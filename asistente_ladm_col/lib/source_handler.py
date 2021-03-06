# -*- coding: utf-8 -*-
"""
/***************************************************************************
                              Asistente LADM_COL
                             --------------------
        begin                : 2018-06-09
        git sha              : :%H$
        copyright            : (C) 2018 by Germán Carrillo (BSF Swissphoto)
        email                : gcarrillo@linuxmail.org
 ***************************************************************************/
/***************************************************************************
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License v3.0 as          *
 *   published by the Free Software Foundation.                            *
 *                                                                         *
 ***************************************************************************/
"""
import json
import os.path

from qgis.PyQt.QtNetwork import QNetworkRequest
from qgis.PyQt.QtCore import (QEventLoop,
                              QUrl,
                              QObject,
                              QTextStream,
                              QIODevice,
                              QCoreApplication,
                              QFile,
                              QVariant,
                              QByteArray,
                              QSettings,
                              Qt)
from qgis.PyQt.QtNetwork import (QNetworkAccessManager,
                                 QHttpMultiPart,
                                 QHttpPart)
from qgis.core import (QgsProject,
                       NULL)

from asistente_ladm_col.app_interface import AppInterface
from asistente_ladm_col.lib.logger import Logger
from asistente_ladm_col.utils.qt_utils import OverrideCursor
from asistente_ladm_col.config.general_config import (DEFAULT_ENDPOINT_SOURCE_SERVICE,
                                                      SOURCE_SERVICE_UPLOAD_SUFFIX,
                                                      DEFAULT_USE_SOURCE_SERVICE_SETTING)
from asistente_ladm_col.gui.dialogs.dlg_upload_progress import UploadProgressDialog


