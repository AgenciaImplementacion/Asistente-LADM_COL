from asistente_ladm_col.logic.ladm_col.config.queries.queries_config_utils import get_full_alias
from asistente_ladm_col.config.enums import EnumSpatialOperationType
from asistente_ladm_col.config.mapping_config import QueryNames
from asistente_ladm_col.logic.ladm_col.ladm_query_objects import (OwnField,
                                                                  DomainOwnField,
                                                                  EvalExprOwnField,
                                                                  RelatedOwnFieldValue,
                                                                  SpatialFilterSubLevel,
                                                                  FilterSubLevel)
from qgis.core import QgsExpression


def get_igac_physical_query(names, ladm_units):
    op_spatial_source_fields = [
        DomainOwnField(names.COL_SPATIAL_SOURCE_T_TYPE_F, "Tipo de fuente espacial",
                       names.COL_SPATIAL_SOURCE_TYPE_D),
        DomainOwnField(names.COL_SOURCE_T_AVAILABILITY_STATUS_F, "Estado disponibilidad",
                       names.COL_AVAILABILITY_TYPE_D),
        DomainOwnField(names.COL_SOURCE_T_MAIN_TYPE_F, "Tipo principal", names.CI_CODE_PRESENTATION_FORM_D),
        OwnField(names.COL_SOURCE_T_DATE_DOCUMENT_F, "Fecha documento"),
        RelatedOwnFieldValue('Archivo fuente', names.EXT_ARCHIVE_S,
                             OwnField(names.EXT_ARCHIVE_S_DATA_F, 'Archivo fuente'),
                             names.EXT_ARCHIVE_S_OP_SPATIAL_SOURCE_F)
    ]

    query = {
        QueryNames.LEVEL_TABLE: {
            QueryNames.LEVEL_TABLE_NAME: names.OP_PLOT_T,
            QueryNames.LEVEL_TABLE_ALIAS: names.OP_PLOT_T,
            QueryNames.FILTER_SUB_LEVEL: FilterSubLevel(names.T_ID_F, names.OP_PLOT_T, names.T_ID_F),
            QueryNames.TABLE_FIELDS: [OwnField(names.OP_PLOT_T_PLOT_AREA_F, get_full_alias("Área terreno", ladm_units, names.OP_PLOT_T, names.OP_PLOT_T_PLOT_AREA_F))],
            '1' + QueryNames.LEVEL_TABLE: {
                QueryNames.LEVEL_TABLE_NAME: names.OP_PARCEL_T,
                QueryNames.LEVEL_TABLE_ALIAS: names.OP_PARCEL_T,
                QueryNames.FILTER_SUB_LEVEL: FilterSubLevel(names.COL_UE_BAUNIT_T_PARCEL_F,
                                                            names.COL_UE_BAUNIT_T,
                                                            names.COL_UE_BAUNIT_T_OP_PLOT_F),
                QueryNames.TABLE_FIELDS: [
                    OwnField(names.COL_BAUNIT_T_NAME_F, "Nombre"),
                    OwnField(names.OP_PARCEL_T_NUPRE_F, "NUPRE"),
                    OwnField(names.OP_PARCEL_T_FMI_F, "FMI"),
                    OwnField(names.OP_PARCEL_T_PARCEL_NUMBER_F, "Número predial"),
                    OwnField(names.OP_PARCEL_T_PREVIOUS_PARCEL_NUMBER_F, "Número predial anterior")
                ],
                QueryNames.LEVEL_TABLE: {
                    QueryNames.LEVEL_TABLE_NAME: names.OP_BUILDING_T,
                    QueryNames.LEVEL_TABLE_ALIAS: names.OP_BUILDING_T,
                    QueryNames.FILTER_SUB_LEVEL: FilterSubLevel(names.COL_UE_BAUNIT_T_OP_BUILDING_F,
                                                                names.COL_UE_BAUNIT_T,
                                                                names.COL_UE_BAUNIT_T_PARCEL_F),
                    QueryNames.TABLE_FIELDS: [
                        OwnField(names.OP_BUILDING_T_BUILDING_AREA_F, "Área construcción"),
                        OwnField(names.OP_BUILDING_T_NUMBER_OF_FLOORS_F, "Número de pisos")
                    ],
                    '1' + QueryNames.LEVEL_TABLE: {
                        QueryNames.LEVEL_TABLE_NAME: names.OP_BUILDING_UNIT_T,
                        QueryNames.LEVEL_TABLE_ALIAS: names.OP_BUILDING_UNIT_T,
                        QueryNames.FILTER_SUB_LEVEL: FilterSubLevel(names.T_ID_F, names.OP_BUILDING_UNIT_T,
                                                                    names.OP_BUILDING_UNIT_T_BUILDING_F),
                        QueryNames.TABLE_FIELDS: [
                            OwnField(names.OP_BUILDING_UNIT_T_TOTAL_FLOORS_F, "Número de pisos"),
                            DomainOwnField(names.OP_BUILDING_UNIT_T_USE_F, "Uso",
                                           names.OP_BUILDING_UNIT_USE_D),
                            DomainOwnField(names.OP_BUILDING_UNIT_T_BUILDING_TYPE_F, "Tipo construcción",
                                           names.OP_BUILDING_TYPE_D),
                            DomainOwnField(names.OP_BUILDING_UNIT_T_BUILDING_UNIT_TYPE_F,
                                           "Tipo unidad de construcción", names.OP_BUILDING_UNIT_TYPE_D),
                            OwnField(names.OP_BUILDING_UNIT_T_BUILT_PRIVATE_AREA_F,
                                     get_full_alias("Área privada construida", ladm_units, names.OP_BUILDING_UNIT_T, names.OP_BUILDING_UNIT_T_BUILT_PRIVATE_AREA_F)),
                            OwnField(names.OP_BUILDING_UNIT_T_BUILT_AREA_F, get_full_alias("Área construida", ladm_units, names.OP_BUILDING_UNIT_T, names.OP_BUILDING_UNIT_T_BUILT_AREA_F))
                        ],
                        QueryNames.LEVEL_TABLE: {
                            QueryNames.LEVEL_TABLE_NAME: names.OP_SPATIAL_SOURCE_T,
                            QueryNames.LEVEL_TABLE_ALIAS: names.OP_SPATIAL_SOURCE_T,
                            QueryNames.FILTER_SUB_LEVEL: FilterSubLevel(names.COL_UE_SOURCE_T_SOURCE_F,
                                                                        names.COL_UE_SOURCE_T,
                                                                        names.COL_UE_SOURCE_T_OP_BUILDING_UNIT_F),
                            QueryNames.TABLE_FIELDS: op_spatial_source_fields
                        }
                    },
                    '2' + QueryNames.LEVEL_TABLE: {
                        QueryNames.LEVEL_TABLE_NAME: names.OP_SPATIAL_SOURCE_T,
                        QueryNames.LEVEL_TABLE_ALIAS: names.OP_SPATIAL_SOURCE_T,
                        QueryNames.FILTER_SUB_LEVEL: FilterSubLevel(names.COL_UE_SOURCE_T_SOURCE_F,
                                                                    names.COL_UE_SOURCE_T,
                                                                    names.COL_UE_SOURCE_T_OP_BUILDING_F),
                        QueryNames.TABLE_FIELDS: op_spatial_source_fields
                    }
                }
            },
            '2' + QueryNames.LEVEL_TABLE: {
                QueryNames.LEVEL_TABLE_NAME: names.OP_BOUNDARY_T,
                QueryNames.LEVEL_TABLE_ALIAS: names.OP_BOUNDARY_T + " externos",
                QueryNames.FILTER_SUB_LEVEL: FilterSubLevel(names.MORE_BFS_T_OP_BOUNDARY_F,
                                                            names.MORE_BFS_T,
                                                            names.MORE_BFS_T_OP_PLOT_F),
                QueryNames.TABLE_FIELDS: [OwnField(names.OP_BOUNDARY_T_LENGTH_F, get_full_alias("Longitud", ladm_units, names.OP_BOUNDARY_T, names.OP_BOUNDARY_T_LENGTH_F))]
            },
            '3' + QueryNames.LEVEL_TABLE: {
                QueryNames.LEVEL_TABLE_NAME: names.OP_BOUNDARY_POINT_T,
                QueryNames.LEVEL_TABLE_ALIAS: names.OP_BOUNDARY_POINT_T + " externos",
                QueryNames.FILTER_SUB_LEVEL: FilterSubLevel(names.MORE_BFS_T_OP_BOUNDARY_F,
                                                            names.MORE_BFS_T,
                                                            names.MORE_BFS_T_OP_PLOT_F,
                                                            FilterSubLevel(names.POINT_BFS_T_OP_BOUNDARY_POINT_F,
                                                                           names.POINT_BFS_T,
                                                                           names.POINT_BFS_T_OP_BOUNDARY_F)
                                                            ),
                QueryNames.TABLE_FIELDS: [
                    EvalExprOwnField("Coordenadas", QgsExpression("$x || ' ' || $y || ' ' || z($geometry)"))]
            },
            '4' + QueryNames.LEVEL_TABLE: {
                QueryNames.LEVEL_TABLE_NAME: names.OP_BOUNDARY_T,
                QueryNames.LEVEL_TABLE_ALIAS: names.OP_BOUNDARY_T + " internos",
                QueryNames.FILTER_SUB_LEVEL: FilterSubLevel(names.LESS_BFS_T_OP_BOUNDARY_F,
                                                            names.LESS_BFS_T,
                                                            names.LESS_BFS_T_OP_PLOT_F),
                QueryNames.TABLE_FIELDS: [OwnField(names.OP_BOUNDARY_T_LENGTH_F, get_full_alias("Longitud", ladm_units, names.OP_BOUNDARY_T, names.OP_BOUNDARY_T_LENGTH_F))]
            },
            '5' + QueryNames.LEVEL_TABLE: {
                QueryNames.LEVEL_TABLE_NAME: names.OP_BOUNDARY_POINT_T,
                QueryNames.LEVEL_TABLE_ALIAS: names.OP_BOUNDARY_POINT_T + " internos",
                QueryNames.FILTER_SUB_LEVEL: FilterSubLevel(names.LESS_BFS_T_OP_BOUNDARY_F,
                                                            names.LESS_BFS_T,
                                                            names.LESS_BFS_T_OP_PLOT_F,
                                                            FilterSubLevel(names.POINT_BFS_T_OP_BOUNDARY_POINT_F,
                                                                           names.POINT_BFS_T,
                                                                           names.POINT_BFS_T_OP_BOUNDARY_F)
                                                            ),
                QueryNames.TABLE_FIELDS: [
                    EvalExprOwnField("Coordenadas", QgsExpression("$x || ' ' || $y || ' ' || z($geometry)"))]
            },
            '6' + QueryNames.LEVEL_TABLE: {
                QueryNames.LEVEL_TABLE_NAME: names.OP_SURVEY_POINT_T,
                QueryNames.LEVEL_TABLE_ALIAS: names.OP_SURVEY_POINT_T,
                QueryNames.FILTER_SUB_LEVEL: SpatialFilterSubLevel(names.T_ID_F, names.OP_SURVEY_POINT_T,
                                                                   names.OP_PLOT_T,
                                                                   EnumSpatialOperationType.INTERSECTS),
                QueryNames.TABLE_FIELDS: [
                    EvalExprOwnField("Coordenadas", QgsExpression("$x || ' ' || $y || ' ' || z($geometry)"))]
            },
            '7' + QueryNames.LEVEL_TABLE: {
                QueryNames.LEVEL_TABLE_NAME: names.OP_SPATIAL_SOURCE_T,
                QueryNames.LEVEL_TABLE_ALIAS: names.OP_SPATIAL_SOURCE_T,
                QueryNames.FILTER_SUB_LEVEL: FilterSubLevel(names.COL_UE_SOURCE_T_SOURCE_F,
                                                            names.COL_UE_SOURCE_T,
                                                            names.COL_UE_SOURCE_T_OP_PLOT_F),
                QueryNames.TABLE_FIELDS: op_spatial_source_fields
            }
        }
    }

    return query
