# -*- coding: utf-8 -*-
"""
/***************************************************************************
                              Asistente LADM-COL
                             --------------------
        begin                : 2020-07-22
        git sha              : :%H$
        copyright            : (C) 2020 by Germán Carrillo (SwissTierras Colombia)
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
from qgis.PyQt.QtCore import QCoreApplication

from asistente_ladm_col.config.general_config import FDC_ADMIN_DATASET_NAME
from asistente_ladm_col.gui.field_data_capture.base_field_data_capture_controller import BaseFieldDataCaptureController


class FieldDataCaptureAdminController(BaseFieldDataCaptureController):
    def __init__(self, iface, db, ladm_data):
        BaseFieldDataCaptureController.__init__(self, iface, db, ladm_data)

        self.receiver_type = self.coordinator_type  # Admin allocates parcels to coordinators

    def _get_parcel_field_referencing_receiver(self):
        return self._db.names.T_BASKET_F

    def _get_receiver_referenced_field(self):
        return self._db.names.T_BASKET_F

    def get_basket_id_for_new_receiver(self):
        res, msg = self._get_basket_id_for_new_receiver(FDC_ADMIN_DATASET_NAME)
        if not res:
            msg_prefix = QCoreApplication.translate("FieldDataCaptureAdminController", "No coordinator can be created.")
            msg = msg_prefix + " " + msg

        return res, msg

    def get_coordinator_basket_id_for_new_receiver(self):
        return None, "Success!"  # Since we don't store admin info, we pass a None (NULL) here.

    def delete_receiver(self, receiver_id):
        return self._ladm_data.delete_coordinator(self.db(), receiver_id, self.surveyor_type, self.user_layer())