class SourceHandler(QObject):
    """
    Upload source files from a given field of a layer to a remote server that
    is configured in Settings Dialog. The server returns a file URL that is
    then stored in the source table.
    """
    def __init__(self):
        QObject.__init__(self)
        self.logger = Logger()
        self.app = AppInterface()

    def upload_files(self, layer, field_index, features):
        """
        Upload given features' source files to remote server and return a dict
        formatted as changeAttributeValues expects to update 'datos' attribute
        to a remote location.
        """
        if not QSettings().value('Asistente-LADM-COL/sources/use_service', DEFAULT_USE_SOURCE_SERVICE_SETTING, bool):
            self.logger.info_msg(__name__, QCoreApplication.translate("SourceHandler",
                   "The source files were not uploaded to the document repository because you have that option unchecked. You can still upload the source files later using the 'Upload Pending Source Files' menu."), 10)
            return dict()

        # Test if we have Internet connection and a valid service
        res, msg = self.app.core.is_source_service_valid()

        if not res:
            msg['text'] = QCoreApplication.translate("SourceHandler",
                "No file could be uploaded to the document repository. You can do it later from the 'Upload Pending Source Files' menu. Reason: {}").format(msg['text'])
            self.logger.info_msg(__name__, msg['text'], 20)  # The data is still saved, so always show Info msg
            return dict()

        file_features = [feature for feature in features if not feature[field_index] == NULL and os.path.isfile(feature[field_index])]
        total = len(features)
        not_found = total - len(file_features)

        upload_dialog = UploadProgressDialog(len(file_features), not_found, self.app.gui.iface.mainWindow())
        upload_dialog.show()
        count = 0
        upload_errors = 0
        new_values = dict()

        for feature in file_features:
            data_url = feature[field_index]
            file_name = os.path.basename(data_url)

            nam = QNetworkAccessManager()
            #reply.downloadProgress.connect(upload_dialog.update_current_progress)

            multiPart = QHttpMultiPart(QHttpMultiPart.FormDataType)
            textPart = QHttpPart()
            textPart.setHeader(QNetworkRequest.ContentDispositionHeader, QVariant("form-data; name=\"driver\""))
            textPart.setBody(QByteArray().append('Local'))

            filePart = QHttpPart()
            filePart.setHeader(QNetworkRequest.ContentDispositionHeader, QVariant("form-data; name=\"file\"; filename=\"{}\"".format(file_name)))
            file = QFile(data_url)
            file.open(QIODevice.ReadOnly)

            filePart.setBodyDevice(file)
            file.setParent(multiPart)  # we cannot delete the file now, so delete it with the multiPart

            multiPart.append(filePart)
            multiPart.append(textPart)

            service_url = '/'.join([
                QSettings().value('Asistente-LADM-COL/sources/service_endpoint', DEFAULT_ENDPOINT_SOURCE_SERVICE),
                SOURCE_SERVICE_UPLOAD_SUFFIX])
            request = QNetworkRequest(QUrl(service_url))
            reply = nam.post(request, multiPart)
            #reply.uploadProgress.connect(upload_dialog.update_current_progress)
            reply.error.connect(self.error_returned)
            multiPart.setParent(reply)

            # We'll block execution until we get response from the server
            loop = QEventLoop()
            reply.finished.connect(loop.quit)
            loop.exec_()

            response = reply.readAll()
            data = QTextStream(response, QIODevice.ReadOnly)
            content = data.readAll()

            if content is None:
                self.logger.critical(__name__, "There was an error uploading file '{}'".format(data_url))
                upload_errors += 1
                continue

            try:
                response = json.loads(content)
            except json.decoder.JSONDecodeError:
                self.logger.critical(__name__, "Couldn't parse JSON response from server for file '{}'!!!".format(data_url))
                upload_errors += 1
                continue

            if 'error' in response:
                self.logger.critical(__name__, "STATUS: {}. ERROR: {} MESSAGE: {} FILE: {}".format(
                        response['status'],
                        response['error'],
                        response['message'],
                        data_url))
                upload_errors += 1
                continue

            reply.deleteLater()

            if 'url' not in response:
                self.logger.critical(__name__, "'url' attribute not found in JSON response for file '{}'!".format(data_url))
                upload_errors += 1
                continue

            url = self.get_file_url(response['url'])
            new_values[feature.id()] = {field_index : url}

            count += 1
            upload_dialog.update_total_progress(count)

        if not_found > 0:
            self.logger.info_msg(__name__, QCoreApplication.translate("SourceHandler",
                "{} out of {} records {} not uploaded to the document repository because {} file path is NULL or it couldn't be found in the local disk!").format(
                    not_found,
                    total,
                    QCoreApplication.translate("SourceHandler", "was") if not_found == 1 else QCoreApplication.translate("SourceHandler", "were"),
                    QCoreApplication.translate("SourceHandler", "its") if not_found == 1 else QCoreApplication.translate("SourceHandler", "their")
                ))
        if len(new_values):
            self.logger.info_msg(__name__, QCoreApplication.translate("SourceHandler",
                "{} out of {} files {} uploaded to the document repository and {} remote location stored in the database!").format(
                    len(new_values),
                    total,
                    QCoreApplication.translate("SourceHandler", "was") if len(new_values) == 1 else QCoreApplication.translate("SourceHandler", "were"),
                    QCoreApplication.translate("SourceHandler", "its") if len(new_values) == 1 else QCoreApplication.translate("SourceHandler", "their")
                ))
        if upload_errors:
            self.logger.info_msg(__name__, QCoreApplication.translate("SourceHandler",
                "{} out of {} files could not be uploaded to the document repository because of upload errors! See log for details.").format(
                    upload_errors,
                    total
                ))

        return new_values

    def error_returned(self, error_code):
        self.logger.critical(__name__, "Qt network error code: {}".format(error_code))

    def handle_source_upload(self, db, layer, field_name):

        layer_name = db.get_ladm_layer_name(layer)
        field_index = layer.fields().indexFromName(field_name)

        def features_added(layer_id, features):
            modified_layer = QgsProject.instance().mapLayer(layer_id)

            if modified_layer is None:
                return

            modified_layer_name = db.get_ladm_layer_name(modified_layer, validate_is_ladm=True)
            if modified_layer_name is None:
                return

            if modified_layer_name.lower() != layer_name.lower():
                return

            with OverrideCursor(Qt.WaitCursor):
                new_values = self.upload_files(modified_layer, field_index, features)

            if new_values:
                modified_layer.dataProvider().changeAttributeValues(new_values)

        layer.committedFeaturesAdded.connect(features_added)

    def get_file_url(self, part):
        endpoint = QSettings().value('Asistente-LADM-COL/sources/service_endpoint', DEFAULT_ENDPOINT_SOURCE_SERVICE)
        return '/'.join([endpoint, part[1:] if part.startswith('/') else part])
