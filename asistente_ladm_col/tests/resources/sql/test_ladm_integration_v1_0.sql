--
-- PostgreSQL database dump
--

-- Dumped from database version 11.8 (Ubuntu 11.8-1.pgdg20.04+1)
-- Dumped by pg_dump version 12.3 (Ubuntu 12.3-1.pgdg20.04+1)

-- Started on 2020-07-22 11:13:45 -05

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 11 (class 2615 OID 375911)
-- Name: test_ladm_integration; Type: SCHEMA; Schema: -; Owner: postgres
--

DROP SCHEMA IF EXISTS test_ladm_integration CASCADE;
CREATE SCHEMA test_ladm_integration;
CREATE EXTENSION IF NOT EXISTS postgis;

ALTER SCHEMA test_ladm_integration OWNER TO postgres;

--
-- TOC entry 795 (class 1259 OID 375912)
-- Name: t_ili2db_seq; Type: SEQUENCE; Schema: test_ladm_integration; Owner: postgres
--

CREATE SEQUENCE test_ladm_integration.t_ili2db_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE test_ladm_integration.t_ili2db_seq OWNER TO postgres;

SET default_tablespace = '';

--
-- TOC entry 800 (class 1259 OID 375948)
-- Name: extarchivo; Type: TABLE; Schema: test_ladm_integration; Owner: postgres
--

CREATE TABLE test_ladm_integration.extarchivo (
    t_id bigint DEFAULT nextval('test_ladm_integration.t_ili2db_seq'::regclass) NOT NULL,
    t_seq bigint,
    fecha_aceptacion date,
    datos character varying(255),
    extraccion date,
    fecha_grabacion date,
    fecha_entrega date,
    espacio_de_nombres character varying(255) NOT NULL,
    local_id character varying(255) NOT NULL,
    snr_fuentecabidalndros_archivo bigint
);


ALTER TABLE test_ladm_integration.extarchivo OWNER TO postgres;

--
-- TOC entry 6564 (class 0 OID 0)
-- Dependencies: 800
-- Name: TABLE extarchivo; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON TABLE test_ladm_integration.extarchivo IS 'Referencia a clase externa desde donde se gestiona el repositorio de archivos.';


--
-- TOC entry 6565 (class 0 OID 0)
-- Dependencies: 800
-- Name: COLUMN extarchivo.fecha_aceptacion; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.extarchivo.fecha_aceptacion IS 'Fecha en la que ha sido aceptado el documento.';


--
-- TOC entry 6566 (class 0 OID 0)
-- Dependencies: 800
-- Name: COLUMN extarchivo.datos; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.extarchivo.datos IS 'Datos que contiene el documento.';


--
-- TOC entry 6567 (class 0 OID 0)
-- Dependencies: 800
-- Name: COLUMN extarchivo.extraccion; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.extarchivo.extraccion IS 'Última fecha de extracción del documento.';


--
-- TOC entry 6568 (class 0 OID 0)
-- Dependencies: 800
-- Name: COLUMN extarchivo.fecha_grabacion; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.extarchivo.fecha_grabacion IS 'Fecha en la que el documento es aceptado en el sistema.';


--
-- TOC entry 6569 (class 0 OID 0)
-- Dependencies: 800
-- Name: COLUMN extarchivo.fecha_entrega; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.extarchivo.fecha_entrega IS 'Fecha en la que fue entregado el documento.';


--
-- TOC entry 6570 (class 0 OID 0)
-- Dependencies: 800
-- Name: COLUMN extarchivo.snr_fuentecabidalndros_archivo; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.extarchivo.snr_fuentecabidalndros_archivo IS 'Identificador del archivo fuente controlado por una clase externa.';


--
-- TOC entry 801 (class 1259 OID 375958)
-- Name: gc_barrio; Type: TABLE; Schema: test_ladm_integration; Owner: postgres
--

CREATE TABLE test_ladm_integration.gc_barrio (
    t_id bigint DEFAULT nextval('test_ladm_integration.t_ili2db_seq'::regclass) NOT NULL,
    t_ili_tid character varying(200),
    codigo character varying(13),
    nombre character varying(100),
    codigo_sector character varying(9),
    geometria public.geometry(MultiPolygon,9377)
);


ALTER TABLE test_ladm_integration.gc_barrio OWNER TO postgres;

--
-- TOC entry 6571 (class 0 OID 0)
-- Dependencies: 801
-- Name: TABLE gc_barrio; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON TABLE test_ladm_integration.gc_barrio IS 'Dato geografico aportado por el Gestor Catastral respecto de los barrios de una entidad territorial.';


--
-- TOC entry 6572 (class 0 OID 0)
-- Dependencies: 801
-- Name: COLUMN gc_barrio.codigo; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_barrio.codigo IS 'Código de identificación del barrio.';


--
-- TOC entry 6573 (class 0 OID 0)
-- Dependencies: 801
-- Name: COLUMN gc_barrio.nombre; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_barrio.nombre IS 'Nombre del barrio.';


--
-- TOC entry 6574 (class 0 OID 0)
-- Dependencies: 801
-- Name: COLUMN gc_barrio.codigo_sector; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_barrio.codigo_sector IS 'Código del sector donde se encuentra localizado el barrio.';


--
-- TOC entry 6575 (class 0 OID 0)
-- Dependencies: 801
-- Name: COLUMN gc_barrio.geometria; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_barrio.geometria IS 'Tipo de geometría y su representación georrefenciada que definen los límites y el área ocupada por el barrio.';


--
-- TOC entry 802 (class 1259 OID 375968)
-- Name: gc_calificacionunidadconstruccion; Type: TABLE; Schema: test_ladm_integration; Owner: postgres
--

CREATE TABLE test_ladm_integration.gc_calificacionunidadconstruccion (
    t_id bigint DEFAULT nextval('test_ladm_integration.t_ili2db_seq'::regclass) NOT NULL,
    t_ili_tid character varying(200),
    componente character varying(255),
    elemento_calificacion character varying(255),
    detalle_calificacion character varying(255),
    puntos integer,
    gc_unidadconstruccion bigint,
    CONSTRAINT gc_calificcnnddcnstrccion_puntos_check CHECK (((puntos >= 0) AND (puntos <= 100)))
);


ALTER TABLE test_ladm_integration.gc_calificacionunidadconstruccion OWNER TO postgres;

--
-- TOC entry 6576 (class 0 OID 0)
-- Dependencies: 802
-- Name: TABLE gc_calificacionunidadconstruccion; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON TABLE test_ladm_integration.gc_calificacionunidadconstruccion IS 'Relaciona la calificación de las unidades de construcción de los datos de insumos del Gestor Catastral.';


--
-- TOC entry 6577 (class 0 OID 0)
-- Dependencies: 802
-- Name: COLUMN gc_calificacionunidadconstruccion.componente; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_calificacionunidadconstruccion.componente IS 'Indica el componente de la calificación de la unidad de construcción.';


--
-- TOC entry 6578 (class 0 OID 0)
-- Dependencies: 802
-- Name: COLUMN gc_calificacionunidadconstruccion.elemento_calificacion; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_calificacionunidadconstruccion.elemento_calificacion IS 'Indica el elemento de calificación de la unidad de construcción.';


--
-- TOC entry 6579 (class 0 OID 0)
-- Dependencies: 802
-- Name: COLUMN gc_calificacionunidadconstruccion.detalle_calificacion; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_calificacionunidadconstruccion.detalle_calificacion IS 'Indica el detalle de calificación del elemento de calificación de la unidad de construcción.';


--
-- TOC entry 6580 (class 0 OID 0)
-- Dependencies: 802
-- Name: COLUMN gc_calificacionunidadconstruccion.puntos; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_calificacionunidadconstruccion.puntos IS 'Puntaje asociado al detalle del elemento de calificación.';


--
-- TOC entry 803 (class 1259 OID 375978)
-- Name: gc_comisionesconstruccion; Type: TABLE; Schema: test_ladm_integration; Owner: postgres
--

CREATE TABLE test_ladm_integration.gc_comisionesconstruccion (
    t_id bigint DEFAULT nextval('test_ladm_integration.t_ili2db_seq'::regclass) NOT NULL,
    t_ili_tid character varying(200),
    numero_predial character varying(30) NOT NULL,
    geometria public.geometry(MultiPolygonZ,9377)
);


ALTER TABLE test_ladm_integration.gc_comisionesconstruccion OWNER TO postgres;

--
-- TOC entry 6581 (class 0 OID 0)
-- Dependencies: 803
-- Name: TABLE gc_comisionesconstruccion; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON TABLE test_ladm_integration.gc_comisionesconstruccion IS 'Construcciones que no cuentan con información alfanumérica en la base de datos catastral.';


--
-- TOC entry 6582 (class 0 OID 0)
-- Dependencies: 803
-- Name: COLUMN gc_comisionesconstruccion.numero_predial; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_comisionesconstruccion.numero_predial IS 'Numero Predial del Construcciones que no cuentan con información alfanumérica en la base de datos catastral.';


--
-- TOC entry 6583 (class 0 OID 0)
-- Dependencies: 803
-- Name: COLUMN gc_comisionesconstruccion.geometria; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_comisionesconstruccion.geometria IS 'Construcciones que no cuentan con información alfanumérica en la base catastral.';


--
-- TOC entry 804 (class 1259 OID 375988)
-- Name: gc_comisionesterreno; Type: TABLE; Schema: test_ladm_integration; Owner: postgres
--

CREATE TABLE test_ladm_integration.gc_comisionesterreno (
    t_id bigint DEFAULT nextval('test_ladm_integration.t_ili2db_seq'::regclass) NOT NULL,
    t_ili_tid character varying(200),
    numero_predial character varying(30) NOT NULL,
    geometria public.geometry(MultiPolygon,9377)
);


ALTER TABLE test_ladm_integration.gc_comisionesterreno OWNER TO postgres;

--
-- TOC entry 6584 (class 0 OID 0)
-- Dependencies: 804
-- Name: TABLE gc_comisionesterreno; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON TABLE test_ladm_integration.gc_comisionesterreno IS 'Terrenos que no cuentan con información alfanumérica en la base de datos catastral.';


--
-- TOC entry 6585 (class 0 OID 0)
-- Dependencies: 804
-- Name: COLUMN gc_comisionesterreno.numero_predial; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_comisionesterreno.numero_predial IS 'Numero Predial del terreno que no cuentan con información
alfanumérica en la base de datos catastral.';


--
-- TOC entry 6586 (class 0 OID 0)
-- Dependencies: 804
-- Name: COLUMN gc_comisionesterreno.geometria; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_comisionesterreno.geometria IS 'Terrenos que no cuentan con información alfanumérica en la base catastral.';


--
-- TOC entry 805 (class 1259 OID 375998)
-- Name: gc_comisionesunidadconstruccion; Type: TABLE; Schema: test_ladm_integration; Owner: postgres
--

CREATE TABLE test_ladm_integration.gc_comisionesunidadconstruccion (
    t_id bigint DEFAULT nextval('test_ladm_integration.t_ili2db_seq'::regclass) NOT NULL,
    t_ili_tid character varying(200),
    numero_predial character varying(30) NOT NULL,
    geometria public.geometry(MultiPolygonZ,9377)
);


ALTER TABLE test_ladm_integration.gc_comisionesunidadconstruccion OWNER TO postgres;

--
-- TOC entry 6587 (class 0 OID 0)
-- Dependencies: 805
-- Name: TABLE gc_comisionesunidadconstruccion; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON TABLE test_ladm_integration.gc_comisionesunidadconstruccion IS 'Unidades de construcción que no cuentan con información alfanumérica en la base de datos catastral.';


--
-- TOC entry 6588 (class 0 OID 0)
-- Dependencies: 805
-- Name: COLUMN gc_comisionesunidadconstruccion.numero_predial; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_comisionesunidadconstruccion.numero_predial IS 'Numero Predial del terreno que no cuentan con información alfanumérica en la base de datos catastral.';


--
-- TOC entry 6589 (class 0 OID 0)
-- Dependencies: 805
-- Name: COLUMN gc_comisionesunidadconstruccion.geometria; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_comisionesunidadconstruccion.geometria IS 'Unidades de construcción que no cuentan con información alfanumérica en la base catastral.';


--
-- TOC entry 840 (class 1259 OID 376321)
-- Name: gc_condicionprediotipo; Type: TABLE; Schema: test_ladm_integration; Owner: postgres
--

CREATE TABLE test_ladm_integration.gc_condicionprediotipo (
    t_id bigint DEFAULT nextval('test_ladm_integration.t_ili2db_seq'::regclass) NOT NULL,
    thisclass character varying(1024) NOT NULL,
    baseclass character varying(1024),
    itfcode integer NOT NULL,
    ilicode character varying(1024) NOT NULL,
    seq integer,
    inactive boolean NOT NULL,
    dispname character varying(250) NOT NULL,
    description character varying(1024)
);


ALTER TABLE test_ladm_integration.gc_condicionprediotipo OWNER TO postgres;

--
-- TOC entry 806 (class 1259 OID 376008)
-- Name: gc_construccion; Type: TABLE; Schema: test_ladm_integration; Owner: postgres
--

CREATE TABLE test_ladm_integration.gc_construccion (
    t_id bigint DEFAULT nextval('test_ladm_integration.t_ili2db_seq'::regclass) NOT NULL,
    t_ili_tid character varying(200),
    identificador character varying(30),
    etiqueta character varying(50),
    tipo_construccion bigint,
    tipo_dominio character varying(20),
    numero_pisos integer,
    numero_sotanos integer,
    numero_mezanines integer,
    numero_semisotanos integer,
    codigo_edificacion integer,
    codigo_terreno character varying(30),
    area_construida numeric(16,2),
    geometria public.geometry(MultiPolygonZ,9377),
    gc_predio bigint NOT NULL,
    CONSTRAINT gc_construccion_area_construida_check CHECK (((area_construida >= 0.0) AND (area_construida <= 99999999999999.98))),
    CONSTRAINT gc_construccion_codigo_edificacion_check CHECK (((codigo_edificacion >= 0) AND (codigo_edificacion <= 2147483647))),
    CONSTRAINT gc_construccion_numero_mezanines_check CHECK (((numero_mezanines >= 0) AND (numero_mezanines <= 99))),
    CONSTRAINT gc_construccion_numero_pisos_check CHECK (((numero_pisos >= 0) AND (numero_pisos <= 200))),
    CONSTRAINT gc_construccion_numero_semisotanos_check CHECK (((numero_semisotanos >= 0) AND (numero_semisotanos <= 99))),
    CONSTRAINT gc_construccion_numero_sotanos_check CHECK (((numero_sotanos >= 0) AND (numero_sotanos <= 99)))
);


ALTER TABLE test_ladm_integration.gc_construccion OWNER TO postgres;

--
-- TOC entry 6590 (class 0 OID 0)
-- Dependencies: 806
-- Name: TABLE gc_construccion; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON TABLE test_ladm_integration.gc_construccion IS 'Datos de las construcciones inscritas en las bases de datos catastrales en una entidad territorial.';


--
-- TOC entry 6591 (class 0 OID 0)
-- Dependencies: 806
-- Name: COLUMN gc_construccion.identificador; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_construccion.identificador IS 'Identificado de la unidad de construcción, su codificación puede ser por letras del abecedario.';


--
-- TOC entry 6592 (class 0 OID 0)
-- Dependencies: 806
-- Name: COLUMN gc_construccion.etiqueta; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_construccion.etiqueta IS 'Etiqueta de la construcción.';


--
-- TOC entry 6593 (class 0 OID 0)
-- Dependencies: 806
-- Name: COLUMN gc_construccion.tipo_construccion; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_construccion.tipo_construccion IS 'Indica si la construcción es de tipo convencional o no convencional.';


--
-- TOC entry 6594 (class 0 OID 0)
-- Dependencies: 806
-- Name: COLUMN gc_construccion.tipo_dominio; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_construccion.tipo_dominio IS 'Indica el tipo de dominio de la unidad de construcción: común y privado.';


--
-- TOC entry 6595 (class 0 OID 0)
-- Dependencies: 806
-- Name: COLUMN gc_construccion.numero_pisos; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_construccion.numero_pisos IS 'Número total de pisos de la construcción.';


--
-- TOC entry 6596 (class 0 OID 0)
-- Dependencies: 806
-- Name: COLUMN gc_construccion.numero_sotanos; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_construccion.numero_sotanos IS 'Número total de sótanos de la construcción.';


--
-- TOC entry 6597 (class 0 OID 0)
-- Dependencies: 806
-- Name: COLUMN gc_construccion.numero_mezanines; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_construccion.numero_mezanines IS 'Número total de mezanines de la construcción.';


--
-- TOC entry 6598 (class 0 OID 0)
-- Dependencies: 806
-- Name: COLUMN gc_construccion.numero_semisotanos; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_construccion.numero_semisotanos IS 'Número total de semisótanos de la construcción.';


--
-- TOC entry 6599 (class 0 OID 0)
-- Dependencies: 806
-- Name: COLUMN gc_construccion.codigo_edificacion; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_construccion.codigo_edificacion IS 'Código catastral de la construcción.';


--
-- TOC entry 6600 (class 0 OID 0)
-- Dependencies: 806
-- Name: COLUMN gc_construccion.codigo_terreno; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_construccion.codigo_terreno IS 'Código de terreno donde se encuentra ubicada la construcción.';


--
-- TOC entry 6601 (class 0 OID 0)
-- Dependencies: 806
-- Name: COLUMN gc_construccion.area_construida; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_construccion.area_construida IS 'Área total construida.';


--
-- TOC entry 6602 (class 0 OID 0)
-- Dependencies: 806
-- Name: COLUMN gc_construccion.geometria; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_construccion.geometria IS 'Polígono de la construcción existente en la base de datos catastral.';


--
-- TOC entry 820 (class 1259 OID 376146)
-- Name: gc_copropiedad; Type: TABLE; Schema: test_ladm_integration; Owner: postgres
--

CREATE TABLE test_ladm_integration.gc_copropiedad (
    t_id bigint DEFAULT nextval('test_ladm_integration.t_ili2db_seq'::regclass) NOT NULL,
    gc_matriz bigint NOT NULL,
    gc_unidad bigint NOT NULL,
    coeficiente_copropiedad numeric(10,7),
    CONSTRAINT gc_copropiedad_coeficiente_copropiedad_check CHECK (((coeficiente_copropiedad >= 0.0) AND (coeficiente_copropiedad <= 100.0)))
);


ALTER TABLE test_ladm_integration.gc_copropiedad OWNER TO postgres;

--
-- TOC entry 6603 (class 0 OID 0)
-- Dependencies: 820
-- Name: TABLE gc_copropiedad; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON TABLE test_ladm_integration.gc_copropiedad IS 'Clase que relaciona las unidades prediales a los predios matrices bajo el regimen de propiedad horizontal inscritos en las bases de datos catastrales.';


--
-- TOC entry 807 (class 1259 OID 376020)
-- Name: gc_datosphcondominio; Type: TABLE; Schema: test_ladm_integration; Owner: postgres
--

CREATE TABLE test_ladm_integration.gc_datosphcondominio (
    t_id bigint DEFAULT nextval('test_ladm_integration.t_ili2db_seq'::regclass) NOT NULL,
    t_ili_tid character varying(200),
    area_total_terreno_privada numeric(16,2),
    area_total_terreno_comun numeric(16,2),
    area_total_construida_privada numeric(16,2),
    area_total_construida_comun numeric(16,2),
    total_unidades_privadas integer,
    total_unidades_sotano integer,
    valor_total_avaluo_catastral numeric(16,1),
    gc_predio bigint NOT NULL,
    CONSTRAINT gc_datosphcondominio_area_total_constrd_prvada_check CHECK (((area_total_construida_privada >= 0.0) AND (area_total_construida_privada <= 99999999999999.98))),
    CONSTRAINT gc_datosphcondominio_area_total_construid_cmun_check CHECK (((area_total_construida_comun >= 0.0) AND (area_total_construida_comun <= 99999999999999.98))),
    CONSTRAINT gc_datosphcondominio_area_total_terreno_comun_check CHECK (((area_total_terreno_comun >= 0.0) AND (area_total_terreno_comun <= 99999999999999.98))),
    CONSTRAINT gc_datosphcondominio_area_total_terreno_prvada_check CHECK (((area_total_terreno_privada >= 0.0) AND (area_total_terreno_privada <= 99999999999999.98))),
    CONSTRAINT gc_datosphcondominio_total_unidades_privadas_check CHECK (((total_unidades_privadas >= 0) AND (total_unidades_privadas <= 99999999))),
    CONSTRAINT gc_datosphcondominio_total_unidades_sotano_check CHECK (((total_unidades_sotano >= 0) AND (total_unidades_sotano <= 99999999))),
    CONSTRAINT gc_datosphcondominio_valor_total_avalu_ctstral_check CHECK (((valor_total_avaluo_catastral >= 0.0) AND (valor_total_avaluo_catastral <= '999999999999999'::numeric)))
);


ALTER TABLE test_ladm_integration.gc_datosphcondominio OWNER TO postgres;

--
-- TOC entry 6604 (class 0 OID 0)
-- Dependencies: 807
-- Name: TABLE gc_datosphcondominio; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON TABLE test_ladm_integration.gc_datosphcondominio IS 'Clase que contiene los datos principales del predio matriz sometido al regimen de propiedad horizontal inscrito en las bases de datos catastrales.';


--
-- TOC entry 6605 (class 0 OID 0)
-- Dependencies: 807
-- Name: COLUMN gc_datosphcondominio.area_total_terreno_privada; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_datosphcondominio.area_total_terreno_privada IS 'Área total privada del terreno del PH o Condominio Matriz.';


--
-- TOC entry 6606 (class 0 OID 0)
-- Dependencies: 807
-- Name: COLUMN gc_datosphcondominio.area_total_terreno_comun; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_datosphcondominio.area_total_terreno_comun IS 'Área total de terreno común del PH o Condominio Matriz.';


--
-- TOC entry 6607 (class 0 OID 0)
-- Dependencies: 807
-- Name: COLUMN gc_datosphcondominio.area_total_construida_privada; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_datosphcondominio.area_total_construida_privada IS 'Área total construida privada del PH o Condominio Matriz.';


--
-- TOC entry 6608 (class 0 OID 0)
-- Dependencies: 807
-- Name: COLUMN gc_datosphcondominio.area_total_construida_comun; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_datosphcondominio.area_total_construida_comun IS 'Área total construida común del PH o Condominio Matriz.';


--
-- TOC entry 6609 (class 0 OID 0)
-- Dependencies: 807
-- Name: COLUMN gc_datosphcondominio.total_unidades_privadas; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_datosphcondominio.total_unidades_privadas IS 'Total de unidades privadas en el PH o Condominio.';


--
-- TOC entry 6610 (class 0 OID 0)
-- Dependencies: 807
-- Name: COLUMN gc_datosphcondominio.total_unidades_sotano; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_datosphcondominio.total_unidades_sotano IS 'Total de unidades prediales en el sótano del PH o Condominio.';


--
-- TOC entry 6611 (class 0 OID 0)
-- Dependencies: 807
-- Name: COLUMN gc_datosphcondominio.valor_total_avaluo_catastral; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_datosphcondominio.valor_total_avaluo_catastral IS 'Avalúo catastral total de la propiedad horizontal o condominio.';


--
-- TOC entry 808 (class 1259 OID 376027)
-- Name: gc_datostorreph; Type: TABLE; Schema: test_ladm_integration; Owner: postgres
--

CREATE TABLE test_ladm_integration.gc_datostorreph (
    t_id bigint DEFAULT nextval('test_ladm_integration.t_ili2db_seq'::regclass) NOT NULL,
    t_ili_tid character varying(200),
    torre integer,
    total_pisos_torre integer,
    total_unidades_privadas integer,
    total_sotanos integer,
    total_unidades_sotano integer,
    gc_datosphcondominio bigint,
    CONSTRAINT gc_datostorreph_torre_check CHECK (((torre >= 0) AND (torre <= 1500))),
    CONSTRAINT gc_datostorreph_total_pisos_torre_check CHECK (((total_pisos_torre >= 0) AND (total_pisos_torre <= 100))),
    CONSTRAINT gc_datostorreph_total_sotanos_check CHECK (((total_sotanos >= 0) AND (total_sotanos <= 99))),
    CONSTRAINT gc_datostorreph_total_unidades_privadas_check CHECK (((total_unidades_privadas >= 0) AND (total_unidades_privadas <= 99999999))),
    CONSTRAINT gc_datostorreph_total_unidades_sotano_check CHECK (((total_unidades_sotano >= 0) AND (total_unidades_sotano <= 99999999)))
);


ALTER TABLE test_ladm_integration.gc_datostorreph OWNER TO postgres;

--
-- TOC entry 6612 (class 0 OID 0)
-- Dependencies: 808
-- Name: TABLE gc_datostorreph; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON TABLE test_ladm_integration.gc_datostorreph IS 'Relaciona la información de las torres asociadas al PH o Condominio de los datos insumos del Gestor Catastral';


--
-- TOC entry 6613 (class 0 OID 0)
-- Dependencies: 808
-- Name: COLUMN gc_datostorreph.torre; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_datostorreph.torre IS 'Número de torre en el PH o Condominio.';


--
-- TOC entry 6614 (class 0 OID 0)
-- Dependencies: 808
-- Name: COLUMN gc_datostorreph.total_pisos_torre; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_datostorreph.total_pisos_torre IS 'Total de pisos de la torre.';


--
-- TOC entry 6615 (class 0 OID 0)
-- Dependencies: 808
-- Name: COLUMN gc_datostorreph.total_unidades_privadas; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_datostorreph.total_unidades_privadas IS 'Total de unidades privadas en la torre.';


--
-- TOC entry 6616 (class 0 OID 0)
-- Dependencies: 808
-- Name: COLUMN gc_datostorreph.total_sotanos; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_datostorreph.total_sotanos IS 'Total de sótanos en la torre.';


--
-- TOC entry 6617 (class 0 OID 0)
-- Dependencies: 808
-- Name: COLUMN gc_datostorreph.total_unidades_sotano; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_datostorreph.total_unidades_sotano IS 'Total de unidades prediales en el sótano de la torre.';


--
-- TOC entry 809 (class 1259 OID 376034)
-- Name: gc_direccion; Type: TABLE; Schema: test_ladm_integration; Owner: postgres
--

CREATE TABLE test_ladm_integration.gc_direccion (
    t_id bigint DEFAULT nextval('test_ladm_integration.t_ili2db_seq'::regclass) NOT NULL,
    t_seq bigint,
    valor character varying(255),
    principal boolean,
    geometria_referencia public.geometry(LineStringZ,9377),
    gc_prediocatastro_direcciones bigint
);


ALTER TABLE test_ladm_integration.gc_direccion OWNER TO postgres;

--
-- TOC entry 6618 (class 0 OID 0)
-- Dependencies: 809
-- Name: COLUMN gc_direccion.valor; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_direccion.valor IS 'Registros de la direcciones del predio.';


--
-- TOC entry 6619 (class 0 OID 0)
-- Dependencies: 809
-- Name: COLUMN gc_direccion.principal; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_direccion.principal IS 'Indica si el registro de la dirección corresponde a la principal.';


--
-- TOC entry 6620 (class 0 OID 0)
-- Dependencies: 809
-- Name: COLUMN gc_direccion.geometria_referencia; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_direccion.geometria_referencia IS 'Línea de donde se encuentra la placa de nomenclatura del predio.';


--
-- TOC entry 6621 (class 0 OID 0)
-- Dependencies: 809
-- Name: COLUMN gc_direccion.gc_prediocatastro_direcciones; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_direccion.gc_prediocatastro_direcciones IS 'Direcciones del predio inscritas en catastro.';


--
-- TOC entry 810 (class 1259 OID 376045)
-- Name: gc_estadopredio; Type: TABLE; Schema: test_ladm_integration; Owner: postgres
--

CREATE TABLE test_ladm_integration.gc_estadopredio (
    t_id bigint DEFAULT nextval('test_ladm_integration.t_ili2db_seq'::regclass) NOT NULL,
    t_seq bigint,
    estado_alerta character varying(30),
    entidad_emisora_alerta character varying(255),
    fecha_alerta date,
    gc_prediocatastro_estado_predio bigint
);


ALTER TABLE test_ladm_integration.gc_estadopredio OWNER TO postgres;

--
-- TOC entry 6622 (class 0 OID 0)
-- Dependencies: 810
-- Name: TABLE gc_estadopredio; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON TABLE test_ladm_integration.gc_estadopredio IS 'Estructura que contiene el estado del predio en la base de datos catastral.';


--
-- TOC entry 6623 (class 0 OID 0)
-- Dependencies: 810
-- Name: COLUMN gc_estadopredio.estado_alerta; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_estadopredio.estado_alerta IS 'Indica el estado del predio en la base de datos catastral.';


--
-- TOC entry 6624 (class 0 OID 0)
-- Dependencies: 810
-- Name: COLUMN gc_estadopredio.entidad_emisora_alerta; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_estadopredio.entidad_emisora_alerta IS 'Entidad emisora del estado de alerta del predio.';


--
-- TOC entry 6625 (class 0 OID 0)
-- Dependencies: 810
-- Name: COLUMN gc_estadopredio.fecha_alerta; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_estadopredio.fecha_alerta IS 'Fecha de la alerta en el sistema de gestión catastral.';


--
-- TOC entry 6626 (class 0 OID 0)
-- Dependencies: 810
-- Name: COLUMN gc_estadopredio.gc_prediocatastro_estado_predio; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_estadopredio.gc_prediocatastro_estado_predio IS 'Estado del predio en la base de datos catastral según los actos administrativos o judiciales que versan sobre el mismo.';


--
-- TOC entry 811 (class 1259 OID 376052)
-- Name: gc_manzana; Type: TABLE; Schema: test_ladm_integration; Owner: postgres
--

CREATE TABLE test_ladm_integration.gc_manzana (
    t_id bigint DEFAULT nextval('test_ladm_integration.t_ili2db_seq'::regclass) NOT NULL,
    t_ili_tid character varying(200),
    codigo character varying(17),
    codigo_anterior character varying(255),
    codigo_barrio character varying(13),
    geometria public.geometry(MultiPolygon,9377)
);


ALTER TABLE test_ladm_integration.gc_manzana OWNER TO postgres;

--
-- TOC entry 6627 (class 0 OID 0)
-- Dependencies: 811
-- Name: TABLE gc_manzana; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON TABLE test_ladm_integration.gc_manzana IS 'Dato geografico aportado por el Gestor Catastral respecto de las manzanas de una entidad territorial.';


--
-- TOC entry 6628 (class 0 OID 0)
-- Dependencies: 811
-- Name: COLUMN gc_manzana.codigo; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_manzana.codigo IS 'Código catastral de 17 dígitos de la manzana.';


--
-- TOC entry 6629 (class 0 OID 0)
-- Dependencies: 811
-- Name: COLUMN gc_manzana.codigo_anterior; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_manzana.codigo_anterior IS 'Código catastral anterior de la manzana.';


--
-- TOC entry 6630 (class 0 OID 0)
-- Dependencies: 811
-- Name: COLUMN gc_manzana.codigo_barrio; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_manzana.codigo_barrio IS 'Código catastral de 13 dígitos del barrio donde se encuentra la manzana.';


--
-- TOC entry 6631 (class 0 OID 0)
-- Dependencies: 811
-- Name: COLUMN gc_manzana.geometria; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_manzana.geometria IS 'Polígonos de la manzanas catastrales.';


--
-- TOC entry 812 (class 1259 OID 376062)
-- Name: gc_perimetro; Type: TABLE; Schema: test_ladm_integration; Owner: postgres
--

CREATE TABLE test_ladm_integration.gc_perimetro (
    t_id bigint DEFAULT nextval('test_ladm_integration.t_ili2db_seq'::regclass) NOT NULL,
    t_ili_tid character varying(200),
    codigo_departamento character varying(2),
    codigo_municipio character varying(5),
    tipo_avaluo character varying(30),
    nombre_geografico character varying(50),
    codigo_nombre character varying(255),
    geometria public.geometry(MultiPolygon,9377)
);


ALTER TABLE test_ladm_integration.gc_perimetro OWNER TO postgres;

--
-- TOC entry 6632 (class 0 OID 0)
-- Dependencies: 812
-- Name: TABLE gc_perimetro; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON TABLE test_ladm_integration.gc_perimetro IS 'Dato geografico aportado por el Gestor Catastral respecto del perimetro urbano de una entidad territorial.';


--
-- TOC entry 6633 (class 0 OID 0)
-- Dependencies: 812
-- Name: COLUMN gc_perimetro.codigo_departamento; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_perimetro.codigo_departamento IS 'Código de 2 dígitos del Departamento según clasificación de Divipola.';


--
-- TOC entry 6634 (class 0 OID 0)
-- Dependencies: 812
-- Name: COLUMN gc_perimetro.codigo_municipio; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_perimetro.codigo_municipio IS 'Código de 5 dígitos que une los 2 dígitos del Departamento y los 3 dígitos del municipio según la clasificación de Divipola.';


--
-- TOC entry 6635 (class 0 OID 0)
-- Dependencies: 812
-- Name: COLUMN gc_perimetro.tipo_avaluo; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_perimetro.tipo_avaluo IS 'Tipo de avalúo catastral del perímetro urbano.';


--
-- TOC entry 6636 (class 0 OID 0)
-- Dependencies: 812
-- Name: COLUMN gc_perimetro.nombre_geografico; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_perimetro.nombre_geografico IS 'Nombre geográfico del perímetro municipal, por ejemplo el nombre del municipio.';


--
-- TOC entry 6637 (class 0 OID 0)
-- Dependencies: 812
-- Name: COLUMN gc_perimetro.codigo_nombre; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_perimetro.codigo_nombre IS 'Código del nombre geográfico.';


--
-- TOC entry 6638 (class 0 OID 0)
-- Dependencies: 812
-- Name: COLUMN gc_perimetro.geometria; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_perimetro.geometria IS 'Polígono del perímetro urbano.';


--
-- TOC entry 819 (class 1259 OID 376135)
-- Name: gc_prediocatastro; Type: TABLE; Schema: test_ladm_integration; Owner: postgres
--

CREATE TABLE test_ladm_integration.gc_prediocatastro (
    t_id bigint DEFAULT nextval('test_ladm_integration.t_ili2db_seq'::regclass) NOT NULL,
    t_ili_tid character varying(200),
    tipo_catastro character varying(255),
    numero_predial character varying(30),
    numero_predial_anterior character varying(20),
    nupre character varying(11),
    circulo_registral character varying(4),
    matricula_inmobiliaria_catastro character varying(80),
    tipo_predio character varying(100),
    condicion_predio bigint,
    destinacion_economica character varying(150),
    sistema_procedencia_datos bigint,
    fecha_datos date NOT NULL
);


ALTER TABLE test_ladm_integration.gc_prediocatastro OWNER TO postgres;

--
-- TOC entry 6639 (class 0 OID 0)
-- Dependencies: 819
-- Name: TABLE gc_prediocatastro; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON TABLE test_ladm_integration.gc_prediocatastro IS 'Información existente en las bases de datos catastrales respecto de los predios en una entidad territorial.';


--
-- TOC entry 6640 (class 0 OID 0)
-- Dependencies: 819
-- Name: COLUMN gc_prediocatastro.tipo_catastro; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_prediocatastro.tipo_catastro IS 'Indica si el predio se encuentra en catastro fiscal o Ley 14.';


--
-- TOC entry 6641 (class 0 OID 0)
-- Dependencies: 819
-- Name: COLUMN gc_prediocatastro.numero_predial; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_prediocatastro.numero_predial IS 'Código numérico de 30 dígitos que permita localizarlo inequívocamente en los respectivos documentos catastrales, según el modelo determinado por el Instituto Geográfico Agustín Codazzi.';


--
-- TOC entry 6642 (class 0 OID 0)
-- Dependencies: 819
-- Name: COLUMN gc_prediocatastro.numero_predial_anterior; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_prediocatastro.numero_predial_anterior IS 'Código numérico de 20 dígitos que permita localizarlo inequívocamente en los respectivos documentos catastrales, según el modelo determinado por el Instituto Geográfico Agustín Codazzi.';


--
-- TOC entry 6643 (class 0 OID 0)
-- Dependencies: 819
-- Name: COLUMN gc_prediocatastro.nupre; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_prediocatastro.nupre IS 'Es un código único para identificar los inmuebles tanto en los sistemas de información catastral como registral. El NUPRE no implicará supresión de la numeración catastral ni registral asociada a la cédula catastral ni a la matrícula inmobiliaria actual.';


--
-- TOC entry 6644 (class 0 OID 0)
-- Dependencies: 819
-- Name: COLUMN gc_prediocatastro.circulo_registral; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_prediocatastro.circulo_registral IS 'Circulo registral al que se encuentra inscrito el predio.';


--
-- TOC entry 6645 (class 0 OID 0)
-- Dependencies: 819
-- Name: COLUMN gc_prediocatastro.matricula_inmobiliaria_catastro; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_prediocatastro.matricula_inmobiliaria_catastro IS 'Identificador único asignado por las oficinas de registro de instrumentos públicos.';


--
-- TOC entry 6646 (class 0 OID 0)
-- Dependencies: 819
-- Name: COLUMN gc_prediocatastro.tipo_predio; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_prediocatastro.tipo_predio IS 'Tipo de predio inscrito en catastro: Nacional, Departamental, Municipal, Particular, Baldío, Ejido, Resguardo Indígena, Tierra de comunidades negras y Reservas Naturales.';


--
-- TOC entry 6647 (class 0 OID 0)
-- Dependencies: 819
-- Name: COLUMN gc_prediocatastro.condicion_predio; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_prediocatastro.condicion_predio IS 'Caracterización temática del predio.';


--
-- TOC entry 6648 (class 0 OID 0)
-- Dependencies: 819
-- Name: COLUMN gc_prediocatastro.destinacion_economica; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_prediocatastro.destinacion_economica IS 'Es la clasificación para fines estadísticos que se da a cada inmueble en su conjunto–terreno, construcciones o edificaciones-, en el momento de la identificación predial de conformidad con la actividad predominante que en él se desarrolle.';


--
-- TOC entry 6649 (class 0 OID 0)
-- Dependencies: 819
-- Name: COLUMN gc_prediocatastro.sistema_procedencia_datos; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_prediocatastro.sistema_procedencia_datos IS 'Indica el sistema de gestión catastral de donde proceden los datos, en el caso del IGAC puede ser COBOL o SNC.';


--
-- TOC entry 6650 (class 0 OID 0)
-- Dependencies: 819
-- Name: COLUMN gc_prediocatastro.fecha_datos; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_prediocatastro.fecha_datos IS 'Fecha de la vigencia de los datos.';


--
-- TOC entry 813 (class 1259 OID 376072)
-- Name: gc_propietario; Type: TABLE; Schema: test_ladm_integration; Owner: postgres
--

CREATE TABLE test_ladm_integration.gc_propietario (
    t_id bigint DEFAULT nextval('test_ladm_integration.t_ili2db_seq'::regclass) NOT NULL,
    t_ili_tid character varying(200),
    tipo_documento character varying(100),
    numero_documento character varying(50),
    digito_verificacion character varying(1),
    primer_nombre character varying(255),
    segundo_nombre character varying(255),
    primer_apellido character varying(255),
    segundo_apellido character varying(255),
    razon_social character varying(255),
    gc_predio_catastro bigint NOT NULL
);


ALTER TABLE test_ladm_integration.gc_propietario OWNER TO postgres;

--
-- TOC entry 6651 (class 0 OID 0)
-- Dependencies: 813
-- Name: TABLE gc_propietario; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON TABLE test_ladm_integration.gc_propietario IS 'Datos de los propietarios inscritos en las bases de datos catastrales que tienen relación con un predio.';


--
-- TOC entry 6652 (class 0 OID 0)
-- Dependencies: 813
-- Name: COLUMN gc_propietario.tipo_documento; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_propietario.tipo_documento IS 'Tipo de documento del propietario registrado en la base de datos catastral.';


--
-- TOC entry 6653 (class 0 OID 0)
-- Dependencies: 813
-- Name: COLUMN gc_propietario.numero_documento; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_propietario.numero_documento IS 'Número de documento del propietario registrado en la base de datos catastral.';


--
-- TOC entry 6654 (class 0 OID 0)
-- Dependencies: 813
-- Name: COLUMN gc_propietario.digito_verificacion; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_propietario.digito_verificacion IS 'Dígito de verificación de las personas jurídicas.';


--
-- TOC entry 6655 (class 0 OID 0)
-- Dependencies: 813
-- Name: COLUMN gc_propietario.primer_nombre; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_propietario.primer_nombre IS 'Primer nombre del propietario en catastro.';


--
-- TOC entry 6656 (class 0 OID 0)
-- Dependencies: 813
-- Name: COLUMN gc_propietario.segundo_nombre; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_propietario.segundo_nombre IS 'Segundo nombre del propietario en catastro.';


--
-- TOC entry 6657 (class 0 OID 0)
-- Dependencies: 813
-- Name: COLUMN gc_propietario.primer_apellido; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_propietario.primer_apellido IS 'Primer apellido del propietario en catastro.';


--
-- TOC entry 6658 (class 0 OID 0)
-- Dependencies: 813
-- Name: COLUMN gc_propietario.segundo_apellido; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_propietario.segundo_apellido IS 'Segundo apellido del propietario en catastro.';


--
-- TOC entry 6659 (class 0 OID 0)
-- Dependencies: 813
-- Name: COLUMN gc_propietario.razon_social; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_propietario.razon_social IS 'Razon social de las personas jurídicas inscritas como propietarios en catastro.';


--
-- TOC entry 814 (class 1259 OID 376082)
-- Name: gc_sectorrural; Type: TABLE; Schema: test_ladm_integration; Owner: postgres
--

CREATE TABLE test_ladm_integration.gc_sectorrural (
    t_id bigint DEFAULT nextval('test_ladm_integration.t_ili2db_seq'::regclass) NOT NULL,
    t_ili_tid character varying(200),
    codigo character varying(9),
    geometria public.geometry(MultiPolygon,9377)
);


ALTER TABLE test_ladm_integration.gc_sectorrural OWNER TO postgres;

--
-- TOC entry 6660 (class 0 OID 0)
-- Dependencies: 814
-- Name: TABLE gc_sectorrural; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON TABLE test_ladm_integration.gc_sectorrural IS 'Dato geografico aportado por el Gestor Catastral respecto de los sectores catastrales rurales de una entidad territorial.';


--
-- TOC entry 6661 (class 0 OID 0)
-- Dependencies: 814
-- Name: COLUMN gc_sectorrural.codigo; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_sectorrural.codigo IS 'Código catastral de 9 dígitos del sector catastral.';


--
-- TOC entry 6662 (class 0 OID 0)
-- Dependencies: 814
-- Name: COLUMN gc_sectorrural.geometria; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_sectorrural.geometria IS 'Polígono de los sectores catastrales existentes en la base de datos catastral.';


--
-- TOC entry 815 (class 1259 OID 376092)
-- Name: gc_sectorurbano; Type: TABLE; Schema: test_ladm_integration; Owner: postgres
--

CREATE TABLE test_ladm_integration.gc_sectorurbano (
    t_id bigint DEFAULT nextval('test_ladm_integration.t_ili2db_seq'::regclass) NOT NULL,
    t_ili_tid character varying(200),
    codigo character varying(9),
    geometria public.geometry(MultiPolygon,9377)
);


ALTER TABLE test_ladm_integration.gc_sectorurbano OWNER TO postgres;

--
-- TOC entry 6663 (class 0 OID 0)
-- Dependencies: 815
-- Name: TABLE gc_sectorurbano; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON TABLE test_ladm_integration.gc_sectorurbano IS 'Dato geografico aportado por el Gestor Catastral respecto de los sectores catastrales urbanos de una entidad territorial.';


--
-- TOC entry 6664 (class 0 OID 0)
-- Dependencies: 815
-- Name: COLUMN gc_sectorurbano.codigo; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_sectorurbano.codigo IS 'Código catastral de 9 dígitos del sector catastral.';


--
-- TOC entry 6665 (class 0 OID 0)
-- Dependencies: 815
-- Name: COLUMN gc_sectorurbano.geometria; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_sectorurbano.geometria IS 'Polígono de los sectores catastrales existentes en la base de datos catastral.';


--
-- TOC entry 838 (class 1259 OID 376303)
-- Name: gc_sistemaprocedenciadatostipo; Type: TABLE; Schema: test_ladm_integration; Owner: postgres
--

CREATE TABLE test_ladm_integration.gc_sistemaprocedenciadatostipo (
    t_id bigint DEFAULT nextval('test_ladm_integration.t_ili2db_seq'::regclass) NOT NULL,
    thisclass character varying(1024) NOT NULL,
    baseclass character varying(1024),
    itfcode integer NOT NULL,
    ilicode character varying(1024) NOT NULL,
    seq integer,
    inactive boolean NOT NULL,
    dispname character varying(250) NOT NULL,
    description character varying(1024)
);


ALTER TABLE test_ladm_integration.gc_sistemaprocedenciadatostipo OWNER TO postgres;

--
-- TOC entry 816 (class 1259 OID 376102)
-- Name: gc_terreno; Type: TABLE; Schema: test_ladm_integration; Owner: postgres
--

CREATE TABLE test_ladm_integration.gc_terreno (
    t_id bigint DEFAULT nextval('test_ladm_integration.t_ili2db_seq'::regclass) NOT NULL,
    t_ili_tid character varying(200),
    area_terreno_alfanumerica numeric(16,2),
    area_terreno_digital numeric(16,2),
    manzana_vereda_codigo character varying(17),
    numero_subterraneos integer,
    geometria public.geometry(MultiPolygon,9377),
    gc_predio bigint NOT NULL,
    CONSTRAINT gc_terreno_area_terreno_alfanumerica_check CHECK (((area_terreno_alfanumerica >= 0.0) AND (area_terreno_alfanumerica <= 99999999999999.98))),
    CONSTRAINT gc_terreno_area_terreno_digital_check CHECK (((area_terreno_digital >= 0.0) AND (area_terreno_digital <= 99999999999999.98))),
    CONSTRAINT gc_terreno_numero_subterraneos_check CHECK (((numero_subterraneos >= 0) AND (numero_subterraneos <= 2147483647)))
);


ALTER TABLE test_ladm_integration.gc_terreno OWNER TO postgres;

--
-- TOC entry 6666 (class 0 OID 0)
-- Dependencies: 816
-- Name: TABLE gc_terreno; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON TABLE test_ladm_integration.gc_terreno IS 'Datos de los terrenos inscritos en las bases de datos catastrales en una entidad territorial.';


--
-- TOC entry 6667 (class 0 OID 0)
-- Dependencies: 816
-- Name: COLUMN gc_terreno.area_terreno_alfanumerica; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_terreno.area_terreno_alfanumerica IS 'Área de terreno alfanumérica registrada en la base de datos catastral.';


--
-- TOC entry 6668 (class 0 OID 0)
-- Dependencies: 816
-- Name: COLUMN gc_terreno.area_terreno_digital; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_terreno.area_terreno_digital IS 'Área de terreno digital registrada en la base de datos catastral.';


--
-- TOC entry 6669 (class 0 OID 0)
-- Dependencies: 816
-- Name: COLUMN gc_terreno.manzana_vereda_codigo; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_terreno.manzana_vereda_codigo IS 'Código de la manzana o vereda donde se localiza el terreno.';


--
-- TOC entry 6670 (class 0 OID 0)
-- Dependencies: 816
-- Name: COLUMN gc_terreno.numero_subterraneos; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_terreno.numero_subterraneos IS 'Número de subterráneos en el terreno.';


--
-- TOC entry 6671 (class 0 OID 0)
-- Dependencies: 816
-- Name: COLUMN gc_terreno.geometria; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_terreno.geometria IS 'Polígono de la unidad de construcción existente en la base de datos catastral.';


--
-- TOC entry 817 (class 1259 OID 376113)
-- Name: gc_unidadconstruccion; Type: TABLE; Schema: test_ladm_integration; Owner: postgres
--

CREATE TABLE test_ladm_integration.gc_unidadconstruccion (
    t_id bigint DEFAULT nextval('test_ladm_integration.t_ili2db_seq'::regclass) NOT NULL,
    t_ili_tid character varying(200),
    identificador character varying(2),
    etiqueta character varying(50),
    tipo_dominio character varying(20),
    tipo_construccion bigint,
    planta character varying(10),
    total_habitaciones integer,
    total_banios integer,
    total_locales integer,
    total_pisos integer,
    uso character varying(255),
    anio_construccion integer,
    puntaje integer,
    area_construida numeric(16,2),
    area_privada numeric(16,2),
    codigo_terreno character varying(30),
    geometria public.geometry(MultiPolygonZ,9377),
    gc_construccion bigint NOT NULL,
    CONSTRAINT gc_unidadconstruccion_anio_construccion_check CHECK (((anio_construccion >= 1512) AND (anio_construccion <= 2500))),
    CONSTRAINT gc_unidadconstruccion_area_construida_check CHECK (((area_construida >= 0.0) AND (area_construida <= 99999999999999.98))),
    CONSTRAINT gc_unidadconstruccion_area_privada_check CHECK (((area_privada >= 0.0) AND (area_privada <= 99999999999999.98))),
    CONSTRAINT gc_unidadconstruccion_puntaje_check CHECK (((puntaje >= 0) AND (puntaje <= 200))),
    CONSTRAINT gc_unidadconstruccion_total_banios_check CHECK (((total_banios >= 0) AND (total_banios <= 999999))),
    CONSTRAINT gc_unidadconstruccion_total_habitaciones_check CHECK (((total_habitaciones >= 0) AND (total_habitaciones <= 999999))),
    CONSTRAINT gc_unidadconstruccion_total_locales_check CHECK (((total_locales >= 0) AND (total_locales <= 999999))),
    CONSTRAINT gc_unidadconstruccion_total_pisos_check CHECK (((total_pisos >= 0) AND (total_pisos <= 150)))
);


ALTER TABLE test_ladm_integration.gc_unidadconstruccion OWNER TO postgres;

--
-- TOC entry 6672 (class 0 OID 0)
-- Dependencies: 817
-- Name: TABLE gc_unidadconstruccion; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON TABLE test_ladm_integration.gc_unidadconstruccion IS 'Datos de las unidades de construcción inscritas en las bases de datos catastrales en una entidad territorial.';


--
-- TOC entry 6673 (class 0 OID 0)
-- Dependencies: 817
-- Name: COLUMN gc_unidadconstruccion.identificador; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_unidadconstruccion.identificador IS 'Identificado de la unidad de construcción, su codificación puede ser por letras del abecedario.';


--
-- TOC entry 6674 (class 0 OID 0)
-- Dependencies: 817
-- Name: COLUMN gc_unidadconstruccion.etiqueta; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_unidadconstruccion.etiqueta IS 'Etiqueta de la unidad de construcción.';


--
-- TOC entry 6675 (class 0 OID 0)
-- Dependencies: 817
-- Name: COLUMN gc_unidadconstruccion.tipo_dominio; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_unidadconstruccion.tipo_dominio IS 'Indica el tipo de dominio de la unidad de construcción: común y privado.';


--
-- TOC entry 6676 (class 0 OID 0)
-- Dependencies: 817
-- Name: COLUMN gc_unidadconstruccion.tipo_construccion; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_unidadconstruccion.tipo_construccion IS 'Indica si la construcción es de tipo convencional o no convencional.';


--
-- TOC entry 6677 (class 0 OID 0)
-- Dependencies: 817
-- Name: COLUMN gc_unidadconstruccion.planta; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_unidadconstruccion.planta IS 'Indica numéricamente la ubicación del predio de acuerdo al tipo de planta.';


--
-- TOC entry 6678 (class 0 OID 0)
-- Dependencies: 817
-- Name: COLUMN gc_unidadconstruccion.total_habitaciones; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_unidadconstruccion.total_habitaciones IS 'Número total de  habitaciones en la unidad de construcción.';


--
-- TOC entry 6679 (class 0 OID 0)
-- Dependencies: 817
-- Name: COLUMN gc_unidadconstruccion.total_banios; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_unidadconstruccion.total_banios IS 'Número total de baños en la unidad de construcción.';


--
-- TOC entry 6680 (class 0 OID 0)
-- Dependencies: 817
-- Name: COLUMN gc_unidadconstruccion.total_locales; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_unidadconstruccion.total_locales IS 'Número total de locales en la unidad de construcción.';


--
-- TOC entry 6681 (class 0 OID 0)
-- Dependencies: 817
-- Name: COLUMN gc_unidadconstruccion.total_pisos; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_unidadconstruccion.total_pisos IS 'Número total de pisos en la unidad de construcción.';


--
-- TOC entry 6682 (class 0 OID 0)
-- Dependencies: 817
-- Name: COLUMN gc_unidadconstruccion.uso; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_unidadconstruccion.uso IS 'Actividad que se desarrolla en una unidad de construcción.';


--
-- TOC entry 6683 (class 0 OID 0)
-- Dependencies: 817
-- Name: COLUMN gc_unidadconstruccion.anio_construccion; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_unidadconstruccion.anio_construccion IS 'Año de construcción de la unidad de construcción.';


--
-- TOC entry 6684 (class 0 OID 0)
-- Dependencies: 817
-- Name: COLUMN gc_unidadconstruccion.puntaje; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_unidadconstruccion.puntaje IS 'Puntaje total de la calificación de construcción.';


--
-- TOC entry 6685 (class 0 OID 0)
-- Dependencies: 817
-- Name: COLUMN gc_unidadconstruccion.area_construida; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_unidadconstruccion.area_construida IS 'Área total construida en la unidad de construcción.';


--
-- TOC entry 6686 (class 0 OID 0)
-- Dependencies: 817
-- Name: COLUMN gc_unidadconstruccion.area_privada; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_unidadconstruccion.area_privada IS 'Área total privada de la unidad de construcción para los predios en régimen de propiedad horizontal.';


--
-- TOC entry 6687 (class 0 OID 0)
-- Dependencies: 817
-- Name: COLUMN gc_unidadconstruccion.codigo_terreno; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_unidadconstruccion.codigo_terreno IS 'Código catastral del terreno donde se encuentra localizada la unidad de construcción.';


--
-- TOC entry 6688 (class 0 OID 0)
-- Dependencies: 817
-- Name: COLUMN gc_unidadconstruccion.geometria; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_unidadconstruccion.geometria IS 'Polígono de la unidad de construcción existente en la base de datos catastral.';


--
-- TOC entry 837 (class 1259 OID 376294)
-- Name: gc_unidadconstrucciontipo; Type: TABLE; Schema: test_ladm_integration; Owner: postgres
--

CREATE TABLE test_ladm_integration.gc_unidadconstrucciontipo (
    t_id bigint DEFAULT nextval('test_ladm_integration.t_ili2db_seq'::regclass) NOT NULL,
    thisclass character varying(1024) NOT NULL,
    baseclass character varying(1024),
    itfcode integer NOT NULL,
    ilicode character varying(1024) NOT NULL,
    seq integer,
    inactive boolean NOT NULL,
    dispname character varying(250) NOT NULL,
    description character varying(1024)
);


ALTER TABLE test_ladm_integration.gc_unidadconstrucciontipo OWNER TO postgres;

--
-- TOC entry 818 (class 1259 OID 376125)
-- Name: gc_vereda; Type: TABLE; Schema: test_ladm_integration; Owner: postgres
--

CREATE TABLE test_ladm_integration.gc_vereda (
    t_id bigint DEFAULT nextval('test_ladm_integration.t_ili2db_seq'::regclass) NOT NULL,
    t_ili_tid character varying(200),
    codigo character varying(17),
    codigo_anterior character varying(13),
    nombre character varying(100),
    codigo_sector character varying(9),
    geometria public.geometry(MultiPolygon,9377)
);


ALTER TABLE test_ladm_integration.gc_vereda OWNER TO postgres;

--
-- TOC entry 6689 (class 0 OID 0)
-- Dependencies: 818
-- Name: TABLE gc_vereda; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON TABLE test_ladm_integration.gc_vereda IS 'Dato geografico aportado por el Gestor Catastral respecto de las veredades de una entidad territorial.';


--
-- TOC entry 6690 (class 0 OID 0)
-- Dependencies: 818
-- Name: COLUMN gc_vereda.codigo; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_vereda.codigo IS 'Código catastral de 17 dígitos de la vereda.';


--
-- TOC entry 6691 (class 0 OID 0)
-- Dependencies: 818
-- Name: COLUMN gc_vereda.codigo_anterior; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_vereda.codigo_anterior IS 'Código catastral de 13 dígitos de la vereda.';


--
-- TOC entry 6692 (class 0 OID 0)
-- Dependencies: 818
-- Name: COLUMN gc_vereda.nombre; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_vereda.nombre IS 'Nombre de la vereda.';


--
-- TOC entry 6693 (class 0 OID 0)
-- Dependencies: 818
-- Name: COLUMN gc_vereda.codigo_sector; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_vereda.codigo_sector IS 'Código catastral de 9 dígitos del código de sector donde se encuentra la vereda.';


--
-- TOC entry 6694 (class 0 OID 0)
-- Dependencies: 818
-- Name: COLUMN gc_vereda.geometria; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.gc_vereda.geometria IS 'Geometría en 2D de la vereda.';


--
-- TOC entry 797 (class 1259 OID 375925)
-- Name: gm_multisurface2d; Type: TABLE; Schema: test_ladm_integration; Owner: postgres
--

CREATE TABLE test_ladm_integration.gm_multisurface2d (
    t_id bigint DEFAULT nextval('test_ladm_integration.t_ili2db_seq'::regclass) NOT NULL,
    t_seq bigint
);


ALTER TABLE test_ladm_integration.gm_multisurface2d OWNER TO postgres;

--
-- TOC entry 799 (class 1259 OID 375942)
-- Name: gm_multisurface3d; Type: TABLE; Schema: test_ladm_integration; Owner: postgres
--

CREATE TABLE test_ladm_integration.gm_multisurface3d (
    t_id bigint DEFAULT nextval('test_ladm_integration.t_ili2db_seq'::regclass) NOT NULL,
    t_seq bigint
);


ALTER TABLE test_ladm_integration.gm_multisurface3d OWNER TO postgres;

--
-- TOC entry 796 (class 1259 OID 375914)
-- Name: gm_surface2dlistvalue; Type: TABLE; Schema: test_ladm_integration; Owner: postgres
--

CREATE TABLE test_ladm_integration.gm_surface2dlistvalue (
    t_id bigint DEFAULT nextval('test_ladm_integration.t_ili2db_seq'::regclass) NOT NULL,
    t_seq bigint,
    avalue public.geometry(Polygon,9377) NOT NULL,
    gm_multisurface2d_geometry bigint
);


ALTER TABLE test_ladm_integration.gm_surface2dlistvalue OWNER TO postgres;

--
-- TOC entry 798 (class 1259 OID 375931)
-- Name: gm_surface3dlistvalue; Type: TABLE; Schema: test_ladm_integration; Owner: postgres
--

CREATE TABLE test_ladm_integration.gm_surface3dlistvalue (
    t_id bigint DEFAULT nextval('test_ladm_integration.t_ili2db_seq'::regclass) NOT NULL,
    t_seq bigint,
    avalue public.geometry(PolygonZ,9377) NOT NULL,
    gm_multisurface3d_geometry bigint
);


ALTER TABLE test_ladm_integration.gm_surface3dlistvalue OWNER TO postgres;

--
-- TOC entry 835 (class 1259 OID 376276)
-- Name: ini_emparejamientotipo; Type: TABLE; Schema: test_ladm_integration; Owner: postgres
--

CREATE TABLE test_ladm_integration.ini_emparejamientotipo (
    t_id bigint DEFAULT nextval('test_ladm_integration.t_ili2db_seq'::regclass) NOT NULL,
    thisclass character varying(1024) NOT NULL,
    baseclass character varying(1024),
    itfcode integer NOT NULL,
    ilicode character varying(1024) NOT NULL,
    seq integer,
    inactive boolean NOT NULL,
    dispname character varying(250) NOT NULL,
    description character varying(1024)
);


ALTER TABLE test_ladm_integration.ini_emparejamientotipo OWNER TO postgres;

--
-- TOC entry 828 (class 1259 OID 376220)
-- Name: ini_predioinsumos; Type: TABLE; Schema: test_ladm_integration; Owner: postgres
--

CREATE TABLE test_ladm_integration.ini_predioinsumos (
    t_id bigint DEFAULT nextval('test_ladm_integration.t_ili2db_seq'::regclass) NOT NULL,
    t_ili_tid character varying(200),
    tipo_emparejamiento bigint,
    observaciones text,
    gc_predio_catastro bigint,
    snr_predio_juridico bigint
);


ALTER TABLE test_ladm_integration.ini_predioinsumos OWNER TO postgres;

--
-- TOC entry 6695 (class 0 OID 0)
-- Dependencies: 828
-- Name: TABLE ini_predioinsumos; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON TABLE test_ladm_integration.ini_predioinsumos IS 'Clase que relaciona los predios en los modelos de insumos para el Gestor Catastral y la SNR.';


--
-- TOC entry 6696 (class 0 OID 0)
-- Dependencies: 828
-- Name: COLUMN ini_predioinsumos.tipo_emparejamiento; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.ini_predioinsumos.tipo_emparejamiento IS 'Tipo de emparejamiento de insumos Catastro-Registro';


--
-- TOC entry 6697 (class 0 OID 0)
-- Dependencies: 828
-- Name: COLUMN ini_predioinsumos.observaciones; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.ini_predioinsumos.observaciones IS 'Observaciones de la relación.';


--
-- TOC entry 842 (class 1259 OID 376339)
-- Name: snr_calidadderechotipo; Type: TABLE; Schema: test_ladm_integration; Owner: postgres
--

CREATE TABLE test_ladm_integration.snr_calidadderechotipo (
    t_id bigint DEFAULT nextval('test_ladm_integration.t_ili2db_seq'::regclass) NOT NULL,
    thisclass character varying(1024) NOT NULL,
    baseclass character varying(1024),
    itfcode integer NOT NULL,
    ilicode character varying(1024) NOT NULL,
    seq integer,
    inactive boolean NOT NULL,
    dispname character varying(250) NOT NULL,
    description character varying(1024)
);


ALTER TABLE test_ladm_integration.snr_calidadderechotipo OWNER TO postgres;

--
-- TOC entry 839 (class 1259 OID 376312)
-- Name: snr_clasepredioregistrotipo; Type: TABLE; Schema: test_ladm_integration; Owner: postgres
--

CREATE TABLE test_ladm_integration.snr_clasepredioregistrotipo (
    t_id bigint DEFAULT nextval('test_ladm_integration.t_ili2db_seq'::regclass) NOT NULL,
    thisclass character varying(1024) NOT NULL,
    baseclass character varying(1024),
    itfcode integer NOT NULL,
    ilicode character varying(1024) NOT NULL,
    seq integer,
    inactive boolean NOT NULL,
    dispname character varying(250) NOT NULL,
    description character varying(1024)
);


ALTER TABLE test_ladm_integration.snr_clasepredioregistrotipo OWNER TO postgres;

--
-- TOC entry 821 (class 1259 OID 376154)
-- Name: snr_derecho; Type: TABLE; Schema: test_ladm_integration; Owner: postgres
--

CREATE TABLE test_ladm_integration.snr_derecho (
    t_id bigint DEFAULT nextval('test_ladm_integration.t_ili2db_seq'::regclass) NOT NULL,
    t_ili_tid character varying(200),
    calidad_derecho_registro bigint NOT NULL,
    codigo_naturaleza_juridica character varying(5),
    snr_fuente_derecho bigint NOT NULL,
    snr_predio_registro bigint NOT NULL
);


ALTER TABLE test_ladm_integration.snr_derecho OWNER TO postgres;

--
-- TOC entry 6698 (class 0 OID 0)
-- Dependencies: 821
-- Name: TABLE snr_derecho; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON TABLE test_ladm_integration.snr_derecho IS 'Datos del derecho inscrito en la SNR.';


--
-- TOC entry 6699 (class 0 OID 0)
-- Dependencies: 821
-- Name: COLUMN snr_derecho.calidad_derecho_registro; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.snr_derecho.calidad_derecho_registro IS 'Calidad de derecho en registro';


--
-- TOC entry 6700 (class 0 OID 0)
-- Dependencies: 821
-- Name: COLUMN snr_derecho.codigo_naturaleza_juridica; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.snr_derecho.codigo_naturaleza_juridica IS 'es el número asignado en el registro a cada acto sujeto a registro.';


--
-- TOC entry 836 (class 1259 OID 376285)
-- Name: snr_documentotitulartipo; Type: TABLE; Schema: test_ladm_integration; Owner: postgres
--

CREATE TABLE test_ladm_integration.snr_documentotitulartipo (
    t_id bigint DEFAULT nextval('test_ladm_integration.t_ili2db_seq'::regclass) NOT NULL,
    thisclass character varying(1024) NOT NULL,
    baseclass character varying(1024),
    itfcode integer NOT NULL,
    ilicode character varying(1024) NOT NULL,
    seq integer,
    inactive boolean NOT NULL,
    dispname character varying(250) NOT NULL,
    description character varying(1024)
);


ALTER TABLE test_ladm_integration.snr_documentotitulartipo OWNER TO postgres;

--
-- TOC entry 822 (class 1259 OID 376163)
-- Name: snr_estructuramatriculamatriz; Type: TABLE; Schema: test_ladm_integration; Owner: postgres
--

CREATE TABLE test_ladm_integration.snr_estructuramatriculamatriz (
    t_id bigint DEFAULT nextval('test_ladm_integration.t_ili2db_seq'::regclass) NOT NULL,
    t_seq bigint,
    codigo_orip character varying(20),
    matricula_inmobiliaria character varying(20),
    snr_predioregistro_matricula_inmobiliaria_matriz bigint
);


ALTER TABLE test_ladm_integration.snr_estructuramatriculamatriz OWNER TO postgres;

--
-- TOC entry 6701 (class 0 OID 0)
-- Dependencies: 822
-- Name: COLUMN snr_estructuramatriculamatriz.codigo_orip; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.snr_estructuramatriculamatriz.codigo_orip IS 'Es el nùmero que se ha asignado a la Oficina de Registro de Instrumentos públicos correspondiente.';


--
-- TOC entry 6702 (class 0 OID 0)
-- Dependencies: 822
-- Name: COLUMN snr_estructuramatriculamatriz.matricula_inmobiliaria; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.snr_estructuramatriculamatriz.matricula_inmobiliaria IS 'Es el consecutivo que se asigna a cada predio jurídico abierto en la ORIP.';


--
-- TOC entry 6703 (class 0 OID 0)
-- Dependencies: 822
-- Name: COLUMN snr_estructuramatriculamatriz.snr_predioregistro_matricula_inmobiliaria_matriz; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.snr_estructuramatriculamatriz.snr_predioregistro_matricula_inmobiliaria_matriz IS 'Es la matrícula por la cual se dio apertura al predio objeto de estudio (la madre).';


--
-- TOC entry 823 (class 1259 OID 376170)
-- Name: snr_fuentecabidalinderos; Type: TABLE; Schema: test_ladm_integration; Owner: postgres
--

CREATE TABLE test_ladm_integration.snr_fuentecabidalinderos (
    t_id bigint DEFAULT nextval('test_ladm_integration.t_ili2db_seq'::regclass) NOT NULL,
    t_ili_tid character varying(200),
    tipo_documento bigint,
    numero_documento character varying(255),
    fecha_documento date,
    ente_emisor character varying(255),
    ciudad_emisora character varying(255)
);


ALTER TABLE test_ladm_integration.snr_fuentecabidalinderos OWNER TO postgres;

--
-- TOC entry 6704 (class 0 OID 0)
-- Dependencies: 823
-- Name: TABLE snr_fuentecabidalinderos; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON TABLE test_ladm_integration.snr_fuentecabidalinderos IS 'Datos del documento que soporta la descripción de cabida y linderos.';


--
-- TOC entry 6705 (class 0 OID 0)
-- Dependencies: 823
-- Name: COLUMN snr_fuentecabidalinderos.tipo_documento; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.snr_fuentecabidalinderos.tipo_documento IS 'Tipo de documento que soporta la relación de tenencia entre el interesado con el predio.';


--
-- TOC entry 6706 (class 0 OID 0)
-- Dependencies: 823
-- Name: COLUMN snr_fuentecabidalinderos.numero_documento; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.snr_fuentecabidalinderos.numero_documento IS 'Identificador del documento, ejemplo: numero de la resolución';


--
-- TOC entry 6707 (class 0 OID 0)
-- Dependencies: 823
-- Name: COLUMN snr_fuentecabidalinderos.ente_emisor; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.snr_fuentecabidalinderos.ente_emisor IS 'Es tipo de oficina que emite el documento (notaria, juzgado)';


--
-- TOC entry 6708 (class 0 OID 0)
-- Dependencies: 823
-- Name: COLUMN snr_fuentecabidalinderos.ciudad_emisora; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.snr_fuentecabidalinderos.ciudad_emisora IS 'Es la ciudad donde se encuentra ubicada la oficina que expide el documento.';


--
-- TOC entry 824 (class 1259 OID 376180)
-- Name: snr_fuentederecho; Type: TABLE; Schema: test_ladm_integration; Owner: postgres
--

CREATE TABLE test_ladm_integration.snr_fuentederecho (
    t_id bigint DEFAULT nextval('test_ladm_integration.t_ili2db_seq'::regclass) NOT NULL,
    t_ili_tid character varying(200),
    tipo_documento bigint,
    numero_documento character varying(255),
    fecha_documento date,
    ente_emisor character varying(255),
    ciudad_emisora character varying(255)
);


ALTER TABLE test_ladm_integration.snr_fuentederecho OWNER TO postgres;

--
-- TOC entry 6709 (class 0 OID 0)
-- Dependencies: 824
-- Name: TABLE snr_fuentederecho; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON TABLE test_ladm_integration.snr_fuentederecho IS 'Datos del documento que soporta el derecho.';


--
-- TOC entry 6710 (class 0 OID 0)
-- Dependencies: 824
-- Name: COLUMN snr_fuentederecho.tipo_documento; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.snr_fuentederecho.tipo_documento IS 'Tipo de documento que soporta la relación de tenencia entre el interesado con el predio.';


--
-- TOC entry 6711 (class 0 OID 0)
-- Dependencies: 824
-- Name: COLUMN snr_fuentederecho.numero_documento; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.snr_fuentederecho.numero_documento IS 'Identificador del documento, ejemplo: numero de la resolución';


--
-- TOC entry 6712 (class 0 OID 0)
-- Dependencies: 824
-- Name: COLUMN snr_fuentederecho.ente_emisor; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.snr_fuentederecho.ente_emisor IS 'Es tipo de oficina que emite el documento (notaria, juzgado)';


--
-- TOC entry 6713 (class 0 OID 0)
-- Dependencies: 824
-- Name: COLUMN snr_fuentederecho.ciudad_emisora; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.snr_fuentederecho.ciudad_emisora IS 'Es la ciudad donde se encuentra ubicada la oficina que expide el documento.';


--
-- TOC entry 841 (class 1259 OID 376330)
-- Name: snr_fuentetipo; Type: TABLE; Schema: test_ladm_integration; Owner: postgres
--

CREATE TABLE test_ladm_integration.snr_fuentetipo (
    t_id bigint DEFAULT nextval('test_ladm_integration.t_ili2db_seq'::regclass) NOT NULL,
    thisclass character varying(1024) NOT NULL,
    baseclass character varying(1024),
    itfcode integer NOT NULL,
    ilicode character varying(1024) NOT NULL,
    seq integer,
    inactive boolean NOT NULL,
    dispname character varying(250) NOT NULL,
    description character varying(1024)
);


ALTER TABLE test_ladm_integration.snr_fuentetipo OWNER TO postgres;

--
-- TOC entry 843 (class 1259 OID 376348)
-- Name: snr_personatitulartipo; Type: TABLE; Schema: test_ladm_integration; Owner: postgres
--

CREATE TABLE test_ladm_integration.snr_personatitulartipo (
    t_id bigint DEFAULT nextval('test_ladm_integration.t_ili2db_seq'::regclass) NOT NULL,
    thisclass character varying(1024) NOT NULL,
    baseclass character varying(1024),
    itfcode integer NOT NULL,
    ilicode character varying(1024) NOT NULL,
    seq integer,
    inactive boolean NOT NULL,
    dispname character varying(250) NOT NULL,
    description character varying(1024)
);


ALTER TABLE test_ladm_integration.snr_personatitulartipo OWNER TO postgres;

--
-- TOC entry 826 (class 1259 OID 376201)
-- Name: snr_predioregistro; Type: TABLE; Schema: test_ladm_integration; Owner: postgres
--

CREATE TABLE test_ladm_integration.snr_predioregistro (
    t_id bigint DEFAULT nextval('test_ladm_integration.t_ili2db_seq'::regclass) NOT NULL,
    t_ili_tid character varying(200),
    codigo_orip character varying(3),
    matricula_inmobiliaria character varying(80),
    numero_predial_nuevo_en_fmi character varying(100),
    numero_predial_anterior_en_fmi character varying(100),
    nomenclatura_registro character varying(255),
    cabida_linderos text,
    clase_suelo_registro bigint,
    fecha_datos date NOT NULL,
    snr_fuente_cabidalinderos bigint
);


ALTER TABLE test_ladm_integration.snr_predioregistro OWNER TO postgres;

--
-- TOC entry 6714 (class 0 OID 0)
-- Dependencies: 826
-- Name: TABLE snr_predioregistro; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON TABLE test_ladm_integration.snr_predioregistro IS 'Datos del predio entregados por la SNR.';


--
-- TOC entry 6715 (class 0 OID 0)
-- Dependencies: 826
-- Name: COLUMN snr_predioregistro.codigo_orip; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.snr_predioregistro.codigo_orip IS 'Es el nùmero que se ha asignado a la Oficina de Registro de Instrumentos públicos correspondiente.';


--
-- TOC entry 6716 (class 0 OID 0)
-- Dependencies: 826
-- Name: COLUMN snr_predioregistro.matricula_inmobiliaria; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.snr_predioregistro.matricula_inmobiliaria IS 'Es el consecutivo que se asigna a cada predio jurídico abierto en la ORIP.';


--
-- TOC entry 6717 (class 0 OID 0)
-- Dependencies: 826
-- Name: COLUMN snr_predioregistro.numero_predial_nuevo_en_fmi; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.snr_predioregistro.numero_predial_nuevo_en_fmi IS 'Nuevo código númerico de treinta (30) dígitos, que se le asigna a cada predio y busca localizarlo inequívocamente en los documentos catastrales, según el modelo determinado por el Instituto Geográfico Agustin Codazzi, registrado en SNR.';


--
-- TOC entry 6718 (class 0 OID 0)
-- Dependencies: 826
-- Name: COLUMN snr_predioregistro.numero_predial_anterior_en_fmi; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.snr_predioregistro.numero_predial_anterior_en_fmi IS 'Anterior código númerico de veinte (20) digitos, que se le asigna a cada predio y busca localizarlo inequívocamente en los documentos catastrales, según el modelo determinado por el Instituto Geográfico Agustin Codazzi, registrado en SNR.';


--
-- TOC entry 6719 (class 0 OID 0)
-- Dependencies: 826
-- Name: COLUMN snr_predioregistro.nomenclatura_registro; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.snr_predioregistro.nomenclatura_registro IS 'Conjunto de símbolos alfanuméricos, los cuales designan vías y predios de la ciudad.';


--
-- TOC entry 6720 (class 0 OID 0)
-- Dependencies: 826
-- Name: COLUMN snr_predioregistro.cabida_linderos; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.snr_predioregistro.cabida_linderos IS 'El texto de cabida y linderosque está consignado en el registro público de la propiedad sobre el cual se ejercen los derechos.';


--
-- TOC entry 6721 (class 0 OID 0)
-- Dependencies: 826
-- Name: COLUMN snr_predioregistro.clase_suelo_registro; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.snr_predioregistro.clase_suelo_registro IS 'Corresponde al dato de tipo de predio incorporado en las bases de datos registrales';


--
-- TOC entry 6722 (class 0 OID 0)
-- Dependencies: 826
-- Name: COLUMN snr_predioregistro.fecha_datos; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.snr_predioregistro.fecha_datos IS 'Fecha de la generación de datos.';


--
-- TOC entry 825 (class 1259 OID 376190)
-- Name: snr_titular; Type: TABLE; Schema: test_ladm_integration; Owner: postgres
--

CREATE TABLE test_ladm_integration.snr_titular (
    t_id bigint DEFAULT nextval('test_ladm_integration.t_ili2db_seq'::regclass) NOT NULL,
    t_ili_tid character varying(200),
    tipo_persona bigint,
    tipo_documento bigint,
    numero_documento character varying(50) NOT NULL,
    nombres character varying(500),
    primer_apellido character varying(255),
    segundo_apellido character varying(255),
    razon_social character varying(255)
);


ALTER TABLE test_ladm_integration.snr_titular OWNER TO postgres;

--
-- TOC entry 6723 (class 0 OID 0)
-- Dependencies: 825
-- Name: TABLE snr_titular; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON TABLE test_ladm_integration.snr_titular IS 'Datos de titulares de derecho inscritos en la SNR.';


--
-- TOC entry 6724 (class 0 OID 0)
-- Dependencies: 825
-- Name: COLUMN snr_titular.tipo_persona; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.snr_titular.tipo_persona IS 'Tipo de persona';


--
-- TOC entry 6725 (class 0 OID 0)
-- Dependencies: 825
-- Name: COLUMN snr_titular.tipo_documento; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.snr_titular.tipo_documento IS 'Tipo de documento del que se trata.';


--
-- TOC entry 6726 (class 0 OID 0)
-- Dependencies: 825
-- Name: COLUMN snr_titular.numero_documento; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.snr_titular.numero_documento IS 'Documento de identidad del interesado.';


--
-- TOC entry 6727 (class 0 OID 0)
-- Dependencies: 825
-- Name: COLUMN snr_titular.nombres; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.snr_titular.nombres IS 'Nombres de la persona física.';


--
-- TOC entry 6728 (class 0 OID 0)
-- Dependencies: 825
-- Name: COLUMN snr_titular.primer_apellido; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.snr_titular.primer_apellido IS 'Primer apellido de la persona física.';


--
-- TOC entry 6729 (class 0 OID 0)
-- Dependencies: 825
-- Name: COLUMN snr_titular.segundo_apellido; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.snr_titular.segundo_apellido IS 'Segundo apellido de la persona física.';


--
-- TOC entry 6730 (class 0 OID 0)
-- Dependencies: 825
-- Name: COLUMN snr_titular.razon_social; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON COLUMN test_ladm_integration.snr_titular.razon_social IS 'Nombre con el que está inscrita la persona jurídica';


--
-- TOC entry 827 (class 1259 OID 376212)
-- Name: snr_titular_derecho; Type: TABLE; Schema: test_ladm_integration; Owner: postgres
--

CREATE TABLE test_ladm_integration.snr_titular_derecho (
    t_id bigint DEFAULT nextval('test_ladm_integration.t_ili2db_seq'::regclass) NOT NULL,
    t_ili_tid character varying(200),
    snr_titular bigint NOT NULL,
    snr_derecho bigint NOT NULL,
    porcentaje_participacion character varying(100)
);


ALTER TABLE test_ladm_integration.snr_titular_derecho OWNER TO postgres;

--
-- TOC entry 6731 (class 0 OID 0)
-- Dependencies: 827
-- Name: TABLE snr_titular_derecho; Type: COMMENT; Schema: test_ladm_integration; Owner: postgres
--

COMMENT ON TABLE test_ladm_integration.snr_titular_derecho IS 'Datos del titular del derecho con relación al porcentaje de participación en el derecho';


--
-- TOC entry 845 (class 1259 OID 376365)
-- Name: t_ili2db_attrname; Type: TABLE; Schema: test_ladm_integration; Owner: postgres
--

CREATE TABLE test_ladm_integration.t_ili2db_attrname (
    iliname character varying(1024) NOT NULL,
    sqlname character varying(1024) NOT NULL,
    colowner character varying(1024) NOT NULL,
    target character varying(1024)
);


ALTER TABLE test_ladm_integration.t_ili2db_attrname OWNER TO postgres;

--
-- TOC entry 829 (class 1259 OID 376232)
-- Name: t_ili2db_basket; Type: TABLE; Schema: test_ladm_integration; Owner: postgres
--

CREATE TABLE test_ladm_integration.t_ili2db_basket (
    t_id bigint NOT NULL,
    dataset bigint,
    topic character varying(200) NOT NULL,
    t_ili_tid character varying(200),
    attachmentkey character varying(200) NOT NULL,
    domains character varying(1024)
);


ALTER TABLE test_ladm_integration.t_ili2db_basket OWNER TO postgres;

--
-- TOC entry 844 (class 1259 OID 376357)
-- Name: t_ili2db_classname; Type: TABLE; Schema: test_ladm_integration; Owner: postgres
--

CREATE TABLE test_ladm_integration.t_ili2db_classname (
    iliname character varying(1024) NOT NULL,
    sqlname character varying(1024) NOT NULL
);


ALTER TABLE test_ladm_integration.t_ili2db_classname OWNER TO postgres;

--
-- TOC entry 846 (class 1259 OID 376373)
-- Name: t_ili2db_column_prop; Type: TABLE; Schema: test_ladm_integration; Owner: postgres
--

CREATE TABLE test_ladm_integration.t_ili2db_column_prop (
    tablename character varying(255) NOT NULL,
    subtype character varying(255),
    columnname character varying(255) NOT NULL,
    tag character varying(1024) NOT NULL,
    setting character varying(1024) NOT NULL
);


ALTER TABLE test_ladm_integration.t_ili2db_column_prop OWNER TO postgres;

--
-- TOC entry 830 (class 1259 OID 376241)
-- Name: t_ili2db_dataset; Type: TABLE; Schema: test_ladm_integration; Owner: postgres
--

CREATE TABLE test_ladm_integration.t_ili2db_dataset (
    t_id bigint NOT NULL,
    datasetname character varying(200)
);


ALTER TABLE test_ladm_integration.t_ili2db_dataset OWNER TO postgres;

--
-- TOC entry 831 (class 1259 OID 376246)
-- Name: t_ili2db_inheritance; Type: TABLE; Schema: test_ladm_integration; Owner: postgres
--

CREATE TABLE test_ladm_integration.t_ili2db_inheritance (
    thisclass character varying(1024) NOT NULL,
    baseclass character varying(1024)
);


ALTER TABLE test_ladm_integration.t_ili2db_inheritance OWNER TO postgres;

--
-- TOC entry 848 (class 1259 OID 376385)
-- Name: t_ili2db_meta_attrs; Type: TABLE; Schema: test_ladm_integration; Owner: postgres
--

CREATE TABLE test_ladm_integration.t_ili2db_meta_attrs (
    ilielement character varying(255) NOT NULL,
    attr_name character varying(1024) NOT NULL,
    attr_value character varying(1024) NOT NULL
);


ALTER TABLE test_ladm_integration.t_ili2db_meta_attrs OWNER TO postgres;

--
-- TOC entry 834 (class 1259 OID 376268)
-- Name: t_ili2db_model; Type: TABLE; Schema: test_ladm_integration; Owner: postgres
--

CREATE TABLE test_ladm_integration.t_ili2db_model (
    filename character varying(250) NOT NULL,
    iliversion character varying(3) NOT NULL,
    modelname text NOT NULL,
    content text NOT NULL,
    importdate timestamp without time zone NOT NULL
);


ALTER TABLE test_ladm_integration.t_ili2db_model OWNER TO postgres;

--
-- TOC entry 832 (class 1259 OID 376254)
-- Name: t_ili2db_settings; Type: TABLE; Schema: test_ladm_integration; Owner: postgres
--

CREATE TABLE test_ladm_integration.t_ili2db_settings (
    tag character varying(60) NOT NULL,
    setting character varying(1024)
);


ALTER TABLE test_ladm_integration.t_ili2db_settings OWNER TO postgres;

--
-- TOC entry 847 (class 1259 OID 376379)
-- Name: t_ili2db_table_prop; Type: TABLE; Schema: test_ladm_integration; Owner: postgres
--

CREATE TABLE test_ladm_integration.t_ili2db_table_prop (
    tablename character varying(255) NOT NULL,
    tag character varying(1024) NOT NULL,
    setting character varying(1024) NOT NULL
);


ALTER TABLE test_ladm_integration.t_ili2db_table_prop OWNER TO postgres;

--
-- TOC entry 833 (class 1259 OID 376262)
-- Name: t_ili2db_trafo; Type: TABLE; Schema: test_ladm_integration; Owner: postgres
--

CREATE TABLE test_ladm_integration.t_ili2db_trafo (
    iliname character varying(1024) NOT NULL,
    tag character varying(1024) NOT NULL,
    setting character varying(1024) NOT NULL
);


ALTER TABLE test_ladm_integration.t_ili2db_trafo OWNER TO postgres;

--
-- TOC entry 6510 (class 0 OID 375948)
-- Dependencies: 800
-- Data for Name: extarchivo; Type: TABLE DATA; Schema: test_ladm_integration; Owner: postgres
--

COPY test_ladm_integration.extarchivo (t_id, t_seq, fecha_aceptacion, datos, extraccion, fecha_grabacion, fecha_entrega, espacio_de_nombres, local_id, snr_fuentecabidalndros_archivo) FROM stdin;
\.


--
-- TOC entry 6511 (class 0 OID 375958)
-- Dependencies: 801
-- Data for Name: gc_barrio; Type: TABLE DATA; Schema: test_ladm_integration; Owner: postgres
--

COPY test_ladm_integration.gc_barrio (t_id, t_ili_tid, codigo, nombre, codigo_sector, geometria) FROM stdin;
\.


--
-- TOC entry 6512 (class 0 OID 375968)
-- Dependencies: 802
-- Data for Name: gc_calificacionunidadconstruccion; Type: TABLE DATA; Schema: test_ladm_integration; Owner: postgres
--

COPY test_ladm_integration.gc_calificacionunidadconstruccion (t_id, t_ili_tid, componente, elemento_calificacion, detalle_calificacion, puntos, gc_unidadconstruccion) FROM stdin;
\.


--
-- TOC entry 6513 (class 0 OID 375978)
-- Dependencies: 803
-- Data for Name: gc_comisionesconstruccion; Type: TABLE DATA; Schema: test_ladm_integration; Owner: postgres
--

COPY test_ladm_integration.gc_comisionesconstruccion (t_id, t_ili_tid, numero_predial, geometria) FROM stdin;
\.


--
-- TOC entry 6514 (class 0 OID 375988)
-- Dependencies: 804
-- Data for Name: gc_comisionesterreno; Type: TABLE DATA; Schema: test_ladm_integration; Owner: postgres
--

COPY test_ladm_integration.gc_comisionesterreno (t_id, t_ili_tid, numero_predial, geometria) FROM stdin;
\.


--
-- TOC entry 6515 (class 0 OID 375998)
-- Dependencies: 805
-- Data for Name: gc_comisionesunidadconstruccion; Type: TABLE DATA; Schema: test_ladm_integration; Owner: postgres
--

COPY test_ladm_integration.gc_comisionesunidadconstruccion (t_id, t_ili_tid, numero_predial, geometria) FROM stdin;
\.


--
-- TOC entry 6550 (class 0 OID 376321)
-- Dependencies: 840
-- Data for Name: gc_condicionprediotipo; Type: TABLE DATA; Schema: test_ladm_integration; Owner: postgres
--

COPY test_ladm_integration.gc_condicionprediotipo (t_id, thisclass, baseclass, itfcode, ilicode, seq, inactive, dispname, description) FROM stdin;
26	Submodelo_Insumos_Gestor_Catastral_V1_0.GC_CondicionPredioTipo	\N	0	NPH	\N	f	No propiedad horizontal	Predio no sometido al régimen de propiedad horizontal.
27	Submodelo_Insumos_Gestor_Catastral_V1_0.GC_CondicionPredioTipo	\N	1	PH.Matriz	\N	f	(PH) Matriz	Predio matriz del régimen de propiedad horizontal sobre el cual se segregan todas las unidades prediales.
28	Submodelo_Insumos_Gestor_Catastral_V1_0.GC_CondicionPredioTipo	\N	2	PH.Unidad_Predial	\N	f	(PH) Unidad predial	Apartamento, garaje, depósito o cualquier otro tipo de unidad predial dentro del PH que se encuentra debidamente inscrito en el registro de instrumentos públicos
29	Submodelo_Insumos_Gestor_Catastral_V1_0.GC_CondicionPredioTipo	\N	3	Condominio.Matriz	\N	f	(Condominio) Matriz	Predio matriz del condominio sobre el cual se segregan todas las unidades prediales.
30	Submodelo_Insumos_Gestor_Catastral_V1_0.GC_CondicionPredioTipo	\N	4	Condominio.Unidad_Predial	\N	f	(Condominio) Unidad predial	Unidad predial dentro del condominio matriz.
31	Submodelo_Insumos_Gestor_Catastral_V1_0.GC_CondicionPredioTipo	\N	5	Mejora.PH	\N	f	(Mejora) Propiedad horizontal	Mejora sobre un predio sometido a régimen de propiedad horizontal
32	Submodelo_Insumos_Gestor_Catastral_V1_0.GC_CondicionPredioTipo	\N	6	Mejora.NPH	\N	f	(Mejora) No propiedad horizontal	Mejora sobre un predio no sometido a régimen de propiedad horizontal.
33	Submodelo_Insumos_Gestor_Catastral_V1_0.GC_CondicionPredioTipo	\N	7	Parque_Cementerio.Matriz	\N	f	(Parque cementerio) Matriz	Predios sobre los cuales las áreas de terreno y construcciones son dedicadas a la cremación, inhumación o enterramiento de personas fallecidas.
34	Submodelo_Insumos_Gestor_Catastral_V1_0.GC_CondicionPredioTipo	\N	8	Parque_Cementerio.Unidad_Predial	\N	f	(Parque cementerio) Unidad predial	Área o sección de terreno con función de tumba, esta debe encontrarse inscrita en el registro de instrumentos públicos.
35	Submodelo_Insumos_Gestor_Catastral_V1_0.GC_CondicionPredioTipo	\N	9	Via	\N	f	Vía	Espacio (terreno y construcción) diseñado y destinado para el tránsito de vehículos, personas, entre otros.
36	Submodelo_Insumos_Gestor_Catastral_V1_0.GC_CondicionPredioTipo	\N	10	Bien_Uso_Publico	\N	f	Bien de uso público	Inmuebles que siendo de dominio de la Nación, o una entidad territorial o de particulares, están destinados al uso de los habitantes.
\.


--
-- TOC entry 6516 (class 0 OID 376008)
-- Dependencies: 806
-- Data for Name: gc_construccion; Type: TABLE DATA; Schema: test_ladm_integration; Owner: postgres
--

COPY test_ladm_integration.gc_construccion (t_id, t_ili_tid, identificador, etiqueta, tipo_construccion, tipo_dominio, numero_pisos, numero_sotanos, numero_mezanines, numero_semisotanos, codigo_edificacion, codigo_terreno, area_construida, geometria, gc_predio) FROM stdin;
\.


--
-- TOC entry 6530 (class 0 OID 376146)
-- Dependencies: 820
-- Data for Name: gc_copropiedad; Type: TABLE DATA; Schema: test_ladm_integration; Owner: postgres
--

COPY test_ladm_integration.gc_copropiedad (t_id, gc_matriz, gc_unidad, coeficiente_copropiedad) FROM stdin;
\.


--
-- TOC entry 6517 (class 0 OID 376020)
-- Dependencies: 807
-- Data for Name: gc_datosphcondominio; Type: TABLE DATA; Schema: test_ladm_integration; Owner: postgres
--

COPY test_ladm_integration.gc_datosphcondominio (t_id, t_ili_tid, area_total_terreno_privada, area_total_terreno_comun, area_total_construida_privada, area_total_construida_comun, total_unidades_privadas, total_unidades_sotano, valor_total_avaluo_catastral, gc_predio) FROM stdin;
\.


--
-- TOC entry 6518 (class 0 OID 376027)
-- Dependencies: 808
-- Data for Name: gc_datostorreph; Type: TABLE DATA; Schema: test_ladm_integration; Owner: postgres
--

COPY test_ladm_integration.gc_datostorreph (t_id, t_ili_tid, torre, total_pisos_torre, total_unidades_privadas, total_sotanos, total_unidades_sotano, gc_datosphcondominio) FROM stdin;
\.


--
-- TOC entry 6519 (class 0 OID 376034)
-- Dependencies: 809
-- Data for Name: gc_direccion; Type: TABLE DATA; Schema: test_ladm_integration; Owner: postgres
--

COPY test_ladm_integration.gc_direccion (t_id, t_seq, valor, principal, geometria_referencia, gc_prediocatastro_direcciones) FROM stdin;
\.


--
-- TOC entry 6520 (class 0 OID 376045)
-- Dependencies: 810
-- Data for Name: gc_estadopredio; Type: TABLE DATA; Schema: test_ladm_integration; Owner: postgres
--

COPY test_ladm_integration.gc_estadopredio (t_id, t_seq, estado_alerta, entidad_emisora_alerta, fecha_alerta, gc_prediocatastro_estado_predio) FROM stdin;
\.


--
-- TOC entry 6521 (class 0 OID 376052)
-- Dependencies: 811
-- Data for Name: gc_manzana; Type: TABLE DATA; Schema: test_ladm_integration; Owner: postgres
--

COPY test_ladm_integration.gc_manzana (t_id, t_ili_tid, codigo, codigo_anterior, codigo_barrio, geometria) FROM stdin;
\.


--
-- TOC entry 6522 (class 0 OID 376062)
-- Dependencies: 812
-- Data for Name: gc_perimetro; Type: TABLE DATA; Schema: test_ladm_integration; Owner: postgres
--

COPY test_ladm_integration.gc_perimetro (t_id, t_ili_tid, codigo_departamento, codigo_municipio, tipo_avaluo, nombre_geografico, codigo_nombre, geometria) FROM stdin;
\.


--
-- TOC entry 6529 (class 0 OID 376135)
-- Dependencies: 819
-- Data for Name: gc_prediocatastro; Type: TABLE DATA; Schema: test_ladm_integration; Owner: postgres
--

COPY test_ladm_integration.gc_prediocatastro (t_id, t_ili_tid, tipo_catastro, numero_predial, numero_predial_anterior, nupre, circulo_registral, matricula_inmobiliaria_catastro, tipo_predio, condicion_predio, destinacion_economica, sistema_procedencia_datos, fecha_datos) FROM stdin;
\.


--
-- TOC entry 6523 (class 0 OID 376072)
-- Dependencies: 813
-- Data for Name: gc_propietario; Type: TABLE DATA; Schema: test_ladm_integration; Owner: postgres
--

COPY test_ladm_integration.gc_propietario (t_id, t_ili_tid, tipo_documento, numero_documento, digito_verificacion, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, razon_social, gc_predio_catastro) FROM stdin;
\.


--
-- TOC entry 6524 (class 0 OID 376082)
-- Dependencies: 814
-- Data for Name: gc_sectorrural; Type: TABLE DATA; Schema: test_ladm_integration; Owner: postgres
--

COPY test_ladm_integration.gc_sectorrural (t_id, t_ili_tid, codigo, geometria) FROM stdin;
\.


--
-- TOC entry 6525 (class 0 OID 376092)
-- Dependencies: 815
-- Data for Name: gc_sectorurbano; Type: TABLE DATA; Schema: test_ladm_integration; Owner: postgres
--

COPY test_ladm_integration.gc_sectorurbano (t_id, t_ili_tid, codigo, geometria) FROM stdin;
\.


--
-- TOC entry 6548 (class 0 OID 376303)
-- Dependencies: 838
-- Data for Name: gc_sistemaprocedenciadatostipo; Type: TABLE DATA; Schema: test_ladm_integration; Owner: postgres
--

COPY test_ladm_integration.gc_sistemaprocedenciadatostipo (t_id, thisclass, baseclass, itfcode, ilicode, seq, inactive, dispname, description) FROM stdin;
21	Submodelo_Insumos_Gestor_Catastral_V1_0.GC_SistemaProcedenciaDatosTipo	\N	0	SNC	\N	f	Sistema Nacional Catastral	Datos extraídos del Sistema Nacional Catastral del IGAC.
22	Submodelo_Insumos_Gestor_Catastral_V1_0.GC_SistemaProcedenciaDatosTipo	\N	1	Cobol	\N	f	Cobol	Datos extraídos del Sistema COBOL del IGAC.
\.


--
-- TOC entry 6526 (class 0 OID 376102)
-- Dependencies: 816
-- Data for Name: gc_terreno; Type: TABLE DATA; Schema: test_ladm_integration; Owner: postgres
--

COPY test_ladm_integration.gc_terreno (t_id, t_ili_tid, area_terreno_alfanumerica, area_terreno_digital, manzana_vereda_codigo, numero_subterraneos, geometria, gc_predio) FROM stdin;
\.


--
-- TOC entry 6527 (class 0 OID 376113)
-- Dependencies: 817
-- Data for Name: gc_unidadconstruccion; Type: TABLE DATA; Schema: test_ladm_integration; Owner: postgres
--

COPY test_ladm_integration.gc_unidadconstruccion (t_id, t_ili_tid, identificador, etiqueta, tipo_dominio, tipo_construccion, planta, total_habitaciones, total_banios, total_locales, total_pisos, uso, anio_construccion, puntaje, area_construida, area_privada, codigo_terreno, geometria, gc_construccion) FROM stdin;
\.


--
-- TOC entry 6547 (class 0 OID 376294)
-- Dependencies: 837
-- Data for Name: gc_unidadconstrucciontipo; Type: TABLE DATA; Schema: test_ladm_integration; Owner: postgres
--

COPY test_ladm_integration.gc_unidadconstrucciontipo (t_id, thisclass, baseclass, itfcode, ilicode, seq, inactive, dispname, description) FROM stdin;
19	Submodelo_Insumos_Gestor_Catastral_V1_0.GC_UnidadConstruccionTipo	\N	0	Convencional	\N	f	Convencional	Se refiere aquellas construcciones de uso residencial, comercial e industrial.
20	Submodelo_Insumos_Gestor_Catastral_V1_0.GC_UnidadConstruccionTipo	\N	1	No_Convencional	\N	f	No convencional	Se refiere aquellas construcciones considereadas anexos de construcción.
\.


--
-- TOC entry 6528 (class 0 OID 376125)
-- Dependencies: 818
-- Data for Name: gc_vereda; Type: TABLE DATA; Schema: test_ladm_integration; Owner: postgres
--

COPY test_ladm_integration.gc_vereda (t_id, t_ili_tid, codigo, codigo_anterior, nombre, codigo_sector, geometria) FROM stdin;
\.


--
-- TOC entry 6507 (class 0 OID 375925)
-- Dependencies: 797
-- Data for Name: gm_multisurface2d; Type: TABLE DATA; Schema: test_ladm_integration; Owner: postgres
--

COPY test_ladm_integration.gm_multisurface2d (t_id, t_seq) FROM stdin;
\.


--
-- TOC entry 6509 (class 0 OID 375942)
-- Dependencies: 799
-- Data for Name: gm_multisurface3d; Type: TABLE DATA; Schema: test_ladm_integration; Owner: postgres
--

COPY test_ladm_integration.gm_multisurface3d (t_id, t_seq) FROM stdin;
\.


--
-- TOC entry 6506 (class 0 OID 375914)
-- Dependencies: 796
-- Data for Name: gm_surface2dlistvalue; Type: TABLE DATA; Schema: test_ladm_integration; Owner: postgres
--

COPY test_ladm_integration.gm_surface2dlistvalue (t_id, t_seq, avalue, gm_multisurface2d_geometry) FROM stdin;
\.


--
-- TOC entry 6508 (class 0 OID 375931)
-- Dependencies: 798
-- Data for Name: gm_surface3dlistvalue; Type: TABLE DATA; Schema: test_ladm_integration; Owner: postgres
--

COPY test_ladm_integration.gm_surface3dlistvalue (t_id, t_seq, avalue, gm_multisurface3d_geometry) FROM stdin;
\.


--
-- TOC entry 6545 (class 0 OID 376276)
-- Dependencies: 835
-- Data for Name: ini_emparejamientotipo; Type: TABLE DATA; Schema: test_ladm_integration; Owner: postgres
--

COPY test_ladm_integration.ini_emparejamientotipo (t_id, thisclass, baseclass, itfcode, ilicode, seq, inactive, dispname, description) FROM stdin;
1	Submodelo_Integracion_Insumos_V1_0.INI_EmparejamientoTipo	\N	0	Tipo_1	\N	f	Tipo 1	FMI SNR - Matricula Inmobiliaria IGAC ; Número Predial IGAC - Número predial SNR ; Número predial Anterior IGAC - Número predial Anterior SNR
2	Submodelo_Integracion_Insumos_V1_0.INI_EmparejamientoTipo	\N	1	Tipo_2	\N	f	Tipo 2	FMI SNR - Matricula Inmobiliaria IGAC ; Número Predial IGAC - Número predial SNR
3	Submodelo_Integracion_Insumos_V1_0.INI_EmparejamientoTipo	\N	2	Tipo_3	\N	f	Tipo 3	FMI SNR - Matricula Inmobiliaria IGAC ; Número predial Anterior IGAC - Número predial Anterior SNR
4	Submodelo_Integracion_Insumos_V1_0.INI_EmparejamientoTipo	\N	3	Tipo_4	\N	f	Tipo 4	FMI SNR - Matricula Inmobiliaria IGAC ; Número Predial IGAC - Número predial Anterior SNR
5	Submodelo_Integracion_Insumos_V1_0.INI_EmparejamientoTipo	\N	4	Tipo_5	\N	f	Tipo 5	FMI SNR - Matricula Inmobiliaria IGAC ; Número predial Anterior IGAC - Número predial SNR
6	Submodelo_Integracion_Insumos_V1_0.INI_EmparejamientoTipo	\N	5	Tipo_6	\N	f	Tipo 6	Número Predial IGAC - Número predial SNR ; Número predial Anterior IGAC - Número predial Anterior SNR
7	Submodelo_Integracion_Insumos_V1_0.INI_EmparejamientoTipo	\N	6	Tipo_7	\N	f	Tipo 7	Número Predial IGAC - Número predial SNR
8	Submodelo_Integracion_Insumos_V1_0.INI_EmparejamientoTipo	\N	7	Tipo_8	\N	f	Tipo 8	Número predial Anterior IGAC - Número predial Anterior SNR
9	Submodelo_Integracion_Insumos_V1_0.INI_EmparejamientoTipo	\N	8	Tipo_9	\N	f	Tipo 9	Número Predial IGAC - Número predial Anterior SNR
10	Submodelo_Integracion_Insumos_V1_0.INI_EmparejamientoTipo	\N	9	Tipo_10	\N	f	Tipo 10	Número predial Anterior IGAC - Número predial SNR
11	Submodelo_Integracion_Insumos_V1_0.INI_EmparejamientoTipo	\N	10	Tipo_11	\N	f	Tipo 11	FMI SNR - Matricula Inmobiliaria IGAC
\.


--
-- TOC entry 6538 (class 0 OID 376220)
-- Dependencies: 828
-- Data for Name: ini_predioinsumos; Type: TABLE DATA; Schema: test_ladm_integration; Owner: postgres
--

COPY test_ladm_integration.ini_predioinsumos (t_id, t_ili_tid, tipo_emparejamiento, observaciones, gc_predio_catastro, snr_predio_juridico) FROM stdin;
\.


--
-- TOC entry 6552 (class 0 OID 376339)
-- Dependencies: 842
-- Data for Name: snr_calidadderechotipo; Type: TABLE DATA; Schema: test_ladm_integration; Owner: postgres
--

COPY test_ladm_integration.snr_calidadderechotipo (t_id, thisclass, baseclass, itfcode, ilicode, seq, inactive, dispname, description) FROM stdin;
42	Submodelo_Insumos_SNR_V1_0.SNR_CalidadDerechoTipo	\N	0	Dominio	\N	f	Dominio	El dominio que se llama también propiedad es el derecho real en una cosa corporal, para gozar y disponer de ella arbitrariamente, no siendo contra ley o contra derecho ajeno. (Art. 669 CC):\n\n0100\n0101\n0102\n0103\n0106\n0107\n0108\n0109\n0110\n0111\n0112\n0113\n0114\n0115\n0116\n0117\n0118\n0119\n0120\n0121\n0122\n0124\n0125\n0126\n0127\n0128\n0129\n0130\n0131\n0132\n0133\n0135\n0137\n0138\n0139\n0140\n0141\n0142\n0143\n0144\n0145\n0146\n0147\n0148\n0150\n0151\n0152\n0153\n0154\n0155\n0156\n0157\n0158\n0159\n0160\n0161\n0163\n0164\n0165\n0166\n0167\n0168\n0169\n0171\n0172\n0173\n0175\n0177\n0178\n0179\n0180\n0181\n0182\n0183\n0184\n0185\n0186\n0187\n0188\n0189\n0190\n0191\n0192\n0193\n0194\n0195\n0196\n0197\n0198\n0199\n01003\n01004\n01005\n01006\n01007\n01008\n01009\n01010\n01012\n01013\n01014\n0301\n0307\n0321\n0332\n0348\n0356\n0374\n0375\n0376\n0377\n0906\n0907\n0910\n0911\n0912\n0913\n0915\n0917\n0918\n0919\n0920\n0924\n0935\n0959\n0962\n0963
43	Submodelo_Insumos_SNR_V1_0.SNR_CalidadDerechoTipo	\N	1	Falsa_Tradicion	\N	f	Falsa tradición	Es la inscripción en la Oficina de Registro de Instrumentos Públicos, de todo acto de transferencia de un derecho incompleto que se hace a favor de una persona, por parte de quien carece del derecho de dominio sobre determinado inmueble:\n\n0600\n0601\n0602\n0604\n0605\n0606\n0607\n0608\n0609\n0610\n0611\n0613\n0614\n0615\n0616\n0617\n0618\n0619\n0620\n0621\n0622\n0136\n0508\n0927
44	Submodelo_Insumos_SNR_V1_0.SNR_CalidadDerechoTipo	\N	2	Nuda_Propiedad	\N	f	Nuda propiedad	La propiedad separada del goce de la cosa se llama mera o nuda propiedad (art 669 CC):\n\nCódigos:\n\n0302\n0308\n0322\n0349\n0379
45	Submodelo_Insumos_SNR_V1_0.SNR_CalidadDerechoTipo	\N	3	Derecho_Propiedad_Colectiva	\N	f	Derecho de propiedad colectiva	Es la propiedad de toda una comunidad sea indígena o negra. Adjudicacion Baldios En Propiedad Colectiva A Comunidades Negras, Adjudicacion Baldios Resguardos Indigenas, Constitución Resguardo Indigena,\nAmpliación De Resguardo Indígena\n\nCódigos:\n\n0104\n0105\n01001\n01002
46	Submodelo_Insumos_SNR_V1_0.SNR_CalidadDerechoTipo	\N	4	Usufructo	\N	f	Usufructo	El derecho de usufructo es un derecho real que consiste en la facultad de gozar de una cosa con cargo de conservar su forma y sustancia, y de restituir a su dueño, si la cosa no es fungible; o con cargo de volver igual cantidad y calidad del mismo género, o de pagar su valor si la cosa es fungible. (art. 823 CC):\n\n0310\n0314\n0323\n0333\n0378\n0380\n0382\n0383
\.


--
-- TOC entry 6549 (class 0 OID 376312)
-- Dependencies: 839
-- Data for Name: snr_clasepredioregistrotipo; Type: TABLE DATA; Schema: test_ladm_integration; Owner: postgres
--

COPY test_ladm_integration.snr_clasepredioregistrotipo (t_id, thisclass, baseclass, itfcode, ilicode, seq, inactive, dispname, description) FROM stdin;
23	Submodelo_Insumos_SNR_V1_0.SNR_ClasePredioRegistroTipo	\N	0	Rural	\N	f	Rural	Constituyen esta categoría los terrenos no aptos para el uso urbano, por razones de oportunidad, o por su destinación a usos agrícolas, ganaderos, forestales, de explotación de recursos naturales y actividades análogas. (Artículo 33, Ley 388 de 1997)
24	Submodelo_Insumos_SNR_V1_0.SNR_ClasePredioRegistroTipo	\N	1	Urbano	\N	f	Urbano	Constituyen el suelo urbano, las áreas del territorio distrital o municipal destinadas a usos urbanos por el plan de ordenamiento, que cuenten con infraestructura vial y redes primarias de energía, acueducto y alcantarillado, posibilitándose su urbanización y edificación, según sea el caso. Podrán pertenecer a esta categoría aquellas zonas con procesos de urbanización incompletos, comprendidos en áreas consolidadas con edificación, que se definan como áreas de mejoramiento integral en los planes de ordenamiento territorial.\n\nLas áreas que conforman el suelo urbano serán delimitadas por perímetros y podrán incluir los centros poblados de los corregimientos. En ningún caso el perímetro urbano podrá ser mayor que el denominado perímetro de servicios públicos o sanitario. (Artículo 31, Ley 388 de 1997)
25	Submodelo_Insumos_SNR_V1_0.SNR_ClasePredioRegistroTipo	\N	2	Sin_Informacion	\N	f	Sin información	\N
\.


--
-- TOC entry 6531 (class 0 OID 376154)
-- Dependencies: 821
-- Data for Name: snr_derecho; Type: TABLE DATA; Schema: test_ladm_integration; Owner: postgres
--

COPY test_ladm_integration.snr_derecho (t_id, t_ili_tid, calidad_derecho_registro, codigo_naturaleza_juridica, snr_fuente_derecho, snr_predio_registro) FROM stdin;
\.


--
-- TOC entry 6546 (class 0 OID 376285)
-- Dependencies: 836
-- Data for Name: snr_documentotitulartipo; Type: TABLE DATA; Schema: test_ladm_integration; Owner: postgres
--

COPY test_ladm_integration.snr_documentotitulartipo (t_id, thisclass, baseclass, itfcode, ilicode, seq, inactive, dispname, description) FROM stdin;
12	Submodelo_Insumos_SNR_V1_0.SNR_DocumentoTitularTipo	\N	0	Cedula_Ciudadania	\N	f	Cédula de ciudadanía	Es un documento emitido por la Registraduría Nacional del Estado Civil para permitir la identificación personal de los ciudadanos.
13	Submodelo_Insumos_SNR_V1_0.SNR_DocumentoTitularTipo	\N	1	Cedula_Extranjeria	\N	f	Cédula de extranjería	Es el documento que cumple los fines de identificación de los extranjeros en el territorio nacional y su utilización deberá estar acorde con la visa otorgada al extranjero.
14	Submodelo_Insumos_SNR_V1_0.SNR_DocumentoTitularTipo	\N	2	NIT	\N	f	NIT	El Número de Identificación Tributaria (NIT) es un código privado, secreto e intransferible que solamente debe conocer el contribuyente.
15	Submodelo_Insumos_SNR_V1_0.SNR_DocumentoTitularTipo	\N	3	Tarjeta_Identidad	\N	f	Tarjeta de identidad	Es el documento oficial que hace las veces de identificación para los menores de edad entre los 7 y los 18 años.
16	Submodelo_Insumos_SNR_V1_0.SNR_DocumentoTitularTipo	\N	4	Registro_Civil	\N	f	Registro civil	Registro donde se hacen constar por autoridades competentes los nacimientos, matrimonios, defunciones y demás hechos relativos al estado civil de las personas. En el modelo se tendrá en cuenta el número de registro como identificación personal de las personas de 0 a 7 años.
17	Submodelo_Insumos_SNR_V1_0.SNR_DocumentoTitularTipo	\N	5	NUIP	\N	f	NUIP	El Número Único de Identificación Personal, es el número que permite identificar a los colombianos durante toda su vida.
18	Submodelo_Insumos_SNR_V1_0.SNR_DocumentoTitularTipo	\N	6	Secuencial_SNR	\N	f	Secuencial SNR	Es un consecutivo asignado automáticamente en registro en lugar del número de la identificación de la persona que hace el trámite, se usa especialmente en trámites de construcción cuando el proyecto está a nombre de una Fiducia el cual tiene el mismo número del banco.
\.


--
-- TOC entry 6532 (class 0 OID 376163)
-- Dependencies: 822
-- Data for Name: snr_estructuramatriculamatriz; Type: TABLE DATA; Schema: test_ladm_integration; Owner: postgres
--

COPY test_ladm_integration.snr_estructuramatriculamatriz (t_id, t_seq, codigo_orip, matricula_inmobiliaria, snr_predioregistro_matricula_inmobiliaria_matriz) FROM stdin;
\.


--
-- TOC entry 6533 (class 0 OID 376170)
-- Dependencies: 823
-- Data for Name: snr_fuentecabidalinderos; Type: TABLE DATA; Schema: test_ladm_integration; Owner: postgres
--

COPY test_ladm_integration.snr_fuentecabidalinderos (t_id, t_ili_tid, tipo_documento, numero_documento, fecha_documento, ente_emisor, ciudad_emisora) FROM stdin;
\.


--
-- TOC entry 6534 (class 0 OID 376180)
-- Dependencies: 824
-- Data for Name: snr_fuentederecho; Type: TABLE DATA; Schema: test_ladm_integration; Owner: postgres
--

COPY test_ladm_integration.snr_fuentederecho (t_id, t_ili_tid, tipo_documento, numero_documento, fecha_documento, ente_emisor, ciudad_emisora) FROM stdin;
\.


--
-- TOC entry 6551 (class 0 OID 376330)
-- Dependencies: 841
-- Data for Name: snr_fuentetipo; Type: TABLE DATA; Schema: test_ladm_integration; Owner: postgres
--

COPY test_ladm_integration.snr_fuentetipo (t_id, thisclass, baseclass, itfcode, ilicode, seq, inactive, dispname, description) FROM stdin;
37	Submodelo_Insumos_SNR_V1_0.SNR_FuenteTipo	\N	0	Acto_Administrativo	\N	f	Acto administrativo	Un acto administrativo es toda manifestación o declaración emanada de la administración pública en el ejercicio de potestades administrativas, mediante el que impone su voluntad sobre los derechos, libertades o intereses de otros sujetos públicos o privados y que queda bajo el del comienzo.
38	Submodelo_Insumos_SNR_V1_0.SNR_FuenteTipo	\N	1	Escritura_Publica	\N	f	Escritura pública	Una escritura pública es un documento público en el que se realiza ante un notario público un determinado hecho o un derecho autorizado por dicho fedatario público, que firma con el otorgante u otorgantes,mostrando sobre la capacidad jurídica del contenido y de la fecha en que se realizó
39	Submodelo_Insumos_SNR_V1_0.SNR_FuenteTipo	\N	2	Sentencia_Judicial	\N	f	Sentencia judicial	La sentencia es la resolución judicial definitiva dictada por un juez o tribunal que pone fin a la litis o caso sometido a su conocimiento y cierra definitivamente su actuación en el mismo
40	Submodelo_Insumos_SNR_V1_0.SNR_FuenteTipo	\N	3	Documento_Privado	\N	f	Documento privado	Documento que contiene un compromiso entre dos o más personas que lo firman.
41	Submodelo_Insumos_SNR_V1_0.SNR_FuenteTipo	\N	4	Sin_Documento	\N	f	Sin documento	Cuando no se haya documento soporte pero puede ser una declaración verbal.
\.


--
-- TOC entry 6553 (class 0 OID 376348)
-- Dependencies: 843
-- Data for Name: snr_personatitulartipo; Type: TABLE DATA; Schema: test_ladm_integration; Owner: postgres
--

COPY test_ladm_integration.snr_personatitulartipo (t_id, thisclass, baseclass, itfcode, ilicode, seq, inactive, dispname, description) FROM stdin;
47	Submodelo_Insumos_SNR_V1_0.SNR_PersonaTitularTipo	\N	0	Persona_Natural	\N	f	Persona natural	Se refiere a la persona humana.
48	Submodelo_Insumos_SNR_V1_0.SNR_PersonaTitularTipo	\N	1	Persona_Juridica	\N	f	Persona jurídica	Se llama persona jurídica, una persona ficticia, capaz de ejercer derechos y contraer obligaciones civiles, y de ser representada judicial y extrajudicialmente. Las personas jurídicas son de dos especies: corporaciones y fundaciones de beneficencia pública.
\.


--
-- TOC entry 6536 (class 0 OID 376201)
-- Dependencies: 826
-- Data for Name: snr_predioregistro; Type: TABLE DATA; Schema: test_ladm_integration; Owner: postgres
--

COPY test_ladm_integration.snr_predioregistro (t_id, t_ili_tid, codigo_orip, matricula_inmobiliaria, numero_predial_nuevo_en_fmi, numero_predial_anterior_en_fmi, nomenclatura_registro, cabida_linderos, clase_suelo_registro, fecha_datos, snr_fuente_cabidalinderos) FROM stdin;
\.


--
-- TOC entry 6535 (class 0 OID 376190)
-- Dependencies: 825
-- Data for Name: snr_titular; Type: TABLE DATA; Schema: test_ladm_integration; Owner: postgres
--

COPY test_ladm_integration.snr_titular (t_id, t_ili_tid, tipo_persona, tipo_documento, numero_documento, nombres, primer_apellido, segundo_apellido, razon_social) FROM stdin;
\.


--
-- TOC entry 6537 (class 0 OID 376212)
-- Dependencies: 827
-- Data for Name: snr_titular_derecho; Type: TABLE DATA; Schema: test_ladm_integration; Owner: postgres
--

COPY test_ladm_integration.snr_titular_derecho (t_id, t_ili_tid, snr_titular, snr_derecho, porcentaje_participacion) FROM stdin;
\.


--
-- TOC entry 6555 (class 0 OID 376365)
-- Dependencies: 845
-- Data for Name: t_ili2db_attrname; Type: TABLE DATA; Schema: test_ladm_integration; Owner: postgres
--

COPY test_ladm_integration.t_ili2db_attrname (iliname, sqlname, colowner, target) FROM stdin;
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Puntaje	puntaje	gc_unidadconstruccion	\N
LADM_COL_V3_0.LADM_Nucleo.ExtArchivo.Espacio_De_Nombres	espacio_de_nombres	extarchivo	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Manzana.Codigo_Anterior	codigo_anterior	gc_manzana	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Total_Pisos	total_pisos	gc_unidadconstruccion	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_PredioCatastro.Fecha_Datos	fecha_datos	gc_prediocatastro	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Terreno.Area_Terreno_Digital	area_terreno_digital	gc_terreno	\N
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_FuenteDerecho.Ciudad_Emisora	ciudad_emisora	snr_fuentederecho	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_EstadoPredio.Estado_Alerta	estado_alerta	gc_estadopredio	\N
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_FuenteCabidaLinderos.Numero_Documento	numero_documento	snr_fuentecabidalinderos	\N
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_Titular.Tipo_Persona	tipo_persona	snr_titular	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Tipo_Dominio	tipo_dominio	gc_unidadconstruccion	\N
LADM_COL_V3_0.LADM_Nucleo.ExtArchivo.Extraccion	extraccion	extarchivo	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_CalificacionUnidadConstruccion.Componente	componente	gc_calificacionunidadconstruccion	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_EstadoPredio.Entidad_Emisora_Alerta	entidad_emisora_alerta	gc_estadopredio	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_PredioCatastro.NUPRE	nupre	gc_prediocatastro	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Total_Habitaciones	total_habitaciones	gc_unidadconstruccion	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Vereda.Codigo_Anterior	codigo_anterior	gc_vereda	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Construccion.Numero_Pisos	numero_pisos	gc_construccion	\N
ISO19107_PLANAS_V3_0.GM_MultiSurface2D.geometry	gm_multisurface2d_geometry	gm_surface2dlistvalue	gm_multisurface2d
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_ComisionesUnidadConstruccion.Numero_Predial	numero_predial	gc_comisionesunidadconstruccion	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_DatosTorrePH.Total_Pisos_Torre	total_pisos_torre	gc_datostorreph	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Vereda.Geometria	geometria	gc_vereda	\N
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_PredioRegistro.Numero_Predial_Anterior_en_FMI	numero_predial_anterior_en_fmi	snr_predioregistro	\N
LADM_COL_V3_0.LADM_Nucleo.ExtArchivo.Local_Id	local_id	extarchivo	\N
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_PredioRegistro.Matricula_Inmobiliaria_Matriz	snr_predioregistro_matricula_inmobiliaria_matriz	snr_estructuramatriculamatriz	snr_predioregistro
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Perimetro.Geometria	geometria	gc_perimetro	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_PredioCatastro.Estado_Predio	gc_prediocatastro_estado_predio	gc_estadopredio	gc_prediocatastro
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Perimetro.Codigo_Nombre	codigo_nombre	gc_perimetro	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Construccion.Identificador	identificador	gc_construccion	\N
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_Titular.Razon_Social	razon_social	snr_titular	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Propietario.Segundo_Apellido	segundo_apellido	gc_propietario	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Area_Privada	area_privada	gc_unidadconstruccion	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Vereda.Codigo_Sector	codigo_sector	gc_vereda	\N
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_Derecho.Codigo_Naturaleza_Juridica	codigo_naturaleza_juridica	snr_derecho	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Construccion.Codigo_Terreno	codigo_terreno	gc_construccion	\N
LADM_COL_V3_0.LADM_Nucleo.ExtArchivo.Fecha_Grabacion	fecha_grabacion	extarchivo	\N
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_EstructuraMatriculaMatriz.Codigo_ORIP	codigo_orip	snr_estructuramatriculamatriz	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Geometria	geometria	gc_unidadconstruccion	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Terreno.Geometria	geometria	gc_terreno	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Perimetro.Nombre_Geografico	nombre_geografico	gc_perimetro	\N
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_PredioRegistro.Cabida_Linderos	cabida_linderos	snr_predioregistro	\N
Submodelo_Integracion_Insumos_V1_0.Datos_Integracion_Insumos.ini_predio_integracion_gc.gc_predio_catastro	gc_predio_catastro	ini_predioinsumos	gc_prediocatastro
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_copropiedad.gc_unidad	gc_unidad	gc_copropiedad	gc_prediocatastro
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_PredioRegistro.Clase_Suelo_Registro	clase_suelo_registro	snr_predioregistro	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Construccion.Area_Construida	area_construida	gc_construccion	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_PredioCatastro.Destinacion_Economica	destinacion_economica	gc_prediocatastro	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Total_Locales	total_locales	gc_unidadconstruccion	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Propietario.Primer_Apellido	primer_apellido	gc_propietario	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_PredioCatastro.Numero_Predial	numero_predial	gc_prediocatastro	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Manzana.Codigo	codigo	gc_manzana	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Propietario.Numero_Documento	numero_documento	gc_propietario	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_ComisionesUnidadConstruccion.Geometria	geometria	gc_comisionesunidadconstruccion	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Construccion.Codigo_Edificacion	codigo_edificacion	gc_construccion	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_PredioCatastro.Condicion_Predio	condicion_predio	gc_prediocatastro	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_ComisionesTerreno.Geometria	geometria	gc_comisionesterreno	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Vereda.Codigo	codigo	gc_vereda	\N
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_FuenteCabidaLinderos.Tipo_Documento	tipo_documento	snr_fuentecabidalinderos	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_PredioCatastro.Sistema_Procedencia_Datos	sistema_procedencia_datos	gc_prediocatastro	\N
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_FuenteDerecho.Ente_Emisor	ente_emisor	snr_fuentederecho	\N
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_Titular.Tipo_Documento	tipo_documento	snr_titular	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Construccion.Tipo_Construccion	tipo_construccion	gc_construccion	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Etiqueta	etiqueta	gc_unidadconstruccion	\N
LADM_COL_V3_0.LADM_Nucleo.ExtArchivo.Fecha_Entrega	fecha_entrega	extarchivo	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_EstadoPredio.Fecha_Alerta	fecha_alerta	gc_estadopredio	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_SectorUrbano.Codigo	codigo	gc_sectorurbano	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_construccion_unidad.gc_construccion	gc_construccion	gc_unidadconstruccion	gc_construccion
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_FuenteCabidaLinderos.Ciudad_Emisora	ciudad_emisora	snr_fuentecabidalinderos	\N
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_Titular.Numero_Documento	numero_documento	snr_titular	\N
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_PredioRegistro.Codigo_ORIP	codigo_orip	snr_predioregistro	\N
Submodelo_Insumos_SNR_V1_0.Datos_SNR.snr_titular_derecho.snr_derecho	snr_derecho	snr_titular_derecho	snr_derecho
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_DatosPHCondominio.Area_Total_Terreno_Privada	area_total_terreno_privada	gc_datosphcondominio	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_DatosPHCondominio.Area_Total_Construida_Privada	area_total_construida_privada	gc_datosphcondominio	\N
Submodelo_Integracion_Insumos_V1_0.Datos_Integracion_Insumos.ini_predio_integracion_snr.snr_predio_juridico	snr_predio_juridico	ini_predioinsumos	snr_predioregistro
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_FuenteCabidaLinderos.Fecha_Documento	fecha_documento	snr_fuentecabidalinderos	\N
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_PredioRegistro.Fecha_Datos	fecha_datos	snr_predioregistro	\N
ISO19107_PLANAS_V3_0.GM_Surface2DListValue.value	avalue	gm_surface2dlistvalue	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_SectorUrbano.Geometria	geometria	gc_sectorurbano	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Area_Construida	area_construida	gc_unidadconstruccion	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Total_Banios	total_banios	gc_unidadconstruccion	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_PredioCatastro.Circulo_Registral	circulo_registral	gc_prediocatastro	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Construccion.Numero_Mezanines	numero_mezanines	gc_construccion	\N
Submodelo_Integracion_Insumos_V1_0.Datos_Integracion_Insumos.INI_PredioInsumos.Observaciones	observaciones	ini_predioinsumos	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_DatosPHCondominio.Area_Total_Terreno_Comun	area_total_terreno_comun	gc_datosphcondominio	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_terreno_predio.gc_predio	gc_predio	gc_terreno	gc_prediocatastro
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_EstructuraMatriculaMatriz.Matricula_Inmobiliaria	matricula_inmobiliaria	snr_estructuramatriculamatriz	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_DatosPHCondominio.Valor_Total_Avaluo_Catastral	valor_total_avaluo_catastral	gc_datosphcondominio	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Anio_Construccion	anio_construccion	gc_unidadconstruccion	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_CalificacionUnidadConstruccion.Elemento_Calificacion	elemento_calificacion	gc_calificacionunidadconstruccion	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Perimetro.Codigo_Municipio	codigo_municipio	gc_perimetro	\N
Submodelo_Insumos_SNR_V1_0.Datos_SNR.snr_derecho_fuente_derecho.snr_fuente_derecho	snr_fuente_derecho	snr_derecho	snr_fuentederecho
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_unidadconstruccion_calificacionunidadconstruccion.gc_unidadconstruccion	gc_unidadconstruccion	gc_calificacionunidadconstruccion	gc_unidadconstruccion
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_ComisionesTerreno.Numero_Predial	numero_predial	gc_comisionesterreno	\N
LADM_COL_V3_0.LADM_Nucleo.ExtArchivo.Datos	datos	extarchivo	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Terreno.Area_Terreno_Alfanumerica	area_terreno_alfanumerica	gc_terreno	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_propietario_predio.gc_predio_catastro	gc_predio_catastro	gc_propietario	gc_prediocatastro
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_DatosTorrePH.Total_Unidades_Sotano	total_unidades_sotano	gc_datostorreph	\N
Submodelo_Insumos_SNR_V1_0.Datos_SNR.snr_predio_registro_fuente_cabidalinderos.snr_fuente_cabidalinderos	snr_fuente_cabidalinderos	snr_predioregistro	snr_fuentecabidalinderos
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Construccion.Numero_Sotanos	numero_sotanos	gc_construccion	\N
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_FuenteCabidaLinderos.Archivo	snr_fuentecabidalndros_archivo	extarchivo	snr_fuentecabidalinderos
Submodelo_Insumos_SNR_V1_0.Datos_SNR.snr_titular_derecho.snr_titular	snr_titular	snr_titular_derecho	snr_titular
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Perimetro.Codigo_Departamento	codigo_departamento	gc_perimetro	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Terreno.Numero_Subterraneos	numero_subterraneos	gc_terreno	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_ComisionesConstruccion.Numero_Predial	numero_predial	gc_comisionesconstruccion	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Direccion.Valor	valor	gc_direccion	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Planta	planta	gc_unidadconstruccion	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_SectorRural.Geometria	geometria	gc_sectorrural	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_CalificacionUnidadConstruccion.Detalle_Calificacion	detalle_calificacion	gc_calificacionunidadconstruccion	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Construccion.Tipo_Dominio	tipo_dominio	gc_construccion	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_DatosPHCondominio.Total_Unidades_Sotano	total_unidades_sotano	gc_datosphcondominio	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Propietario.Razon_Social	razon_social	gc_propietario	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Manzana.Geometria	geometria	gc_manzana	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Construccion.Numero_Semisotanos	numero_semisotanos	gc_construccion	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_DatosTorrePH.Total_Unidades_Privadas	total_unidades_privadas	gc_datostorreph	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Propietario.Segundo_Nombre	segundo_nombre	gc_propietario	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_PredioCatastro.Numero_Predial_Anterior	numero_predial_anterior	gc_prediocatastro	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_copropiedad.gc_matriz	gc_matriz	gc_copropiedad	gc_prediocatastro
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_DatosPHCondominio.Area_Total_Construida_Comun	area_total_construida_comun	gc_datosphcondominio	\N
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_Titular.Nombres	nombres	snr_titular	\N
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_FuenteCabidaLinderos.Ente_Emisor	ente_emisor	snr_fuentecabidalinderos	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_ph_predio.gc_predio	gc_predio	gc_datosphcondominio	gc_prediocatastro
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Construccion.Etiqueta	etiqueta	gc_construccion	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Tipo_Construccion	tipo_construccion	gc_unidadconstruccion	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Barrio.Codigo_Sector	codigo_sector	gc_barrio	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_SectorRural.Codigo	codigo	gc_sectorrural	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Vereda.Nombre	nombre	gc_vereda	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Uso	uso	gc_unidadconstruccion	\N
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_Derecho.Calidad_Derecho_Registro	calidad_derecho_registro	snr_derecho	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_DatosTorrePH.Torre	torre	gc_datostorreph	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Barrio.Nombre	nombre	gc_barrio	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Propietario.Tipo_Documento	tipo_documento	gc_propietario	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Codigo_Terreno	codigo_terreno	gc_unidadconstruccion	\N
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_PredioRegistro.Numero_Predial_Nuevo_en_FMI	numero_predial_nuevo_en_fmi	snr_predioregistro	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_ComisionesConstruccion.Geometria	geometria	gc_comisionesconstruccion	\N
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_FuenteDerecho.Tipo_Documento	tipo_documento	snr_fuentederecho	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Direccion.Geometria_Referencia	geometria_referencia	gc_direccion	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Perimetro.Tipo_Avaluo	tipo_avaluo	gc_perimetro	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Direccion.Principal	principal	gc_direccion	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_PredioCatastro.Matricula_Inmobiliaria_Catastro	matricula_inmobiliaria_catastro	gc_prediocatastro	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_copropiedad.Coeficiente_Copropiedad	coeficiente_copropiedad	gc_copropiedad	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_CalificacionUnidadConstruccion.Puntos	puntos	gc_calificacionunidadconstruccion	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_construccion_predio.gc_predio	gc_predio	gc_construccion	gc_prediocatastro
ISO19107_PLANAS_V3_0.GM_MultiSurface3D.geometry	gm_multisurface3d_geometry	gm_surface3dlistvalue	gm_multisurface3d
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Barrio.Geometria	geometria	gc_barrio	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_datosphcondominio_datostorreph.gc_datosphcondominio	gc_datosphcondominio	gc_datostorreph	gc_datosphcondominio
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_DatosTorrePH.Total_Sotanos	total_sotanos	gc_datostorreph	\N
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_PredioRegistro.Nomenclatura_Registro	nomenclatura_registro	snr_predioregistro	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_DatosPHCondominio.Total_Unidades_Privadas	total_unidades_privadas	gc_datosphcondominio	\N
LADM_COL_V3_0.LADM_Nucleo.ExtArchivo.Fecha_Aceptacion	fecha_aceptacion	extarchivo	\N
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_Titular.Segundo_Apellido	segundo_apellido	snr_titular	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Terreno.Manzana_Vereda_Codigo	manzana_vereda_codigo	gc_terreno	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Barrio.Codigo	codigo	gc_barrio	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Construccion.Geometria	geometria	gc_construccion	\N
Submodelo_Insumos_SNR_V1_0.Datos_SNR.snr_titular_derecho.Porcentaje_Participacion	porcentaje_participacion	snr_titular_derecho	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_PredioCatastro.Tipo_Predio	tipo_predio	gc_prediocatastro	\N
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_PredioRegistro.Matricula_Inmobiliaria	matricula_inmobiliaria	snr_predioregistro	\N
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_FuenteDerecho.Fecha_Documento	fecha_documento	snr_fuentederecho	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_PredioCatastro.Direcciones	gc_prediocatastro_direcciones	gc_direccion	gc_prediocatastro
ISO19107_PLANAS_V3_0.GM_Surface3DListValue.value	avalue	gm_surface3dlistvalue	\N
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_FuenteDerecho.Numero_Documento	numero_documento	snr_fuentederecho	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Manzana.Codigo_Barrio	codigo_barrio	gc_manzana	\N
Submodelo_Integracion_Insumos_V1_0.Datos_Integracion_Insumos.INI_PredioInsumos.Tipo_Emparejamiento	tipo_emparejamiento	ini_predioinsumos	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Identificador	identificador	gc_unidadconstruccion	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_PredioCatastro.Tipo_Catastro	tipo_catastro	gc_prediocatastro	\N
Submodelo_Insumos_SNR_V1_0.Datos_SNR.snr_derecho_predio.snr_predio_registro	snr_predio_registro	snr_derecho	snr_predioregistro
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Propietario.Primer_Nombre	primer_nombre	gc_propietario	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Propietario.Digito_Verificacion	digito_verificacion	gc_propietario	\N
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_Titular.Primer_Apellido	primer_apellido	snr_titular	\N
\.


--
-- TOC entry 6539 (class 0 OID 376232)
-- Dependencies: 829
-- Data for Name: t_ili2db_basket; Type: TABLE DATA; Schema: test_ladm_integration; Owner: postgres
--

COPY test_ladm_integration.t_ili2db_basket (t_id, dataset, topic, t_ili_tid, attachmentkey, domains) FROM stdin;
\.


--
-- TOC entry 6554 (class 0 OID 376357)
-- Dependencies: 844
-- Data for Name: t_ili2db_classname; Type: TABLE DATA; Schema: test_ladm_integration; Owner: postgres
--

COPY test_ladm_integration.t_ili2db_classname (iliname, sqlname) FROM stdin;
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_ComisionesTerreno	gc_comisionesterreno
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Barrio	gc_barrio
Submodelo_Insumos_SNR_V1_0.SNR_CalidadDerechoTipo	snr_calidadderechotipo
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_EstadoPredio	gc_estadopredio
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_construccion_predio	gc_construccion_predio
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_SectorUrbano	gc_sectorurbano
Submodelo_Insumos_SNR_V1_0.SNR_ClasePredioRegistroTipo	snr_clasepredioregistrotipo
Submodelo_Integracion_Insumos_V1_0.INI_EmparejamientoTipo	ini_emparejamientotipo
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_terreno_predio	gc_terreno_predio
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_EstructuraMatriculaMatriz	snr_estructuramatriculamatriz
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Terreno	gc_terreno
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_CalificacionUnidadConstruccion	gc_calificacionunidadconstruccion
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_DatosPHCondominio	gc_datosphcondominio
Submodelo_Insumos_SNR_V1_0.SNR_FuenteTipo	snr_fuentetipo
Submodelo_Insumos_Gestor_Catastral_V1_0.GC_UnidadConstruccionTipo	gc_unidadconstrucciontipo
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_ComisionesUnidadConstruccion	gc_comisionesunidadconstruccion
ISO19107_PLANAS_V3_0.GM_MultiSurface3D	gm_multisurface3d
LADM_COL_V3_0.LADM_Nucleo.ExtArchivo	extarchivo
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_construccion_unidad	gc_construccion_unidad
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_copropiedad	gc_copropiedad
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Vereda	gc_vereda
ISO19107_PLANAS_V3_0.GM_Surface2DListValue	gm_surface2dlistvalue
Submodelo_Insumos_Gestor_Catastral_V1_0.GC_CondicionPredioTipo	gc_condicionprediotipo
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_propietario_predio	gc_propietario_predio
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_Derecho	snr_derecho
Submodelo_Integracion_Insumos_V1_0.Datos_Integracion_Insumos.ini_predio_integracion_gc	ini_predio_integracion_gc
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_SectorRural	gc_sectorrural
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_ph_predio	gc_ph_predio
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_DatosTorrePH	gc_datostorreph
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Perimetro	gc_perimetro
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_ComisionesConstruccion	gc_comisionesconstruccion
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion	gc_unidadconstruccion
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Construccion	gc_construccion
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_unidadconstruccion_calificacionunidadconstruccion	gc_unidadconstruccion_calificacionunidadconstruccion
Submodelo_Insumos_SNR_V1_0.SNR_DocumentoTitularTipo	snr_documentotitulartipo
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Direccion	gc_direccion
ISO19107_PLANAS_V3_0.GM_MultiSurface2D	gm_multisurface2d
ISO19107_PLANAS_V3_0.GM_Surface3DListValue	gm_surface3dlistvalue
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_PredioRegistro	snr_predioregistro
Submodelo_Insumos_SNR_V1_0.Datos_SNR.snr_derecho_fuente_derecho	snr_derecho_fuente_derecho
Submodelo_Insumos_SNR_V1_0.Datos_SNR.snr_predio_registro_fuente_cabidalinderos	snr_predio_registro_fuente_cabidalinderos
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_datosphcondominio_datostorreph	gc_datosphcondominio_datostorreph
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_FuenteDerecho	snr_fuentederecho
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_Titular	snr_titular
Submodelo_Insumos_SNR_V1_0.Datos_SNR.snr_derecho_predio	snr_derecho_predio
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Manzana	gc_manzana
Submodelo_Integracion_Insumos_V1_0.Datos_Integracion_Insumos.INI_PredioInsumos	ini_predioinsumos
Submodelo_Insumos_SNR_V1_0.Datos_SNR.snr_titular_derecho	snr_titular_derecho
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Propietario	gc_propietario
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_FuenteCabidaLinderos	snr_fuentecabidalinderos
Submodelo_Integracion_Insumos_V1_0.Datos_Integracion_Insumos.ini_predio_integracion_snr	ini_predio_integracion_snr
Submodelo_Insumos_Gestor_Catastral_V1_0.GC_SistemaProcedenciaDatosTipo	gc_sistemaprocedenciadatostipo
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_PredioCatastro	gc_prediocatastro
Submodelo_Insumos_SNR_V1_0.SNR_PersonaTitularTipo	snr_personatitulartipo
\.


--
-- TOC entry 6556 (class 0 OID 376373)
-- Dependencies: 846
-- Data for Name: t_ili2db_column_prop; Type: TABLE DATA; Schema: test_ladm_integration; Owner: postgres
--

COPY test_ladm_integration.t_ili2db_column_prop (tablename, subtype, columnname, tag, setting) FROM stdin;
gc_prediocatastro	\N	circulo_registral	ch.ehi.ili2db.dispName	Círculo registral
gc_estadopredio	\N	estado_alerta	ch.ehi.ili2db.dispName	Estado alerta
gc_calificacionunidadconstruccion	\N	puntos	ch.ehi.ili2db.dispName	Puntos
gc_propietario	\N	razon_social	ch.ehi.ili2db.dispName	Razón social
gc_unidadconstruccion	\N	tipo_dominio	ch.ehi.ili2db.dispName	Tipo de dominio
extarchivo	\N	snr_fuentecabidalndros_archivo	ch.ehi.ili2db.foreignKey	snr_fuentecabidalinderos
gc_unidadconstruccion	\N	area_construida	ch.ehi.ili2db.unit	m2
gc_unidadconstruccion	\N	area_construida	ch.ehi.ili2db.dispName	Área construida
snr_predioregistro	\N	snr_fuente_cabidalinderos	ch.ehi.ili2db.foreignKey	snr_fuentecabidalinderos
gc_prediocatastro	\N	numero_predial_anterior	ch.ehi.ili2db.dispName	Número predial anterior
gc_comisionesterreno	\N	numero_predial	ch.ehi.ili2db.dispName	Número predial
gc_vereda	\N	codigo_sector	ch.ehi.ili2db.dispName	Código del sector
gc_prediocatastro	\N	condicion_predio	ch.ehi.ili2db.foreignKey	gc_condicionprediotipo
gc_prediocatastro	\N	condicion_predio	ch.ehi.ili2db.dispName	Condición del predio
gc_copropiedad	\N	gc_unidad	ch.ehi.ili2db.foreignKey	gc_prediocatastro
gc_manzana	\N	codigo_barrio	ch.ehi.ili2db.dispName	Código de barrio
gc_prediocatastro	\N	numero_predial	ch.ehi.ili2db.dispName	Número predial
snr_predioregistro	\N	cabida_linderos	ch.ehi.ili2db.textKind	MTEXT
snr_predioregistro	\N	cabida_linderos	ch.ehi.ili2db.dispName	Cabida y linderos
gc_datostorreph	\N	torre	ch.ehi.ili2db.dispName	Torre
snr_fuentecabidalinderos	\N	ciudad_emisora	ch.ehi.ili2db.dispName	Ciudad emisora
gc_perimetro	\N	nombre_geografico	ch.ehi.ili2db.dispName	Nombre geográfico
snr_titular_derecho	\N	snr_titular	ch.ehi.ili2db.foreignKey	snr_titular
gc_comisionesconstruccion	\N	numero_predial	ch.ehi.ili2db.dispName	Número predial
gc_perimetro	\N	codigo_departamento	ch.ehi.ili2db.dispName	Código del departamento
gc_unidadconstruccion	\N	total_habitaciones	ch.ehi.ili2db.dispName	Total de habitaciones
gc_calificacionunidadconstruccion	\N	componente	ch.ehi.ili2db.dispName	Componente
gc_unidadconstruccion	\N	planta	ch.ehi.ili2db.dispName	Planta
gc_datostorreph	\N	total_unidades_sotano	ch.ehi.ili2db.dispName	Total de unidades sótano
gc_manzana	\N	codigo	ch.ehi.ili2db.dispName	Código
snr_titular	\N	nombres	ch.ehi.ili2db.dispName	Nombres
gc_construccion	\N	identificador	ch.ehi.ili2db.dispName	Identificador
gc_construccion	\N	numero_mezanines	ch.ehi.ili2db.dispName	Número de mezanines
gc_vereda	\N	codigo	ch.ehi.ili2db.dispName	Código
snr_estructuramatriculamatriz	\N	snr_predioregistro_matricula_inmobiliaria_matriz	ch.ehi.ili2db.foreignKey	snr_predioregistro
gc_construccion	\N	tipo_construccion	ch.ehi.ili2db.foreignKey	gc_unidadconstrucciontipo
gc_construccion	\N	tipo_construccion	ch.ehi.ili2db.dispName	Tipo de construcción
snr_fuentecabidalinderos	\N	fecha_documento	ch.ehi.ili2db.dispName	Fecha de documento
ini_predioinsumos	\N	snr_predio_juridico	ch.ehi.ili2db.foreignKey	snr_predioregistro
extarchivo	\N	espacio_de_nombres	ch.ehi.ili2db.dispName	Espacio de nombres
gc_terreno	\N	area_terreno_alfanumerica	ch.ehi.ili2db.unit	m2
gc_terreno	\N	area_terreno_alfanumerica	ch.ehi.ili2db.dispName	Área terreno alfanumérica
snr_predioregistro	\N	nomenclatura_registro	ch.ehi.ili2db.dispName	Nomenclatura según registro
gc_perimetro	\N	tipo_avaluo	ch.ehi.ili2db.dispName	Tipo de avalúo
snr_derecho	\N	snr_predio_registro	ch.ehi.ili2db.foreignKey	snr_predioregistro
snr_titular	\N	segundo_apellido	ch.ehi.ili2db.dispName	Segundo apellido
gc_calificacionunidadconstruccion	\N	gc_unidadconstruccion	ch.ehi.ili2db.foreignKey	gc_unidadconstruccion
gc_unidadconstruccion	\N	geometria	ch.ehi.ili2db.coordDimension	3
gc_unidadconstruccion	\N	geometria	ch.ehi.ili2db.c1Max	5700000.000
gc_unidadconstruccion	\N	geometria	ch.ehi.ili2db.c2Max	3100000.000
gc_unidadconstruccion	\N	geometria	ch.ehi.ili2db.geomType	MULTIPOLYGON
gc_unidadconstruccion	\N	geometria	ch.ehi.ili2db.c1Min	3980000.000
gc_unidadconstruccion	\N	geometria	ch.ehi.ili2db.c2Min	1080000.000
gc_unidadconstruccion	\N	geometria	ch.ehi.ili2db.c3Min	-5000.000
gc_unidadconstruccion	\N	geometria	ch.ehi.ili2db.c3Max	6000.000
gc_unidadconstruccion	\N	geometria	ch.ehi.ili2db.srid	9377
gc_unidadconstruccion	\N	geometria	ch.ehi.ili2db.dispName	Geometría
gc_vereda	\N	geometria	ch.ehi.ili2db.coordDimension	2
gc_vereda	\N	geometria	ch.ehi.ili2db.c1Max	5700000.000
gc_vereda	\N	geometria	ch.ehi.ili2db.c2Max	3100000.000
gc_vereda	\N	geometria	ch.ehi.ili2db.geomType	MULTIPOLYGON
gc_vereda	\N	geometria	ch.ehi.ili2db.c1Min	3980000.000
gc_vereda	\N	geometria	ch.ehi.ili2db.c2Min	1080000.000
gc_vereda	\N	geometria	ch.ehi.ili2db.srid	9377
gc_vereda	\N	geometria	ch.ehi.ili2db.dispName	Geometría
gc_terreno	\N	area_terreno_digital	ch.ehi.ili2db.unit	m2
gc_terreno	\N	area_terreno_digital	ch.ehi.ili2db.dispName	Área terreno digital
snr_estructuramatriculamatriz	\N	matricula_inmobiliaria	ch.ehi.ili2db.dispName	Matrícula inmobiliaria
gc_unidadconstruccion	\N	gc_construccion	ch.ehi.ili2db.foreignKey	gc_construccion
gc_prediocatastro	\N	fecha_datos	ch.ehi.ili2db.dispName	Fecha de los datos
gc_construccion	\N	gc_predio	ch.ehi.ili2db.foreignKey	gc_prediocatastro
gc_prediocatastro	\N	matricula_inmobiliaria_catastro	ch.ehi.ili2db.dispName	Matrícula inmobiliaria catastro
snr_titular	\N	razon_social	ch.ehi.ili2db.textKind	MTEXT
snr_titular	\N	razon_social	ch.ehi.ili2db.dispName	Razón social
gc_terreno	\N	manzana_vereda_codigo	ch.ehi.ili2db.dispName	Código de manzana vereda
gc_direccion	\N	valor	ch.ehi.ili2db.dispName	Valor
gc_datosphcondominio	\N	area_total_terreno_privada	ch.ehi.ili2db.unit	m2
gc_datosphcondominio	\N	area_total_terreno_privada	ch.ehi.ili2db.dispName	Área total de terreno privada
snr_fuentecabidalinderos	\N	tipo_documento	ch.ehi.ili2db.foreignKey	snr_fuentetipo
snr_fuentecabidalinderos	\N	tipo_documento	ch.ehi.ili2db.dispName	Tipo de documento
gc_prediocatastro	\N	nupre	ch.ehi.ili2db.dispName	Número único predial
gc_datostorreph	\N	gc_datosphcondominio	ch.ehi.ili2db.foreignKey	gc_datosphcondominio
gc_unidadconstruccion	\N	anio_construccion	ch.ehi.ili2db.dispName	Año de construcción
gc_unidadconstruccion	\N	total_banios	ch.ehi.ili2db.dispName	Total de baños
gc_propietario	\N	segundo_apellido	ch.ehi.ili2db.dispName	Segundo apellido
gc_sectorrural	\N	codigo	ch.ehi.ili2db.dispName	Código
snr_fuentederecho	\N	fecha_documento	ch.ehi.ili2db.dispName	Fecha del documento
extarchivo	\N	extraccion	ch.ehi.ili2db.dispName	Extracción
ini_predioinsumos	\N	gc_predio_catastro	ch.ehi.ili2db.foreignKey	gc_prediocatastro
gc_terreno	\N	numero_subterraneos	ch.ehi.ili2db.dispName	Número de subterráneos
snr_fuentecabidalinderos	\N	ente_emisor	ch.ehi.ili2db.dispName	Ente emisor
gm_surface2dlistvalue	\N	avalue	ch.ehi.ili2db.coordDimension	2
gm_surface2dlistvalue	\N	avalue	ch.ehi.ili2db.c1Max	5700000.000
gm_surface2dlistvalue	\N	avalue	ch.ehi.ili2db.c2Max	3100000.000
gm_surface2dlistvalue	\N	avalue	ch.ehi.ili2db.geomType	POLYGON
gm_surface2dlistvalue	\N	avalue	ch.ehi.ili2db.c1Min	3980000.000
gm_surface2dlistvalue	\N	avalue	ch.ehi.ili2db.c2Min	1080000.000
gm_surface2dlistvalue	\N	avalue	ch.ehi.ili2db.srid	9377
gc_vereda	\N	codigo_anterior	ch.ehi.ili2db.dispName	Código anterior
gc_barrio	\N	geometria	ch.ehi.ili2db.coordDimension	2
gc_barrio	\N	geometria	ch.ehi.ili2db.c1Max	5700000.000
gc_barrio	\N	geometria	ch.ehi.ili2db.c2Max	3100000.000
gc_barrio	\N	geometria	ch.ehi.ili2db.geomType	MULTIPOLYGON
gc_barrio	\N	geometria	ch.ehi.ili2db.c1Min	3980000.000
gc_barrio	\N	geometria	ch.ehi.ili2db.c2Min	1080000.000
gc_barrio	\N	geometria	ch.ehi.ili2db.srid	9377
gc_barrio	\N	geometria	ch.ehi.ili2db.dispName	Geometría
gc_construccion	\N	area_construida	ch.ehi.ili2db.unit	m2
gc_construccion	\N	area_construida	ch.ehi.ili2db.dispName	Área construida
snr_predioregistro	\N	numero_predial_nuevo_en_fmi	ch.ehi.ili2db.dispName	Número predial nuevo en FMI
extarchivo	\N	fecha_aceptacion	ch.ehi.ili2db.dispName	Fecha de aceptación
snr_fuentederecho	\N	numero_documento	ch.ehi.ili2db.dispName	Número de documento
gc_propietario	\N	numero_documento	ch.ehi.ili2db.dispName	Número de documento
gc_copropiedad	\N	gc_matriz	ch.ehi.ili2db.foreignKey	gc_prediocatastro
gc_comisionesunidadconstruccion	\N	numero_predial	ch.ehi.ili2db.dispName	Número predial
extarchivo	\N	datos	ch.ehi.ili2db.dispName	Datos
gc_perimetro	\N	codigo_municipio	ch.ehi.ili2db.dispName	Código del municipio
gc_construccion	\N	numero_semisotanos	ch.ehi.ili2db.dispName	Número de semisótanos
gc_unidadconstruccion	\N	area_privada	ch.ehi.ili2db.unit	m2
gc_unidadconstruccion	\N	area_privada	ch.ehi.ili2db.dispName	Área privada
gc_perimetro	\N	geometria	ch.ehi.ili2db.coordDimension	2
gc_perimetro	\N	geometria	ch.ehi.ili2db.c1Max	5700000.000
gc_perimetro	\N	geometria	ch.ehi.ili2db.c2Max	3100000.000
gc_perimetro	\N	geometria	ch.ehi.ili2db.geomType	MULTIPOLYGON
gc_perimetro	\N	geometria	ch.ehi.ili2db.c1Min	3980000.000
gc_perimetro	\N	geometria	ch.ehi.ili2db.c2Min	1080000.000
gc_perimetro	\N	geometria	ch.ehi.ili2db.srid	9377
gc_perimetro	\N	geometria	ch.ehi.ili2db.dispName	Geometría
gc_prediocatastro	\N	tipo_predio	ch.ehi.ili2db.dispName	Tipo de predio
gc_prediocatastro	\N	sistema_procedencia_datos	ch.ehi.ili2db.foreignKey	gc_sistemaprocedenciadatostipo
gc_prediocatastro	\N	sistema_procedencia_datos	ch.ehi.ili2db.dispName	Sistema procedencia de los datos
ini_predioinsumos	\N	observaciones	ch.ehi.ili2db.dispName	Observaciones
gc_direccion	\N	principal	ch.ehi.ili2db.dispName	Principal
gc_datostorreph	\N	total_sotanos	ch.ehi.ili2db.dispName	Total de sótanos
snr_derecho	\N	codigo_naturaleza_juridica	ch.ehi.ili2db.dispName	Código naturaleza jurídica
gc_comisionesterreno	\N	geometria	ch.ehi.ili2db.coordDimension	2
gc_comisionesterreno	\N	geometria	ch.ehi.ili2db.c1Max	5700000.000
gc_comisionesterreno	\N	geometria	ch.ehi.ili2db.c2Max	3100000.000
gc_comisionesterreno	\N	geometria	ch.ehi.ili2db.geomType	MULTIPOLYGON
gc_comisionesterreno	\N	geometria	ch.ehi.ili2db.c1Min	3980000.000
gc_comisionesterreno	\N	geometria	ch.ehi.ili2db.c2Min	1080000.000
gc_comisionesterreno	\N	geometria	ch.ehi.ili2db.srid	9377
gc_comisionesterreno	\N	geometria	ch.ehi.ili2db.dispName	Geometría
gc_prediocatastro	\N	tipo_catastro	ch.ehi.ili2db.dispName	Tipo de catastro
gc_prediocatastro	\N	destinacion_economica	ch.ehi.ili2db.dispName	Destinación económica
snr_derecho	\N	snr_fuente_derecho	ch.ehi.ili2db.foreignKey	snr_fuentederecho
gc_direccion	\N	geometria_referencia	ch.ehi.ili2db.coordDimension	3
gc_direccion	\N	geometria_referencia	ch.ehi.ili2db.c1Max	5700000.000
gc_direccion	\N	geometria_referencia	ch.ehi.ili2db.c2Max	3100000.000
gc_direccion	\N	geometria_referencia	ch.ehi.ili2db.geomType	LINESTRING
gc_direccion	\N	geometria_referencia	ch.ehi.ili2db.c1Min	3980000.000
gc_direccion	\N	geometria_referencia	ch.ehi.ili2db.c2Min	1080000.000
gc_direccion	\N	geometria_referencia	ch.ehi.ili2db.c3Min	-5000.000
gc_direccion	\N	geometria_referencia	ch.ehi.ili2db.c3Max	6000.000
gc_direccion	\N	geometria_referencia	ch.ehi.ili2db.srid	9377
gc_direccion	\N	geometria_referencia	ch.ehi.ili2db.dispName	Geometría de referencia
gc_perimetro	\N	codigo_nombre	ch.ehi.ili2db.dispName	Código nombre
gc_propietario	\N	primer_apellido	ch.ehi.ili2db.dispName	Primer apellido
gc_sectorurbano	\N	geometria	ch.ehi.ili2db.coordDimension	2
gc_sectorurbano	\N	geometria	ch.ehi.ili2db.c1Max	5700000.000
gc_sectorurbano	\N	geometria	ch.ehi.ili2db.c2Max	3100000.000
gc_sectorurbano	\N	geometria	ch.ehi.ili2db.geomType	MULTIPOLYGON
gc_sectorurbano	\N	geometria	ch.ehi.ili2db.c1Min	3980000.000
gc_sectorurbano	\N	geometria	ch.ehi.ili2db.c2Min	1080000.000
gc_sectorurbano	\N	geometria	ch.ehi.ili2db.srid	9377
gc_sectorurbano	\N	geometria	ch.ehi.ili2db.dispName	Geometría
snr_predioregistro	\N	codigo_orip	ch.ehi.ili2db.dispName	Código ORIP
gc_datosphcondominio	\N	valor_total_avaluo_catastral	ch.ehi.ili2db.unit	COP
gc_datosphcondominio	\N	valor_total_avaluo_catastral	ch.ehi.ili2db.dispName	Valor total avaúo catastral
ini_predioinsumos	\N	tipo_emparejamiento	ch.ehi.ili2db.foreignKey	ini_emparejamientotipo
ini_predioinsumos	\N	tipo_emparejamiento	ch.ehi.ili2db.dispName	Tipo de emparejamiento
gm_surface3dlistvalue	\N	gm_multisurface3d_geometry	ch.ehi.ili2db.foreignKey	gm_multisurface3d
gm_surface2dlistvalue	\N	gm_multisurface2d_geometry	ch.ehi.ili2db.foreignKey	gm_multisurface2d
gc_construccion	\N	geometria	ch.ehi.ili2db.coordDimension	3
gc_construccion	\N	geometria	ch.ehi.ili2db.c1Max	5700000.000
gc_construccion	\N	geometria	ch.ehi.ili2db.c2Max	3100000.000
gc_construccion	\N	geometria	ch.ehi.ili2db.geomType	MULTIPOLYGON
gc_construccion	\N	geometria	ch.ehi.ili2db.c1Min	3980000.000
gc_construccion	\N	geometria	ch.ehi.ili2db.c2Min	1080000.000
gc_construccion	\N	geometria	ch.ehi.ili2db.c3Min	-5000.000
gc_construccion	\N	geometria	ch.ehi.ili2db.c3Max	6000.000
gc_construccion	\N	geometria	ch.ehi.ili2db.srid	9377
gc_construccion	\N	geometria	ch.ehi.ili2db.dispName	Geometría
gc_vereda	\N	nombre	ch.ehi.ili2db.dispName	Nombre
gc_sectorurbano	\N	codigo	ch.ehi.ili2db.dispName	Código
gc_propietario	\N	segundo_nombre	ch.ehi.ili2db.dispName	Segundo nombre
snr_titular	\N	tipo_documento	ch.ehi.ili2db.foreignKey	snr_documentotitulartipo
snr_titular	\N	tipo_documento	ch.ehi.ili2db.dispName	Tipo de documento
gc_datosphcondominio	\N	total_unidades_privadas	ch.ehi.ili2db.dispName	Total de unidades privadas
gc_comisionesunidadconstruccion	\N	geometria	ch.ehi.ili2db.coordDimension	3
gc_comisionesunidadconstruccion	\N	geometria	ch.ehi.ili2db.c1Max	5700000.000
gc_comisionesunidadconstruccion	\N	geometria	ch.ehi.ili2db.c2Max	3100000.000
gc_comisionesunidadconstruccion	\N	geometria	ch.ehi.ili2db.geomType	MULTIPOLYGON
gc_comisionesunidadconstruccion	\N	geometria	ch.ehi.ili2db.c1Min	3980000.000
gc_comisionesunidadconstruccion	\N	geometria	ch.ehi.ili2db.c2Min	1080000.000
gc_comisionesunidadconstruccion	\N	geometria	ch.ehi.ili2db.c3Min	-5000.000
gc_comisionesunidadconstruccion	\N	geometria	ch.ehi.ili2db.c3Max	6000.000
gc_comisionesunidadconstruccion	\N	geometria	ch.ehi.ili2db.srid	9377
gc_comisionesunidadconstruccion	\N	geometria	ch.ehi.ili2db.dispName	Geometría
gc_construccion	\N	numero_pisos	ch.ehi.ili2db.dispName	Número de pisos
snr_predioregistro	\N	matricula_inmobiliaria	ch.ehi.ili2db.dispName	Matrícula inmobiliaria
gc_estadopredio	\N	fecha_alerta	ch.ehi.ili2db.dispName	Fecha de alerta
gc_datostorreph	\N	total_pisos_torre	ch.ehi.ili2db.dispName	Total de pisos torre
gc_datosphcondominio	\N	area_total_construida_privada	ch.ehi.ili2db.unit	m2
gc_datosphcondominio	\N	area_total_construida_privada	ch.ehi.ili2db.dispName	Área total construida privada
gc_manzana	\N	codigo_anterior	ch.ehi.ili2db.dispName	Código anterior
gc_datostorreph	\N	total_unidades_privadas	ch.ehi.ili2db.dispName	Total de unidades privadas
extarchivo	\N	local_id	ch.ehi.ili2db.dispName	Local ID
snr_derecho	\N	calidad_derecho_registro	ch.ehi.ili2db.foreignKey	snr_calidadderechotipo
snr_derecho	\N	calidad_derecho_registro	ch.ehi.ili2db.dispName	Calidad derecho registro
snr_titular	\N	tipo_persona	ch.ehi.ili2db.foreignKey	snr_personatitulartipo
snr_titular	\N	tipo_persona	ch.ehi.ili2db.dispName	Tipo de persona
gc_terreno	\N	gc_predio	ch.ehi.ili2db.foreignKey	gc_prediocatastro
gc_unidadconstruccion	\N	tipo_construccion	ch.ehi.ili2db.foreignKey	gc_unidadconstrucciontipo
gc_unidadconstruccion	\N	tipo_construccion	ch.ehi.ili2db.dispName	Tipo de construcción
gc_barrio	\N	codigo_sector	ch.ehi.ili2db.dispName	Código sector
gc_unidadconstruccion	\N	identificador	ch.ehi.ili2db.dispName	Identificador
gc_unidadconstruccion	\N	total_pisos	ch.ehi.ili2db.dispName	Total de pisos
snr_titular	\N	primer_apellido	ch.ehi.ili2db.dispName	Primer apellido
extarchivo	\N	fecha_grabacion	ch.ehi.ili2db.dispName	Fecha de grabación
snr_estructuramatriculamatriz	\N	codigo_orip	ch.ehi.ili2db.dispName	Código ORIP
gc_calificacionunidadconstruccion	\N	detalle_calificacion	ch.ehi.ili2db.dispName	Detalle de calificación
snr_titular_derecho	\N	snr_derecho	ch.ehi.ili2db.foreignKey	snr_derecho
snr_titular	\N	numero_documento	ch.ehi.ili2db.dispName	Número de documento
snr_fuentederecho	\N	ciudad_emisora	ch.ehi.ili2db.dispName	Ciudad emisora
gc_barrio	\N	nombre	ch.ehi.ili2db.dispName	Nombre
gc_terreno	\N	geometria	ch.ehi.ili2db.coordDimension	2
gc_terreno	\N	geometria	ch.ehi.ili2db.c1Max	5700000.000
gc_terreno	\N	geometria	ch.ehi.ili2db.c2Max	3100000.000
gc_terreno	\N	geometria	ch.ehi.ili2db.geomType	MULTIPOLYGON
gc_terreno	\N	geometria	ch.ehi.ili2db.c1Min	3980000.000
gc_terreno	\N	geometria	ch.ehi.ili2db.c2Min	1080000.000
gc_terreno	\N	geometria	ch.ehi.ili2db.srid	9377
gc_terreno	\N	geometria	ch.ehi.ili2db.dispName	Geometría
gc_datosphcondominio	\N	area_total_terreno_comun	ch.ehi.ili2db.unit	m2
gc_datosphcondominio	\N	area_total_terreno_comun	ch.ehi.ili2db.dispName	Área total de terreno común
gc_datosphcondominio	\N	gc_predio	ch.ehi.ili2db.foreignKey	gc_prediocatastro
gc_propietario	\N	primer_nombre	ch.ehi.ili2db.dispName	Primer nombre
snr_predioregistro	\N	numero_predial_anterior_en_fmi	ch.ehi.ili2db.dispName	Número predial anterior en FMI
gc_propietario	\N	digito_verificacion	ch.ehi.ili2db.dispName	Dígito de verificación
gc_manzana	\N	geometria	ch.ehi.ili2db.coordDimension	2
gc_manzana	\N	geometria	ch.ehi.ili2db.c1Max	5700000.000
gc_manzana	\N	geometria	ch.ehi.ili2db.c2Max	3100000.000
gc_manzana	\N	geometria	ch.ehi.ili2db.geomType	MULTIPOLYGON
gc_manzana	\N	geometria	ch.ehi.ili2db.c1Min	3980000.000
gc_manzana	\N	geometria	ch.ehi.ili2db.c2Min	1080000.000
gc_manzana	\N	geometria	ch.ehi.ili2db.srid	9377
gc_manzana	\N	geometria	ch.ehi.ili2db.dispName	Geometría
gc_estadopredio	\N	gc_prediocatastro_estado_predio	ch.ehi.ili2db.foreignKey	gc_prediocatastro
gc_unidadconstruccion	\N	uso	ch.ehi.ili2db.dispName	Uso
snr_fuentederecho	\N	ente_emisor	ch.ehi.ili2db.textKind	MTEXT
snr_fuentederecho	\N	ente_emisor	ch.ehi.ili2db.dispName	Ente emisor
gc_datosphcondominio	\N	total_unidades_sotano	ch.ehi.ili2db.dispName	Total de unidades de sótano
snr_predioregistro	\N	fecha_datos	ch.ehi.ili2db.dispName	Fecha de datos
gc_sectorrural	\N	geometria	ch.ehi.ili2db.coordDimension	2
gc_sectorrural	\N	geometria	ch.ehi.ili2db.c1Max	5700000.000
gc_sectorrural	\N	geometria	ch.ehi.ili2db.c2Max	3100000.000
gc_sectorrural	\N	geometria	ch.ehi.ili2db.geomType	MULTIPOLYGON
gc_sectorrural	\N	geometria	ch.ehi.ili2db.c1Min	3980000.000
gc_sectorrural	\N	geometria	ch.ehi.ili2db.c2Min	1080000.000
gc_sectorrural	\N	geometria	ch.ehi.ili2db.srid	9377
gc_sectorrural	\N	geometria	ch.ehi.ili2db.dispName	Geometría
gc_unidadconstruccion	\N	total_locales	ch.ehi.ili2db.dispName	Total de locales
gc_unidadconstruccion	\N	etiqueta	ch.ehi.ili2db.dispName	Etiqueta
gc_unidadconstruccion	\N	puntaje	ch.ehi.ili2db.dispName	Puntaje
gc_direccion	\N	gc_prediocatastro_direcciones	ch.ehi.ili2db.foreignKey	gc_prediocatastro
extarchivo	\N	fecha_entrega	ch.ehi.ili2db.dispName	Fecha de entrega
gc_comisionesconstruccion	\N	geometria	ch.ehi.ili2db.coordDimension	3
gc_comisionesconstruccion	\N	geometria	ch.ehi.ili2db.c1Max	5700000.000
gc_comisionesconstruccion	\N	geometria	ch.ehi.ili2db.c2Max	3100000.000
gc_comisionesconstruccion	\N	geometria	ch.ehi.ili2db.geomType	MULTIPOLYGON
gc_comisionesconstruccion	\N	geometria	ch.ehi.ili2db.c1Min	3980000.000
gc_comisionesconstruccion	\N	geometria	ch.ehi.ili2db.c2Min	1080000.000
gc_comisionesconstruccion	\N	geometria	ch.ehi.ili2db.c3Min	-5000.000
gc_comisionesconstruccion	\N	geometria	ch.ehi.ili2db.c3Max	6000.000
gc_comisionesconstruccion	\N	geometria	ch.ehi.ili2db.srid	9377
gc_comisionesconstruccion	\N	geometria	ch.ehi.ili2db.dispName	Geometría
gc_construccion	\N	etiqueta	ch.ehi.ili2db.dispName	Etiqueta
gc_propietario	\N	gc_predio_catastro	ch.ehi.ili2db.foreignKey	gc_prediocatastro
gc_unidadconstruccion	\N	codigo_terreno	ch.ehi.ili2db.dispName	Código terreno
gc_construccion	\N	numero_sotanos	ch.ehi.ili2db.dispName	Número de sótanos
gc_calificacionunidadconstruccion	\N	elemento_calificacion	ch.ehi.ili2db.dispName	Elemento de calificación
gc_construccion	\N	codigo_edificacion	ch.ehi.ili2db.dispName	Código de edificación
gc_datosphcondominio	\N	area_total_construida_comun	ch.ehi.ili2db.unit	m2
gc_datosphcondominio	\N	area_total_construida_comun	ch.ehi.ili2db.dispName	Área total construida común
gc_estadopredio	\N	entidad_emisora_alerta	ch.ehi.ili2db.dispName	Entidad emisora de la alerta
gm_surface3dlistvalue	\N	avalue	ch.ehi.ili2db.coordDimension	3
gm_surface3dlistvalue	\N	avalue	ch.ehi.ili2db.c1Max	5700000.000
gm_surface3dlistvalue	\N	avalue	ch.ehi.ili2db.c2Max	3100000.000
gm_surface3dlistvalue	\N	avalue	ch.ehi.ili2db.geomType	POLYGON
gm_surface3dlistvalue	\N	avalue	ch.ehi.ili2db.c1Min	3980000.000
gm_surface3dlistvalue	\N	avalue	ch.ehi.ili2db.c2Min	1080000.000
gm_surface3dlistvalue	\N	avalue	ch.ehi.ili2db.c3Min	-5000.000
gm_surface3dlistvalue	\N	avalue	ch.ehi.ili2db.c3Max	6000.000
gm_surface3dlistvalue	\N	avalue	ch.ehi.ili2db.srid	9377
gc_construccion	\N	tipo_dominio	ch.ehi.ili2db.dispName	Tipo de dominio
snr_predioregistro	\N	clase_suelo_registro	ch.ehi.ili2db.foreignKey	snr_clasepredioregistrotipo
snr_predioregistro	\N	clase_suelo_registro	ch.ehi.ili2db.dispName	Clase del suelo según registro
gc_barrio	\N	codigo	ch.ehi.ili2db.dispName	Código
snr_fuentecabidalinderos	\N	numero_documento	ch.ehi.ili2db.dispName	Número de documento
snr_fuentederecho	\N	tipo_documento	ch.ehi.ili2db.foreignKey	snr_fuentetipo
snr_fuentederecho	\N	tipo_documento	ch.ehi.ili2db.dispName	Tipo de documento
gc_construccion	\N	codigo_terreno	ch.ehi.ili2db.dispName	Código de terreno
gc_propietario	\N	tipo_documento	ch.ehi.ili2db.dispName	Tipo de documento
\.


--
-- TOC entry 6540 (class 0 OID 376241)
-- Dependencies: 830
-- Data for Name: t_ili2db_dataset; Type: TABLE DATA; Schema: test_ladm_integration; Owner: postgres
--

COPY test_ladm_integration.t_ili2db_dataset (t_id, datasetname) FROM stdin;
\.


--
-- TOC entry 6541 (class 0 OID 376246)
-- Dependencies: 831
-- Data for Name: t_ili2db_inheritance; Type: TABLE DATA; Schema: test_ladm_integration; Owner: postgres
--

COPY test_ladm_integration.t_ili2db_inheritance (thisclass, baseclass) FROM stdin;
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_propietario_predio	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_CalificacionUnidadConstruccion	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Construccion	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Terreno	\N
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_FuenteDerecho	\N
ISO19107_PLANAS_V3_0.GM_MultiSurface3D	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_ComisionesConstruccion	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_construccion_predio	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_unidadconstruccion_calificacionunidadconstruccion	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Vereda	\N
Submodelo_Integracion_Insumos_V1_0.Datos_Integracion_Insumos.ini_predio_integracion_snr	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_datosphcondominio_datostorreph	\N
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_FuenteCabidaLinderos	\N
Submodelo_Insumos_SNR_V1_0.Datos_SNR.snr_titular_derecho	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Barrio	\N
ISO19107_PLANAS_V3_0.GM_Surface2DListValue	\N
ISO19107_PLANAS_V3_0.GM_Surface3DListValue	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Direccion	\N
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_Derecho	\N
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_PredioRegistro	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Manzana	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Propietario	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_copropiedad	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_construccion_unidad	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_PredioCatastro	\N
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_EstructuraMatriculaMatriz	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_EstadoPredio	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Perimetro	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_ComisionesTerreno	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_DatosTorrePH	\N
Submodelo_Insumos_SNR_V1_0.Datos_SNR.snr_predio_registro_fuente_cabidalinderos	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_terreno_predio	\N
LADM_COL_V3_0.LADM_Nucleo.ExtArchivo	\N
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_Titular	\N
Submodelo_Integracion_Insumos_V1_0.Datos_Integracion_Insumos.INI_PredioInsumos	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_DatosPHCondominio	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_SectorRural	\N
Submodelo_Insumos_SNR_V1_0.Datos_SNR.snr_derecho_predio	\N
Submodelo_Integracion_Insumos_V1_0.Datos_Integracion_Insumos.ini_predio_integracion_gc	\N
Submodelo_Insumos_SNR_V1_0.Datos_SNR.snr_derecho_fuente_derecho	\N
ISO19107_PLANAS_V3_0.GM_MultiSurface2D	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_ComisionesUnidadConstruccion	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_SectorUrbano	\N
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_ph_predio	\N
\.


--
-- TOC entry 6558 (class 0 OID 376385)
-- Dependencies: 848
-- Data for Name: t_ili2db_meta_attrs; Type: TABLE DATA; Schema: test_ladm_integration; Owner: postgres
--

COPY test_ladm_integration.t_ili2db_meta_attrs (ilielement, attr_name, attr_value) FROM stdin;
LADM_COL_V3_0.LADM_Nucleo.COL_AgrupacionUnidadesEspaciales.Etiqueta	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.COL_AgrupacionUnidadesEspaciales.Etiqueta	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.COL_AgrupacionUnidadesEspaciales.Etiqueta	ili2db.dispName	Etiqueta
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_ComisionesTerreno	ili2db.dispName	(GC) Comisiones Terreno
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Construccion.Numero_Sotanos	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Construccion.Numero_Sotanos	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Construccion.Numero_Sotanos	ili2db.dispName	Número de sótanos
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_DatosTorrePH.Total_Pisos_Torre	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_DatosTorrePH.Total_Pisos_Torre	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_DatosTorrePH.Total_Pisos_Torre	ili2db.dispName	Total de pisos torre
LADM_COL_V3_0.LADM_Nucleo.COL_FuenteEspacial.Descripcion	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.COL_FuenteEspacial.Descripcion	ili2db.ili.attrCardinalityMin	1
LADM_COL_V3_0.LADM_Nucleo.COL_FuenteEspacial.Descripcion	ili2db.dispName	Descripción
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Etiqueta	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Etiqueta	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Etiqueta	ili2db.dispName	Etiqueta
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_terreno_predio.gc_predio	ili2db.ili.assocCardinalityMin	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_terreno_predio.gc_predio	ili2db.ili.assocCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_terreno_predio.gc_predio	ili2db.ili.assocKind	ASSOCIATE
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_ComisionesTerreno.Geometria	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_ComisionesTerreno.Geometria	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_ComisionesTerreno.Geometria	ili2db.dispName	Geometría
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_PredioCatastro.Numero_Predial_Anterior	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_PredioCatastro.Numero_Predial_Anterior	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_PredioCatastro.Numero_Predial_Anterior	ili2db.dispName	Número predial anterior
LADM_COL_V3_0.LADM_Nucleo.col_responsableFuente.fuente_administrativa	ili2db.ili.assocCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.col_responsableFuente.fuente_administrativa	ili2db.ili.assocCardinalityMax	*
LADM_COL_V3_0.LADM_Nucleo.col_responsableFuente.fuente_administrativa	ili2db.ili.assocKind	ASSOCIATE
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Manzana.Codigo_Barrio	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Manzana.Codigo_Barrio	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Manzana.Codigo_Barrio	ili2db.dispName	Código de barrio
LADM_COL_V3_0.LADM_Nucleo.col_rrrFuente.fuente_administrativa	ili2db.ili.assocCardinalityMin	1
LADM_COL_V3_0.LADM_Nucleo.col_rrrFuente.fuente_administrativa	ili2db.ili.assocCardinalityMax	*
LADM_COL_V3_0.LADM_Nucleo.col_rrrFuente.fuente_administrativa	ili2db.ili.assocKind	ASSOCIATE
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Direccion.Principal	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Direccion.Principal	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Direccion.Principal	ili2db.dispName	Principal
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Terreno.Manzana_Vereda_Codigo	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Terreno.Manzana_Vereda_Codigo	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Terreno.Manzana_Vereda_Codigo	ili2db.dispName	Código de manzana vereda
LADM_COL_V3_0.LADM_Nucleo.COL_UnidadAdministrativaBasica.Tipo	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.COL_UnidadAdministrativaBasica.Tipo	ili2db.ili.attrCardinalityMin	1
LADM_COL_V3_0.LADM_Nucleo.COL_UnidadAdministrativaBasica.Tipo	ili2db.dispName	Tipo
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_ComisionesUnidadConstruccion.Numero_Predial	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_ComisionesUnidadConstruccion.Numero_Predial	ili2db.ili.attrCardinalityMin	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_ComisionesUnidadConstruccion.Numero_Predial	ili2db.dispName	Número predial
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_DatosTorrePH.Total_Unidades_Sotano	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_DatosTorrePH.Total_Unidades_Sotano	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_DatosTorrePH.Total_Unidades_Sotano	ili2db.dispName	Total de unidades sótano
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Vereda.Geometria	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Vereda.Geometria	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Vereda.Geometria	ili2db.dispName	Geometría
LADM_COL_V3_0.LADM_Nucleo.col_clFuente.cl	ili2db.ili.assocCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.col_clFuente.cl	ili2db.ili.assocCardinalityMax	*
LADM_COL_V3_0.LADM_Nucleo.col_clFuente.cl	ili2db.ili.assocKind	ASSOCIATE
LADM_COL_V3_0.LADM_Nucleo.ExtDireccion.Valor_Via_Generadora	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.ExtDireccion.Valor_Via_Generadora	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.ExtDireccion.Valor_Via_Generadora	ili2db.dispName	Valor de vía generadora
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_DatosPHCondominio.Area_Total_Terreno_Privada	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_DatosPHCondominio.Area_Total_Terreno_Privada	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_DatosPHCondominio.Area_Total_Terreno_Privada	ili2db.dispName	Área total de terreno privada
LADM_COL_V3_0.LADM_Nucleo.ExtDireccion.Nombre_Predio	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.ExtDireccion.Nombre_Predio	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.ExtDireccion.Nombre_Predio	ili2db.dispName	Nombre del predio
LADM_COL_V3_0.LADM_Nucleo.col_baunitRrr.unidad	ili2db.ili.assocCardinalityMin	1
LADM_COL_V3_0.LADM_Nucleo.col_baunitRrr.unidad	ili2db.ili.assocCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.col_baunitRrr.unidad	ili2db.ili.assocKind	ASSOCIATE
LADM_COL_V3_0.LADM_Nucleo.COL_Interesado.ext_PID	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.COL_Interesado.ext_PID	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.COL_Interesado.ext_PID	ili2db.dispName	Ext PID
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Propietario.Primer_Apellido	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Propietario.Primer_Apellido	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Propietario.Primer_Apellido	ili2db.dispName	Primer apellido
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Total_Locales	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Total_Locales	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Total_Locales	ili2db.dispName	Total de locales
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_FuenteDerecho.Fecha_Documento	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_FuenteDerecho.Fecha_Documento	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_FuenteDerecho.Fecha_Documento	ili2db.dispName	Fecha del documento
LADM_COL_V3_0.LADM_Nucleo.COL_EspacioJuridicoRedServicios.Estado	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.COL_EspacioJuridicoRedServicios.Estado	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.COL_EspacioJuridicoRedServicios.Estado	ili2db.dispName	Estado
LADM_COL_V3_0.LADM_Nucleo.COL_FuenteEspacial.Nombre	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.COL_FuenteEspacial.Nombre	ili2db.ili.attrCardinalityMin	1
LADM_COL_V3_0.LADM_Nucleo.COL_FuenteEspacial.Nombre	ili2db.dispName	Nombre
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_DatosPHCondominio	ili2db.dispName	(GC) Datos Propiedad Horizontal Condominio
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_DatosTorrePH.Total_Sotanos	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_DatosTorrePH.Total_Sotanos	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_DatosTorrePH.Total_Sotanos	ili2db.dispName	Total de sótanos
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Total_Pisos	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Total_Pisos	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Total_Pisos	ili2db.dispName	Total de pisos
LADM_COL_V3_0.LADM_Nucleo.COL_CarasLindero.Geometria	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.COL_CarasLindero.Geometria	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.COL_CarasLindero.Geometria	ili2db.dispName	Geometría
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Construccion.Numero_Semisotanos	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Construccion.Numero_Semisotanos	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Construccion.Numero_Semisotanos	ili2db.dispName	Número de semisótanos
LADM_COL_V3_0.LADM_Nucleo.col_ueNivel.ue	ili2db.ili.assocCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.col_ueNivel.ue	ili2db.ili.assocCardinalityMax	*
LADM_COL_V3_0.LADM_Nucleo.col_ueNivel.ue	ili2db.ili.assocKind	ASSOCIATE
LADM_COL_V3_0.LADM_Nucleo.col_ueNivel.nivel	ili2db.ili.assocCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.col_ueNivel.nivel	ili2db.ili.assocCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.col_ueNivel.nivel	ili2db.ili.assocKind	ASSOCIATE
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Construccion.Numero_Mezanines	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Construccion.Numero_Mezanines	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Construccion.Numero_Mezanines	ili2db.dispName	Número de mezanines
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_FuenteDerecho.Tipo_Documento	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_FuenteDerecho.Tipo_Documento	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_FuenteDerecho.Tipo_Documento	ili2db.dispName	Tipo de documento
Submodelo_Insumos_SNR_V1_0.Datos_SNR.snr_derecho_fuente_derecho.snr_derecho	ili2db.ili.assocCardinalityMin	1
Submodelo_Insumos_SNR_V1_0.Datos_SNR.snr_derecho_fuente_derecho.snr_derecho	ili2db.ili.assocCardinalityMax	*
Submodelo_Insumos_SNR_V1_0.Datos_SNR.snr_derecho_fuente_derecho.snr_derecho	ili2db.ili.assocKind	ASSOCIATE
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_construccion_unidad.gc_construccion	ili2db.ili.assocCardinalityMin	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_construccion_unidad.gc_construccion	ili2db.ili.assocCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_construccion_unidad.gc_construccion	ili2db.ili.assocKind	ASSOCIATE
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_Titular.Segundo_Apellido	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_Titular.Segundo_Apellido	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_Titular.Segundo_Apellido	ili2db.dispName	Segundo apellido
Submodelo_Integracion_Insumos_V1_0.Datos_Integracion_Insumos.INI_PredioInsumos.Observaciones	ili2db.ili.attrCardinalityMax	1
Submodelo_Integracion_Insumos_V1_0.Datos_Integracion_Insumos.INI_PredioInsumos.Observaciones	ili2db.ili.attrCardinalityMin	0
Submodelo_Integracion_Insumos_V1_0.Datos_Integracion_Insumos.INI_PredioInsumos.Observaciones	ili2db.dispName	Observaciones
LADM_COL_V3_0.LADM_Nucleo.ExtArchivo	ili2db.dispName	Archivo fuente
LADM_COL_V3_0.LADM_Nucleo.ExtRedServiciosFisica.Orientada	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.ExtRedServiciosFisica.Orientada	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.ExtRedServiciosFisica.Orientada	ili2db.dispName	Orientada
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_copropiedad.gc_matriz	ili2db.ili.assocCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_copropiedad.gc_matriz	ili2db.ili.assocCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_copropiedad.gc_matriz	ili2db.ili.assocKind	AGGREGATE
LADM_COL_V3_0.LADM_Nucleo.Fraccion.Denominador	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.Fraccion.Denominador	ili2db.ili.attrCardinalityMin	1
LADM_COL_V3_0.LADM_Nucleo.Fraccion.Denominador	ili2db.dispName	Denominador
LADM_COL_V3_0.LADM_Nucleo.ExtRedServiciosFisica.Ext_Interesado_Administrador_ID	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.ExtRedServiciosFisica.Ext_Interesado_Administrador_ID	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.ExtRedServiciosFisica.Ext_Interesado_Administrador_ID	ili2db.dispName	Ext interesado administrador id
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_PredioCatastro.Direcciones	ili2db.ili.attrCardinalityMax	*
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_PredioCatastro.Direcciones	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_PredioCatastro.Direcciones	ili2db.dispName	Direcciones
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Construccion.Codigo_Edificacion	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Construccion.Codigo_Edificacion	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Construccion.Codigo_Edificacion	ili2db.dispName	Código de edificación
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_DatosPHCondominio.Area_Total_Construida_Comun	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_DatosPHCondominio.Area_Total_Construida_Comun	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_DatosPHCondominio.Area_Total_Construida_Comun	ili2db.dispName	Área total construida común
LADM_COL_V3_0.LADM_Nucleo.COL_FuenteAdministrativa.Tipo	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.COL_FuenteAdministrativa.Tipo	ili2db.ili.attrCardinalityMin	1
LADM_COL_V3_0.LADM_Nucleo.COL_FuenteAdministrativa.Tipo	ili2db.dispName	Tipo
LADM_COL_V3_0.LADM_Nucleo.ExtDireccion.Sector_Ciudad	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.ExtDireccion.Sector_Ciudad	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.ExtDireccion.Sector_Ciudad	ili2db.dispName	Sector de la ciudad
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_SectorRural	ili2db.dispName	(GC) Sector Rural
Submodelo_Insumos_SNR_V1_0.Datos_SNR.snr_titular_derecho.Porcentaje_Participacion	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_SNR_V1_0.Datos_SNR.snr_titular_derecho.Porcentaje_Participacion	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.Oid.Local_Id	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.Oid.Local_Id	ili2db.ili.attrCardinalityMin	1
LADM_COL_V3_0.LADM_Nucleo.Oid.Local_Id	ili2db.dispName	Local ID
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Manzana.Codigo	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Manzana.Codigo	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Manzana.Codigo	ili2db.dispName	Código
LADM_COL_V3_0.LADM_Nucleo.ExtDireccion.Complemento	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.ExtDireccion.Complemento	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.ExtDireccion.Complemento	ili2db.dispName	Complemento
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Construccion.Numero_Pisos	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Construccion.Numero_Pisos	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Construccion.Numero_Pisos	ili2db.dispName	Número de pisos
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_DatosPHCondominio.Area_Total_Terreno_Comun	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_DatosPHCondominio.Area_Total_Terreno_Comun	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_DatosPHCondominio.Area_Total_Terreno_Comun	ili2db.dispName	Área total de terreno común
LADM_COL_V3_0.LADM_Nucleo.COL_Transformacion.Transformacion	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.COL_Transformacion.Transformacion	ili2db.ili.attrCardinalityMin	1
LADM_COL_V3_0.LADM_Nucleo.COL_Transformacion.Transformacion	ili2db.dispName	Transformación
LADM_COL_V3_0.LADM_Nucleo.ExtArchivo.Espacio_De_Nombres	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.ExtArchivo.Espacio_De_Nombres	ili2db.ili.attrCardinalityMin	1
LADM_COL_V3_0.LADM_Nucleo.ExtArchivo.Espacio_De_Nombres	ili2db.dispName	Espacio de nombres
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Construccion	ili2db.dispName	(GC) Construcción
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_EstadoPredio.Fecha_Alerta	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_EstadoPredio.Fecha_Alerta	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_EstadoPredio.Fecha_Alerta	ili2db.dispName	Fecha de alerta
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_propietario_predio.gc_predio_catastro	ili2db.ili.assocCardinalityMin	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_propietario_predio.gc_predio_catastro	ili2db.ili.assocCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_propietario_predio.gc_predio_catastro	ili2db.ili.assocKind	ASSOCIATE
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Direccion	ili2db.dispName	(GC) Dirección
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_PredioCatastro.Condicion_Predio	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_PredioCatastro.Condicion_Predio	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_PredioCatastro.Condicion_Predio	ili2db.dispName	Condición del predio
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_unidadconstruccion_calificacionunidadconstruccion.gc_unidadconstruccion	ili2db.ili.assocCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_unidadconstruccion_calificacionunidadconstruccion.gc_unidadconstruccion	ili2db.ili.assocCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_unidadconstruccion_calificacionunidadconstruccion.gc_unidadconstruccion	ili2db.ili.assocKind	ASSOCIATE
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_PredioRegistro.Matricula_Inmobiliaria_Matriz	ili2db.ili.attrCardinalityMax	*
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_PredioRegistro.Matricula_Inmobiliaria_Matriz	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_PredioRegistro.Matricula_Inmobiliaria_Matriz	ili2db.dispName	Matrícula inmobiliaria matriz
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Tipo_Construccion	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Tipo_Construccion	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Tipo_Construccion	ili2db.dispName	Tipo de construcción
LADM_COL_V3_0.LADM_Nucleo.col_puntoCl.punto	ili2db.ili.assocCardinalityMin	3
LADM_COL_V3_0.LADM_Nucleo.col_puntoCl.punto	ili2db.ili.assocCardinalityMax	*
LADM_COL_V3_0.LADM_Nucleo.col_puntoCl.punto	ili2db.ili.assocKind	ASSOCIATE
LADM_COL_V3_0.LADM_Nucleo.col_unidadFuente.unidad	ili2db.ili.assocCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.col_unidadFuente.unidad	ili2db.ili.assocCardinalityMax	*
LADM_COL_V3_0.LADM_Nucleo.col_unidadFuente.unidad	ili2db.ili.assocKind	ASSOCIATE
LADM_COL_V3_0.LADM_Nucleo.ExtDireccion.Sector_Predio	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.ExtDireccion.Sector_Predio	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.ExtDireccion.Sector_Predio	ili2db.dispName	Sector del predio
LADM_COL_V3_0.LADM_Nucleo.COL_UnidadEspacial.Etiqueta	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.COL_UnidadEspacial.Etiqueta	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.COL_UnidadEspacial.Etiqueta	ili2db.dispName	Etiqueta
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_construccion_predio.gc_predio	ili2db.ili.assocCardinalityMin	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_construccion_predio.gc_predio	ili2db.ili.assocCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_construccion_predio.gc_predio	ili2db.ili.assocKind	ASSOCIATE
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_PredioRegistro.Fecha_Datos	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_PredioRegistro.Fecha_Datos	ili2db.ili.attrCardinalityMin	1
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_PredioRegistro.Fecha_Datos	ili2db.dispName	Fecha de datos
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Barrio.Codigo	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Barrio.Codigo	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Barrio.Codigo	ili2db.dispName	Código
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_PredioRegistro.Numero_Predial_Nuevo_en_FMI	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_PredioRegistro.Numero_Predial_Nuevo_en_FMI	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_PredioRegistro.Numero_Predial_Nuevo_en_FMI	ili2db.dispName	Número predial nuevo en FMI
Submodelo_Insumos_SNR_V1_0.Datos_SNR.snr_predio_registro_fuente_cabidalinderos.snr_fuente_cabidalinderos	ili2db.ili.assocCardinalityMin	0
Submodelo_Insumos_SNR_V1_0.Datos_SNR.snr_predio_registro_fuente_cabidalinderos.snr_fuente_cabidalinderos	ili2db.ili.assocCardinalityMax	1
Submodelo_Insumos_SNR_V1_0.Datos_SNR.snr_predio_registro_fuente_cabidalinderos.snr_fuente_cabidalinderos	ili2db.ili.assocKind	ASSOCIATE
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Terreno.Area_Terreno_Digital	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Terreno.Area_Terreno_Digital	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Terreno.Area_Terreno_Digital	ili2db.dispName	Área terreno digital
LADM_COL_V3_0.LADM_Nucleo.Fraccion.Numerador	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.Fraccion.Numerador	ili2db.ili.attrCardinalityMin	1
LADM_COL_V3_0.LADM_Nucleo.Fraccion.Numerador	ili2db.dispName	Numerador
LADM_COL_V3_0.LADM_Nucleo.ExtArchivo.Fecha_Entrega	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.ExtArchivo.Fecha_Entrega	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.ExtArchivo.Fecha_Entrega	ili2db.dispName	Fecha de entrega
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_unidadconstruccion_calificacionunidadconstruccion.gc_calificacionunidadconstruccion	ili2db.ili.assocCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_unidadconstruccion_calificacionunidadconstruccion.gc_calificacionunidadconstruccion	ili2db.ili.assocCardinalityMax	*
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_unidadconstruccion_calificacionunidadconstruccion.gc_calificacionunidadconstruccion	ili2db.ili.assocKind	ASSOCIATE
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_propietario_predio.gc_propietario	ili2db.ili.assocCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_propietario_predio.gc_propietario	ili2db.ili.assocCardinalityMax	*
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_propietario_predio.gc_propietario	ili2db.ili.assocKind	ASSOCIATE
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_PredioRegistro.Matricula_Inmobiliaria	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_PredioRegistro.Matricula_Inmobiliaria	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_PredioRegistro.Matricula_Inmobiliaria	ili2db.dispName	Matrícula inmobiliaria
LADM_COL_V3_0.LADM_Nucleo.COL_Fuente.Estado_Disponibilidad	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.COL_Fuente.Estado_Disponibilidad	ili2db.ili.attrCardinalityMin	1
LADM_COL_V3_0.LADM_Nucleo.COL_Fuente.Estado_Disponibilidad	ili2db.dispName	Estado de disponibilidad
LADM_COL_V3_0.LADM_Nucleo.COL_Fuente.Fecha_Documento_Fuente	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.COL_Fuente.Fecha_Documento_Fuente	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.COL_Fuente.Fecha_Documento_Fuente	ili2db.dispName	Fecha de documento fuente
LADM_COL_V3_0.LADM_Nucleo.COL_Punto.Geometria	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.COL_Punto.Geometria	ili2db.ili.attrCardinalityMin	1
LADM_COL_V3_0.LADM_Nucleo.COL_Punto.Geometria	ili2db.dispName	Geometría
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Perimetro.Codigo_Nombre	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Perimetro.Codigo_Nombre	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Perimetro.Codigo_Nombre	ili2db.dispName	Código nombre
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_FuenteCabidaLinderos.Ente_Emisor	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_FuenteCabidaLinderos.Ente_Emisor	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_FuenteCabidaLinderos.Ente_Emisor	ili2db.dispName	Ente emisor
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Construccion.Geometria	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Construccion.Geometria	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Construccion.Geometria	ili2db.dispName	Geometría
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_PredioRegistro.Nomenclatura_Registro	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_PredioRegistro.Nomenclatura_Registro	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_PredioRegistro.Nomenclatura_Registro	ili2db.dispName	Nomenclatura según registro
LADM_COL_V3_0.LADM_Nucleo.col_topografoFuente.topografo	ili2db.ili.assocCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.col_topografoFuente.topografo	ili2db.ili.assocCardinalityMax	*
LADM_COL_V3_0.LADM_Nucleo.col_topografoFuente.topografo	ili2db.ili.assocKind	ASSOCIATE
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_datosphcondominio_datostorreph.gc_datostorreph	ili2db.ili.assocCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_datosphcondominio_datostorreph.gc_datostorreph	ili2db.ili.assocCardinalityMax	*
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_datosphcondominio_datostorreph.gc_datostorreph	ili2db.ili.assocKind	ASSOCIATE
Submodelo_Integracion_Insumos_V1_0.Datos_Integracion_Insumos.INI_PredioInsumos	ili2db.dispName	(Integración Insumos) Predio Insumos
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_PredioCatastro.Tipo_Predio	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_PredioCatastro.Tipo_Predio	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_PredioCatastro.Tipo_Predio	ili2db.dispName	Tipo de predio
LADM_COL_V3_0.LADM_Nucleo.COL_EspacioJuridicoUnidadEdificacion.Tipo	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.COL_EspacioJuridicoUnidadEdificacion.Tipo	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.COL_EspacioJuridicoUnidadEdificacion.Tipo	ili2db.dispName	Tipo
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_PredioRegistro.Clase_Suelo_Registro	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_PredioRegistro.Clase_Suelo_Registro	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_PredioRegistro.Clase_Suelo_Registro	ili2db.dispName	Clase del suelo según registro
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Construccion.Tipo_Construccion	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Construccion.Tipo_Construccion	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Construccion.Tipo_Construccion	ili2db.dispName	Tipo de construcción
LADM_COL_V3_0.LADM_Nucleo.COL_RelacionNecesariaUnidadesEspaciales.Relacion	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.COL_RelacionNecesariaUnidadesEspaciales.Relacion	ili2db.ili.attrCardinalityMin	1
LADM_COL_V3_0.LADM_Nucleo.COL_RelacionNecesariaUnidadesEspaciales.Relacion	ili2db.dispName	Relación
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Barrio.Nombre	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Barrio.Nombre	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Barrio.Nombre	ili2db.dispName	Nombre
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_CalificacionUnidadConstruccion.Puntos	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_CalificacionUnidadConstruccion.Puntos	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_CalificacionUnidadConstruccion.Puntos	ili2db.dispName	Puntos
LADM_COL_V3_0.LADM_Nucleo.COL_AreaValor.Area	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.COL_AreaValor.Area	ili2db.ili.attrCardinalityMin	1
LADM_COL_V3_0.LADM_Nucleo.COL_AreaValor.Area	ili2db.dispName	Área
LADM_COL_V3_0.LADM_Nucleo.col_topografoFuente.fuente_espacial	ili2db.ili.assocCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.col_topografoFuente.fuente_espacial	ili2db.ili.assocCardinalityMax	*
LADM_COL_V3_0.LADM_Nucleo.col_topografoFuente.fuente_espacial	ili2db.ili.assocKind	ASSOCIATE
LADM_COL_V3_0.LADM_Nucleo.ExtDireccion.Es_Direccion_Principal	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.ExtDireccion.Es_Direccion_Principal	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.ExtDireccion.Es_Direccion_Principal	ili2db.dispName	Es dirección principal
LADM_COL_V3_0.LADM_Nucleo.COL_VolumenValor.Tipo	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.COL_VolumenValor.Tipo	ili2db.ili.attrCardinalityMin	1
LADM_COL_V3_0.LADM_Nucleo.COL_VolumenValor.Tipo	ili2db.dispName	Tipo
LADM_COL_V3_0.LADM_Nucleo.COL_EspacioJuridicoRedServicios.ext_ID_Red_Fisica	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.COL_EspacioJuridicoRedServicios.ext_ID_Red_Fisica	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.COL_EspacioJuridicoRedServicios.ext_ID_Red_Fisica	ili2db.dispName	Ext id red física
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_PredioCatastro	ili2db.dispName	(GC) Predio Catastro
LADM_COL_V3_0.LADM_Nucleo.COL_Nivel.Estructura	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.COL_Nivel.Estructura	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.COL_Nivel.Estructura	ili2db.dispName	Estructura
LADM_COL_V3_0.LADM_Nucleo.ExtDireccion.Localizacion	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.ExtDireccion.Localizacion	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.ExtDireccion.Localizacion	ili2db.dispName	Localización
LADM_COL_V3_0.LADM_Nucleo.ExtDireccion.Numero_Predio	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.ExtDireccion.Numero_Predio	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.ExtDireccion.Numero_Predio	ili2db.dispName	Número del predio
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Direccion.Geometria_Referencia	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Direccion.Geometria_Referencia	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Direccion.Geometria_Referencia	ili2db.dispName	Geometría de referencia
LADM_COL_V3_0.LADM_Nucleo.col_relacionFuenteUespacial.fuente_espacial	ili2db.ili.assocCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.col_relacionFuenteUespacial.fuente_espacial	ili2db.ili.assocCardinalityMax	*
LADM_COL_V3_0.LADM_Nucleo.col_relacionFuenteUespacial.fuente_espacial	ili2db.ili.assocKind	ASSOCIATE
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_copropiedad.gc_unidad	ili2db.ili.assocCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_copropiedad.gc_unidad	ili2db.ili.assocCardinalityMax	*
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_copropiedad.gc_unidad	ili2db.ili.assocKind	ASSOCIATE
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Planta	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Planta	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Planta	ili2db.dispName	Planta
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Area_Construida	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Area_Construida	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Area_Construida	ili2db.dispName	Área construida
LADM_COL_V3_0.LADM_Nucleo.COL_Nivel.Tipo	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.COL_Nivel.Tipo	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.COL_Nivel.Tipo	ili2db.dispName	Tipo
LADM_COL_V3_0.LADM_Nucleo.COL_Punto.Transformacion_Y_Resultado	ili2db.ili.attrCardinalityMax	*
LADM_COL_V3_0.LADM_Nucleo.COL_Punto.Transformacion_Y_Resultado	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.COL_Punto.Transformacion_Y_Resultado	ili2db.dispName	Transformación y resultado
Submodelo_Integracion_Insumos_V1_0.Datos_Integracion_Insumos.ini_predio_integracion_snr.snr_predio_juridico	ili2db.ili.assocCardinalityMin	0
Submodelo_Integracion_Insumos_V1_0.Datos_Integracion_Insumos.ini_predio_integracion_snr.snr_predio_juridico	ili2db.ili.assocCardinalityMax	1
Submodelo_Integracion_Insumos_V1_0.Datos_Integracion_Insumos.ini_predio_integracion_snr.snr_predio_juridico	ili2db.ili.assocKind	ASSOCIATE
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Construccion.Identificador	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Construccion.Identificador	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Construccion.Identificador	ili2db.dispName	Identificador
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_DatosTorrePH.Total_Unidades_Privadas	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_DatosTorrePH.Total_Unidades_Privadas	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_DatosTorrePH.Total_Unidades_Privadas	ili2db.dispName	Total de unidades privadas
LADM_COL_V3_0.LADM_Nucleo.COL_RelacionNecesariaBAUnits.Relacion	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.COL_RelacionNecesariaBAUnits.Relacion	ili2db.ili.attrCardinalityMin	1
LADM_COL_V3_0.LADM_Nucleo.COL_RelacionNecesariaBAUnits.Relacion	ili2db.dispName	Relación
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Barrio.Codigo_Sector	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Barrio.Codigo_Sector	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Barrio.Codigo_Sector	ili2db.dispName	Código sector
LADM_COL_V3_0.LADM_Nucleo.col_ueFuente.fuente_espacial	ili2db.ili.assocCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.col_ueFuente.fuente_espacial	ili2db.ili.assocCardinalityMax	*
LADM_COL_V3_0.LADM_Nucleo.col_ueFuente.fuente_espacial	ili2db.ili.assocKind	ASSOCIATE
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_PredioCatastro.Tipo_Catastro	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_PredioCatastro.Tipo_Catastro	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_PredioCatastro.Tipo_Catastro	ili2db.dispName	Tipo de catastro
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Tipo_Dominio	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Tipo_Dominio	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Tipo_Dominio	ili2db.dispName	Tipo de dominio
LADM_COL_V3_0.LADM_Nucleo.col_rrrInteresado.rrr	ili2db.ili.assocCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.col_rrrInteresado.rrr	ili2db.ili.assocCardinalityMax	*
LADM_COL_V3_0.LADM_Nucleo.col_rrrInteresado.rrr	ili2db.ili.assocKind	ASSOCIATE
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_construccion_unidad.gc_unidad_construccion	ili2db.ili.assocCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_construccion_unidad.gc_unidad_construccion	ili2db.ili.assocCardinalityMax	*
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_construccion_unidad.gc_unidad_construccion	ili2db.ili.assocKind	ASSOCIATE
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_PredioRegistro.Codigo_ORIP	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_PredioRegistro.Codigo_ORIP	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_PredioRegistro.Codigo_ORIP	ili2db.dispName	Código ORIP
Submodelo_Insumos_SNR_V1_0.Datos_SNR.snr_titular_derecho.snr_titular	ili2db.ili.assocCardinalityMin	1
Submodelo_Insumos_SNR_V1_0.Datos_SNR.snr_titular_derecho.snr_titular	ili2db.ili.assocCardinalityMax	*
Submodelo_Insumos_SNR_V1_0.Datos_SNR.snr_titular_derecho.snr_titular	ili2db.ili.assocKind	ASSOCIATE
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Perimetro.Geometria	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Perimetro.Geometria	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Perimetro.Geometria	ili2db.dispName	Geometría
LADM_COL_V3_0.LADM_Nucleo.ExtDireccion.Valor_Via_Principal	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.ExtDireccion.Valor_Via_Principal	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.ExtDireccion.Valor_Via_Principal	ili2db.dispName	Valor vía principal
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_ComisionesUnidadConstruccion.Geometria	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_ComisionesUnidadConstruccion.Geometria	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_ComisionesUnidadConstruccion.Geometria	ili2db.dispName	Geometría
LADM_COL_V3_0.LADM_Nucleo.COL_AreaValor	ili2db.dispName	Valores de área
LADM_COL_V3_0.LADM_Nucleo.ExtDireccion.Letra_Via_Generadora	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.ExtDireccion.Letra_Via_Generadora	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.ExtDireccion.Letra_Via_Generadora	ili2db.dispName	Letra de vía generadora
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Propietario.Digito_Verificacion	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Propietario.Digito_Verificacion	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Propietario.Digito_Verificacion	ili2db.dispName	Dígito de verificación
LADM_COL_V3_0.LADM_Nucleo.col_puntoReferencia.ue	hidden	True
LADM_COL_V3_0.LADM_Nucleo.col_puntoReferencia.ue	ili2db.ili.assocCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.col_puntoReferencia.ue	ili2db.ili.assocCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.col_puntoReferencia.ue	ili2db.ili.assocKind	ASSOCIATE
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_CalificacionUnidadConstruccion	ili2db.dispName	(GC) Calificación unidad de construcción
LADM_COL_V3_0.LADM_Nucleo.col_responsableFuente.interesado	ili2db.ili.assocCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.col_responsableFuente.interesado	ili2db.ili.assocCardinalityMax	*
LADM_COL_V3_0.LADM_Nucleo.col_responsableFuente.interesado	ili2db.ili.assocKind	ASSOCIATE
LADM_COL_V3_0.LADM_Nucleo.COL_Punto.PuntoTipo	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.COL_Punto.PuntoTipo	ili2db.ili.attrCardinalityMin	1
LADM_COL_V3_0.LADM_Nucleo.COL_Punto.PuntoTipo	ili2db.dispName	Tipo de punto
LADM_COL_V3_0.LADM_Nucleo.ExtInteresado.Fotografia	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.ExtInteresado.Fotografia	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.ExtInteresado.Fotografia	ili2db.dispName	Fotografía
LADM_COL_V3_0.LADM_Nucleo.col_puntoCcl.ccl	ili2db.ili.assocCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.col_puntoCcl.ccl	ili2db.ili.assocCardinalityMax	*
LADM_COL_V3_0.LADM_Nucleo.col_puntoCcl.ccl	ili2db.ili.assocKind	ASSOCIATE
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Terreno.Numero_Subterraneos	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Terreno.Numero_Subterraneos	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Terreno.Numero_Subterraneos	ili2db.dispName	Número de subterráneos
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_Derecho	ili2db.dispName	(SNR) Derecho
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_EstructuraMatriculaMatriz.Codigo_ORIP	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_EstructuraMatriculaMatriz.Codigo_ORIP	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_EstructuraMatriculaMatriz.Codigo_ORIP	ili2db.dispName	Código ORIP
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_PredioRegistro.Numero_Predial_Anterior_en_FMI	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_PredioRegistro.Numero_Predial_Anterior_en_FMI	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_PredioRegistro.Numero_Predial_Anterior_en_FMI	ili2db.dispName	Número predial anterior en FMI
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Construccion.Area_Construida	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Construccion.Area_Construida	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Construccion.Area_Construida	ili2db.dispName	Área construida
LADM_COL_V3_0.LADM_Nucleo.ExtArchivo.Datos	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.ExtArchivo.Datos	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.ExtArchivo.Datos	ili2db.dispName	Datos
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_copropiedad.Coeficiente_Copropiedad	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_copropiedad.Coeficiente_Copropiedad	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_FuenteCabidaLinderos.Ciudad_Emisora	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_FuenteCabidaLinderos.Ciudad_Emisora	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_FuenteCabidaLinderos.Ciudad_Emisora	ili2db.dispName	Ciudad emisora
LADM_COL_V3_0.LADM_Nucleo.ExtDireccion.Letra_Via_Principal	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.ExtDireccion.Letra_Via_Principal	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.ExtDireccion.Letra_Via_Principal	ili2db.dispName	Letra vía principal
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Perimetro	ili2db.dispName	(GC) Perímetro
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_Derecho.Calidad_Derecho_Registro	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_Derecho.Calidad_Derecho_Registro	ili2db.ili.attrCardinalityMin	1
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_Derecho.Calidad_Derecho_Registro	ili2db.dispName	Calidad derecho registro
LADM_COL_V3_0.LADM_Nucleo.col_ueBaunit.baunit	ili2db.ili.assocCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.col_ueBaunit.baunit	ili2db.ili.assocCardinalityMax	*
LADM_COL_V3_0.LADM_Nucleo.col_ueBaunit.baunit	ili2db.ili.assocKind	ASSOCIATE
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion	ili2db.dispName	(GC) Unidad Construcción
LADM_COL_V3_0.LADM_Nucleo.col_clFuente.fuente_espacial	ili2db.ili.assocCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.col_clFuente.fuente_espacial	ili2db.ili.assocCardinalityMax	*
LADM_COL_V3_0.LADM_Nucleo.col_clFuente.fuente_espacial	ili2db.ili.assocKind	ASSOCIATE
Submodelo_Insumos_SNR_V1_0.Datos_SNR.snr_titular_derecho.snr_derecho	ili2db.ili.assocCardinalityMin	1
Submodelo_Insumos_SNR_V1_0.Datos_SNR.snr_titular_derecho.snr_derecho	ili2db.ili.assocCardinalityMax	*
Submodelo_Insumos_SNR_V1_0.Datos_SNR.snr_titular_derecho.snr_derecho	ili2db.ili.assocKind	ASSOCIATE
LADM_COL_V3_0.LADM_Nucleo.COL_AgrupacionUnidadesEspaciales.Nombre	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.COL_AgrupacionUnidadesEspaciales.Nombre	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.COL_AgrupacionUnidadesEspaciales.Nombre	ili2db.dispName	Nombre
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Puntaje	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Puntaje	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Puntaje	ili2db.dispName	Puntaje
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Total_Banios	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Total_Banios	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Total_Banios	ili2db.dispName	Total de baños
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Vereda.Codigo_Sector	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Vereda.Codigo_Sector	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Vereda.Codigo_Sector	ili2db.dispName	Código del sector
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Propietario.Primer_Nombre	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Propietario.Primer_Nombre	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Propietario.Primer_Nombre	ili2db.dispName	Primer nombre
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_EstructuraMatriculaMatriz.Matricula_Inmobiliaria	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_EstructuraMatriculaMatriz.Matricula_Inmobiliaria	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_EstructuraMatriculaMatriz.Matricula_Inmobiliaria	ili2db.dispName	Matrícula inmobiliaria
LADM_COL_V3_0.LADM_Nucleo.col_masCcl.ue_mas	ili2db.ili.assocCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.col_masCcl.ue_mas	ili2db.ili.assocCardinalityMax	*
LADM_COL_V3_0.LADM_Nucleo.col_masCcl.ue_mas	ili2db.ili.assocKind	ASSOCIATE
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_FuenteDerecho.Ciudad_Emisora	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_FuenteDerecho.Ciudad_Emisora	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_FuenteDerecho.Ciudad_Emisora	ili2db.dispName	Ciudad emisora
LADM_COL_V3_0.LADM_Nucleo.col_ueUeGrupo.todo	ili2db.ili.assocCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.col_ueUeGrupo.todo	ili2db.ili.assocCardinalityMax	*
LADM_COL_V3_0.LADM_Nucleo.col_ueUeGrupo.todo	ili2db.ili.assocKind	ASSOCIATE
LADM_COL_V3_0.LADM_Nucleo.col_relacionFuenteUespacial.relacionrequeridaUe	ili2db.ili.assocCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.col_relacionFuenteUespacial.relacionrequeridaUe	ili2db.ili.assocCardinalityMax	*
LADM_COL_V3_0.LADM_Nucleo.col_relacionFuenteUespacial.relacionrequeridaUe	ili2db.ili.assocKind	ASSOCIATE
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Uso	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Uso	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Uso	ili2db.dispName	Uso
LADM_COL_V3_0.LADM_Nucleo.col_ueFuente.ue	ili2db.ili.assocCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.col_ueFuente.ue	ili2db.ili.assocCardinalityMax	*
LADM_COL_V3_0.LADM_Nucleo.col_ueFuente.ue	ili2db.ili.assocKind	ASSOCIATE
Submodelo_Insumos_SNR_V1_0.Datos_SNR.snr_derecho_fuente_derecho.snr_fuente_derecho	ili2db.ili.assocCardinalityMin	1
Submodelo_Insumos_SNR_V1_0.Datos_SNR.snr_derecho_fuente_derecho.snr_fuente_derecho	ili2db.ili.assocCardinalityMax	1
Submodelo_Insumos_SNR_V1_0.Datos_SNR.snr_derecho_fuente_derecho.snr_fuente_derecho	ili2db.ili.assocKind	ASSOCIATE
LADM_COL_V3_0.LADM_Nucleo.ExtInteresado.Ext_Direccion_ID	hidden	True
LADM_COL_V3_0.LADM_Nucleo.ExtInteresado.Ext_Direccion_ID	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.ExtInteresado.Ext_Direccion_ID	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.ExtInteresado.Ext_Direccion_ID	ili2db.dispName	Ext dirección id
LADM_COL_V3_0.LADM_Nucleo.ExtArchivo.Local_Id	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.ExtArchivo.Local_Id	ili2db.ili.attrCardinalityMin	1
LADM_COL_V3_0.LADM_Nucleo.ExtArchivo.Local_Id	ili2db.dispName	Local ID
LADM_COL_V3_0.LADM_Nucleo.COL_AreaValor.Datos_Proyeccion	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.COL_AreaValor.Datos_Proyeccion	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.COL_AreaValor.Datos_Proyeccion	ili2db.dispName	Datos de la proyección
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_DatosPHCondominio.Total_Unidades_Sotano	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_DatosPHCondominio.Total_Unidades_Sotano	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_DatosPHCondominio.Total_Unidades_Sotano	ili2db.dispName	Total de unidades de sótano
LADM_COL_V3_0.LADM_Nucleo.col_ueJerarquiaGrupo.agrupacion	ili2db.ili.assocCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.col_ueJerarquiaGrupo.agrupacion	ili2db.ili.assocCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.col_ueJerarquiaGrupo.agrupacion	ili2db.ili.assocKind	AGGREGATE
LADM_COL_V3_0.LADM_Nucleo.col_relacionFuente.fuente_administrativa	ili2db.ili.assocCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.col_relacionFuente.fuente_administrativa	ili2db.ili.assocCardinalityMax	*
LADM_COL_V3_0.LADM_Nucleo.col_relacionFuente.fuente_administrativa	ili2db.ili.assocKind	ASSOCIATE
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_Titular	ili2db.dispName	(SNR) Titular
Submodelo_Integracion_Insumos_V1_0.Datos_Integracion_Insumos.ini_predio_integracion_gc.ini_predio_insumos	ili2db.ili.assocCardinalityMin	0
Submodelo_Integracion_Insumos_V1_0.Datos_Integracion_Insumos.ini_predio_integracion_gc.ini_predio_insumos	ili2db.ili.assocCardinalityMax	*
Submodelo_Integracion_Insumos_V1_0.Datos_Integracion_Insumos.ini_predio_integracion_gc.ini_predio_insumos	ili2db.ili.assocKind	ASSOCIATE
LADM_COL_V3_0.LADM_Nucleo.COL_Fuente.Ext_Archivo_ID	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.COL_Fuente.Ext_Archivo_ID	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.COL_Fuente.Ext_Archivo_ID	ili2db.dispName	Ext archivo id
LADM_COL_V3_0.LADM_Nucleo.ExtDireccion	ili2db.dispName	Dirección
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Total_Habitaciones	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Total_Habitaciones	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Total_Habitaciones	ili2db.dispName	Total de habitaciones
LADM_COL_V3_0.LADM_Nucleo.COL_Punto.MetodoProduccion	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.COL_Punto.MetodoProduccion	ili2db.ili.attrCardinalityMin	1
LADM_COL_V3_0.LADM_Nucleo.COL_Punto.MetodoProduccion	ili2db.dispName	Método de producción
LADM_COL_V3_0.LADM_Nucleo.col_cclFuente.fuente_espacial	ili2db.ili.assocCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.col_cclFuente.fuente_espacial	ili2db.ili.assocCardinalityMax	*
LADM_COL_V3_0.LADM_Nucleo.col_cclFuente.fuente_espacial	ili2db.ili.assocKind	ASSOCIATE
LADM_COL_V3_0.LADM_Nucleo.col_masCl.ue_mas	ili2db.ili.assocCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.col_masCl.ue_mas	ili2db.ili.assocCardinalityMax	*
LADM_COL_V3_0.LADM_Nucleo.col_masCl.ue_mas	ili2db.ili.assocKind	ASSOCIATE
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_EstadoPredio.Entidad_Emisora_Alerta	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_EstadoPredio.Entidad_Emisora_Alerta	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_EstadoPredio.Entidad_Emisora_Alerta	ili2db.dispName	Entidad emisora de la alerta
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_FuenteCabidaLinderos	ili2db.dispName	(SNR) Fuente Cabida Linderos
Submodelo_Insumos_SNR_V1_0.Datos_SNR.snr_predio_registro_fuente_cabidalinderos.snr_predio_registro	ili2db.ili.assocCardinalityMin	0
Submodelo_Insumos_SNR_V1_0.Datos_SNR.snr_predio_registro_fuente_cabidalinderos.snr_predio_registro	ili2db.ili.assocCardinalityMax	*
Submodelo_Insumos_SNR_V1_0.Datos_SNR.snr_predio_registro_fuente_cabidalinderos.snr_predio_registro	ili2db.ili.assocKind	ASSOCIATE
LADM_COL_V3_0.LADM_Nucleo.ExtUnidadEdificacionFisica.Ext_Direccion_ID	hidden	True
LADM_COL_V3_0.LADM_Nucleo.ExtUnidadEdificacionFisica.Ext_Direccion_ID	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.ExtUnidadEdificacionFisica.Ext_Direccion_ID	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.ExtUnidadEdificacionFisica.Ext_Direccion_ID	ili2db.dispName	Ext dirección id
LADM_COL_V3_0.LADM_Nucleo.CC_MetodoOperacion.Dimensiones_Origen	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.CC_MetodoOperacion.Dimensiones_Origen	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.CC_MetodoOperacion.Dimensiones_Origen	ili2db.dispName	Dimensiones origen
LADM_COL_V3_0.LADM_Nucleo.col_puntoFuente.fuente_espacial	ili2db.ili.assocCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.col_puntoFuente.fuente_espacial	ili2db.ili.assocCardinalityMax	*
LADM_COL_V3_0.LADM_Nucleo.col_puntoFuente.fuente_espacial	ili2db.ili.assocKind	ASSOCIATE
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_EstadoPredio.Estado_Alerta	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_EstadoPredio.Estado_Alerta	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_EstadoPredio.Estado_Alerta	ili2db.dispName	Estado alerta
LADM_COL_V3_0.LADM_Nucleo.col_puntoReferencia.punto	ili2db.ili.assocCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.col_puntoReferencia.punto	ili2db.ili.assocCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.col_puntoReferencia.punto	ili2db.ili.assocKind	ASSOCIATE
LADM_COL_V3_0.LADM_Nucleo.ExtInteresado.Nombre	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.ExtInteresado.Nombre	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.ExtInteresado.Nombre	ili2db.dispName	Nombre
LADM_COL_V3_0.LADM_Nucleo.COL_UnidadEspacial.Volumen	ili2db.ili.attrCardinalityMax	*
LADM_COL_V3_0.LADM_Nucleo.COL_UnidadEspacial.Volumen	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.COL_UnidadEspacial.Volumen	ili2db.dispName	Volumen
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Vereda.Codigo_Anterior	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Vereda.Codigo_Anterior	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Vereda.Codigo_Anterior	ili2db.dispName	Código anterior
LADM_COL_V3_0.LADM_Nucleo.ExtInteresado.Firma	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.ExtInteresado.Firma	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.ExtInteresado.Firma	ili2db.dispName	Firma
LADM_COL_V3_0.LADM_Nucleo.col_baunitRrr.rrr	ili2db.ili.assocCardinalityMin	1
LADM_COL_V3_0.LADM_Nucleo.col_baunitRrr.rrr	ili2db.ili.assocCardinalityMax	*
LADM_COL_V3_0.LADM_Nucleo.col_baunitRrr.rrr	ili2db.ili.assocKind	ASSOCIATE
LADM_COL_V3_0.LADM_Nucleo.col_miembros.interesado	ili2db.ili.assocCardinalityMin	2
LADM_COL_V3_0.LADM_Nucleo.col_miembros.interesado	ili2db.ili.assocCardinalityMax	*
LADM_COL_V3_0.LADM_Nucleo.col_miembros.interesado	ili2db.ili.assocKind	ASSOCIATE
LADM_COL_V3_0.LADM_Nucleo.col_menosCcl.ccl_menos	ili2db.ili.assocCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.col_menosCcl.ccl_menos	ili2db.ili.assocCardinalityMax	*
LADM_COL_V3_0.LADM_Nucleo.col_menosCcl.ccl_menos	ili2db.ili.assocKind	ASSOCIATE
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_SectorUrbano.Codigo	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_SectorUrbano.Codigo	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_SectorUrbano.Codigo	ili2db.dispName	Código
LADM_COL_V3_0.LADM_Nucleo.COL_UnidadEspacial.Dimension	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.COL_UnidadEspacial.Dimension	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.COL_UnidadEspacial.Dimension	ili2db.dispName	Dimensión
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_EstadoPredio	ili2db.dispName	(GC) EstadoPredio
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_PredioCatastro.Fecha_Datos	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_PredioCatastro.Fecha_Datos	ili2db.ili.attrCardinalityMin	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_PredioCatastro.Fecha_Datos	ili2db.dispName	Fecha de los datos
LADM_COL_V3_0.LADM_Nucleo.col_cclFuente.ccl	ili2db.ili.assocCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.col_cclFuente.ccl	ili2db.ili.assocCardinalityMax	*
LADM_COL_V3_0.LADM_Nucleo.col_cclFuente.ccl	ili2db.ili.assocKind	ASSOCIATE
LADM_COL_V3_0.LADM_Nucleo.col_ueUeGrupo.parte	ili2db.ili.assocCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.col_ueUeGrupo.parte	ili2db.ili.assocCardinalityMax	*
LADM_COL_V3_0.LADM_Nucleo.col_ueUeGrupo.parte	ili2db.ili.assocKind	ASSOCIATE
LADM_COL_V3_0.LADM_Nucleo.COL_VolumenValor.Volumen_Medicion	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.COL_VolumenValor.Volumen_Medicion	ili2db.ili.attrCardinalityMin	1
LADM_COL_V3_0.LADM_Nucleo.COL_VolumenValor.Volumen_Medicion	ili2db.dispName	Volumen medición
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_SectorUrbano	ili2db.dispName	(GC) Sector Urbano
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_DatosPHCondominio.Total_Unidades_Privadas	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_DatosPHCondominio.Total_Unidades_Privadas	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_DatosPHCondominio.Total_Unidades_Privadas	ili2db.dispName	Total de unidades privadas
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Anio_Construccion	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Anio_Construccion	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Anio_Construccion	ili2db.dispName	Año de construcción
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_PredioCatastro.Estado_Predio	ili2db.ili.attrCardinalityMax	*
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_PredioCatastro.Estado_Predio	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_PredioCatastro.Estado_Predio	ili2db.dispName	Estado del predio
LADM_COL_V3_0.LADM_Nucleo.CC_MetodoOperacion.Ddimensiones_Objetivo	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.CC_MetodoOperacion.Ddimensiones_Objetivo	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.CC_MetodoOperacion.Ddimensiones_Objetivo	ili2db.dispName	Ddimensiones objetivo
LADM_COL_V3_0.LADM_Nucleo.ExtDireccion.Codigo_Postal	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.ExtDireccion.Codigo_Postal	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.ExtDireccion.Codigo_Postal	ili2db.dispName	Código postal
LADM_COL_V3_0.LADM_Nucleo.ExtArchivo.Fecha_Aceptacion	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.ExtArchivo.Fecha_Aceptacion	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.ExtArchivo.Fecha_Aceptacion	ili2db.dispName	Fecha de aceptación
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_SectorUrbano.Geometria	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_SectorUrbano.Geometria	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_SectorUrbano.Geometria	ili2db.dispName	Geometría
Submodelo_Insumos_SNR_V1_0.Datos_SNR.snr_derecho_predio.snr_predio_registro	ili2db.ili.assocCardinalityMin	1
Submodelo_Insumos_SNR_V1_0.Datos_SNR.snr_derecho_predio.snr_predio_registro	ili2db.ili.assocCardinalityMax	1
Submodelo_Insumos_SNR_V1_0.Datos_SNR.snr_derecho_predio.snr_predio_registro	ili2db.ili.assocKind	ASSOCIATE
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Construccion.Tipo_Dominio	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Construccion.Tipo_Dominio	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Construccion.Tipo_Dominio	ili2db.dispName	Tipo de dominio
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_EstructuraMatriculaMatriz	ili2db.dispName	(SNR) Estructura Matrícula Matriz
LADM_COL_V3_0.LADM_Nucleo.COL_Nivel.Registro_Tipo	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.COL_Nivel.Registro_Tipo	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.COL_Nivel.Registro_Tipo	ili2db.dispName	Tipo de registro
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_DatosPHCondominio.Area_Total_Construida_Privada	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_DatosPHCondominio.Area_Total_Construida_Privada	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_DatosPHCondominio.Area_Total_Construida_Privada	ili2db.dispName	Área total construida privada
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_CalificacionUnidadConstruccion.Elemento_Calificacion	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_CalificacionUnidadConstruccion.Elemento_Calificacion	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_CalificacionUnidadConstruccion.Elemento_Calificacion	ili2db.dispName	Elemento de calificación
LADM_COL_V3_0.LADM_Nucleo.COL_Fuente.Tipo_Principal	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.COL_Fuente.Tipo_Principal	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.COL_Fuente.Tipo_Principal	ili2db.dispName	Tipo principal
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Codigo_Terreno	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Codigo_Terreno	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Codigo_Terreno	ili2db.dispName	Código terreno
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_ComisionesUnidadConstruccion	ili2db.dispName	(GC) Comisiones Unidad Construcción
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_FuenteCabidaLinderos.Tipo_Documento	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_FuenteCabidaLinderos.Tipo_Documento	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_FuenteCabidaLinderos.Tipo_Documento	ili2db.dispName	Tipo de documento
LADM_COL_V3_0.LADM_Nucleo.ObjetoVersionado.Comienzo_Vida_Util_Version	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.ObjetoVersionado.Comienzo_Vida_Util_Version	ili2db.ili.attrCardinalityMin	1
LADM_COL_V3_0.LADM_Nucleo.ObjetoVersionado.Comienzo_Vida_Util_Version	ili2db.dispName	Versión de comienzo de vida útil
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Vereda	ili2db.dispName	(GC) Vereda
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_PredioRegistro.Cabida_Linderos	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_PredioRegistro.Cabida_Linderos	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_PredioRegistro.Cabida_Linderos	ili2db.dispName	Cabida y linderos
LADM_COL_V3_0.LADM_Nucleo.COL_CarasLindero.Localizacion_Textual	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.COL_CarasLindero.Localizacion_Textual	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.COL_CarasLindero.Localizacion_Textual	ili2db.dispName	Localización textual
LADM_COL_V3_0.LADM_Nucleo.COL_CadenaCarasLimite.Localizacion_Textual	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.COL_CadenaCarasLimite.Localizacion_Textual	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.COL_CadenaCarasLimite.Localizacion_Textual	ili2db.dispName	Localización textual
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_PredioCatastro.Circulo_Registral	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_PredioCatastro.Circulo_Registral	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_PredioCatastro.Circulo_Registral	ili2db.dispName	Círculo registral
LADM_COL_V3_0.LADM_Nucleo.col_relacionFuente.relacionrequeridaBaunit	ili2db.ili.assocCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.col_relacionFuente.relacionrequeridaBaunit	ili2db.ili.assocCardinalityMax	*
LADM_COL_V3_0.LADM_Nucleo.col_relacionFuente.relacionrequeridaBaunit	ili2db.ili.assocKind	ASSOCIATE
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_PredioCatastro.Sistema_Procedencia_Datos	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_PredioCatastro.Sistema_Procedencia_Datos	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_PredioCatastro.Sistema_Procedencia_Datos	ili2db.dispName	Sistema procedencia de los datos
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Manzana.Codigo_Anterior	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Manzana.Codigo_Anterior	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Manzana.Codigo_Anterior	ili2db.dispName	Código anterior
LADM_COL_V3_0.LADM_Nucleo.ExtArchivo.Fecha_Grabacion	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.ExtArchivo.Fecha_Grabacion	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.ExtArchivo.Fecha_Grabacion	ili2db.dispName	Fecha de grabación
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_DatosTorrePH	ili2db.dispName	(GC) Datos torre PH
LADM_COL_V3_0.LADM_Nucleo.Oid.Espacio_De_Nombres	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.Oid.Espacio_De_Nombres	ili2db.ili.attrCardinalityMin	1
LADM_COL_V3_0.LADM_Nucleo.Oid.Espacio_De_Nombres	ili2db.dispName	Espacio de nombres
LADM_COL_V3_0.LADM_Nucleo.COL_AgrupacionUnidadesEspaciales.Punto_Referencia	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.COL_AgrupacionUnidadesEspaciales.Punto_Referencia	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.COL_AgrupacionUnidadesEspaciales.Punto_Referencia	ili2db.dispName	Punto de referencia
LADM_COL_V3_0.LADM_Nucleo.col_rrrFuente.rrr	ili2db.ili.assocCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.col_rrrFuente.rrr	ili2db.ili.assocCardinalityMax	*
LADM_COL_V3_0.LADM_Nucleo.col_rrrFuente.rrr	ili2db.ili.assocKind	ASSOCIATE
LADM_COL_V3_0.LADM_Nucleo.ExtArchivo.Extraccion	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.ExtArchivo.Extraccion	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.ExtArchivo.Extraccion	ili2db.dispName	Extracción
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Propietario.Segundo_Apellido	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Propietario.Segundo_Apellido	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Propietario.Segundo_Apellido	ili2db.dispName	Segundo apellido
LADM_COL_V3_0.LADM_Nucleo.col_baunitComoInteresado.interesado	ili2db.ili.assocCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.col_baunitComoInteresado.interesado	ili2db.ili.assocCardinalityMax	*
LADM_COL_V3_0.LADM_Nucleo.col_baunitComoInteresado.interesado	ili2db.ili.assocKind	ASSOCIATE
LADM_COL_V3_0.LADM_Nucleo.COL_Transformacion.Localizacion_Transformada	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.COL_Transformacion.Localizacion_Transformada	ili2db.ili.attrCardinalityMin	1
LADM_COL_V3_0.LADM_Nucleo.COL_Transformacion.Localizacion_Transformada	ili2db.dispName	Localización transformada
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_terreno_predio.gc_terreno	ili2db.ili.assocCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_terreno_predio.gc_terreno	ili2db.ili.assocCardinalityMax	*
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_terreno_predio.gc_terreno	ili2db.ili.assocKind	ASSOCIATE
LADM_COL_V3_0.LADM_Nucleo.col_menosCcl.ue_menos	ili2db.ili.assocCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.col_menosCcl.ue_menos	ili2db.ili.assocCardinalityMax	*
LADM_COL_V3_0.LADM_Nucleo.col_menosCcl.ue_menos	ili2db.ili.assocKind	ASSOCIATE
LADM_COL_V3_0.LADM_Nucleo.col_menosCl.cl_menos	ili2db.ili.assocCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.col_menosCl.cl_menos	ili2db.ili.assocCardinalityMax	*
LADM_COL_V3_0.LADM_Nucleo.col_menosCl.cl_menos	ili2db.ili.assocKind	ASSOCIATE
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Perimetro.Codigo_Departamento	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Perimetro.Codigo_Departamento	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Perimetro.Codigo_Departamento	ili2db.dispName	Código del departamento
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_FuenteCabidaLinderos.Fecha_Documento	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_FuenteCabidaLinderos.Fecha_Documento	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_FuenteCabidaLinderos.Fecha_Documento	ili2db.dispName	Fecha de documento
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_FuenteCabidaLinderos.Numero_Documento	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_FuenteCabidaLinderos.Numero_Documento	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_FuenteCabidaLinderos.Numero_Documento	ili2db.dispName	Número de documento
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_FuenteCabidaLinderos.Archivo	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_FuenteCabidaLinderos.Archivo	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_FuenteCabidaLinderos.Archivo	ili2db.dispName	Archivo
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Construccion.Etiqueta	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Construccion.Etiqueta	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Construccion.Etiqueta	ili2db.dispName	Etiqueta
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Identificador	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Identificador	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Identificador	ili2db.dispName	Identificador
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Area_Privada	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Area_Privada	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Area_Privada	ili2db.dispName	Área privada
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Manzana	ili2db.dispName	(GC) Manzana
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_Titular.Numero_Documento	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_Titular.Numero_Documento	ili2db.ili.attrCardinalityMin	1
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_Titular.Numero_Documento	ili2db.dispName	Número de documento
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Propietario	ili2db.dispName	(GC) Propietario
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_SectorRural.Codigo	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_SectorRural.Codigo	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_SectorRural.Codigo	ili2db.dispName	Código
Submodelo_Integracion_Insumos_V1_0.Datos_Integracion_Insumos.INI_PredioInsumos.Tipo_Emparejamiento	ili2db.ili.attrCardinalityMax	1
Submodelo_Integracion_Insumos_V1_0.Datos_Integracion_Insumos.INI_PredioInsumos.Tipo_Emparejamiento	ili2db.ili.attrCardinalityMin	0
Submodelo_Integracion_Insumos_V1_0.Datos_Integracion_Insumos.INI_PredioInsumos.Tipo_Emparejamiento	ili2db.dispName	Tipo de emparejamiento
LADM_COL_V3_0.LADM_Nucleo.ExtDireccion.Tipo_Direccion	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.ExtDireccion.Tipo_Direccion	ili2db.ili.attrCardinalityMin	1
LADM_COL_V3_0.LADM_Nucleo.ExtDireccion.Tipo_Direccion	ili2db.dispName	Tipo de dirección
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_ComisionesConstruccion.Numero_Predial	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_ComisionesConstruccion.Numero_Predial	ili2db.ili.attrCardinalityMin	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_ComisionesConstruccion.Numero_Predial	ili2db.dispName	Número predial
LADM_COL_V3_0.LADM_Nucleo.col_baunitFuente.unidad	ili2db.ili.assocCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.col_baunitFuente.unidad	ili2db.ili.assocCardinalityMax	*
LADM_COL_V3_0.LADM_Nucleo.col_baunitFuente.unidad	ili2db.ili.assocKind	ASSOCIATE
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_Titular.Tipo_Documento	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_Titular.Tipo_Documento	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_Titular.Tipo_Documento	ili2db.dispName	Tipo de documento
Submodelo_Integracion_Insumos_V1_0.Datos_Integracion_Insumos.ini_predio_integracion_snr.ini_predio	ili2db.ili.assocCardinalityMin	0
Submodelo_Integracion_Insumos_V1_0.Datos_Integracion_Insumos.ini_predio_integracion_snr.ini_predio	ili2db.ili.assocCardinalityMax	*
Submodelo_Integracion_Insumos_V1_0.Datos_Integracion_Insumos.ini_predio_integracion_snr.ini_predio	ili2db.ili.assocKind	ASSOCIATE
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_datosphcondominio_datostorreph.gc_datosphcondominio	ili2db.ili.assocCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_datosphcondominio_datostorreph.gc_datosphcondominio	ili2db.ili.assocCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_datosphcondominio_datostorreph.gc_datosphcondominio	ili2db.ili.assocKind	ASSOCIATE
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Construccion.Codigo_Terreno	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Construccion.Codigo_Terreno	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Construccion.Codigo_Terreno	ili2db.dispName	Código de terreno
LADM_COL_V3_0.LADM_Nucleo.col_unidadFuente.fuente_administrativa	ili2db.ili.assocCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.col_unidadFuente.fuente_administrativa	ili2db.ili.assocCardinalityMax	*
LADM_COL_V3_0.LADM_Nucleo.col_unidadFuente.fuente_administrativa	ili2db.ili.assocKind	ASSOCIATE
LADM_COL_V3_0.LADM_Nucleo.col_puntoCcl.punto	ili2db.ili.assocCardinalityMin	2
LADM_COL_V3_0.LADM_Nucleo.col_puntoCcl.punto	ili2db.ili.assocCardinalityMax	*
LADM_COL_V3_0.LADM_Nucleo.col_puntoCcl.punto	ili2db.ili.assocKind	ASSOCIATE
LADM_COL_V3_0.LADM_Nucleo.col_menosCl.ue_menos	ili2db.ili.assocCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.col_menosCl.ue_menos	ili2db.ili.assocCardinalityMax	*
LADM_COL_V3_0.LADM_Nucleo.col_menosCl.ue_menos	ili2db.ili.assocKind	ASSOCIATE
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_ph_predio.gc_datos_ph	ili2db.ili.assocCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_ph_predio.gc_datos_ph	ili2db.ili.assocCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_ph_predio.gc_datos_ph	ili2db.ili.assocKind	ASSOCIATE
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Barrio	ili2db.dispName	(GC) Barrio
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_PredioCatastro.Destinacion_Economica	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.COL_UnidadAdministrativaBasica.Nombre	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_PredioCatastro.Destinacion_Economica	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_PredioCatastro.Destinacion_Economica	ili2db.dispName	Destinación económica
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Direccion.Valor	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Direccion.Valor	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Direccion.Valor	ili2db.dispName	Valor
LADM_COL_V3_0.LADM_Nucleo.COL_UnidadEspacial.Area	ili2db.ili.attrCardinalityMax	*
LADM_COL_V3_0.LADM_Nucleo.COL_UnidadEspacial.Area	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.COL_UnidadEspacial.Area	ili2db.dispName	Área
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Propietario.Numero_Documento	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Propietario.Numero_Documento	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Propietario.Numero_Documento	ili2db.dispName	Número de documento
LADM_COL_V3_0.LADM_Nucleo.COL_AgrupacionInteresados.Tipo	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.COL_AgrupacionInteresados.Tipo	ili2db.ili.attrCardinalityMin	1
LADM_COL_V3_0.LADM_Nucleo.COL_AgrupacionInteresados.Tipo	ili2db.dispName	Tipo
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_Titular.Primer_Apellido	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_Titular.Primer_Apellido	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_Titular.Primer_Apellido	ili2db.dispName	Primer apellido
LADM_COL_V3_0.LADM_Nucleo.col_masCcl.ccl_mas	ili2db.ili.assocCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.col_masCcl.ccl_mas	ili2db.ili.assocCardinalityMax	*
LADM_COL_V3_0.LADM_Nucleo.col_masCcl.ccl_mas	ili2db.ili.assocKind	ASSOCIATE
LADM_COL_V3_0.LADM_Nucleo.COL_FuenteEspacial.Tipo	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.COL_FuenteEspacial.Tipo	ili2db.ili.attrCardinalityMin	1
LADM_COL_V3_0.LADM_Nucleo.COL_FuenteEspacial.Tipo	ili2db.dispName	Tipo
LADM_COL_V3_0.LADM_Nucleo.col_baunitFuente.fuente_espacial	ili2db.ili.assocCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.col_baunitFuente.fuente_espacial	ili2db.ili.assocCardinalityMax	*
LADM_COL_V3_0.LADM_Nucleo.col_baunitFuente.fuente_espacial	ili2db.ili.assocKind	ASSOCIATE
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_ComisionesTerreno.Numero_Predial	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_ComisionesTerreno.Numero_Predial	ili2db.ili.attrCardinalityMin	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_ComisionesTerreno.Numero_Predial	ili2db.dispName	Número predial
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_DatosTorrePH.Torre	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_DatosTorrePH.Torre	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_DatosTorrePH.Torre	ili2db.dispName	Torre
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Terreno.Area_Terreno_Alfanumerica	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Terreno.Area_Terreno_Alfanumerica	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Terreno.Area_Terreno_Alfanumerica	ili2db.dispName	Área terreno alfanumérica
LADM_COL_V3_0.LADM_Nucleo.COL_UnidadEspacial.Relacion_Superficie	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.COL_UnidadEspacial.Relacion_Superficie	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.COL_UnidadEspacial.Relacion_Superficie	ili2db.dispName	Relación superficie
LADM_COL_V3_0.LADM_Nucleo.COL_Punto.Posicion_Interpolacion	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.COL_Punto.Posicion_Interpolacion	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.COL_Punto.Posicion_Interpolacion	ili2db.dispName	Posición interpolación
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_Derecho.Codigo_Naturaleza_Juridica	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_Derecho.Codigo_Naturaleza_Juridica	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_Derecho.Codigo_Naturaleza_Juridica	ili2db.dispName	Código naturaleza jurídica
LADM_COL_V3_0.LADM_Nucleo.col_puntoCl.cl	ili2db.ili.assocCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.col_puntoCl.cl	ili2db.ili.assocCardinalityMax	*
LADM_COL_V3_0.LADM_Nucleo.col_puntoCl.cl	ili2db.ili.assocKind	ASSOCIATE
Submodelo_Integracion_Insumos_V1_0.Datos_Integracion_Insumos.ini_predio_integracion_gc.gc_predio_catastro	ili2db.ili.assocCardinalityMin	0
Submodelo_Integracion_Insumos_V1_0.Datos_Integracion_Insumos.ini_predio_integracion_gc.gc_predio_catastro	ili2db.ili.assocCardinalityMax	1
Submodelo_Integracion_Insumos_V1_0.Datos_Integracion_Insumos.ini_predio_integracion_gc.gc_predio_catastro	ili2db.ili.assocKind	ASSOCIATE
LADM_COL_V3_0.LADM_Nucleo.ExtInteresado.Huella_Dactilar	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.ExtInteresado.Huella_Dactilar	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.ExtInteresado.Huella_Dactilar	ili2db.dispName	Huella dactilar
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Terreno	ili2db.dispName	(GC) Terreno
LADM_COL_V3_0.LADM_Nucleo.col_ueBaunit.ue	ili2db.ili.assocCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.col_ueBaunit.ue	ili2db.ili.assocCardinalityMax	*
LADM_COL_V3_0.LADM_Nucleo.col_ueBaunit.ue	ili2db.ili.assocKind	ASSOCIATE
LADM_COL_V3_0.LADM_Nucleo.COL_Interesado.Nombre	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.COL_Interesado.Nombre	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.COL_Interesado.Nombre	ili2db.dispName	Nombre
LADM_COL_V3_0.LADM_Nucleo.COL_UnidadAdministrativaBasica.Nombre	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.COL_UnidadAdministrativaBasica.Nombre	ili2db.dispName	Nombre
LADM_COL_V3_0.LADM_Nucleo.col_rrrInteresado.interesado	ili2db.ili.assocCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.col_rrrInteresado.interesado	ili2db.ili.assocCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.col_rrrInteresado.interesado	ili2db.ili.assocKind	ASSOCIATE
LADM_COL_V3_0.LADM_Nucleo.COL_FuenteAdministrativa.Numero_Fuente	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.COL_FuenteAdministrativa.Numero_Fuente	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.COL_FuenteAdministrativa.Numero_Fuente	ili2db.dispName	Número de fuente
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Barrio.Geometria	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Barrio.Geometria	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Barrio.Geometria	ili2db.dispName	Geometría
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_Titular.Razon_Social	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_Titular.Razon_Social	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_Titular.Razon_Social	ili2db.dispName	Razón social
LADM_COL_V3_0.LADM_Nucleo.ObjetoVersionado.Fin_Vida_Util_Version	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.ObjetoVersionado.Fin_Vida_Util_Version	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.ObjetoVersionado.Fin_Vida_Util_Version	ili2db.dispName	Versión de fin de vida útil
LADM_COL_V3_0.LADM_Nucleo.ExtInteresado.Documento_Escaneado	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.ExtInteresado.Documento_Escaneado	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.ExtInteresado.Documento_Escaneado	ili2db.dispName	Documento escaneado
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Terreno.Geometria	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Terreno.Geometria	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Terreno.Geometria	ili2db.dispName	Geometría
Submodelo_Insumos_SNR_V1_0.Datos_SNR.snr_derecho_predio.snr_derecho	ili2db.ili.assocCardinalityMin	1
Submodelo_Insumos_SNR_V1_0.Datos_SNR.snr_derecho_predio.snr_derecho	ili2db.ili.assocCardinalityMax	*
Submodelo_Insumos_SNR_V1_0.Datos_SNR.snr_derecho_predio.snr_derecho	ili2db.ili.assocKind	ASSOCIATE
LADM_COL_V3_0.LADM_Nucleo.COL_UnidadEspacial.Geometria	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.COL_UnidadEspacial.Geometria	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.COL_UnidadEspacial.Geometria	ili2db.dispName	Geometría
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Manzana.Geometria	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Manzana.Geometria	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Manzana.Geometria	ili2db.dispName	Geometría
LADM_COL_V3_0.LADM_Nucleo.CC_MetodoOperacion.Formula	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.CC_MetodoOperacion.Formula	ili2db.ili.attrCardinalityMin	1
LADM_COL_V3_0.LADM_Nucleo.CC_MetodoOperacion.Formula	ili2db.dispName	Fórmula
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_Titular.Nombres	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_Titular.Nombres	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_Titular.Nombres	ili2db.dispName	Nombres
LADM_COL_V3_0.LADM_Nucleo.COL_UnidadEspacial.Ext_Direccion_ID	hidden	True
LADM_COL_V3_0.LADM_Nucleo.COL_UnidadEspacial.Ext_Direccion_ID	ili2db.ili.attrCardinalityMax	*
LADM_COL_V3_0.LADM_Nucleo.COL_UnidadEspacial.Ext_Direccion_ID	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.COL_UnidadEspacial.Ext_Direccion_ID	ili2db.dispName	Ext dirección id
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_construccion_predio.gc_construccion	ili2db.ili.assocCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_construccion_predio.gc_construccion	ili2db.ili.assocCardinalityMax	*
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_construccion_predio.gc_construccion	ili2db.ili.assocKind	ASSOCIATE
LADM_COL_V3_0.LADM_Nucleo.Imagen.uri	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.Imagen.uri	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.Imagen.uri	ili2db.dispName	uri
LADM_COL_V3_0.LADM_Nucleo.COL_FuenteEspacial.Metadato	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.COL_FuenteEspacial.Metadato	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.COL_FuenteEspacial.Metadato	ili2db.dispName	Metadato
LADM_COL_V3_0.LADM_Nucleo.ExtDireccion.Clase_Via_Principal	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.ExtDireccion.Clase_Via_Principal	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.ExtDireccion.Clase_Via_Principal	ili2db.dispName	Clase de vía principal
LADM_COL_V3_0.LADM_Nucleo.col_ueJerarquiaGrupo.elemento	ili2db.ili.assocCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.col_ueJerarquiaGrupo.elemento	ili2db.ili.assocCardinalityMax	*
LADM_COL_V3_0.LADM_Nucleo.col_ueJerarquiaGrupo.elemento	ili2db.ili.assocKind	ASSOCIATE
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_ph_predio.gc_predio	ili2db.ili.assocCardinalityMin	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_ph_predio.gc_predio	ili2db.ili.assocCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_ph_predio.gc_predio	ili2db.ili.assocKind	ASSOCIATE
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Vereda.Codigo	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Vereda.Codigo	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Vereda.Codigo	ili2db.dispName	Código
LADM_COL_V3_0.LADM_Nucleo.COL_AreaValor.Tipo	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.COL_AreaValor.Tipo	ili2db.ili.attrCardinalityMin	1
LADM_COL_V3_0.LADM_Nucleo.COL_AreaValor.Tipo	ili2db.dispName	Tipo
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_ComisionesConstruccion	ili2db.dispName	(GC) Comisiones Construcción
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Perimetro.Nombre_Geografico	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Perimetro.Nombre_Geografico	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Perimetro.Nombre_Geografico	ili2db.dispName	Nombre geográfico
LADM_COL_V3_0.LADM_Nucleo.COL_Nivel.Nombre	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.COL_Nivel.Nombre	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.COL_Nivel.Nombre	ili2db.dispName	Nombre
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_CalificacionUnidadConstruccion.Detalle_Calificacion	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_CalificacionUnidadConstruccion.Detalle_Calificacion	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_CalificacionUnidadConstruccion.Detalle_Calificacion	ili2db.dispName	Detalle de calificación
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_PredioCatastro.Numero_Predial	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_PredioCatastro.Numero_Predial	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_PredioCatastro.Numero_Predial	ili2db.dispName	Número predial
LADM_COL_V3_0.LADM_Nucleo.COL_CadenaCarasLimite.Geometria	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.COL_CadenaCarasLimite.Geometria	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.COL_CadenaCarasLimite.Geometria	ili2db.dispName	Geometría
LADM_COL_V3_0.LADM_Nucleo.COL_EspacioJuridicoUnidadEdificacion.Ext_Unidad_Edificacion_Fisica_ID	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.COL_EspacioJuridicoUnidadEdificacion.Ext_Unidad_Edificacion_Fisica_ID	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.COL_EspacioJuridicoUnidadEdificacion.Ext_Unidad_Edificacion_Fisica_ID	ili2db.dispName	Ext unidad edificación física id
LADM_COL_V3_0.LADM_Nucleo.COL_EspacioJuridicoRedServicios.Tipo	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.COL_EspacioJuridicoRedServicios.Tipo	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.COL_EspacioJuridicoRedServicios.Tipo	ili2db.dispName	Tipo
LADM_COL_V3_0.LADM_Nucleo.col_puntoFuente.punto	ili2db.ili.assocCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.col_puntoFuente.punto	ili2db.ili.assocCardinalityMax	*
LADM_COL_V3_0.LADM_Nucleo.col_puntoFuente.punto	ili2db.ili.assocKind	ASSOCIATE
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_PredioCatastro.NUPRE	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_PredioCatastro.NUPRE	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_PredioCatastro.NUPRE	ili2db.dispName	Número único predial
LADM_COL_V3_0.LADM_Nucleo.col_miembros.agrupacion	ili2db.ili.assocCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.col_miembros.agrupacion	ili2db.ili.assocCardinalityMax	*
LADM_COL_V3_0.LADM_Nucleo.col_miembros.agrupacion	ili2db.ili.assocKind	AGGREGATE
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_PredioRegistro	ili2db.dispName	(SNR) Predio Registro
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_ComisionesConstruccion.Geometria	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_ComisionesConstruccion.Geometria	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_ComisionesConstruccion.Geometria	ili2db.dispName	Geometría
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Vereda.Nombre	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Vereda.Nombre	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Vereda.Nombre	ili2db.dispName	Nombre
LADM_COL_V3_0.LADM_Nucleo.COL_AgrupacionUnidadesEspaciales.Nivel_Jerarquico	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.COL_AgrupacionUnidadesEspaciales.Nivel_Jerarquico	ili2db.ili.attrCardinalityMin	1
LADM_COL_V3_0.LADM_Nucleo.COL_AgrupacionUnidadesEspaciales.Nivel_Jerarquico	ili2db.dispName	Nivel jerárquico
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Perimetro.Codigo_Municipio	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Perimetro.Codigo_Municipio	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Perimetro.Codigo_Municipio	ili2db.dispName	Código del municipio
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Geometria	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Geometria	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Geometria	ili2db.dispName	Geometría
LADM_COL_V3_0.LADM_Nucleo.COL_DRR.Descripcion	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.COL_DRR.Descripcion	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.COL_DRR.Descripcion	ili2db.dispName	Descripción
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Perimetro.Tipo_Avaluo	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Perimetro.Tipo_Avaluo	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Perimetro.Tipo_Avaluo	ili2db.dispName	Tipo de avalúo
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_FuenteDerecho.Numero_Documento	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_FuenteDerecho.Numero_Documento	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_FuenteDerecho.Numero_Documento	ili2db.dispName	Número de documento
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_CalificacionUnidadConstruccion.Componente	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_CalificacionUnidadConstruccion.Componente	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_CalificacionUnidadConstruccion.Componente	ili2db.dispName	Componente
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_FuenteDerecho	ili2db.dispName	(SNR) Fuente Derecho
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_SectorRural.Geometria	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_SectorRural.Geometria	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_SectorRural.Geometria	ili2db.dispName	Geometría
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_Titular.Tipo_Persona	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_Titular.Tipo_Persona	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_Titular.Tipo_Persona	ili2db.dispName	Tipo de persona
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_PredioCatastro.Matricula_Inmobiliaria_Catastro	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_PredioCatastro.Matricula_Inmobiliaria_Catastro	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_PredioCatastro.Matricula_Inmobiliaria_Catastro	ili2db.dispName	Matrícula inmobiliaria catastro
LADM_COL_V3_0.LADM_Nucleo.col_miembros.participacion	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.col_miembros.participacion	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.col_baunitComoInteresado.unidad	ili2db.ili.assocCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.col_baunitComoInteresado.unidad	ili2db.ili.assocCardinalityMax	*
LADM_COL_V3_0.LADM_Nucleo.col_baunitComoInteresado.unidad	ili2db.ili.assocKind	ASSOCIATE
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Propietario.Segundo_Nombre	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Propietario.Segundo_Nombre	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Propietario.Segundo_Nombre	ili2db.dispName	Segundo nombre
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Propietario.Tipo_Documento	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Propietario.Tipo_Documento	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Propietario.Tipo_Documento	ili2db.dispName	Tipo de documento
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Propietario.Razon_Social	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Propietario.Razon_Social	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Propietario.Razon_Social	ili2db.dispName	Razón social
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_FuenteDerecho.Ente_Emisor	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_FuenteDerecho.Ente_Emisor	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_FuenteDerecho.Ente_Emisor	ili2db.dispName	Ente emisor
LADM_COL_V3_0.LADM_Nucleo.COL_FuenteAdministrativa.Observacion	ili2db.ili.attrCardinalityMax	1
LADM_COL_V3_0.LADM_Nucleo.COL_FuenteAdministrativa.Observacion	ili2db.ili.attrCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.COL_FuenteAdministrativa.Observacion	ili2db.dispName	Observación
LADM_COL_V3_0.LADM_Nucleo.col_masCl.cl_mas	ili2db.ili.assocCardinalityMin	0
LADM_COL_V3_0.LADM_Nucleo.col_masCl.cl_mas	ili2db.ili.assocCardinalityMax	*
LADM_COL_V3_0.LADM_Nucleo.col_masCl.cl_mas	ili2db.ili.assocKind	ASSOCIATE
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_DatosPHCondominio.Valor_Total_Avaluo_Catastral	ili2db.ili.attrCardinalityMax	1
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_DatosPHCondominio.Valor_Total_Avaluo_Catastral	ili2db.ili.attrCardinalityMin	0
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_DatosPHCondominio.Valor_Total_Avaluo_Catastral	ili2db.dispName	Valor total avaúo catastral
\.


--
-- TOC entry 6544 (class 0 OID 376268)
-- Dependencies: 834
-- Data for Name: t_ili2db_model; Type: TABLE DATA; Schema: test_ladm_integration; Owner: postgres
--

COPY test_ladm_integration.t_ili2db_model (filename, iliversion, modelname, content, importdate) FROM stdin;
LADM_COL_V3_0.ili	2.3	LADM_COL_V3_0{ ISO19107_PLANAS_V3_0}	INTERLIS 2.3;\n\n/** ISO 19152 LADM country profile COL Core Model.\n * \n * -----------------------------------------------------------\n * \n * LADM es un modelo conceptual de la realidad que concreta una ontología y establece una semántica para la administración del territorio.\n * \n * -----------------------------------------------------------\n *  revision history\n * -----------------------------------------------------------\n * \n *  30.01.2018/fm : Cambio del tipo de dato del atributo Ext_Direccion de la clase Unidad Espacial a ExtDireccion; atributo ext_PID de la calse LA_Interesado cambia de OID a ExtInteresado; Cambio de cardinalidad en relacion miembros entre LA_Interesado y LA_Agrupacion_Interesados de 0..1 a 0..*\n *  07.02.2018/fm-gc: Ajuste al tipo de dato de la unidad Peso, pasa a tener precision 1 para evitar ser tratado cmo atributo entero y aumentar su tamaño\n *  19.02.2018/fm-gc: ampliación del dominio al tipo de dato Peso\n *  26.02.2018/fm-lj: cambio del nombre del dominio ISO19125_Type a ISO19125_Tipo\n *  19.04.2018/vb fm: Ajuste al constraint Fraccion, denominador mayor a 0\n *  19.04.2018/vb fm: Cambio en la cardinalidad del atributo u_Local_Id de la clase LA_BAUnit de 0..1 a 1\n * 17.07.2018/fm : se incluye escritura en dominio COL_FuenteAdministrativaTipo\n * 10.08.2018/fm : Se eliminan los atributos ai_local_id y ai_espacio_de_nombres de la clase LA_Agrupacion_Interesados\n * 27.08.2018/fm : Ajuste a la cardinalidad de asociacion puntoFuente de 1..* a 0..*\n * 25.09.2018/at: Se ajusta la longitud del atributo Codigo_Registral_Transaccion en la clase COL_FuenteAdministrativa a 5 caracteres de acuerdo a la Resolución 3973 de 2018\n * -----------------------------------------------------------\n * \n *  (c) IGAC y SNR con apoyo de la Cooperacion Suiza\n * \n * -----------------------------------------------------------\n */\nMODEL LADM_COL_V3_0 (es)\nAT "http://www.proadmintierra.info/"\nVERSION "V1.2.0"  // 2019-08-13 // =\n  IMPORTS ISO19107_PLANAS_V3_0;\n\n  UNIT\n\n    PesoColombiano [COP] EXTENDS INTERLIS.MONEY;\n\n    Area (ABSTRACT) = (INTERLIS.LENGTH * INTERLIS.LENGTH);\n\n    MetroCuadrado [m2] EXTENDS Area = (INTERLIS.m * INTERLIS.m);\n\n    Centrimetro [cm] = 1 / 100 [INTERLIS.m];\n\n  TOPIC LADM_Nucleo(ABSTRACT) =\n\n    DOMAIN\n\n      CharacterString = TEXT*255;\n\n      /** Traducción del dominio CI_PresentationFormCode de la norma ISO 19115:2003. Indica el modo en el que se representan los datos.\n       */\n      CI_Forma_Presentacion_Codigo = (\n        /** Definición en la ISO 19115:2003.\n         */\n        !!@ ili2db.dispName = "Imagen"\n        Imagen,\n        !!@ ili2db.dispName = "Documento"\n        Documento,\n        /** Definición en la ISO 19115:2003.\n         */\n        !!@ ili2db.dispName = "Mapa"\n        Mapa,\n        /** Definición en la ISO 19115:2003.\n         */\n        !!@ ili2db.dispName = "Video"\n        Video,\n        /** Definición en la ISO 19115:2003.\n         */\n        !!@ ili2db.dispName = "Otro"\n        Otro\n      );\n\n      COL_AreaTipo = (\n        /** Corresponde al área gráfica inscrita en la base de datos catastral sobre un predio antes de efectuar la transformación al nuevo sistema de proyección para catastro.\n         */\n        !!@ ili2db.dispName = "Area catastral gráfica del predio"\n        Area_Catastral_Grafica,\n        /** Corresponde al área alfanumérica inscrita en la base de datos catastral sobre un predio antes de efectuar la transformación al nuevo sistema de proyección para catastro. En la mayoría de los casos el área alfanumérica corresponde al valor de área inscrita en los datos de Registro.\n         */\n        !!@ ili2db.dispName = "Area catastral alfanumérica"\n        Area_Catastral_Alfanumerica\n      );\n\n      COL_ContenidoNivelTipo = (\n        !!@ ili2db.dispName = "Construcción convencional"\n        Construccion_Convencional,\n        !!@ ili2db.dispName = "Construcción no convencional"\n        Construccion_No_Convencional,\n        !!@ ili2db.dispName = "Consuetudinario"\n        Consuetudinario,\n        !!@ ili2db.dispName = "Formal"\n        Formal,\n        !!@ ili2db.dispName = "Informal"\n        Informal,\n        !!@ ili2db.dispName = "Responsabilidad"\n        Responsabilidad,\n        !!@ ili2db.dispName = "Restricción derecho público"\n        Restriccion_Derecho_Publico,\n        !!@ ili2db.dispName = "Restricción derecho privado"\n        Restriccion_Derecho_Privado\n      );\n\n      COL_DimensionTipo = (\n        !!@ ili2db.dispName = "Dimensión 2D"\n        Dim2D,\n        !!@ ili2db.dispName = "Dimensión 3D"\n        Dim3D,\n        !!@ ili2db.dispName = "Otro"\n        Otro\n      );\n\n      COL_EstadoRedServiciosTipo = (\n        !!@ ili2db.dispName = "Planeado"\n        Planeado,\n        !!@ ili2db.dispName = "En uso"\n        En_Uso,\n        !!@ ili2db.dispName = "Fuera de servicio"\n        Fuera_De_Servicio,\n        !!@ ili2db.dispName = "Otro"\n        Otro\n      );\n\n      COL_EstructuraTipo = (\n        !!@ ili2db.dispName = "Croquis"\n        Croquis,\n        !!@ ili2db.dispName = "Línea no estructurada"\n        Linea_no_Estructurada,\n        !!@ ili2db.dispName = "Texto"\n        Texto,\n        !!@ ili2db.dispName = "Topológico"\n        Topologico\n      );\n\n      COL_FuenteEspacialTipo = (\n        /** Ilustración análoga del levantamiento catastral de un predio.\n         */\n        !!@ ili2db.dispName = "Croquis de campo"\n        Croquis_Campo,\n        /** Datos tomados por un equipo GNSS sin ningún tipo de postprocesamiento.\n         */\n        !!@ ili2db.dispName = "Datos crudos (GPS, Estación total, LiDAR, etc.)"\n        Datos_Crudos,\n        /** Imagen producto de la toma de fotografías aéreas o satélites, en la cual han sido corregidos los desplazamientos causados por la inclinación de la cámara o sensor y la curvatura de la superficie del terreno. Está referida a un sistema de proyección cartográfica, por lo que posee las características geométricas de un mapa con el factor adicional de que los objetos se encuentran representados de forma real en la imagen de la fotográfica.\n         */\n        !!@ ili2db.dispName = "Ortofoto"\n        Ortofoto,\n        /** Informe técnico de levantamiento catastral de un predio.\n         */\n        !!@ ili2db.dispName = "Informe técnico"\n        Informe_Tecnico,\n        /** Registro fotográfico del levantamiento catastral de un predio.\n         */\n        !!@ ili2db.dispName = "Registro fotográfico"\n        Registro_Fotografico\n      );\n\n      COL_GrupoInteresadoTipo = (\n        /** Agrupación de personas naturales.\n         */\n        !!@ ili2db.dispName = "Grupo civil"\n        Grupo_Civil,\n        /** Agrupación de personas jurídicas.\n         */\n        !!@ ili2db.dispName = "Grupo empresarial"\n        Grupo_Empresarial,\n        /** Agrupación de personas pertenecientes a un grupo étnico.\n         */\n        !!@ ili2db.dispName = "Grupo étnico"\n        Grupo_Etnico,\n        /** Agrupación de personas naturales y jurídicas.\n         */\n        !!@ ili2db.dispName = "Grupo mixto"\n        Grupo_Mixto\n      );\n\n      /** Si ha sido situado por interpolación, de qué manera se ha hecho.\n       */\n      COL_InterpolacionTipo = (\n        !!@ ili2db.dispName = "Aislado"\n        Aislado,\n        !!@ ili2db.dispName = "Intermedio arco"\n        Intermedio_Arco,\n        !!@ ili2db.dispName = "Intermedio línea"\n        Intermedio_Linea\n      );\n\n      COL_MetodoProduccionTipo = (\n        /** Aquellos que requieren una visita campo con el fin de\n         * recolectar la realidad de los bienes inmuebles.\n         */\n        !!@ ili2db.dispName = "Método directo"\n        Metodo_Directo,\n        /** aquellos métodos identificación física, jurídica y\n         * económica de los inmuebles a través del uso de de sensores\n         * remotos, integración registros administrativos, modelos ísticos y\n         * econométricos, análisis de Big Data y fuentes secundarias como\n         * observatorios inmobiliarios, su posterior incorporación en la base catastral.\n         */\n        !!@ ili2db.dispName = "Método indirecto"\n        Metodo_Indirecto,\n        /** Son los derivados participación de la comunidad en el suministro de información que sirva como insumo para el desarrollo de los procesos catastrales. Los gestores catastrales propenderán por la adopción nuevas tecnologías y procesos comunitarios que faciliten la participación los ciudadanos.\n         */\n        !!@ ili2db.dispName = "Metodo declarativo y colaborativo"\n        Metodo_Declarativo_y_Colaborativo\n      );\n\n      COL_PuntoTipo = (\n        !!@ ili2db.dispName = "Control"\n        Control,\n        !!@ ili2db.dispName = "Catastro"\n        Catastro,\n        !!@ ili2db.dispName = "Otro"\n        Otro\n      );\n\n      COL_RegistroTipo = (\n        !!@ ili2db.dispName = "Rural"\n        Rural,\n        !!@ ili2db.dispName = "Urbano"\n        Urbano,\n        !!@ ili2db.dispName = "Otro"\n        Otro\n      );\n\n      COL_UnidadAdministrativaBasicaTipo = (\n        /** Unidad administrativa básica de la temática predial.\n         */\n        !!@ ili2db.dispName = "Predio"\n        Predio,\n        /** Unidad administrativa básica de la temática de ordenamiento territorial.\n         */\n        !!@ ili2db.dispName = "Ordenamiento territorial"\n        Ordenamiento_Territorial,\n        /** Unidad administrativa básica de la temática de servicios públicos.\n         */\n        !!@ ili2db.dispName = "Servicios públicos"\n        Servicios_Publicos,\n        /** Unidad administrativa básica de la temática de reservas naturales.\n         */\n        !!@ ili2db.dispName = "Reservas naturales"\n        Reservas_Naturales,\n        /** Unidad administrativa básica de la temática de parques naturales.\n         */\n        !!@ ili2db.dispName = "Parques naturales"\n        Parques_Naturales,\n        /** Unidad administrativa básica de la temática de amenazas de riesgo.\n         */\n        !!@ ili2db.dispName = "Amenazas de riesgos"\n        Amenazas_Riesgos,\n        /** Unidad administrativa básica de la temática de servidumbres.\n         */\n        !!@ ili2db.dispName = "Servidumbre"\n        Servidumbre,\n        /** Unidad administrativa básica de la temática de superficies de agua.\n         */\n        !!@ ili2db.dispName = "Superficies de agua"\n        Superficies_Agua,\n        /** Unidad administrativa básica de la temática de transporte.\n         */\n        !!@ ili2db.dispName = "Transporte"\n        Transporte\n      );\n\n      COL_VolumenTipo = (\n        !!@ ili2db.dispName = "Oficial"\n        Oficial,\n        !!@ ili2db.dispName = "Calculado"\n        Calculado,\n        !!@ ili2db.dispName = "Otro"\n        Otro\n      );\n\n      Integer = 0 .. 999999999;\n\n      COL_EstadoDisponibilidadTipo = (\n        /** La fuente fue convertida o recibió algún tratamiento.\n         */\n        !!@ ili2db.dispName = "Convertido"\n        Convertido,\n        /** Se desconoce la disponibilidad de la fuente.\n         */\n        !!@ ili2db.dispName = "Desconocido"\n        Desconocido,\n        /** La fuente está disponible.\n         */\n        !!@ ili2db.dispName = "Disponible"\n        Disponible\n      );\n\n      COL_ISO19125_Tipo = (\n        !!@ ili2db.dispName = "Disjunto"\n        Disjunto,\n        !!@ ili2db.dispName = "Toca"\n        Toca,\n        !!@ ili2db.dispName = "Superpone"\n        Superpone,\n        !!@ ili2db.dispName = "Desconocido"\n        Desconocido\n      );\n\n      COL_RelacionSuperficieTipo = (\n        !!@ ili2db.dispName = "En rasante"\n        En_Rasante,\n        !!@ ili2db.dispName = "En vuelo"\n        En_Vuelo,\n        !!@ ili2db.dispName = "En subsuelo"\n        En_Subsuelo,\n        !!@ ili2db.dispName = "Otro"\n        Otro\n      );\n\n      COL_UnidadEdificacionTipo = (\n        !!@ ili2db.dispName = "Compartido"\n        Compartido,\n        !!@ ili2db.dispName = "Individual"\n        Individual\n      );\n\n      Currency = -2000000000.00 .. 2000000000.00;\n\n      Real = 0.000 .. 999999999.999;\n\n    /** Estructura que proviene de la traducción de la clase CC_OperationMethod de la ISO 19111. Indica el método utilizado, mediante un algoritmo o un procedimiento, para realizar operaciones con coordenadas.\n     */\n    STRUCTURE CC_MetodoOperacion =\n      /** Fórmulas o procedimientos utilizadoa por este método de operación de coordenadas. Esto puede ser una referencia a una publicación. Tenga en cuenta que el método de operación puede no ser analítico, en cuyo caso este atributo hace referencia o contiene el procedimiento, no una fórmula analítica.\n       */\n      !!@ ili2db.dispName = "Fórmula"\n      Formula : MANDATORY CharacterString;\n      /** Número de dimensiones en la fuente CRS de este método de operación de coordenadas.\n       */\n      !!@ ili2db.dispName = "Dimensiones origen"\n      Dimensiones_Origen : Integer;\n      /** Número de dimensiones en el CRS de destino de este método de operación de coordenadas.\n       */\n      !!@ ili2db.dispName = "Ddimensiones objetivo"\n      Ddimensiones_Objetivo : Integer;\n    END CC_MetodoOperacion;\n\n    !!@ ili2db.dispName = "Valores de área"\n    STRUCTURE COL_AreaValor =\n      /** Indica si el valor a registrar corresponde al área gráfica o alfanumérica de la base de datos catastral.\n       */\n      !!@ ili2db.dispName = "Tipo"\n      Tipo : MANDATORY COL_AreaTipo;\n      /** Corresponde al valor del área registrada en la base de datos catastral.\n       */\n      !!@ ili2db.dispName = "Área"\n      Area : MANDATORY 0.0 .. 99999999999999.9 [LADM_COL_V3_0.m2];\n      /** Parametros de la proyección utilizada para el cálculo del área de la forma proj, ejemplo: 'EPSG:3116', '+proj=tmerc +lat_0=4.59620041666667 +lon_0=-74.0775079166667 +k=1 +x_0=1000000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs'\n       */\n      !!@ ili2db.dispName = "Datos de la proyección"\n      Datos_Proyeccion : TEXT;\n    END COL_AreaValor;\n\n    /** Referencia a una clase externa para gestionar direcciones.\n     */\n    !!@ ili2db.dispName = "Dirección"\n    STRUCTURE ExtDireccion =\n      !!@ ili2db.dispName = "Tipo de dirección"\n      Tipo_Direccion : MANDATORY (\n        !!@ ili2db.dispName = "Estructurada"\n        Estructurada,\n        !!@ ili2db.dispName = "No estructurada"\n        No_Estructurada\n      );\n      !!@ ili2db.dispName = "Es dirección principal"\n      Es_Direccion_Principal : BOOLEAN;\n      /** Par de valores georreferenciados (x,y) en la que se encuentra la dirección.\n       */\n      !!@ ili2db.dispName = "Localización"\n      Localizacion : ISO19107_PLANAS_V3_0.GM_Point3D;\n      !!@ ili2db.dispName = "Código postal"\n      Codigo_Postal : CharacterString;\n      !!@ ili2db.dispName = "Clase de vía principal"\n      Clase_Via_Principal : (\n        !!@ ili2db.dispName = "Avenida calle"\n        Avenida_Calle,\n        !!@ ili2db.dispName = "Avenida carrera"\n        Avenida_Carrera,\n        !!@ ili2db.dispName = "Avenida"\n        Avenida,\n        !!@ ili2db.dispName = "Autopista"\n        Autopista,\n        !!@ ili2db.dispName = "Circunvalar"\n        Circunvalar,\n        !!@ ili2db.dispName = "Calle"\n        Calle,\n        !!@ ili2db.dispName = "Carrera"\n        Carrera,\n        !!@ ili2db.dispName = "Diagonal"\n        Diagonal,\n        !!@ ili2db.dispName = "Transversal"\n        Transversal,\n        !!@ ili2db.dispName = "Circular"\n        Circular\n      );\n      !!@ ili2db.dispName = "Valor vía principal"\n      Valor_Via_Principal : TEXT*100;\n      !!@ ili2db.dispName = "Letra vía principal"\n      Letra_Via_Principal : TEXT*20;\n      !!@ ili2db.dispName = "Sector de la ciudad"\n      Sector_Ciudad : (\n        Norte,\n        Sur,\n        Este,\n        Oeste\n      );\n      !!@ ili2db.dispName = "Valor de vía generadora"\n      Valor_Via_Generadora : TEXT*100;\n      !!@ ili2db.dispName = "Letra de vía generadora"\n      Letra_Via_Generadora : TEXT*20;\n      !!@ ili2db.dispName = "Número del predio"\n      Numero_Predio : TEXT*20;\n      !!@ ili2db.dispName = "Sector del predio"\n      Sector_Predio : (\n        Norte,\n        Sur,\n        Este,\n        Oeste\n      );\n      !!@ ili2db.dispName = "Complemento"\n      Complemento : TEXT*255;\n      !!@ ili2db.dispName = "Nombre del predio"\n      Nombre_Predio : TEXT*255;\n    END ExtDireccion;\n\n    /** Estructura para la definición de un tipo de dato personalizado que permite indicar una fracción o quebrado cona serie específica de condiciones.\n     */\n    STRUCTURE Fraccion =\n      /** Parte inferior de la fracción. Debe ser mayor que 0. Debe ser mayor que el numerador.\n       */\n      !!@ ili2db.dispName = "Denominador"\n      Denominador : MANDATORY Integer;\n      /** Parte superior de la fracción. Debe ser mayor que 0. Debe sder menor que el denominador.\n       */\n      !!@ ili2db.dispName = "Numerador"\n      Numerador : MANDATORY Integer;\n      MANDATORY CONSTRAINT\n        Denominador > 0;\n      MANDATORY CONSTRAINT\n        Numerador > 0;\n      MANDATORY CONSTRAINT\n        Denominador >= Numerador;\n    END Fraccion;\n\n    CLASS Oid (ABSTRACT) =\n      /** Identificador único global. Corresponde al atributo de la clase en LADM.\n       */\n      !!@ ili2db.dispName = "Espacio de nombres"\n      Espacio_De_Nombres : MANDATORY CharacterString;\n      /** Identificador único local.\n       */\n      !!@ ili2db.dispName = "Local ID"\n      Local_Id : MANDATORY CharacterString;\n    END Oid;\n\n    DOMAIN\n\n      COL_FuenteAdministrativaTipo = (\n        /** Documento público es el otorgado por el funcionario público en ejercicio de sus funciones o con su intervención. Así mismo, es público el documento otorgado por un particular en ejercicio de funciones públicas o con su intervención. Cuando consiste en un escrito autorizado o suscrito por el respectivo funcionario, es instrumento público; cuando es autorizado por un notario o quien haga sus veces y ha sido incorporado en el respectivo protocolo, se denomina escritura pública.\n         */\n        !!@ ili2db.dispName = "Documento público"\n        Documento_Publico,\n        /** El documento privado es aquel documento que no cumple los requisitos del documento público, es decir, es un documento que no ha sido elaborado por un funcionario público, ni ha habido intervención de éste para su elaboración.\n         */\n        !!@ ili2db.dispName = "Documento privado"\n        Documento_Privado\n      );\n\n      COL_RedServiciosTipo = (\n        !!@ ili2db.dispName = "Petróleo"\n        Petroleo,\n        !!@ ili2db.dispName = "Químicos"\n        Quimicos,\n        !!@ ili2db.dispName = "Red térmica"\n        Red_Termica,\n        !!@ ili2db.dispName = "Telecomunicación"\n        Telecomunicacion\n      );\n\n      Peso = 0.0 .. 999999999999999.0 [LADM_COL_V3_0.COP];\n\n    /** Registro de la fórmula o procedimiento utilizado en la transformación y de su resultado.\n     */\n    STRUCTURE COL_Transformacion =\n      /** Fórmula o procedimiento utilizado en la transformación.\n       */\n      !!@ ili2db.dispName = "Transformación"\n      Transformacion : MANDATORY LADM_COL_V3_0.LADM_Nucleo.CC_MetodoOperacion;\n      /** Geometría una vez realizado el proceso de transformación.\n       */\n      !!@ ili2db.dispName = "Localización transformada"\n      Localizacion_Transformada : MANDATORY ISO19107_PLANAS_V3_0.GM_Point3D;\n    END COL_Transformacion;\n\n    /** Control externo de la unidad de edificación física.\n     */\n    STRUCTURE ExtUnidadEdificacionFisica =\n      !!@ ili2db.dispName = "Ext dirección id"\n      Ext_Direccion_ID : LADM_COL_V3_0.LADM_Nucleo.ExtDireccion;\n    END ExtUnidadEdificacionFisica;\n\n    /** Referencia a una imagen mediante su url.\n     */\n    STRUCTURE Imagen =\n      /** url de la imagen.\n       */\n      !!@ ili2db.dispName = "uri"\n      uri : CharacterString;\n    END Imagen;\n\n    /** Clase abstracta que permite gestionar el histórico del conjunto de clases, las cuales heredan de esta, excepto las fuentes.\n     */\n    CLASS ObjetoVersionado (ABSTRACT)\n    EXTENDS Oid =\n      /** Comienzo de la validez actual de la instancia de un objeto.\n       */\n      !!@ ili2db.dispName = "Versión de comienzo de vida útil"\n      Comienzo_Vida_Util_Version : MANDATORY INTERLIS.XMLDateTime;\n      /** Finalización de la validez actual de la instancia de un objeto.\n       */\n      !!@ ili2db.dispName = "Versión de fin de vida útil"\n      Fin_Vida_Util_Version : INTERLIS.XMLDateTime;\n      MANDATORY CONSTRAINT\n        Fin_Vida_Util_Version >= Comienzo_Vida_Util_Version;\n    END ObjetoVersionado;\n\n    /** Referencia a una clase externa para gestionar direcciones.\n     */\n    STRUCTURE ExtInteresado =\n      /** Identificador externo del interesado.\n       */\n      !!@ ili2db.dispName = "Ext dirección id"\n      Ext_Direccion_ID : LADM_COL_V3_0.LADM_Nucleo.ExtDireccion;\n      /** Imagen de la huella dactilar del interesado.\n       */\n      !!@ ili2db.dispName = "Huella dactilar"\n      Huella_Dactilar : LADM_COL_V3_0.LADM_Nucleo.Imagen;\n      /** Campo de nombre del interesado.\n       */\n      !!@ ili2db.dispName = "Nombre"\n      Nombre : CharacterString;\n      /** Fotografía del interesado.\n       */\n      !!@ ili2db.dispName = "Fotografía"\n      Fotografia : LADM_COL_V3_0.LADM_Nucleo.Imagen;\n      /** Firma del interesado.\n       */\n      !!@ ili2db.dispName = "Firma"\n      Firma : LADM_COL_V3_0.LADM_Nucleo.Imagen;\n      /** Ruta de almacenamiento del documento escaneado del interesado.\n       */\n      !!@ ili2db.dispName = "Documento escaneado"\n      Documento_Escaneado : CharacterString;\n    END ExtInteresado;\n\n    /** Referencia a una clase externa para gestionar las redes físicas de servicios.\n     */\n    STRUCTURE ExtRedServiciosFisica =\n      /** Indica si la red de servicios tiene un gradiente o no.\n       */\n      !!@ ili2db.dispName = "Orientada"\n      Orientada : BOOLEAN;\n      /** Identificador de referencia a un interesado externo que es el administrador.\n       */\n      !!@ ili2db.dispName = "Ext interesado administrador id"\n      Ext_Interesado_Administrador_ID : LADM_COL_V3_0.LADM_Nucleo.ExtInteresado;\n    END ExtRedServiciosFisica;\n\n    /** Referencia a clase externa desde donde se gestiona el repositorio de archivos.\n     */\n    !!@ ili2db.dispName = "Archivo fuente"\n    STRUCTURE ExtArchivo =\n      /** Fecha en la que ha sido aceptado el documento.\n       */\n      !!@ ili2db.dispName = "Fecha de aceptación"\n      Fecha_Aceptacion : INTERLIS.XMLDate;\n      /** Datos que contiene el documento.\n       */\n      !!@ ili2db.dispName = "Datos"\n      Datos : CharacterString;\n      /** Última fecha de extracción del documento.\n       */\n      !!@ ili2db.dispName = "Extracción"\n      Extraccion : INTERLIS.XMLDate;\n      /** Fecha en la que el documento es aceptado en el sistema.\n       */\n      !!@ ili2db.dispName = "Fecha de grabación"\n      Fecha_Grabacion : INTERLIS.XMLDate;\n      /** Fecha en la que fue entregado el documento.\n       */\n      !!@ ili2db.dispName = "Fecha de entrega"\n      Fecha_Entrega : INTERLIS.XMLDate;\n      !!@ ili2db.dispName = "Espacio de nombres"\n      Espacio_De_Nombres : MANDATORY CharacterString;\n      !!@ ili2db.dispName = "Local ID"\n      Local_Id : MANDATORY CharacterString;\n    END ExtArchivo;\n\n    /** Clase abstracta. Esta clase es la personalización en el modelo del perfil colombiano de la clase de LADM LA_Source.\n     */\n    CLASS COL_Fuente (ABSTRACT)\n    EXTENDS Oid =\n      /** Indica si la fuente está o no disponible y en qué condiciones. También puede indicar porqué ha dejado de estar disponible, si ha ocurrido.\n       */\n      !!@ ili2db.dispName = "Estado de disponibilidad"\n      Estado_Disponibilidad : MANDATORY COL_EstadoDisponibilidadTipo;\n      /** Identificador del archivo fuente controlado por una clase externa.\n       */\n      !!@ ili2db.dispName = "Ext archivo id"\n      Ext_Archivo_ID : LADM_COL_V3_0.LADM_Nucleo.ExtArchivo;\n      /** Tipo de formato en el que es presentada la fuente, de acuerdo con el registro de metadatos.\n       */\n      !!@ ili2db.dispName = "Tipo principal"\n      Tipo_Principal : CI_Forma_Presentacion_Codigo;\n      /** Fecha de expedición del documento de la fuente.\n       */\n      !!@ ili2db.dispName = "Fecha de documento fuente"\n      Fecha_Documento_Fuente : INTERLIS.XMLDate;\n    END COL_Fuente;\n\n    /** Estructura para la definición de un tipo de dato personalizado que permite indicar la medición de un volumen y la naturaleza de este.\n     */\n    STRUCTURE COL_VolumenValor =\n      /** Medición del volumen en m3.\n       */\n      !!@ ili2db.dispName = "Volumen medición"\n      Volumen_Medicion : MANDATORY 0.0 .. 99999999999999.9 [INTERLIS.m];\n      /** Indicación de si el volumen es calculado, si figura como oficial o si se da otra circunstancia.\n       */\n      !!@ ili2db.dispName = "Tipo"\n      Tipo : MANDATORY COL_VolumenTipo;\n    END COL_VolumenValor;\n\n    /** Especialización de la clase COL_Fuente para almacenar aquellas fuentes constituidas por documentos (documento hipotecario, documentos notariales, documentos históricos, etc.) que documentan la relación entre instancias de interesados y de predios.\n     */\n    CLASS COL_FuenteAdministrativa (ABSTRACT)\n    EXTENDS COL_Fuente =\n      /** Observaciones o descripción del documento de la fuente administrativa.\n       */\n      !!@ ili2db.dispName = "Observación"\n      Observacion : CharacterString;\n      /** Tipo de documento de fuente administrativa.\n       */\n      !!@ ili2db.dispName = "Tipo"\n      Tipo : MANDATORY COL_FuenteAdministrativaTipo;\n      /** Identificador del documento, ejemplo: número de la resolución, número de la escritura pública o número de radicado de una sentencia.\n       */\n      !!@ ili2db.dispName = "Número de fuente"\n      Numero_Fuente : TEXT*150;\n    END COL_FuenteAdministrativa;\n\n    /** Representación gráfica del terreno, construcción, unidad de construcción y/o servidumbre de paso.\n     */\n    CLASS COL_UnidadEspacial (ABSTRACT)\n    EXTENDS ObjetoVersionado =\n      /** Registros del área en diferentes sistemas.\n       */\n      !!@ ili2db.dispName = "Área"\n      Area : LIST {0..*} OF LADM_COL_V3_0.LADM_Nucleo.COL_AreaValor;\n      /** Dimensión del objeto.\n       */\n      !!@ ili2db.dispName = "Dimensión"\n      Dimension : COL_DimensionTipo;\n      /** Corresponde al atributo extAddressID de la clase en LADM.\n       */\n      !!@ ili2db.dispName = "Ext dirección id"\n      Ext_Direccion_ID : LIST {0..*} OF LADM_COL_V3_0.LADM_Nucleo.ExtDireccion;\n      /** Corresponde al atributo label de la clase en LADM.\n       */\n      !!@ ili2db.dispName = "Etiqueta"\n      Etiqueta : CharacterString;\n      /** Corresponde al atributo surfaceRelation de la clase en LADM.\n       */\n      !!@ ili2db.dispName = "Relación superficie"\n      Relacion_Superficie : COL_RelacionSuperficieTipo;\n      /** Corresponde al atributo volume de la clase en LADM.\n       */\n      !!@ ili2db.dispName = "Volumen"\n      Volumen : LIST {0..*} OF LADM_COL_V3_0.LADM_Nucleo.COL_VolumenValor;\n      /** Materializacion del metodo createArea(). Almacena de forma permanente la geometría de tipo poligonal.\n       */\n      !!@ ili2db.dispName = "Geometría"\n      Geometria : ISO19107_PLANAS_V3_0.GM_MultiSurface3D;\n    END COL_UnidadEspacial;\n\n    /** Agrupa unidades espaciales, es decir, representaciones geográficas de las unidades administrativas básicas (clase LA_BAUnit) para representar otras unidades espaciales que se forman en base a estas, como puede ser el caso de los polígonos catastrales.\n     */\n    CLASS COL_AgrupacionUnidadesEspaciales (ABSTRACT)\n    EXTENDS ObjetoVersionado =\n      /** Nivel jerárquico de la agrupación, dentro del anidamiento de diferentes agrupaciones.\n       */\n      !!@ ili2db.dispName = "Nivel jerárquico"\n      Nivel_Jerarquico : MANDATORY Integer;\n      /** Definición de la agrupación.\n       */\n      !!@ ili2db.dispName = "Etiqueta"\n      Etiqueta : CharacterString;\n      /** Nombre que recibe la agrupación.\n       */\n      !!@ ili2db.dispName = "Nombre"\n      Nombre : CharacterString;\n      /** Punto de referencia de toda la agrupación, a modo de centro de masas.\n       */\n      !!@ ili2db.dispName = "Punto de referencia"\n      Punto_Referencia : ISO19107_PLANAS_V3_0.GM_Point3D;\n    END COL_AgrupacionUnidadesEspaciales;\n\n    /** Traducción al español de la clase LA_LegalSpaceBuildingUnit. Sus intancias son las unidades de edificación\n     */\n    CLASS COL_EspacioJuridicoUnidadEdificacion (ABSTRACT)\n    EXTENDS COL_UnidadEspacial =\n      /** Identificador de la unidad de edificación.\n       */\n      !!@ ili2db.dispName = "Ext unidad edificación física id"\n      Ext_Unidad_Edificacion_Fisica_ID : LADM_COL_V3_0.LADM_Nucleo.ExtUnidadEdificacionFisica;\n      /** Tipo de unidad de edificación de la que se trata.\n       */\n      !!@ ili2db.dispName = "Tipo"\n      Tipo : COL_UnidadEdificacionTipo;\n    END COL_EspacioJuridicoUnidadEdificacion;\n\n    ASSOCIATION col_ueJerarquiaGrupo =\n      agrupacion -<> {0..1} COL_AgrupacionUnidadesEspaciales;\n      elemento -- {0..*} COL_AgrupacionUnidadesEspaciales;\n    END col_ueJerarquiaGrupo;\n\n    /** Traducción al español de la clase LA_LegalSpaceUtilityNetwork. Representa un tipo de unidad espacial (LA_UNidadEspacial) cuyas instancias son las redes de servicios.\n     */\n    CLASS COL_EspacioJuridicoRedServicios (ABSTRACT)\n    EXTENDS COL_UnidadEspacial =\n      /** Identificador de la red física hacia una referencia externa.\n       */\n      !!@ ili2db.dispName = "Ext id red física"\n      ext_ID_Red_Fisica : LADM_COL_V3_0.LADM_Nucleo.ExtRedServiciosFisica;\n      /** Estado de operatividad de la red.\n       */\n      !!@ ili2db.dispName = "Estado"\n      Estado : COL_EstadoRedServiciosTipo;\n      /** Tipo de servicio que presta.\n       */\n      !!@ ili2db.dispName = "Tipo"\n      Tipo : COL_RedServiciosTipo;\n    END COL_EspacioJuridicoRedServicios;\n\n    ASSOCIATION col_ueUeGrupo =\n      parte -- {0..*} COL_UnidadEspacial;\n      todo -- {0..*} COL_AgrupacionUnidadesEspaciales;\n    END col_ueUeGrupo;\n\n    /** Traducción de la clase LA_Level de LADM.\n     */\n    CLASS COL_Nivel (ABSTRACT)\n    EXTENDS ObjetoVersionado =\n      !!@ ili2db.dispName = "Nombre"\n      Nombre : CharacterString;\n      !!@ ili2db.dispName = "Tipo de registro"\n      Registro_Tipo : COL_RegistroTipo;\n      !!@ ili2db.dispName = "Estructura"\n      Estructura : COL_EstructuraTipo;\n      !!@ ili2db.dispName = "Tipo"\n      Tipo : COL_ContenidoNivelTipo;\n    END COL_Nivel;\n\n    /** Traducción al español de la clase LA_RequiredRelationshipSpatialUnit de LADM.\n     */\n    CLASS COL_RelacionNecesariaUnidadesEspaciales (ABSTRACT)\n    EXTENDS ObjetoVersionado =\n      !!@ ili2db.dispName = "Relación"\n      Relacion : MANDATORY COL_ISO19125_Tipo;\n    END COL_RelacionNecesariaUnidadesEspaciales;\n\n    ASSOCIATION col_ueNivel =\n      ue -- {0..*} COL_UnidadEspacial;\n      nivel -- {0..1} COL_Nivel;\n    END col_ueNivel;\n\n    /** Clase abstracta que agrupa los atributos comunes de las clases para los derechos (rights), las responsabilidades (responsabilities) y las restricciones (restrictions).\n     */\n    CLASS COL_DRR (ABSTRACT)\n    EXTENDS ObjetoVersionado =\n      /** Descripción asociada al derecho, la responsabilidad o la restricción.\n       */\n      !!@ ili2db.dispName = "Descripción"\n      Descripcion : CharacterString;\n    END COL_DRR;\n\n    /** De forma genérica, representa el objeto territorial legal (Catastro 2014) que se gestiona en el modelo, en este caso, la parcela catastral o predio. Es independiente del conocimiento de su realidad espacial y se centra en su existencia conocida y reconocida.\n     */\n    CLASS COL_UnidadAdministrativaBasica (ABSTRACT)\n    EXTENDS ObjetoVersionado =\n      /** Nombre que recibe la unidad administrativa básica, en muchos casos toponímico, especialmente en terrenos rústicos.\n       */\n      !!@ ili2db.dispName = "Nombre"\n      Nombre : CharacterString;\n      /** Tipo de derecho que la reconoce.\n       */\n      !!@ ili2db.dispName = "Tipo"\n      Tipo : MANDATORY COL_UnidadAdministrativaBasicaTipo;\n    END COL_UnidadAdministrativaBasica;\n\n    ASSOCIATION col_rrrFuente =\n      fuente_administrativa -- {1..*} COL_FuenteAdministrativa;\n      rrr -- {0..*} COL_DRR;\n    END col_rrrFuente;\n\n    /** Traducción de la clase LA_RequiredRelationshipBAUnit de LADM.\n     */\n    CLASS COL_RelacionNecesariaBAUnits (ABSTRACT)\n    EXTENDS ObjetoVersionado =\n      !!@ ili2db.dispName = "Relación"\n      Relacion : MANDATORY CharacterString;\n    END COL_RelacionNecesariaBAUnits;\n\n    ASSOCIATION col_baunitRrr =\n      unidad -- {1} COL_UnidadAdministrativaBasica;\n      rrr -- {1..*} COL_DRR;\n    END col_baunitRrr;\n\n    ASSOCIATION col_ueBaunit =\n      ue (EXTERNAL) -- {0..*} COL_UnidadEspacial;\n      baunit -- {0..*} COL_UnidadAdministrativaBasica;\n    END col_ueBaunit;\n\n    ASSOCIATION col_relacionFuente =\n      fuente_administrativa -- {0..*} COL_FuenteAdministrativa;\n      relacionrequeridaBaunit -- {0..*} COL_RelacionNecesariaBAUnits;\n    END col_relacionFuente;\n\n    ASSOCIATION col_unidadFuente =\n      fuente_administrativa -- {0..*} COL_FuenteAdministrativa;\n      unidad -- {0..*} COL_UnidadAdministrativaBasica;\n    END col_unidadFuente;\n\n    /** Clase especializada para la administración de los tipos de puntos.\n     */\n    CLASS COL_Punto (ABSTRACT)\n    EXTENDS ObjetoVersionado =\n      /** Posición de interpolación.\n       */\n      !!@ ili2db.dispName = "Posición interpolación"\n      Posicion_Interpolacion : COL_InterpolacionTipo;\n      /** Clasificación del tipo de punto identificado en el levantamiento catastral.\n       */\n      !!@ ili2db.dispName = "Tipo de punto"\n      PuntoTipo : MANDATORY COL_PuntoTipo;\n      /** Indica si el método de levantamiento catastral: método directo o indirecto.\n       */\n      !!@ ili2db.dispName = "Método de producción"\n      MetodoProduccion : MANDATORY COL_MetodoProduccionTipo;\n      /** Transformación y Resultado.\n       */\n      !!@ ili2db.dispName = "Transformación y resultado"\n      Transformacion_Y_Resultado : LIST {0..*} OF LADM_COL_V3_0.LADM_Nucleo.COL_Transformacion;\n      /** Geometria punto para administración de los objetos: punto de lindero, punto levantamiento y punto de control.\n       */\n      !!@ ili2db.dispName = "Geometría"\n      Geometria : MANDATORY ISO19107_PLANAS_V3_0.GM_Point3D;\n    END COL_Punto;\n\n    /** Especialización de la clase COL_Fuente para almacenar las fuentes constituidas por datos espaciales (entidades geográficas, imágenes de satélite, vuelos fotogramétricos, listados de coordenadas, mapas, planos antiguos o modernos, descripción de localizaciones, etc.) que documentan técnicamente la relación entre instancias de interesados y de predios\n     */\n    CLASS COL_FuenteEspacial (ABSTRACT)\n    EXTENDS COL_Fuente =\n      /** Nombre de la fuente espacial del levantamiento catastral de un predio.\n       */\n      !!@ ili2db.dispName = "Nombre"\n      Nombre : MANDATORY TEXT*255;\n      /** Tipo de fuente espacial.\n       */\n      !!@ ili2db.dispName = "Tipo"\n      Tipo : MANDATORY COL_FuenteEspacialTipo;\n      /** Descripción de la fuente espacial.\n       */\n      !!@ ili2db.dispName = "Descripción"\n      Descripcion : MANDATORY MTEXT;\n      /** Metadato de la fuente espacial.\n       */\n      !!@ ili2db.dispName = "Metadato"\n      Metadato : MTEXT;\n    END COL_FuenteEspacial;\n\n    /** Traducción al español de la clase LA_BoundaryFaceString de LADM. Define los linderos y a su vez puede estar definida por una descrición textual o por dos o más puntos. Puede estar asociada a una fuente espacial o más.\n     */\n    CLASS COL_CadenaCarasLimite (ABSTRACT)\n    EXTENDS ObjetoVersionado =\n      /** Geometría lineal que define el lindero. Puede estar asociada a geometrías de tipo punto que definen sus vértices o ser una entidad lineal independiente.\n       */\n      !!@ ili2db.dispName = "Geometría"\n      Geometria : ISO19107_PLANAS_V3_0.GM_Curve3D;\n      /** Descripción de la localización, cuando esta se basa en texto.\n       */\n      !!@ ili2db.dispName = "Localización textual"\n      Localizacion_Textual : CharacterString;\n    END COL_CadenaCarasLimite;\n\n    /** Traducción de la clase LA_BoundaryFace de LADM. De forma similar a LA_CadenaCarasLindero, representa los límites, pero en este caso permite representación 3D.\n     */\n    CLASS COL_CarasLindero (ABSTRACT)\n    EXTENDS ObjetoVersionado =\n      /** Geometría en 3D del límite o lindero, asociada a putos o a descripciones textuales.\n       */\n      !!@ ili2db.dispName = "Geometría"\n      Geometria : ISO19107_PLANAS_V3_0.GM_MultiSurface3D;\n      /** Cuando la localización del límte está dada por una descripción textual, aquí se recoge esta.\n       */\n      !!@ ili2db.dispName = "Localización textual"\n      Localizacion_Textual : CharacterString;\n    END COL_CarasLindero;\n\n    ASSOCIATION col_puntoReferencia =\n      ue (EXTERNAL) -- {0..1} COL_UnidadEspacial;\n      punto -- {0..1} COL_Punto;\n    END col_puntoReferencia;\n\n    ASSOCIATION col_puntoFuente =\n      fuente_espacial -- {0..*} COL_FuenteEspacial;\n      punto -- {0..*} COL_Punto;\n    END col_puntoFuente;\n\n    ASSOCIATION col_ueFuente =\n      ue (EXTERNAL) -- {0..*} COL_UnidadEspacial;\n      fuente_espacial -- {0..*} COL_FuenteEspacial;\n    END col_ueFuente;\n\n    ASSOCIATION col_baunitFuente =\n      fuente_espacial -- {0..*} COL_FuenteEspacial;\n      unidad (EXTERNAL) -- {0..*} COL_UnidadAdministrativaBasica;\n    END col_baunitFuente;\n\n    ASSOCIATION col_relacionFuenteUespacial =\n      fuente_espacial -- {0..*} COL_FuenteEspacial;\n      relacionrequeridaUe (EXTERNAL) -- {0..*} COL_RelacionNecesariaUnidadesEspaciales;\n    END col_relacionFuenteUespacial;\n\n    ASSOCIATION col_cclFuente =\n      ccl -- {0..*} COL_CadenaCarasLimite;\n      fuente_espacial -- {0..*} COL_FuenteEspacial;\n    END col_cclFuente;\n\n    ASSOCIATION col_menosCcl =\n      ccl_menos -- {0..*} COL_CadenaCarasLimite;\n      ue_menos (EXTERNAL) -- {0..*} COL_UnidadEspacial;\n    END col_menosCcl;\n\n    ASSOCIATION col_masCcl =\n      ccl_mas -- {0..*} COL_CadenaCarasLimite;\n      ue_mas (EXTERNAL) -- {0..*} COL_UnidadEspacial;\n    END col_masCcl;\n\n    ASSOCIATION col_puntoCcl =\n      punto -- {2..*} COL_Punto;\n      ccl -- {0..*} COL_CadenaCarasLimite;\n    END col_puntoCcl;\n\n    ASSOCIATION col_clFuente =\n      cl -- {0..*} COL_CarasLindero;\n      fuente_espacial -- {0..*} COL_FuenteEspacial;\n    END col_clFuente;\n\n    ASSOCIATION col_menosCl =\n      cl_menos -- {0..*} COL_CarasLindero;\n      ue_menos (EXTERNAL) -- {0..*} COL_UnidadEspacial;\n    END col_menosCl;\n\n    ASSOCIATION col_masCl =\n      cl_mas -- {0..*} COL_CarasLindero;\n      ue_mas (EXTERNAL) -- {0..*} COL_UnidadEspacial;\n    END col_masCl;\n\n    ASSOCIATION col_puntoCl =\n      punto -- {3..*} COL_Punto;\n      cl -- {0..*} COL_CarasLindero;\n    END col_puntoCl;\n\n    /** Traducción de la clase LA_Party de LADM. Representa a las personas que ejercen derechos y responsabilidades  o sufren restricciones respecto a una BAUnit.\n     */\n    CLASS COL_Interesado (ABSTRACT)\n    EXTENDS ObjetoVersionado =\n      /** Identificador del interesado.\n       */\n      !!@ ili2db.dispName = "Ext PID"\n      ext_PID : LADM_COL_V3_0.LADM_Nucleo.ExtInteresado;\n      /** Nombre del interesado.\n       */\n      !!@ ili2db.dispName = "Nombre"\n      Nombre : CharacterString;\n    END COL_Interesado;\n\n    /** Relaciona los interesados que ostentan la propiedad, posesión u ocupación de un predio. Se registra el grupo en si e independientemete las personas por separado.\n     */\n    CLASS COL_AgrupacionInteresados (ABSTRACT)\n    EXTENDS COL_Interesado =\n      /** Indica el tipo de agrupación del que se trata.\n       */\n      !!@ ili2db.dispName = "Tipo"\n      Tipo : MANDATORY COL_GrupoInteresadoTipo;\n    END COL_AgrupacionInteresados;\n\n    ASSOCIATION col_baunitComoInteresado =\n      interesado -- {0..*} COL_Interesado;\n      unidad (EXTERNAL) -- {0..*} COL_UnidadAdministrativaBasica;\n    END col_baunitComoInteresado;\n\n    ASSOCIATION col_responsableFuente =\n      fuente_administrativa (EXTERNAL) -- {0..*} COL_FuenteAdministrativa;\n      interesado -- {0..*} COL_Interesado;\n    END col_responsableFuente;\n\n    ASSOCIATION col_rrrInteresado =\n      rrr (EXTERNAL) -- {0..*} COL_DRR;\n      interesado -- {0..1} COL_Interesado;\n    END col_rrrInteresado;\n\n    ASSOCIATION col_topografoFuente =\n      fuente_espacial (EXTERNAL) -- {0..*} COL_FuenteEspacial;\n      topografo -- {0..*} COL_Interesado;\n    END col_topografoFuente;\n\n    ASSOCIATION col_miembros =\n      interesado -- {2..*} COL_Interesado;\n      agrupacion -<> {0..*} COL_AgrupacionInteresados;\n      participacion : LADM_COL_V3_0.LADM_Nucleo.Fraccion;\n    END col_miembros;\n\n  END LADM_Nucleo;\n\nEND LADM_COL_V3_0.\n	2020-07-22 11:12:04.283
ISO19107_PLANAS_V3_0.ili	2.3	ISO19107_PLANAS_V3_0	INTERLIS 2.3;\r\n\r\nTYPE MODEL ISO19107_PLANAS_V3_0 (es)\r\nAT "http://www.swisslm.ch/models"\r\nVERSION "2016-03-07"  =\r\n\r\n  DOMAIN\r\n\r\n    GM_Point2D = COORD 3980000.000 .. 5700000.000 [INTERLIS.m], 1080000.000 .. 3100000.000 [INTERLIS.m] ,ROTATION 2 -> 1;\r\n\r\n    GM_Curve2D = POLYLINE WITH (ARCS,STRAIGHTS) VERTEX GM_Point2D WITHOUT OVERLAPS>0.001;\r\n\r\n    GM_Surface2D = SURFACE WITH (ARCS,STRAIGHTS) VERTEX GM_Point2D WITHOUT OVERLAPS>0.001;\r\n\r\n    GM_Point3D = COORD 3980000.000 .. 5700000.000 [INTERLIS.m], 1080000.000 .. 3100000.000 [INTERLIS.m], -5000.000 .. 6000.000 [INTERLIS.m] ,ROTATION 2 -> 1;\r\n\r\n    GM_Curve3D = POLYLINE WITH (ARCS,STRAIGHTS) VERTEX GM_Point3D WITHOUT OVERLAPS>0.001;\r\n\r\n    GM_Surface3D = SURFACE WITH (ARCS,STRAIGHTS) VERTEX GM_Point3D WITHOUT OVERLAPS>0.001;\r\n\r\n  STRUCTURE GM_Geometry2DListValue =\r\n  END GM_Geometry2DListValue;\r\n\r\n  STRUCTURE GM_Curve2DListValue =\r\n    value : MANDATORY GM_Curve2D;\r\n  END GM_Curve2DListValue;\r\n\r\n  STRUCTURE GM_Surface2DListValue =\r\n    value : MANDATORY GM_Surface2D;\r\n  END GM_Surface2DListValue;\r\n\r\n  !!@ ili2db.mapping = "MultiLine"\r\nSTRUCTURE GM_MultiCurve2D =\r\n    geometry : LIST {1..*} OF ISO19107_PLANAS_V3_0.GM_Curve2DListValue;\r\n  END GM_MultiCurve2D;\r\n\r\n  !!@ ili2db.mapping = "MultiSurface"\r\nSTRUCTURE GM_MultiSurface2D =\r\n    geometry : LIST {1..*} OF ISO19107_PLANAS_V3_0.GM_Surface2DListValue;\r\n  END GM_MultiSurface2D;\r\n\r\n  STRUCTURE GM_Curve3DListValue =\r\n    value : MANDATORY GM_Curve3D;\r\n  END GM_Curve3DListValue;\r\n\r\n  STRUCTURE GM_Surface3DListValue =\r\n    value : MANDATORY GM_Surface3D;\r\n  END GM_Surface3DListValue;\r\n\r\n  !!@ ili2db.mapping = "MultiLine"\r\nSTRUCTURE GM_MultiCurve3D =\r\n    geometry : LIST {1..*} OF ISO19107_PLANAS_V3_0.GM_Curve3DListValue;\r\n  END GM_MultiCurve3D;\r\n\r\n  !!@ ili2db.mapping = "MultiSurface"\r\nSTRUCTURE GM_MultiSurface3D =\r\n    geometry : LIST {1..*} OF ISO19107_PLANAS_V3_0.GM_Surface3DListValue;\r\n  END GM_MultiSurface3D;\r\n\r\nEND ISO19107_PLANAS_V3_0.\r\n	2020-07-22 11:12:04.283
Submodelo_Insumos_V1_0.ili	2.3	Submodelo_Insumos_Gestor_Catastral_V1_0{ LADM_COL_V3_0 ISO19107_PLANAS_V3_0} Submodelo_Insumos_SNR_V1_0{ LADM_COL_V3_0} Submodelo_Integracion_Insumos_V1_0{ Submodelo_Insumos_Gestor_Catastral_V1_0 Submodelo_Insumos_SNR_V1_0}	INTERLIS 2.3;\r\n\r\nMODEL Submodelo_Insumos_Gestor_Catastral_V1_0 (es)\r\nAT "mailto:PC4@localhost"\r\nVERSION "2019-08-01"  =\r\n  IMPORTS ISO19107_PLANAS_V3_0,LADM_COL_V3_0;\r\n\r\n  DOMAIN\r\n\r\n    GC_CondicionPredioTipo = (\r\n      /** Predio no sometido al régimen de propiedad horizontal.\r\n       */\r\n      !!@ ili2db.dispName = "No propiedad horizontal"\r\n      NPH,\r\n      /** Predio sometido al régimen de propiedad horizontal mediante escritura pública registrada\r\n       */\r\n      !!@ ili2db.dispName = "Propiedad horizontal"\r\n      PH(\r\n        /** Predio matriz del régimen de propiedad horizontal sobre el cual se segregan todas las unidades prediales.\r\n         */\r\n        !!@ ili2db.dispName = "(PH) Matriz"\r\n        Matriz,\r\n        /** Apartamento, garaje, depósito o cualquier otro tipo de unidad predial dentro del PH que se encuentra debidamente inscrito en el registro de instrumentos públicos\r\n         */\r\n        !!@ ili2db.dispName = "(PH) Unidad predial"\r\n        Unidad_Predial\r\n      ),\r\n      /** Predio sometido al régimen de propiedad horizontal mediante escritura pública registrada en cuyo reglamento define para cada unidad predial un área privada de terreno.\r\n       */\r\n      !!@ ili2db.dispName = "Condiminio"\r\n      Condominio(\r\n        /** Predio matriz del condominio sobre el cual se segregan todas las unidades prediales.\r\n         */\r\n        !!@ ili2db.dispName = "(Condominio) Matriz"\r\n        Matriz,\r\n        /** Unidad predial dentro del condominio matriz.\r\n         */\r\n        !!@ ili2db.dispName = "(Condominio) Unidad predial"\r\n        Unidad_Predial\r\n      ),\r\n      /** Es la construcción o edificación instalada por una persona natural o jurídica sobre un predio que no le pertenece.\r\n       */\r\n      !!@ ili2db.dispName = "Mejora"\r\n      Mejora(\r\n        /** Mejora sobre un predio sometido a régimen de propiedad horizontal\r\n         */\r\n        !!@ ili2db.dispName = "(Mejora) Propiedad horizontal"\r\n        PH,\r\n        /** Mejora sobre un predio no sometido a régimen de propiedad horizontal.\r\n         */\r\n        !!@ ili2db.dispName = "(Mejora) No propiedad horizontal"\r\n        NPH\r\n      ),\r\n      /** Predios sobre los cuales las áreas de terreno y construcciones son dedicadas a la cremación, inhumación o enterramiento de personas fallecidas.\r\n       */\r\n      !!@ ili2db.dispName = "Parque cementerio"\r\n      Parque_Cementerio(\r\n        /** Predios sobre los cuales las áreas de terreno y construcciones son dedicadas a la cremación, inhumación o enterramiento de personas fallecidas.\r\n         */\r\n        !!@ ili2db.dispName = "(Parque cementerio) Matriz"\r\n        Matriz,\r\n        /** Área o sección de terreno con función de tumba, esta debe encontrarse inscrita en el registro de instrumentos públicos.\r\n         */\r\n        !!@ ili2db.dispName = "(Parque cementerio) Unidad predial"\r\n        Unidad_Predial\r\n      ),\r\n      /** Espacio (terreno y construcción) diseñado y destinado para el tránsito de vehículos, personas, entre otros.\r\n       */\r\n      !!@ ili2db.dispName = "Vía"\r\n      Via,\r\n      /** Inmuebles que siendo de dominio de la Nación, o una entidad territorial o de particulares, están destinados al uso de los habitantes.\r\n       */\r\n      !!@ ili2db.dispName = "Bien de uso público"\r\n      Bien_Uso_Publico\r\n    );\r\n\r\n    GC_SistemaProcedenciaDatosTipo = (\r\n      /** Datos extraídos del Sistema Nacional Catastral del IGAC.\r\n       */\r\n      !!@ ili2db.dispName = "Sistema Nacional Catastral"\r\n      SNC,\r\n      /** Datos extraídos del Sistema COBOL del IGAC.\r\n       */\r\n      !!@ ili2db.dispName = "Cobol"\r\n      Cobol\r\n    );\r\n\r\n    GC_UnidadConstruccionTipo = (\r\n      /** Se refiere aquellas construcciones de uso residencial, comercial e industrial.\r\n       */\r\n      !!@ ili2db.dispName = "Convencional"\r\n      Convencional,\r\n      /** Se refiere aquellas construcciones considereadas anexos de construcción.\r\n       */\r\n      !!@ ili2db.dispName = "No convencional"\r\n      No_Convencional\r\n    );\r\n\r\n  TOPIC Datos_Gestor_Catastral =\r\n\r\n    /** Dato geografico aportado por el Gestor Catastral respecto de los barrios de una entidad territorial.\r\n     */\r\n    !!@ ili2db.dispName = "(GC) Barrio"\r\n    CLASS GC_Barrio =\r\n      /** Código de identificación del barrio.\r\n       */\r\n      !!@ ili2db.dispName = "Código"\r\n      Codigo : TEXT*13;\r\n      /** Nombre del barrio.\r\n       */\r\n      !!@ ili2db.dispName = "Nombre"\r\n      Nombre : TEXT*100;\r\n      /** Código del sector donde se encuentra localizado el barrio.\r\n       */\r\n      !!@ ili2db.dispName = "Código sector"\r\n      Codigo_Sector : TEXT*9;\r\n      /** Tipo de geometría y su representación georrefenciada que definen los límites y el área ocupada por el barrio.\r\n       */\r\n      !!@ ili2db.dispName = "Geometría"\r\n      Geometria : ISO19107_PLANAS_V3_0.GM_MultiSurface2D;\r\n    END GC_Barrio;\r\n\r\n    /** Relaciona la calificación de las unidades de construcción de los datos de insumos del Gestor Catastral.\r\n     */\r\n    !!@ ili2db.dispName = "(GC) Calificación unidad de construcción"\r\n    CLASS GC_CalificacionUnidadConstruccion =\r\n      /** Indica el componente de la calificación de la unidad de construcción.\r\n       */\r\n      !!@ ili2db.dispName = "Componente"\r\n      Componente : TEXT*255;\r\n      /** Indica el elemento de calificación de la unidad de construcción.\r\n       */\r\n      !!@ ili2db.dispName = "Elemento de calificación"\r\n      Elemento_Calificacion : TEXT*255;\r\n      /** Indica el detalle de calificación del elemento de calificación de la unidad de construcción.\r\n       */\r\n      !!@ ili2db.dispName = "Detalle de calificación"\r\n      Detalle_Calificacion : TEXT*255;\r\n      /** Puntaje asociado al detalle del elemento de calificación.\r\n       */\r\n      !!@ ili2db.dispName = "Puntos"\r\n      Puntos : 0 .. 100;\r\n    END GC_CalificacionUnidadConstruccion;\r\n\r\n    /** Construcciones que no cuentan con información alfanumérica en la base de datos catastral.\r\n     */\r\n    !!@ ili2db.dispName = "(GC) Comisiones Construcción"\r\n    CLASS GC_ComisionesConstruccion =\r\n      /** Numero Predial del Construcciones que no cuentan con información alfanumérica en la base de datos catastral.\r\n       */\r\n      !!@ ili2db.dispName = "Número predial"\r\n      Numero_Predial : MANDATORY TEXT*30;\r\n      /** Construcciones que no cuentan con información alfanumérica en la base catastral.\r\n       */\r\n      !!@ ili2db.dispName = "Geometría"\r\n      Geometria : ISO19107_PLANAS_V3_0.GM_MultiSurface3D;\r\n    END GC_ComisionesConstruccion;\r\n\r\n    /** Terrenos que no cuentan con información alfanumérica en la base de datos catastral.\r\n     */\r\n    !!@ ili2db.dispName = "(GC) Comisiones Terreno"\r\n    CLASS GC_ComisionesTerreno =\r\n      /** Numero Predial del terreno que no cuentan con información\r\n       * alfanumérica en la base de datos catastral.\r\n       */\r\n      !!@ ili2db.dispName = "Número predial"\r\n      Numero_Predial : MANDATORY TEXT*30;\r\n      /** Terrenos que no cuentan con información alfanumérica en la base catastral.\r\n       */\r\n      !!@ ili2db.dispName = "Geometría"\r\n      Geometria : ISO19107_PLANAS_V3_0.GM_MultiSurface2D;\r\n    END GC_ComisionesTerreno;\r\n\r\n    /** Unidades de construcción que no cuentan con información alfanumérica en la base de datos catastral.\r\n     */\r\n    !!@ ili2db.dispName = "(GC) Comisiones Unidad Construcción"\r\n    CLASS GC_ComisionesUnidadConstruccion =\r\n      /** Numero Predial del terreno que no cuentan con información alfanumérica en la base de datos catastral.\r\n       */\r\n      !!@ ili2db.dispName = "Número predial"\r\n      Numero_Predial : MANDATORY TEXT*30;\r\n      /** Unidades de construcción que no cuentan con información alfanumérica en la base catastral.\r\n       */\r\n      !!@ ili2db.dispName = "Geometría"\r\n      Geometria : ISO19107_PLANAS_V3_0.GM_MultiSurface3D;\r\n    END GC_ComisionesUnidadConstruccion;\r\n\r\n    /** Datos de las construcciones inscritas en las bases de datos catastrales en una entidad territorial.\r\n     */\r\n    !!@ ili2db.dispName = "(GC) Construcción"\r\n    CLASS GC_Construccion =\r\n      /** Identificado de la unidad de construcción, su codificación puede ser por letras del abecedario.\r\n       */\r\n      !!@ ili2db.dispName = "Identificador"\r\n      Identificador : TEXT*30;\r\n      /** Etiqueta de la construcción.\r\n       */\r\n      !!@ ili2db.dispName = "Etiqueta"\r\n      Etiqueta : TEXT*50;\r\n      /** Indica si la construcción es de tipo convencional o no convencional.\r\n       */\r\n      !!@ ili2db.dispName = "Tipo de construcción"\r\n      Tipo_Construccion : Submodelo_Insumos_Gestor_Catastral_V1_0.GC_UnidadConstruccionTipo;\r\n      /** Indica el tipo de dominio de la unidad de construcción: común y privado.\r\n       */\r\n      !!@ ili2db.dispName = "Tipo de dominio"\r\n      Tipo_Dominio : TEXT*20;\r\n      /** Número total de pisos de la construcción.\r\n       */\r\n      !!@ ili2db.dispName = "Número de pisos"\r\n      Numero_Pisos : 0 .. 200;\r\n      /** Número total de sótanos de la construcción.\r\n       */\r\n      !!@ ili2db.dispName = "Número de sótanos"\r\n      Numero_Sotanos : 0 .. 99;\r\n      /** Número total de mezanines de la construcción.\r\n       */\r\n      !!@ ili2db.dispName = "Número de mezanines"\r\n      Numero_Mezanines : 0 .. 99;\r\n      /** Número total de semisótanos de la construcción.\r\n       */\r\n      !!@ ili2db.dispName = "Número de semisótanos"\r\n      Numero_Semisotanos : 0 .. 99;\r\n      /** Código catastral de la construcción.\r\n       */\r\n      !!@ ili2db.dispName = "Código de edificación"\r\n      Codigo_Edificacion : 0 .. 10000000000000000000;\r\n      /** Código de terreno donde se encuentra ubicada la construcción.\r\n       */\r\n      !!@ ili2db.dispName = "Código de terreno"\r\n      Codigo_Terreno : TEXT*30;\r\n      /** Área total construida.\r\n       */\r\n      !!@ ili2db.dispName = "Área construida"\r\n      Area_Construida : 0.00 .. 99999999999999.98 [LADM_COL_V3_0.m2];\r\n      /** Polígono de la construcción existente en la base de datos catastral.\r\n       */\r\n      !!@ ili2db.dispName = "Geometría"\r\n      Geometria : ISO19107_PLANAS_V3_0.GM_MultiSurface3D;\r\n    END GC_Construccion;\r\n\r\n    /** Clase que contiene los datos principales del predio matriz sometido al regimen de propiedad horizontal inscrito en las bases de datos catastrales.\r\n     */\r\n    !!@ ili2db.dispName = "(GC) Datos Propiedad Horizontal Condominio"\r\n    CLASS GC_DatosPHCondominio =\r\n      /** Área total privada del terreno del PH o Condominio Matriz.\r\n       */\r\n      !!@ ili2db.dispName = "Área total de terreno privada"\r\n      Area_Total_Terreno_Privada : 0.00 .. 99999999999999.98 [LADM_COL_V3_0.m2];\r\n      /** Área total de terreno común del PH o Condominio Matriz.\r\n       */\r\n      !!@ ili2db.dispName = "Área total de terreno común"\r\n      Area_Total_Terreno_Comun : 0.00 .. 99999999999999.98 [LADM_COL_V3_0.m2];\r\n      /** Área total construida privada del PH o Condominio Matriz.\r\n       */\r\n      !!@ ili2db.dispName = "Área total construida privada"\r\n      Area_Total_Construida_Privada : 0.00 .. 99999999999999.98 [LADM_COL_V3_0.m2];\r\n      /** Área total construida común del PH o Condominio Matriz.\r\n       */\r\n      !!@ ili2db.dispName = "Área total construida común"\r\n      Area_Total_Construida_Comun : 0.00 .. 99999999999999.98 [LADM_COL_V3_0.m2];\r\n      /** Total de unidades privadas en el PH o Condominio.\r\n       */\r\n      !!@ ili2db.dispName = "Total de unidades privadas"\r\n      Total_Unidades_Privadas : 0 .. 99999999;\r\n      /** Total de unidades prediales en el sótano del PH o Condominio.\r\n       */\r\n      !!@ ili2db.dispName = "Total de unidades de sótano"\r\n      Total_Unidades_Sotano : 0 .. 99999999;\r\n      /** Avalúo catastral total de la propiedad horizontal o condominio.\r\n       */\r\n      !!@ ili2db.dispName = "Valor total avaúo catastral"\r\n      Valor_Total_Avaluo_Catastral : LADM_COL_V3_0.LADM_Nucleo.Peso;\r\n    END GC_DatosPHCondominio;\r\n\r\n    /** Relaciona la información de las torres asociadas al PH o Condominio de los datos insumos del Gestor Catastral\r\n     */\r\n    !!@ ili2db.dispName = "(GC) Datos torre PH"\r\n    CLASS GC_DatosTorrePH =\r\n      /** Número de torre en el PH o Condominio.\r\n       */\r\n      !!@ ili2db.dispName = "Torre"\r\n      Torre : 0 .. 1500;\r\n      /** Total de pisos de la torre.\r\n       */\r\n      !!@ ili2db.dispName = "Total de pisos torre"\r\n      Total_Pisos_Torre : 0 .. 100;\r\n      /** Total de unidades privadas en la torre.\r\n       */\r\n      !!@ ili2db.dispName = "Total de unidades privadas"\r\n      Total_Unidades_Privadas : 0 .. 99999999;\r\n      /** Total de sótanos en la torre.\r\n       */\r\n      !!@ ili2db.dispName = "Total de sótanos"\r\n      Total_Sotanos : 0 .. 99;\r\n      /** Total de unidades prediales en el sótano de la torre.\r\n       */\r\n      !!@ ili2db.dispName = "Total de unidades sótano"\r\n      Total_Unidades_Sotano : 0 .. 99999999;\r\n    END GC_DatosTorrePH;\r\n\r\n    !!@ ili2db.dispName = "(GC) Dirección"\r\n    STRUCTURE GC_Direccion =\r\n      /** Registros de la direcciones del predio.\r\n       */\r\n      !!@ ili2db.dispName = "Valor"\r\n      Valor : TEXT*255;\r\n      /** Indica si el registro de la dirección corresponde a la principal.\r\n       */\r\n      !!@ ili2db.dispName = "Principal"\r\n      Principal : BOOLEAN;\r\n      /** Línea de donde se encuentra la placa de nomenclatura del predio.\r\n       */\r\n      !!@ ili2db.dispName = "Geometría de referencia"\r\n      Geometria_Referencia : ISO19107_PLANAS_V3_0.GM_Curve3D;\r\n    END GC_Direccion;\r\n\r\n    /** Estructura que contiene el estado del predio en la base de datos catastral.\r\n     */\r\n    !!@ ili2db.dispName = "(GC) EstadoPredio"\r\n    STRUCTURE GC_EstadoPredio =\r\n      /** Indica el estado del predio en la base de datos catastral.\r\n       */\r\n      !!@ ili2db.dispName = "Estado alerta"\r\n      Estado_Alerta : TEXT*30;\r\n      /** Entidad emisora del estado de alerta del predio.\r\n       */\r\n      !!@ ili2db.dispName = "Entidad emisora de la alerta"\r\n      Entidad_Emisora_Alerta : TEXT*255;\r\n      /** Fecha de la alerta en el sistema de gestión catastral.\r\n       */\r\n      !!@ ili2db.dispName = "Fecha de alerta"\r\n      Fecha_Alerta : INTERLIS.XMLDate;\r\n    END GC_EstadoPredio;\r\n\r\n    /** Dato geografico aportado por el Gestor Catastral respecto de las manzanas de una entidad territorial.\r\n     */\r\n    !!@ ili2db.dispName = "(GC) Manzana"\r\n    CLASS GC_Manzana =\r\n      /** Código catastral de 17 dígitos de la manzana.\r\n       */\r\n      !!@ ili2db.dispName = "Código"\r\n      Codigo : TEXT*17;\r\n      /** Código catastral anterior de la manzana.\r\n       */\r\n      !!@ ili2db.dispName = "Código anterior"\r\n      Codigo_Anterior : TEXT*255;\r\n      /** Código catastral de 13 dígitos del barrio donde se encuentra la manzana.\r\n       */\r\n      !!@ ili2db.dispName = "Código de barrio"\r\n      Codigo_Barrio : TEXT*13;\r\n      /** Polígonos de la manzanas catastrales.\r\n       */\r\n      !!@ ili2db.dispName = "Geometría"\r\n      Geometria : ISO19107_PLANAS_V3_0.GM_MultiSurface2D;\r\n    END GC_Manzana;\r\n\r\n    /** Dato geografico aportado por el Gestor Catastral respecto del perimetro urbano de una entidad territorial.\r\n     */\r\n    !!@ ili2db.dispName = "(GC) Perímetro"\r\n    CLASS GC_Perimetro =\r\n      /** Código de 2 dígitos del Departamento según clasificación de Divipola.\r\n       */\r\n      !!@ ili2db.dispName = "Código del departamento"\r\n      Codigo_Departamento : TEXT*2;\r\n      /** Código de 5 dígitos que une los 2 dígitos del Departamento y los 3 dígitos del municipio según la clasificación de Divipola.\r\n       */\r\n      !!@ ili2db.dispName = "Código del municipio"\r\n      Codigo_Municipio : TEXT*5;\r\n      /** Tipo de avalúo catastral del perímetro urbano.\r\n       */\r\n      !!@ ili2db.dispName = "Tipo de avalúo"\r\n      Tipo_Avaluo : TEXT*30;\r\n      /** Nombre geográfico del perímetro municipal, por ejemplo el nombre del municipio.\r\n       */\r\n      !!@ ili2db.dispName = "Nombre geográfico"\r\n      Nombre_Geografico : TEXT*50;\r\n      /** Código del nombre geográfico.\r\n       */\r\n      !!@ ili2db.dispName = "Código nombre"\r\n      Codigo_Nombre : TEXT*255;\r\n      /** Polígono del perímetro urbano.\r\n       */\r\n      !!@ ili2db.dispName = "Geometría"\r\n      Geometria : ISO19107_PLANAS_V3_0.GM_MultiSurface2D;\r\n    END GC_Perimetro;\r\n\r\n    /** Datos de los propietarios inscritos en las bases de datos catastrales que tienen relación con un predio.\r\n     */\r\n    !!@ ili2db.dispName = "(GC) Propietario"\r\n    CLASS GC_Propietario =\r\n      /** Tipo de documento del propietario registrado en la base de datos catastral.\r\n       */\r\n      !!@ ili2db.dispName = "Tipo de documento"\r\n      Tipo_Documento : TEXT*100;\r\n      /** Número de documento del propietario registrado en la base de datos catastral.\r\n       */\r\n      !!@ ili2db.dispName = "Número de documento"\r\n      Numero_Documento : TEXT*50;\r\n      /** Dígito de verificación de las personas jurídicas.\r\n       */\r\n      !!@ ili2db.dispName = "Dígito de verificación"\r\n      Digito_Verificacion : TEXT*1;\r\n      /** Primer nombre del propietario en catastro.\r\n       */\r\n      !!@ ili2db.dispName = "Primer nombre"\r\n      Primer_Nombre : TEXT*255;\r\n      /** Segundo nombre del propietario en catastro.\r\n       */\r\n      !!@ ili2db.dispName = "Segundo nombre"\r\n      Segundo_Nombre : TEXT*255;\r\n      /** Primer apellido del propietario en catastro.\r\n       */\r\n      !!@ ili2db.dispName = "Primer apellido"\r\n      Primer_Apellido : TEXT*255;\r\n      /** Segundo apellido del propietario en catastro.\r\n       */\r\n      !!@ ili2db.dispName = "Segundo apellido"\r\n      Segundo_Apellido : TEXT*255;\r\n      /** Razon social de las personas jurídicas inscritas como propietarios en catastro.\r\n       */\r\n      !!@ ili2db.dispName = "Razón social"\r\n      Razon_Social : TEXT*255;\r\n    END GC_Propietario;\r\n\r\n    /** Dato geografico aportado por el Gestor Catastral respecto de los sectores catastrales rurales de una entidad territorial.\r\n     */\r\n    !!@ ili2db.dispName = "(GC) Sector Rural"\r\n    CLASS GC_SectorRural =\r\n      /** Código catastral de 9 dígitos del sector catastral.\r\n       */\r\n      !!@ ili2db.dispName = "Código"\r\n      Codigo : TEXT*9;\r\n      /** Polígono de los sectores catastrales existentes en la base de datos catastral.\r\n       */\r\n      !!@ ili2db.dispName = "Geometría"\r\n      Geometria : ISO19107_PLANAS_V3_0.GM_MultiSurface2D;\r\n    END GC_SectorRural;\r\n\r\n    /** Dato geografico aportado por el Gestor Catastral respecto de los sectores catastrales urbanos de una entidad territorial.\r\n     */\r\n    !!@ ili2db.dispName = "(GC) Sector Urbano"\r\n    CLASS GC_SectorUrbano =\r\n      /** Código catastral de 9 dígitos del sector catastral.\r\n       */\r\n      !!@ ili2db.dispName = "Código"\r\n      Codigo : TEXT*9;\r\n      /** Polígono de los sectores catastrales existentes en la base de datos catastral.\r\n       */\r\n      !!@ ili2db.dispName = "Geometría"\r\n      Geometria : ISO19107_PLANAS_V3_0.GM_MultiSurface2D;\r\n    END GC_SectorUrbano;\r\n\r\n    /** Datos de los terrenos inscritos en las bases de datos catastrales en una entidad territorial.\r\n     */\r\n    !!@ ili2db.dispName = "(GC) Terreno"\r\n    CLASS GC_Terreno =\r\n      /** Área de terreno alfanumérica registrada en la base de datos catastral.\r\n       */\r\n      !!@ ili2db.dispName = "Área terreno alfanumérica"\r\n      Area_Terreno_Alfanumerica : 0.00 .. 99999999999999.98 [LADM_COL_V3_0.m2];\r\n      /** Área de terreno digital registrada en la base de datos catastral.\r\n       */\r\n      !!@ ili2db.dispName = "Área terreno digital"\r\n      Area_Terreno_Digital : 0.00 .. 99999999999999.98 [LADM_COL_V3_0.m2];\r\n      /** Código de la manzana o vereda donde se localiza el terreno.\r\n       */\r\n      !!@ ili2db.dispName = "Código de manzana vereda"\r\n      Manzana_Vereda_Codigo : TEXT*17;\r\n      /** Número de subterráneos en el terreno.\r\n       */\r\n      !!@ ili2db.dispName = "Número de subterráneos"\r\n      Numero_Subterraneos : 0 .. 999999999999999;\r\n      /** Polígono de la unidad de construcción existente en la base de datos catastral.\r\n       */\r\n      !!@ ili2db.dispName = "Geometría"\r\n      Geometria : ISO19107_PLANAS_V3_0.GM_MultiSurface2D;\r\n    END GC_Terreno;\r\n\r\n    /** Datos de las unidades de construcción inscritas en las bases de datos catastrales en una entidad territorial.\r\n     */\r\n    !!@ ili2db.dispName = "(GC) Unidad Construcción"\r\n    CLASS GC_UnidadConstruccion =\r\n      /** Identificado de la unidad de construcción, su codificación puede ser por letras del abecedario.\r\n       */\r\n      !!@ ili2db.dispName = "Identificador"\r\n      Identificador : TEXT*2;\r\n      /** Etiqueta de la unidad de construcción.\r\n       */\r\n      !!@ ili2db.dispName = "Etiqueta"\r\n      Etiqueta : TEXT*50;\r\n      /** Indica el tipo de dominio de la unidad de construcción: común y privado.\r\n       */\r\n      !!@ ili2db.dispName = "Tipo de dominio"\r\n      Tipo_Dominio : TEXT*20;\r\n      /** Indica si la construcción es de tipo convencional o no convencional.\r\n       */\r\n      !!@ ili2db.dispName = "Tipo de construcción"\r\n      Tipo_Construccion : Submodelo_Insumos_Gestor_Catastral_V1_0.GC_UnidadConstruccionTipo;\r\n      /** Indica numéricamente la ubicación del predio de acuerdo al tipo de planta.\r\n       */\r\n      !!@ ili2db.dispName = "Planta"\r\n      Planta : TEXT*10;\r\n      /** Número total de  habitaciones en la unidad de construcción.\r\n       */\r\n      !!@ ili2db.dispName = "Total de habitaciones"\r\n      Total_Habitaciones : 0 .. 999999;\r\n      /** Número total de baños en la unidad de construcción.\r\n       */\r\n      !!@ ili2db.dispName = "Total de baños"\r\n      Total_Banios : 0 .. 999999;\r\n      /** Número total de locales en la unidad de construcción.\r\n       */\r\n      !!@ ili2db.dispName = "Total de locales"\r\n      Total_Locales : 0 .. 999999;\r\n      /** Número total de pisos en la unidad de construcción.\r\n       */\r\n      !!@ ili2db.dispName = "Total de pisos"\r\n      Total_Pisos : 0 .. 150;\r\n      /** Actividad que se desarrolla en una unidad de construcción.\r\n       */\r\n      !!@ ili2db.dispName = "Uso"\r\n      Uso : TEXT*255;\r\n      /** Año de construcción de la unidad de construcción.\r\n       */\r\n      !!@ ili2db.dispName = "Año de construcción"\r\n      Anio_Construccion : 1512 .. 2500;\r\n      /** Puntaje total de la calificación de construcción.\r\n       */\r\n      !!@ ili2db.dispName = "Puntaje"\r\n      Puntaje : 0 .. 200;\r\n      /** Área total construida en la unidad de construcción.\r\n       */\r\n      !!@ ili2db.dispName = "Área construida"\r\n      Area_Construida : 0.00 .. 99999999999999.98 [LADM_COL_V3_0.m2];\r\n      /** Área total privada de la unidad de construcción para los predios en régimen de propiedad horizontal.\r\n       */\r\n      !!@ ili2db.dispName = "Área privada"\r\n      Area_Privada : 0.00 .. 99999999999999.98 [LADM_COL_V3_0.m2];\r\n      /** Código catastral del terreno donde se encuentra localizada la unidad de construcción.\r\n       */\r\n      !!@ ili2db.dispName = "Código terreno"\r\n      Codigo_Terreno : TEXT*30;\r\n      /** Polígono de la unidad de construcción existente en la base de datos catastral.\r\n       */\r\n      !!@ ili2db.dispName = "Geometría"\r\n      Geometria : ISO19107_PLANAS_V3_0.GM_MultiSurface3D;\r\n    END GC_UnidadConstruccion;\r\n\r\n    /** Dato geografico aportado por el Gestor Catastral respecto de las veredades de una entidad territorial.\r\n     */\r\n    !!@ ili2db.dispName = "(GC) Vereda"\r\n    CLASS GC_Vereda =\r\n      /** Código catastral de 17 dígitos de la vereda.\r\n       */\r\n      !!@ ili2db.dispName = "Código"\r\n      Codigo : TEXT*17;\r\n      /** Código catastral de 13 dígitos de la vereda.\r\n       */\r\n      !!@ ili2db.dispName = "Código anterior"\r\n      Codigo_Anterior : TEXT*13;\r\n      /** Nombre de la vereda.\r\n       */\r\n      !!@ ili2db.dispName = "Nombre"\r\n      Nombre : TEXT*100;\r\n      /** Código catastral de 9 dígitos del código de sector donde se encuentra la vereda.\r\n       */\r\n      !!@ ili2db.dispName = "Código del sector"\r\n      Codigo_Sector : TEXT*9;\r\n      /** Geometría en 2D de la vereda.\r\n       */\r\n      !!@ ili2db.dispName = "Geometría"\r\n      Geometria : ISO19107_PLANAS_V3_0.GM_MultiSurface2D;\r\n    END GC_Vereda;\r\n\r\n    /** Información existente en las bases de datos catastrales respecto de los predios en una entidad territorial.\r\n     */\r\n    !!@ ili2db.dispName = "(GC) Predio Catastro"\r\n    CLASS GC_PredioCatastro =\r\n      /** Indica si el predio se encuentra en catastro fiscal o Ley 14.\r\n       */\r\n      !!@ ili2db.dispName = "Tipo de catastro"\r\n      Tipo_Catastro : TEXT*255;\r\n      /** Código numérico de 30 dígitos que permita localizarlo inequívocamente en los respectivos documentos catastrales, según el modelo determinado por el Instituto Geográfico Agustín Codazzi.\r\n       */\r\n      !!@ ili2db.dispName = "Número predial"\r\n      Numero_Predial : TEXT*30;\r\n      /** Código numérico de 20 dígitos que permita localizarlo inequívocamente en los respectivos documentos catastrales, según el modelo determinado por el Instituto Geográfico Agustín Codazzi.\r\n       */\r\n      !!@ ili2db.dispName = "Número predial anterior"\r\n      Numero_Predial_Anterior : TEXT*20;\r\n      /** Es un código único para identificar los inmuebles tanto en los sistemas de información catastral como registral. El NUPRE no implicará supresión de la numeración catastral ni registral asociada a la cédula catastral ni a la matrícula inmobiliaria actual.\r\n       */\r\n      !!@ ili2db.dispName = "Número único predial"\r\n      NUPRE : TEXT*11;\r\n      /** Circulo registral al que se encuentra inscrito el predio.\r\n       */\r\n      !!@ ili2db.dispName = "Círculo registral"\r\n      Circulo_Registral : TEXT*4;\r\n      /** Identificador único asignado por las oficinas de registro de instrumentos públicos.\r\n       */\r\n      !!@ ili2db.dispName = "Matrícula inmobiliaria catastro"\r\n      Matricula_Inmobiliaria_Catastro : TEXT*80;\r\n      /** Direcciones del predio inscritas en catastro.\r\n       */\r\n      !!@ ili2db.dispName = "Direcciones"\r\n      Direcciones : BAG {0..*} OF Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Direccion;\r\n      /** Tipo de predio inscrito en catastro: Nacional, Departamental, Municipal, Particular, Baldío, Ejido, Resguardo Indígena, Tierra de comunidades negras y Reservas Naturales.\r\n       */\r\n      !!@ ili2db.dispName = "Tipo de predio"\r\n      Tipo_Predio : TEXT*100;\r\n      /** Caracterización temática del predio.\r\n       */\r\n      !!@ ili2db.dispName = "Condición del predio"\r\n      Condicion_Predio : Submodelo_Insumos_Gestor_Catastral_V1_0.GC_CondicionPredioTipo;\r\n      /** Es la clasificación para fines estadísticos que se da a cada inmueble en su conjunto–terreno, construcciones o edificaciones-, en el momento de la identificación predial de conformidad con la actividad predominante que en él se desarrolle.\r\n       */\r\n      !!@ ili2db.dispName = "Destinación económica"\r\n      Destinacion_Economica : TEXT*150;\r\n      /** Estado del predio en la base de datos catastral según los actos administrativos o judiciales que versan sobre el mismo.\r\n       */\r\n      !!@ ili2db.dispName = "Estado del predio"\r\n      Estado_Predio : BAG {0..*} OF Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_EstadoPredio;\r\n      /** Indica el sistema de gestión catastral de donde proceden los datos, en el caso del IGAC puede ser COBOL o SNC.\r\n       */\r\n      !!@ ili2db.dispName = "Sistema procedencia de los datos"\r\n      Sistema_Procedencia_Datos : Submodelo_Insumos_Gestor_Catastral_V1_0.GC_SistemaProcedenciaDatosTipo;\r\n      /** Fecha de la vigencia de los datos.\r\n       */\r\n      !!@ ili2db.dispName = "Fecha de los datos"\r\n      Fecha_Datos : MANDATORY INTERLIS.XMLDate;\r\n    END GC_PredioCatastro;\r\n\r\n    ASSOCIATION gc_construccion_unidad =\r\n      gc_unidad_construccion -- {0..*} GC_UnidadConstruccion;\r\n      gc_construccion -- {1} GC_Construccion;\r\n    END gc_construccion_unidad;\r\n\r\n    ASSOCIATION gc_datosphcondominio_datostorreph =\r\n      gc_datostorreph -- {0..*} GC_DatosTorrePH;\r\n      gc_datosphcondominio -- {0..1} GC_DatosPHCondominio;\r\n    END gc_datosphcondominio_datostorreph;\r\n\r\n    ASSOCIATION gc_unidadconstruccion_calificacionunidadconstruccion =\r\n      gc_unidadconstruccion -- {0..1} GC_UnidadConstruccion;\r\n      gc_calificacionunidadconstruccion -- {0..*} GC_CalificacionUnidadConstruccion;\r\n    END gc_unidadconstruccion_calificacionunidadconstruccion;\r\n\r\n    ASSOCIATION gc_construccion_predio =\r\n      gc_predio -- {1} GC_PredioCatastro;\r\n      gc_construccion -- {0..*} GC_Construccion;\r\n    END gc_construccion_predio;\r\n\r\n    /** Clase que relaciona las unidades prediales a los predios matrices bajo el regimen de propiedad horizontal inscritos en las bases de datos catastrales.\r\n     */\r\n    ASSOCIATION gc_copropiedad =\r\n      gc_matriz -<> {0..1} GC_PredioCatastro;\r\n      gc_unidad -- {0..*} GC_PredioCatastro;\r\n      Coeficiente_Copropiedad : 0.0000000 .. 100.0000000;\r\n    END gc_copropiedad;\r\n\r\n    ASSOCIATION gc_ph_predio =\r\n      gc_predio -- {1} GC_PredioCatastro;\r\n      gc_datos_ph -- {0..1} GC_DatosPHCondominio;\r\n    END gc_ph_predio;\r\n\r\n    ASSOCIATION gc_propietario_predio =\r\n      gc_predio_catastro -- {1} GC_PredioCatastro;\r\n      gc_propietario -- {0..*} GC_Propietario;\r\n    END gc_propietario_predio;\r\n\r\n    ASSOCIATION gc_terreno_predio =\r\n      gc_predio -- {1} GC_PredioCatastro;\r\n      gc_terreno -- {0..*} GC_Terreno;\r\n    END gc_terreno_predio;\r\n\r\n  END Datos_Gestor_Catastral;\r\n\r\nEND Submodelo_Insumos_Gestor_Catastral_V1_0.\r\n\r\nMODEL Submodelo_Insumos_SNR_V1_0 (es)\r\nAT "http://www.proadmintierra.info/"\r\nVERSION "V2.3"  // 2019-07-31 // =\r\n  IMPORTS LADM_COL_V3_0;\r\n\r\n  DOMAIN\r\n\r\n    SNR_CalidadDerechoTipo = (\r\n      /** El dominio que se llama también propiedad es el derecho real en una cosa corporal, para gozar y disponer de ella arbitrariamente, no siendo contra ley o contra derecho ajeno. (Art. 669 CC):\r\n       * \r\n       * 0100\r\n       * 0101\r\n       * 0102\r\n       * 0103\r\n       * 0106\r\n       * 0107\r\n       * 0108\r\n       * 0109\r\n       * 0110\r\n       * 0111\r\n       * 0112\r\n       * 0113\r\n       * 0114\r\n       * 0115\r\n       * 0116\r\n       * 0117\r\n       * 0118\r\n       * 0119\r\n       * 0120\r\n       * 0121\r\n       * 0122\r\n       * 0124\r\n       * 0125\r\n       * 0126\r\n       * 0127\r\n       * 0128\r\n       * 0129\r\n       * 0130\r\n       * 0131\r\n       * 0132\r\n       * 0133\r\n       * 0135\r\n       * 0137\r\n       * 0138\r\n       * 0139\r\n       * 0140\r\n       * 0141\r\n       * 0142\r\n       * 0143\r\n       * 0144\r\n       * 0145\r\n       * 0146\r\n       * 0147\r\n       * 0148\r\n       * 0150\r\n       * 0151\r\n       * 0152\r\n       * 0153\r\n       * 0154\r\n       * 0155\r\n       * 0156\r\n       * 0157\r\n       * 0158\r\n       * 0159\r\n       * 0160\r\n       * 0161\r\n       * 0163\r\n       * 0164\r\n       * 0165\r\n       * 0166\r\n       * 0167\r\n       * 0168\r\n       * 0169\r\n       * 0171\r\n       * 0172\r\n       * 0173\r\n       * 0175\r\n       * 0177\r\n       * 0178\r\n       * 0179\r\n       * 0180\r\n       * 0181\r\n       * 0182\r\n       * 0183\r\n       * 0184\r\n       * 0185\r\n       * 0186\r\n       * 0187\r\n       * 0188\r\n       * 0189\r\n       * 0190\r\n       * 0191\r\n       * 0192\r\n       * 0193\r\n       * 0194\r\n       * 0195\r\n       * 0196\r\n       * 0197\r\n       * 0198\r\n       * 0199\r\n       * 01003\r\n       * 01004\r\n       * 01005\r\n       * 01006\r\n       * 01007\r\n       * 01008\r\n       * 01009\r\n       * 01010\r\n       * 01012\r\n       * 01013\r\n       * 01014\r\n       * 0301\r\n       * 0307\r\n       * 0321\r\n       * 0332\r\n       * 0348\r\n       * 0356\r\n       * 0374\r\n       * 0375\r\n       * 0376\r\n       * 0377\r\n       * 0906\r\n       * 0907\r\n       * 0910\r\n       * 0911\r\n       * 0912\r\n       * 0913\r\n       * 0915\r\n       * 0917\r\n       * 0918\r\n       * 0919\r\n       * 0920\r\n       * 0924\r\n       * 0935\r\n       * 0959\r\n       * 0962\r\n       * 0963\r\n       */\r\n      !!@ ili2db.dispName = "Dominio"\r\n      Dominio,\r\n      /** Es la inscripción en la Oficina de Registro de Instrumentos Públicos, de todo acto de transferencia de un derecho incompleto que se hace a favor de una persona, por parte de quien carece del derecho de dominio sobre determinado inmueble: \r\n       * \r\n       * 0600\r\n       * 0601\r\n       * 0602\r\n       * 0604\r\n       * 0605\r\n       * 0606\r\n       * 0607\r\n       * 0608\r\n       * 0609\r\n       * 0610\r\n       * 0611\r\n       * 0613\r\n       * 0614\r\n       * 0615\r\n       * 0616\r\n       * 0617\r\n       * 0618\r\n       * 0619\r\n       * 0620\r\n       * 0621\r\n       * 0622\r\n       * 0136\r\n       * 0508\r\n       * 0927\r\n       */\r\n      !!@ ili2db.dispName = "Falsa tradición"\r\n      Falsa_Tradicion,\r\n      /** La propiedad separada del goce de la cosa se llama mera o nuda propiedad (art 669 CC):\r\n       * \r\n       * Códigos:\r\n       * \r\n       * 0302\r\n       * 0308\r\n       * 0322\r\n       * 0349\r\n       * 0379\r\n       */\r\n      !!@ ili2db.dispName = "Nuda propiedad"\r\n      Nuda_Propiedad,\r\n      /** Es la propiedad de toda una comunidad sea indígena o negra. Adjudicacion Baldios En Propiedad Colectiva A Comunidades Negras, Adjudicacion Baldios Resguardos Indigenas, Constitución Resguardo Indigena,\r\n       * Ampliación De Resguardo Indígena\r\n       * \r\n       * Códigos:\r\n       * \r\n       * 0104\r\n       * 0105\r\n       * 01001\r\n       * 01002\r\n       */\r\n      !!@ ili2db.dispName = "Derecho de propiedad colectiva"\r\n      Derecho_Propiedad_Colectiva,\r\n      /** El derecho de usufructo es un derecho real que consiste en la facultad de gozar de una cosa con cargo de conservar su forma y sustancia, y de restituir a su dueño, si la cosa no es fungible; o con cargo de volver igual cantidad y calidad del mismo género, o de pagar su valor si la cosa es fungible. (art. 823 CC):\r\n       * \r\n       * 0310\r\n       * 0314\r\n       * 0323\r\n       * 0333\r\n       * 0378\r\n       * 0380\r\n       * 0382\r\n       * 0383\r\n       */\r\n      !!@ ili2db.dispName = "Usufructo"\r\n      Usufructo\r\n    );\r\n\r\n    SNR_ClasePredioRegistroTipo = (\r\n      /** Constituyen esta categoría los terrenos no aptos para el uso urbano, por razones de oportunidad, o por su destinación a usos agrícolas, ganaderos, forestales, de explotación de recursos naturales y actividades análogas. (Artículo 33, Ley 388 de 1997)\r\n       */\r\n      !!@ ili2db.dispName = "Rural"\r\n      Rural,\r\n      /** Constituyen el suelo urbano, las áreas del territorio distrital o municipal destinadas a usos urbanos por el plan de ordenamiento, que cuenten con infraestructura vial y redes primarias de energía, acueducto y alcantarillado, posibilitándose su urbanización y edificación, según sea el caso. Podrán pertenecer a esta categoría aquellas zonas con procesos de urbanización incompletos, comprendidos en áreas consolidadas con edificación, que se definan como áreas de mejoramiento integral en los planes de ordenamiento territorial.\r\n       * \r\n       * Las áreas que conforman el suelo urbano serán delimitadas por perímetros y podrán incluir los centros poblados de los corregimientos. En ningún caso el perímetro urbano podrá ser mayor que el denominado perímetro de servicios públicos o sanitario. (Artículo 31, Ley 388 de 1997)\r\n       */\r\n      !!@ ili2db.dispName = "Urbano"\r\n      Urbano,\r\n      !!@ ili2db.dispName = "Sin información"\r\n      Sin_Informacion\r\n    );\r\n\r\n    SNR_DocumentoTitularTipo = (\r\n      /** Es un documento emitido por la Registraduría Nacional del Estado Civil para permitir la identificación personal de los ciudadanos.\r\n       */\r\n      !!@ ili2db.dispName = "Cédula de ciudadanía"\r\n      Cedula_Ciudadania,\r\n      /** Es el documento que cumple los fines de identificación de los extranjeros en el territorio nacional y su utilización deberá estar acorde con la visa otorgada al extranjero.\r\n       */\r\n      !!@ ili2db.dispName = "Cédula de extranjería"\r\n      Cedula_Extranjeria,\r\n      /** El Número de Identificación Tributaria (NIT) es un código privado, secreto e intransferible que solamente debe conocer el contribuyente.\r\n       */\r\n      !!@ ili2db.dispName = "NIT"\r\n      NIT,\r\n      /** Es el documento oficial que hace las veces de identificación para los menores de edad entre los 7 y los 18 años.\r\n       */\r\n      !!@ ili2db.dispName = "Tarjeta de identidad"\r\n      Tarjeta_Identidad,\r\n      /** Registro donde se hacen constar por autoridades competentes los nacimientos, matrimonios, defunciones y demás hechos relativos al estado civil de las personas. En el modelo se tendrá en cuenta el número de registro como identificación personal de las personas de 0 a 7 años.\r\n       */\r\n      !!@ ili2db.dispName = "Registro civil"\r\n      Registro_Civil,\r\n      /** El Número Único de Identificación Personal, es el número que permite identificar a los colombianos durante toda su vida.\r\n       */\r\n      !!@ ili2db.dispName = "NUIP"\r\n      NUIP,\r\n      /** Es un consecutivo asignado automáticamente en registro en lugar del número de la identificación de la persona que hace el trámite, se usa especialmente en trámites de construcción cuando el proyecto está a nombre de una Fiducia el cual tiene el mismo número del banco.\r\n       */\r\n      !!@ ili2db.dispName = "Secuencial SNR"\r\n      Secuencial_SNR\r\n    );\r\n\r\n    SNR_FuenteTipo = (\r\n      /** Un acto administrativo es toda manifestación o declaración emanada de la administración pública en el ejercicio de potestades administrativas, mediante el que impone su voluntad sobre los derechos, libertades o intereses de otros sujetos públicos o privados y que queda bajo el del comienzo.\r\n       */\r\n      !!@ ili2db.dispName = "Acto administrativo"\r\n      Acto_Administrativo,\r\n      /** Una escritura pública es un documento público en el que se realiza ante un notario público un determinado hecho o un derecho autorizado por dicho fedatario público, que firma con el otorgante u otorgantes,mostrando sobre la capacidad jurídica del contenido y de la fecha en que se realizó\r\n       */\r\n      !!@ ili2db.dispName = "Escritura pública"\r\n      Escritura_Publica,\r\n      /** La sentencia es la resolución judicial definitiva dictada por un juez o tribunal que pone fin a la litis o caso sometido a su conocimiento y cierra definitivamente su actuación en el mismo\r\n       */\r\n      !!@ ili2db.dispName = "Sentencia judicial"\r\n      Sentencia_Judicial,\r\n      /** Documento que contiene un compromiso entre dos o más personas que lo firman.\r\n       */\r\n      !!@ ili2db.dispName = "Documento privado"\r\n      Documento_Privado,\r\n      /** Cuando no se haya documento soporte pero puede ser una declaración verbal.\r\n       */\r\n      !!@ ili2db.dispName = "Sin documento"\r\n      Sin_Documento\r\n    );\r\n\r\n    SNR_PersonaTitularTipo = (\r\n      /** Se refiere a la persona humana.\r\n       */\r\n      !!@ ili2db.dispName = "Persona natural"\r\n      Persona_Natural,\r\n      /** Se llama persona jurídica, una persona ficticia, capaz de ejercer derechos y contraer obligaciones civiles, y de ser representada judicial y extrajudicialmente. Las personas jurídicas son de dos especies: corporaciones y fundaciones de beneficencia pública.\r\n       */\r\n      !!@ ili2db.dispName = "Persona jurídica"\r\n      Persona_Juridica\r\n    );\r\n\r\n  TOPIC Datos_SNR =\r\n\r\n    /** Datos del derecho inscrito en la SNR.\r\n     */\r\n    !!@ ili2db.dispName = "(SNR) Derecho"\r\n    CLASS SNR_Derecho =\r\n      /** Calidad de derecho en registro\r\n       */\r\n      !!@ ili2db.dispName = "Calidad derecho registro"\r\n      Calidad_Derecho_Registro : MANDATORY Submodelo_Insumos_SNR_V1_0.SNR_CalidadDerechoTipo;\r\n      /** es el número asignado en el registro a cada acto sujeto a registro.\r\n       */\r\n      !!@ ili2db.dispName = "Código naturaleza jurídica"\r\n      Codigo_Naturaleza_Juridica : TEXT*5;\r\n    END SNR_Derecho;\r\n\r\n    !!@ ili2db.dispName = "(SNR) Estructura Matrícula Matriz"\r\n    STRUCTURE SNR_EstructuraMatriculaMatriz =\r\n      /** Es el nùmero que se ha asignado a la Oficina de Registro de Instrumentos públicos correspondiente.\r\n       */\r\n      !!@ ili2db.dispName = "Código ORIP"\r\n      Codigo_ORIP : TEXT*20;\r\n      /** Es el consecutivo que se asigna a cada predio jurídico abierto en la ORIP.\r\n       */\r\n      !!@ ili2db.dispName = "Matrícula inmobiliaria"\r\n      Matricula_Inmobiliaria : TEXT*20;\r\n    END SNR_EstructuraMatriculaMatriz;\r\n\r\n    /** Datos del documento que soporta la descripción de cabida y linderos.\r\n     */\r\n    !!@ ili2db.dispName = "(SNR) Fuente Cabida Linderos"\r\n    CLASS SNR_FuenteCabidaLinderos =\r\n      /** Tipo de documento que soporta la relación de tenencia entre el interesado con el predio.\r\n       */\r\n      !!@ ili2db.dispName = "Tipo de documento"\r\n      Tipo_Documento : Submodelo_Insumos_SNR_V1_0.SNR_FuenteTipo;\r\n      /** Identificador del documento, ejemplo: numero de la resolución\r\n       */\r\n      !!@ ili2db.dispName = "Número de documento"\r\n      Numero_Documento : TEXT*255;\r\n      !!@ ili2db.dispName = "Fecha de documento"\r\n      Fecha_Documento : INTERLIS.XMLDate;\r\n      /** Es tipo de oficina que emite el documento (notaria, juzgado)\r\n       */\r\n      !!@ ili2db.dispName = "Ente emisor"\r\n      Ente_Emisor : TEXT*255;\r\n      /** Es la ciudad donde se encuentra ubicada la oficina que expide el documento.\r\n       */\r\n      !!@ ili2db.dispName = "Ciudad emisora"\r\n      Ciudad_Emisora : TEXT*255;\r\n      /** Identificador del archivo fuente controlado por una clase externa.\r\n       */\r\n      !!@ ili2db.dispName = "Archivo"\r\n      Archivo : LADM_COL_V3_0.LADM_Nucleo.ExtArchivo;\r\n    END SNR_FuenteCabidaLinderos;\r\n\r\n    /** Datos del documento que soporta el derecho.\r\n     */\r\n    !!@ ili2db.dispName = "(SNR) Fuente Derecho"\r\n    CLASS SNR_FuenteDerecho =\r\n      /** Tipo de documento que soporta la relación de tenencia entre el interesado con el predio.\r\n       */\r\n      !!@ ili2db.dispName = "Tipo de documento"\r\n      Tipo_Documento : Submodelo_Insumos_SNR_V1_0.SNR_FuenteTipo;\r\n      /** Identificador del documento, ejemplo: numero de la resolución\r\n       */\r\n      !!@ ili2db.dispName = "Número de documento"\r\n      Numero_Documento : TEXT*255;\r\n      !!@ ili2db.dispName = "Fecha del documento"\r\n      Fecha_Documento : INTERLIS.XMLDate;\r\n      /** Es tipo de oficina que emite el documento (notaria, juzgado)\r\n       */\r\n      !!@ ili2db.dispName = "Ente emisor"\r\n      Ente_Emisor : MTEXT*255;\r\n      /** Es la ciudad donde se encuentra ubicada la oficina que expide el documento.\r\n       */\r\n      !!@ ili2db.dispName = "Ciudad emisora"\r\n      Ciudad_Emisora : TEXT*255;\r\n    END SNR_FuenteDerecho;\r\n\r\n    /** Datos de titulares de derecho inscritos en la SNR.\r\n     */\r\n    !!@ ili2db.dispName = "(SNR) Titular"\r\n    CLASS SNR_Titular =\r\n      /** Tipo de persona\r\n       */\r\n      !!@ ili2db.dispName = "Tipo de persona"\r\n      Tipo_Persona : Submodelo_Insumos_SNR_V1_0.SNR_PersonaTitularTipo;\r\n      /** Tipo de documento del que se trata.\r\n       */\r\n      !!@ ili2db.dispName = "Tipo de documento"\r\n      Tipo_Documento : Submodelo_Insumos_SNR_V1_0.SNR_DocumentoTitularTipo;\r\n      /** Documento de identidad del interesado.\r\n       */\r\n      !!@ ili2db.dispName = "Número de documento"\r\n      Numero_Documento : MANDATORY TEXT*50;\r\n      /** Nombres de la persona física.\r\n       */\r\n      !!@ ili2db.dispName = "Nombres"\r\n      Nombres : TEXT*500;\r\n      /** Primer apellido de la persona física.\r\n       */\r\n      !!@ ili2db.dispName = "Primer apellido"\r\n      Primer_Apellido : TEXT*255;\r\n      /** Segundo apellido de la persona física.\r\n       */\r\n      !!@ ili2db.dispName = "Segundo apellido"\r\n      Segundo_Apellido : TEXT*255;\r\n      /** Nombre con el que está inscrita la persona jurídica\r\n       */\r\n      !!@ ili2db.dispName = "Razón social"\r\n      Razon_Social : MTEXT*255;\r\n    END SNR_Titular;\r\n\r\n    /** Datos del predio entregados por la SNR.\r\n     */\r\n    !!@ ili2db.dispName = "(SNR) Predio Registro"\r\n    CLASS SNR_PredioRegistro =\r\n      /** Es el nùmero que se ha asignado a la Oficina de Registro de Instrumentos públicos correspondiente.\r\n       */\r\n      !!@ ili2db.dispName = "Código ORIP"\r\n      Codigo_ORIP : TEXT*3;\r\n      /** Es el consecutivo que se asigna a cada predio jurídico abierto en la ORIP.\r\n       */\r\n      !!@ ili2db.dispName = "Matrícula inmobiliaria"\r\n      Matricula_Inmobiliaria : TEXT*80;\r\n      /** Nuevo código númerico de treinta (30) dígitos, que se le asigna a cada predio y busca localizarlo inequívocamente en los documentos catastrales, según el modelo determinado por el Instituto Geográfico Agustin Codazzi, registrado en SNR.\r\n       */\r\n      !!@ ili2db.dispName = "Número predial nuevo en FMI"\r\n      Numero_Predial_Nuevo_en_FMI : TEXT*100;\r\n      /** Anterior código númerico de veinte (20) digitos, que se le asigna a cada predio y busca localizarlo inequívocamente en los documentos catastrales, según el modelo determinado por el Instituto Geográfico Agustin Codazzi, registrado en SNR.\r\n       */\r\n      !!@ ili2db.dispName = "Número predial anterior en FMI"\r\n      Numero_Predial_Anterior_en_FMI : TEXT*100;\r\n      /** Conjunto de símbolos alfanuméricos, los cuales designan vías y predios de la ciudad.\r\n       */\r\n      !!@ ili2db.dispName = "Nomenclatura según registro"\r\n      Nomenclatura_Registro : TEXT*255;\r\n      /** El texto de cabida y linderosque está consignado en el registro público de la propiedad sobre el cual se ejercen los derechos.\r\n       */\r\n      !!@ ili2db.dispName = "Cabida y linderos"\r\n      Cabida_Linderos : MTEXT;\r\n      /** Corresponde al dato de tipo de predio incorporado en las bases de datos registrales\r\n       */\r\n      !!@ ili2db.dispName = "Clase del suelo según registro"\r\n      Clase_Suelo_Registro : Submodelo_Insumos_SNR_V1_0.SNR_ClasePredioRegistroTipo;\r\n      /** Es la matrícula por la cual se dio apertura al predio objeto de estudio (la madre).\r\n       */\r\n      !!@ ili2db.dispName = "Matrícula inmobiliaria matriz"\r\n      Matricula_Inmobiliaria_Matriz : BAG {0..*} OF Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_EstructuraMatriculaMatriz;\r\n      /** Fecha de la generación de datos.\r\n       */\r\n      !!@ ili2db.dispName = "Fecha de datos"\r\n      Fecha_Datos : MANDATORY INTERLIS.XMLDate;\r\n    END SNR_PredioRegistro;\r\n\r\n    ASSOCIATION snr_derecho_fuente_derecho =\r\n      snr_derecho -- {1..*} SNR_Derecho;\r\n      snr_fuente_derecho -- {1} SNR_FuenteDerecho;\r\n    END snr_derecho_fuente_derecho;\r\n\r\n    /** Datos del titular del derecho con relación al porcentaje de participación en el derecho\r\n     */\r\n    ASSOCIATION snr_titular_derecho =\r\n      snr_titular -- {1..*} SNR_Titular;\r\n      snr_derecho -- {1..*} SNR_Derecho;\r\n      Porcentaje_Participacion : TEXT*100;\r\n    END snr_titular_derecho;\r\n\r\n    ASSOCIATION snr_derecho_predio =\r\n      snr_predio_registro -- {1} SNR_PredioRegistro;\r\n      snr_derecho -- {1..*} SNR_Derecho;\r\n    END snr_derecho_predio;\r\n\r\n    ASSOCIATION snr_predio_registro_fuente_cabidalinderos =\r\n      snr_predio_registro -- {0..*} SNR_PredioRegistro;\r\n      snr_fuente_cabidalinderos -- {0..1} SNR_FuenteCabidaLinderos;\r\n    END snr_predio_registro_fuente_cabidalinderos;\r\n\r\n  END Datos_SNR;\r\n\r\nEND Submodelo_Insumos_SNR_V1_0.\r\n\r\nMODEL Submodelo_Integracion_Insumos_V1_0 (es)\r\nAT "mailto:PC4@localhost"\r\nVERSION "2019-09-06"  =\r\n  IMPORTS Submodelo_Insumos_Gestor_Catastral_V1_0,Submodelo_Insumos_SNR_V1_0;\r\n\r\n  DOMAIN\r\n\r\n    INI_EmparejamientoTipo = (\r\n      /** FMI SNR - Matricula Inmobiliaria IGAC ; Número Predial IGAC - Número predial SNR ; Número predial Anterior IGAC - Número predial Anterior SNR\r\n       */\r\n      !!@ ili2db.dispName = "Tipo 1"\r\n      Tipo_1,\r\n      /** FMI SNR - Matricula Inmobiliaria IGAC ; Número Predial IGAC - Número predial SNR\r\n       */\r\n      !!@ ili2db.dispName = "Tipo 2"\r\n      Tipo_2,\r\n      /** FMI SNR - Matricula Inmobiliaria IGAC ; Número predial Anterior IGAC - Número predial Anterior SNR\r\n       */\r\n      !!@ ili2db.dispName = "Tipo 3"\r\n      Tipo_3,\r\n      /** FMI SNR - Matricula Inmobiliaria IGAC ; Número Predial IGAC - Número predial Anterior SNR\r\n       */\r\n      !!@ ili2db.dispName = "Tipo 4"\r\n      Tipo_4,\r\n      /** FMI SNR - Matricula Inmobiliaria IGAC ; Número predial Anterior IGAC - Número predial SNR\r\n       */\r\n      !!@ ili2db.dispName = "Tipo 5"\r\n      Tipo_5,\r\n      /** Número Predial IGAC - Número predial SNR ; Número predial Anterior IGAC - Número predial Anterior SNR\r\n       */\r\n      !!@ ili2db.dispName = "Tipo 6"\r\n      Tipo_6,\r\n      /** Número Predial IGAC - Número predial SNR\r\n       */\r\n      !!@ ili2db.dispName = "Tipo 7"\r\n      Tipo_7,\r\n      /** Número predial Anterior IGAC - Número predial Anterior SNR\r\n       */\r\n      !!@ ili2db.dispName = "Tipo 8"\r\n      Tipo_8,\r\n      /** Número Predial IGAC - Número predial Anterior SNR\r\n       */\r\n      !!@ ili2db.dispName = "Tipo 9"\r\n      Tipo_9,\r\n      /** Número predial Anterior IGAC - Número predial SNR\r\n       */\r\n      !!@ ili2db.dispName = "Tipo 10"\r\n      Tipo_10,\r\n      /** FMI SNR - Matricula Inmobiliaria IGAC\r\n       */\r\n      !!@ ili2db.dispName = "Tipo 11"\r\n      Tipo_11\r\n    );\r\n\r\n  TOPIC Datos_Integracion_Insumos =\r\n    DEPENDS ON Submodelo_Insumos_SNR_V1_0.Datos_SNR,Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral;\r\n\r\n    /** Clase que relaciona los predios en los modelos de insumos para el Gestor Catastral y la SNR.\r\n     */\r\n    !!@ ili2db.dispName = "(Integración Insumos) Predio Insumos"\r\n    CLASS INI_PredioInsumos =\r\n      /** Tipo de emparejamiento de insumos Catastro-Registro\r\n       */\r\n      !!@ ili2db.dispName = "Tipo de emparejamiento"\r\n      Tipo_Emparejamiento : Submodelo_Integracion_Insumos_V1_0.INI_EmparejamientoTipo;\r\n      /** Observaciones de la relación.\r\n       */\r\n      !!@ ili2db.dispName = "Observaciones"\r\n      Observaciones : TEXT;\r\n    END INI_PredioInsumos;\r\n\r\n    ASSOCIATION ini_predio_integracion_gc =\r\n      gc_predio_catastro (EXTERNAL) -- {0..1} Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_PredioCatastro;\r\n      ini_predio_insumos -- {0..*} INI_PredioInsumos;\r\n    END ini_predio_integracion_gc;\r\n\r\n    ASSOCIATION ini_predio_integracion_snr =\r\n      snr_predio_juridico (EXTERNAL) -- {0..1} Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_PredioRegistro;\r\n      ini_predio -- {0..*} INI_PredioInsumos;\r\n    END ini_predio_integracion_snr;\r\n\r\n  END Datos_Integracion_Insumos;\r\n\r\nEND Submodelo_Integracion_Insumos_V1_0.\r\n	2020-07-22 11:12:04.283
\.


--
-- TOC entry 6542 (class 0 OID 376254)
-- Dependencies: 832
-- Data for Name: t_ili2db_settings; Type: TABLE DATA; Schema: test_ladm_integration; Owner: postgres
--

COPY test_ladm_integration.t_ili2db_settings (tag, setting) FROM stdin;
ch.ehi.ili2db.createMetaInfo	True
ch.ehi.ili2db.beautifyEnumDispName	underscore
ch.ehi.ili2db.arrayTrafo	coalesce
ch.ehi.ili2db.localisedTrafo	expand
ch.ehi.ili2db.createTypeConstraint	True
ch.ehi.ili2db.numericCheckConstraints	create
ch.ehi.ili2db.sender	ili2pg-4.4.3-658b7daf37ba45ed2330ca3e3a3c3d59c96e91fa
ch.ehi.ili2db.createForeignKey	yes
ch.ehi.sqlgen.createGeomIndex	True
ch.ehi.ili2db.defaultSrsAuthority	EPSG
ch.ehi.ili2db.defaultSrsCode	9377
ch.ehi.ili2db.uuidDefaultValue	uuid_generate_v4()
ch.ehi.ili2db.StrokeArcs	enable
ch.ehi.ili2db.multiLineTrafo	coalesce
ch.interlis.ili2c.ilidirs	/home/ai/.local/share/QGIS/QGIS3/profiles/dev/python/plugins/asistente_ladm_col/resources/models
ch.ehi.ili2db.TidHandling	property
ch.ehi.ili2db.createForeignKeyIndex	yes
ch.ehi.ili2db.jsonTrafo	coalesce
ch.ehi.ili2db.createEnumDefs	multiTableWithId
ch.ehi.ili2db.uniqueConstraints	create
ch.ehi.ili2db.maxSqlNameLength	60
ch.ehi.ili2db.inheritanceTrafo	smart2
ch.ehi.ili2db.catalogueRefTrafo	coalesce
ch.ehi.ili2db.multiPointTrafo	coalesce
ch.ehi.ili2db.multiSurfaceTrafo	coalesce
ch.ehi.ili2db.multilingualTrafo	expand
\.


--
-- TOC entry 6557 (class 0 OID 376379)
-- Dependencies: 847
-- Data for Name: t_ili2db_table_prop; Type: TABLE DATA; Schema: test_ladm_integration; Owner: postgres
--

COPY test_ladm_integration.t_ili2db_table_prop (tablename, tag, setting) FROM stdin;
gc_sistemaprocedenciadatostipo	ch.ehi.ili2db.tableKind	ENUM
gc_calificacionunidadconstruccion	ch.ehi.ili2db.tableKind	CLASS
gc_calificacionunidadconstruccion	ch.ehi.ili2db.dispName	(GC) Calificación unidad de construcción
gm_surface3dlistvalue	ch.ehi.ili2db.tableKind	STRUCTURE
snr_documentotitulartipo	ch.ehi.ili2db.tableKind	ENUM
gc_terreno	ch.ehi.ili2db.tableKind	CLASS
gc_terreno	ch.ehi.ili2db.dispName	(GC) Terreno
ini_predioinsumos	ch.ehi.ili2db.tableKind	CLASS
ini_predioinsumos	ch.ehi.ili2db.dispName	(Integración Insumos) Predio Insumos
snr_fuentetipo	ch.ehi.ili2db.tableKind	ENUM
gc_unidadconstrucciontipo	ch.ehi.ili2db.tableKind	ENUM
gc_direccion	ch.ehi.ili2db.tableKind	STRUCTURE
gc_direccion	ch.ehi.ili2db.dispName	(GC) Dirección
gc_vereda	ch.ehi.ili2db.tableKind	CLASS
gc_vereda	ch.ehi.ili2db.dispName	(GC) Vereda
gc_comisionesterreno	ch.ehi.ili2db.tableKind	CLASS
gc_comisionesterreno	ch.ehi.ili2db.dispName	(GC) Comisiones Terreno
gc_sectorrural	ch.ehi.ili2db.tableKind	CLASS
gc_sectorrural	ch.ehi.ili2db.dispName	(GC) Sector Rural
gc_propietario	ch.ehi.ili2db.tableKind	CLASS
gc_propietario	ch.ehi.ili2db.dispName	(GC) Propietario
gc_unidadconstruccion	ch.ehi.ili2db.tableKind	CLASS
gc_unidadconstruccion	ch.ehi.ili2db.dispName	(GC) Unidad Construcción
gm_multisurface2d	ch.ehi.ili2db.tableKind	STRUCTURE
snr_fuentecabidalinderos	ch.ehi.ili2db.tableKind	CLASS
snr_fuentecabidalinderos	ch.ehi.ili2db.dispName	(SNR) Fuente Cabida Linderos
snr_predioregistro	ch.ehi.ili2db.tableKind	CLASS
snr_predioregistro	ch.ehi.ili2db.dispName	(SNR) Predio Registro
gc_perimetro	ch.ehi.ili2db.tableKind	CLASS
gc_perimetro	ch.ehi.ili2db.dispName	(GC) Perímetro
snr_titular_derecho	ch.ehi.ili2db.tableKind	ASSOCIATION
snr_calidadderechotipo	ch.ehi.ili2db.tableKind	ENUM
gc_estadopredio	ch.ehi.ili2db.tableKind	STRUCTURE
gc_estadopredio	ch.ehi.ili2db.dispName	(GC) EstadoPredio
gc_datostorreph	ch.ehi.ili2db.tableKind	CLASS
gc_datostorreph	ch.ehi.ili2db.dispName	(GC) Datos torre PH
snr_fuentederecho	ch.ehi.ili2db.tableKind	CLASS
snr_fuentederecho	ch.ehi.ili2db.dispName	(SNR) Fuente Derecho
gc_copropiedad	ch.ehi.ili2db.tableKind	ASSOCIATION
gc_prediocatastro	ch.ehi.ili2db.tableKind	CLASS
gc_prediocatastro	ch.ehi.ili2db.dispName	(GC) Predio Catastro
gc_sectorurbano	ch.ehi.ili2db.tableKind	CLASS
gc_sectorurbano	ch.ehi.ili2db.dispName	(GC) Sector Urbano
gm_surface2dlistvalue	ch.ehi.ili2db.tableKind	STRUCTURE
gc_condicionprediotipo	ch.ehi.ili2db.tableKind	ENUM
gc_construccion	ch.ehi.ili2db.tableKind	CLASS
gc_construccion	ch.ehi.ili2db.dispName	(GC) Construcción
gc_comisionesconstruccion	ch.ehi.ili2db.tableKind	CLASS
gc_comisionesconstruccion	ch.ehi.ili2db.dispName	(GC) Comisiones Construcción
gc_datosphcondominio	ch.ehi.ili2db.tableKind	CLASS
gc_datosphcondominio	ch.ehi.ili2db.dispName	(GC) Datos Propiedad Horizontal Condominio
snr_titular	ch.ehi.ili2db.tableKind	CLASS
snr_titular	ch.ehi.ili2db.dispName	(SNR) Titular
extarchivo	ch.ehi.ili2db.tableKind	STRUCTURE
extarchivo	ch.ehi.ili2db.dispName	Archivo fuente
snr_clasepredioregistrotipo	ch.ehi.ili2db.tableKind	ENUM
gc_manzana	ch.ehi.ili2db.tableKind	CLASS
gc_manzana	ch.ehi.ili2db.dispName	(GC) Manzana
snr_estructuramatriculamatriz	ch.ehi.ili2db.tableKind	STRUCTURE
snr_estructuramatriculamatriz	ch.ehi.ili2db.dispName	(SNR) Estructura Matrícula Matriz
gm_multisurface3d	ch.ehi.ili2db.tableKind	STRUCTURE
snr_personatitulartipo	ch.ehi.ili2db.tableKind	ENUM
gc_barrio	ch.ehi.ili2db.tableKind	CLASS
gc_barrio	ch.ehi.ili2db.dispName	(GC) Barrio
snr_derecho	ch.ehi.ili2db.tableKind	CLASS
snr_derecho	ch.ehi.ili2db.dispName	(SNR) Derecho
ini_emparejamientotipo	ch.ehi.ili2db.tableKind	ENUM
gc_comisionesunidadconstruccion	ch.ehi.ili2db.tableKind	CLASS
gc_comisionesunidadconstruccion	ch.ehi.ili2db.dispName	(GC) Comisiones Unidad Construcción
\.


--
-- TOC entry 6543 (class 0 OID 376262)
-- Dependencies: 833
-- Data for Name: t_ili2db_trafo; Type: TABLE DATA; Schema: test_ladm_integration; Owner: postgres
--

COPY test_ladm_integration.t_ili2db_trafo (iliname, tag, setting) FROM stdin;
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_ComisionesTerreno	ch.ehi.ili2db.inheritance	newAndSubClass
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Barrio	ch.ehi.ili2db.inheritance	newAndSubClass
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_ComisionesTerreno.Geometria	ch.ehi.ili2db.multiSurfaceTrafo	coalesce
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_EstadoPredio	ch.ehi.ili2db.inheritance	newAndSubClass
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_construccion_predio	ch.ehi.ili2db.inheritance	embedded
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_SectorUrbano	ch.ehi.ili2db.inheritance	newAndSubClass
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Vereda.Geometria	ch.ehi.ili2db.multiSurfaceTrafo	coalesce
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_terreno_predio	ch.ehi.ili2db.inheritance	embedded
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Perimetro.Geometria	ch.ehi.ili2db.multiSurfaceTrafo	coalesce
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_SectorUrbano.Geometria	ch.ehi.ili2db.multiSurfaceTrafo	coalesce
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_EstructuraMatriculaMatriz	ch.ehi.ili2db.inheritance	newAndSubClass
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_ComisionesUnidadConstruccion.Geometria	ch.ehi.ili2db.multiSurfaceTrafo	coalesce
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Terreno	ch.ehi.ili2db.inheritance	newAndSubClass
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_CalificacionUnidadConstruccion	ch.ehi.ili2db.inheritance	newAndSubClass
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_DatosPHCondominio	ch.ehi.ili2db.inheritance	newAndSubClass
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Barrio.Geometria	ch.ehi.ili2db.multiSurfaceTrafo	coalesce
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Terreno.Geometria	ch.ehi.ili2db.multiSurfaceTrafo	coalesce
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_ComisionesUnidadConstruccion	ch.ehi.ili2db.inheritance	newAndSubClass
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Manzana.Geometria	ch.ehi.ili2db.multiSurfaceTrafo	coalesce
ISO19107_PLANAS_V3_0.GM_MultiSurface3D	ch.ehi.ili2db.inheritance	newAndSubClass
LADM_COL_V3_0.LADM_Nucleo.ExtArchivo	ch.ehi.ili2db.inheritance	newAndSubClass
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_construccion_unidad	ch.ehi.ili2db.inheritance	embedded
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_copropiedad	ch.ehi.ili2db.inheritance	newAndSubClass
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Vereda	ch.ehi.ili2db.inheritance	newAndSubClass
ISO19107_PLANAS_V3_0.GM_Surface2DListValue	ch.ehi.ili2db.inheritance	newAndSubClass
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_propietario_predio	ch.ehi.ili2db.inheritance	embedded
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_Derecho	ch.ehi.ili2db.inheritance	newAndSubClass
Submodelo_Integracion_Insumos_V1_0.Datos_Integracion_Insumos.ini_predio_integracion_gc	ch.ehi.ili2db.inheritance	embedded
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_SectorRural	ch.ehi.ili2db.inheritance	newAndSubClass
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_ph_predio	ch.ehi.ili2db.inheritance	embedded
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_DatosTorrePH	ch.ehi.ili2db.inheritance	newAndSubClass
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Perimetro	ch.ehi.ili2db.inheritance	newAndSubClass
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_ComisionesConstruccion	ch.ehi.ili2db.inheritance	newAndSubClass
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion	ch.ehi.ili2db.inheritance	newAndSubClass
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Construccion	ch.ehi.ili2db.inheritance	newAndSubClass
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_unidadconstruccion_calificacionunidadconstruccion	ch.ehi.ili2db.inheritance	embedded
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Direccion	ch.ehi.ili2db.inheritance	newAndSubClass
ISO19107_PLANAS_V3_0.GM_MultiSurface2D	ch.ehi.ili2db.inheritance	newAndSubClass
ISO19107_PLANAS_V3_0.GM_Surface3DListValue	ch.ehi.ili2db.inheritance	newAndSubClass
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_PredioRegistro	ch.ehi.ili2db.inheritance	newAndSubClass
Submodelo_Insumos_SNR_V1_0.Datos_SNR.snr_derecho_fuente_derecho	ch.ehi.ili2db.inheritance	embedded
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_ComisionesConstruccion.Geometria	ch.ehi.ili2db.multiSurfaceTrafo	coalesce
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_UnidadConstruccion.Geometria	ch.ehi.ili2db.multiSurfaceTrafo	coalesce
Submodelo_Insumos_SNR_V1_0.Datos_SNR.snr_predio_registro_fuente_cabidalinderos	ch.ehi.ili2db.inheritance	embedded
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.gc_datosphcondominio_datostorreph	ch.ehi.ili2db.inheritance	embedded
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_FuenteDerecho	ch.ehi.ili2db.inheritance	newAndSubClass
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_Titular	ch.ehi.ili2db.inheritance	newAndSubClass
Submodelo_Insumos_SNR_V1_0.Datos_SNR.snr_derecho_predio	ch.ehi.ili2db.inheritance	embedded
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_SectorRural.Geometria	ch.ehi.ili2db.multiSurfaceTrafo	coalesce
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Construccion.Geometria	ch.ehi.ili2db.multiSurfaceTrafo	coalesce
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Manzana	ch.ehi.ili2db.inheritance	newAndSubClass
Submodelo_Integracion_Insumos_V1_0.Datos_Integracion_Insumos.INI_PredioInsumos	ch.ehi.ili2db.inheritance	newAndSubClass
Submodelo_Insumos_SNR_V1_0.Datos_SNR.snr_titular_derecho	ch.ehi.ili2db.inheritance	newAndSubClass
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_Propietario	ch.ehi.ili2db.inheritance	newAndSubClass
Submodelo_Insumos_SNR_V1_0.Datos_SNR.SNR_FuenteCabidaLinderos	ch.ehi.ili2db.inheritance	newAndSubClass
Submodelo_Integracion_Insumos_V1_0.Datos_Integracion_Insumos.ini_predio_integracion_snr	ch.ehi.ili2db.inheritance	embedded
Submodelo_Insumos_Gestor_Catastral_V1_0.Datos_Gestor_Catastral.GC_PredioCatastro	ch.ehi.ili2db.inheritance	newAndSubClass
\.


--
-- TOC entry 6732 (class 0 OID 0)
-- Dependencies: 795
-- Name: t_ili2db_seq; Type: SEQUENCE SET; Schema: test_ladm_integration; Owner: postgres
--

SELECT pg_catalog.setval('test_ladm_integration.t_ili2db_seq', 48, true);


--
-- TOC entry 6207 (class 2606 OID 375956)
-- Name: extarchivo extarchivo_pkey; Type: CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.extarchivo
    ADD CONSTRAINT extarchivo_pkey PRIMARY KEY (t_id);


--
-- TOC entry 6211 (class 2606 OID 375966)
-- Name: gc_barrio gc_barrio_pkey; Type: CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.gc_barrio
    ADD CONSTRAINT gc_barrio_pkey PRIMARY KEY (t_id);


--
-- TOC entry 6213 (class 2606 OID 375976)
-- Name: gc_calificacionunidadconstruccion gc_calificacionunidadconstruccion_pkey; Type: CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.gc_calificacionunidadconstruccion
    ADD CONSTRAINT gc_calificacionunidadconstruccion_pkey PRIMARY KEY (t_id);


--
-- TOC entry 6217 (class 2606 OID 375986)
-- Name: gc_comisionesconstruccion gc_comisionesconstruccion_pkey; Type: CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.gc_comisionesconstruccion
    ADD CONSTRAINT gc_comisionesconstruccion_pkey PRIMARY KEY (t_id);


--
-- TOC entry 6220 (class 2606 OID 375996)
-- Name: gc_comisionesterreno gc_comisionesterreno_pkey; Type: CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.gc_comisionesterreno
    ADD CONSTRAINT gc_comisionesterreno_pkey PRIMARY KEY (t_id);


--
-- TOC entry 6223 (class 2606 OID 376006)
-- Name: gc_comisionesunidadconstruccion gc_comisionesunidadconstruccion_pkey; Type: CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.gc_comisionesunidadconstruccion
    ADD CONSTRAINT gc_comisionesunidadconstruccion_pkey PRIMARY KEY (t_id);


--
-- TOC entry 6333 (class 2606 OID 376329)
-- Name: gc_condicionprediotipo gc_condicionprediotipo_pkey; Type: CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.gc_condicionprediotipo
    ADD CONSTRAINT gc_condicionprediotipo_pkey PRIMARY KEY (t_id);


--
-- TOC entry 6227 (class 2606 OID 376016)
-- Name: gc_construccion gc_construccion_pkey; Type: CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.gc_construccion
    ADD CONSTRAINT gc_construccion_pkey PRIMARY KEY (t_id);


--
-- TOC entry 6277 (class 2606 OID 376151)
-- Name: gc_copropiedad gc_copropiedad_pkey; Type: CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.gc_copropiedad
    ADD CONSTRAINT gc_copropiedad_pkey PRIMARY KEY (t_id);


--
-- TOC entry 6231 (class 2606 OID 376025)
-- Name: gc_datosphcondominio gc_datosphcondominio_pkey; Type: CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.gc_datosphcondominio
    ADD CONSTRAINT gc_datosphcondominio_pkey PRIMARY KEY (t_id);


--
-- TOC entry 6234 (class 2606 OID 376032)
-- Name: gc_datostorreph gc_datostorreph_pkey; Type: CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.gc_datostorreph
    ADD CONSTRAINT gc_datostorreph_pkey PRIMARY KEY (t_id);


--
-- TOC entry 6238 (class 2606 OID 376042)
-- Name: gc_direccion gc_direccion_pkey; Type: CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.gc_direccion
    ADD CONSTRAINT gc_direccion_pkey PRIMARY KEY (t_id);


--
-- TOC entry 6241 (class 2606 OID 376050)
-- Name: gc_estadopredio gc_estadopredio_pkey; Type: CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.gc_estadopredio
    ADD CONSTRAINT gc_estadopredio_pkey PRIMARY KEY (t_id);


--
-- TOC entry 6244 (class 2606 OID 376060)
-- Name: gc_manzana gc_manzana_pkey; Type: CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.gc_manzana
    ADD CONSTRAINT gc_manzana_pkey PRIMARY KEY (t_id);


--
-- TOC entry 6247 (class 2606 OID 376070)
-- Name: gc_perimetro gc_perimetro_pkey; Type: CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.gc_perimetro
    ADD CONSTRAINT gc_perimetro_pkey PRIMARY KEY (t_id);


--
-- TOC entry 6271 (class 2606 OID 376143)
-- Name: gc_prediocatastro gc_prediocatastro_pkey; Type: CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.gc_prediocatastro
    ADD CONSTRAINT gc_prediocatastro_pkey PRIMARY KEY (t_id);


--
-- TOC entry 6250 (class 2606 OID 376080)
-- Name: gc_propietario gc_propietario_pkey; Type: CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.gc_propietario
    ADD CONSTRAINT gc_propietario_pkey PRIMARY KEY (t_id);


--
-- TOC entry 6253 (class 2606 OID 376090)
-- Name: gc_sectorrural gc_sectorrural_pkey; Type: CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.gc_sectorrural
    ADD CONSTRAINT gc_sectorrural_pkey PRIMARY KEY (t_id);


--
-- TOC entry 6256 (class 2606 OID 376100)
-- Name: gc_sectorurbano gc_sectorurbano_pkey; Type: CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.gc_sectorurbano
    ADD CONSTRAINT gc_sectorurbano_pkey PRIMARY KEY (t_id);


--
-- TOC entry 6329 (class 2606 OID 376311)
-- Name: gc_sistemaprocedenciadatostipo gc_sistemaprocedenciadatostipo_pkey; Type: CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.gc_sistemaprocedenciadatostipo
    ADD CONSTRAINT gc_sistemaprocedenciadatostipo_pkey PRIMARY KEY (t_id);


--
-- TOC entry 6260 (class 2606 OID 376110)
-- Name: gc_terreno gc_terreno_pkey; Type: CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.gc_terreno
    ADD CONSTRAINT gc_terreno_pkey PRIMARY KEY (t_id);


--
-- TOC entry 6264 (class 2606 OID 376121)
-- Name: gc_unidadconstruccion gc_unidadconstruccion_pkey; Type: CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.gc_unidadconstruccion
    ADD CONSTRAINT gc_unidadconstruccion_pkey PRIMARY KEY (t_id);


--
-- TOC entry 6327 (class 2606 OID 376302)
-- Name: gc_unidadconstrucciontipo gc_unidadconstrucciontipo_pkey; Type: CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.gc_unidadconstrucciontipo
    ADD CONSTRAINT gc_unidadconstrucciontipo_pkey PRIMARY KEY (t_id);


--
-- TOC entry 6268 (class 2606 OID 376133)
-- Name: gc_vereda gc_vereda_pkey; Type: CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.gc_vereda
    ADD CONSTRAINT gc_vereda_pkey PRIMARY KEY (t_id);


--
-- TOC entry 6199 (class 2606 OID 375930)
-- Name: gm_multisurface2d gm_multisurface2d_pkey; Type: CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.gm_multisurface2d
    ADD CONSTRAINT gm_multisurface2d_pkey PRIMARY KEY (t_id);


--
-- TOC entry 6205 (class 2606 OID 375947)
-- Name: gm_multisurface3d gm_multisurface3d_pkey; Type: CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.gm_multisurface3d
    ADD CONSTRAINT gm_multisurface3d_pkey PRIMARY KEY (t_id);


--
-- TOC entry 6197 (class 2606 OID 375922)
-- Name: gm_surface2dlistvalue gm_surface2dlistvalue_pkey; Type: CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.gm_surface2dlistvalue
    ADD CONSTRAINT gm_surface2dlistvalue_pkey PRIMARY KEY (t_id);


--
-- TOC entry 6203 (class 2606 OID 375939)
-- Name: gm_surface3dlistvalue gm_surface3dlistvalue_pkey; Type: CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.gm_surface3dlistvalue
    ADD CONSTRAINT gm_surface3dlistvalue_pkey PRIMARY KEY (t_id);


--
-- TOC entry 6323 (class 2606 OID 376284)
-- Name: ini_emparejamientotipo ini_emparejamientotipo_pkey; Type: CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.ini_emparejamientotipo
    ADD CONSTRAINT ini_emparejamientotipo_pkey PRIMARY KEY (t_id);


--
-- TOC entry 6306 (class 2606 OID 376228)
-- Name: ini_predioinsumos ini_predioinsumos_pkey; Type: CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.ini_predioinsumos
    ADD CONSTRAINT ini_predioinsumos_pkey PRIMARY KEY (t_id);


--
-- TOC entry 6337 (class 2606 OID 376347)
-- Name: snr_calidadderechotipo snr_calidadderechotipo_pkey; Type: CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.snr_calidadderechotipo
    ADD CONSTRAINT snr_calidadderechotipo_pkey PRIMARY KEY (t_id);


--
-- TOC entry 6331 (class 2606 OID 376320)
-- Name: snr_clasepredioregistrotipo snr_clasepredioregistrotipo_pkey; Type: CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.snr_clasepredioregistrotipo
    ADD CONSTRAINT snr_clasepredioregistrotipo_pkey PRIMARY KEY (t_id);


--
-- TOC entry 6280 (class 2606 OID 376159)
-- Name: snr_derecho snr_derecho_pkey; Type: CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.snr_derecho
    ADD CONSTRAINT snr_derecho_pkey PRIMARY KEY (t_id);


--
-- TOC entry 6325 (class 2606 OID 376293)
-- Name: snr_documentotitulartipo snr_documentotitulartipo_pkey; Type: CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.snr_documentotitulartipo
    ADD CONSTRAINT snr_documentotitulartipo_pkey PRIMARY KEY (t_id);


--
-- TOC entry 6285 (class 2606 OID 376168)
-- Name: snr_estructuramatriculamatriz snr_estructuramatriculamatriz_pkey; Type: CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.snr_estructuramatriculamatriz
    ADD CONSTRAINT snr_estructuramatriculamatriz_pkey PRIMARY KEY (t_id);


--
-- TOC entry 6287 (class 2606 OID 376178)
-- Name: snr_fuentecabidalinderos snr_fuentecabidalinderos_pkey; Type: CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.snr_fuentecabidalinderos
    ADD CONSTRAINT snr_fuentecabidalinderos_pkey PRIMARY KEY (t_id);


--
-- TOC entry 6290 (class 2606 OID 376188)
-- Name: snr_fuentederecho snr_fuentederecho_pkey; Type: CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.snr_fuentederecho
    ADD CONSTRAINT snr_fuentederecho_pkey PRIMARY KEY (t_id);


--
-- TOC entry 6335 (class 2606 OID 376338)
-- Name: snr_fuentetipo snr_fuentetipo_pkey; Type: CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.snr_fuentetipo
    ADD CONSTRAINT snr_fuentetipo_pkey PRIMARY KEY (t_id);


--
-- TOC entry 6339 (class 2606 OID 376356)
-- Name: snr_personatitulartipo snr_personatitulartipo_pkey; Type: CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.snr_personatitulartipo
    ADD CONSTRAINT snr_personatitulartipo_pkey PRIMARY KEY (t_id);


--
-- TOC entry 6298 (class 2606 OID 376209)
-- Name: snr_predioregistro snr_predioregistro_pkey; Type: CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.snr_predioregistro
    ADD CONSTRAINT snr_predioregistro_pkey PRIMARY KEY (t_id);


--
-- TOC entry 6301 (class 2606 OID 376217)
-- Name: snr_titular_derecho snr_titular_derecho_pkey; Type: CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.snr_titular_derecho
    ADD CONSTRAINT snr_titular_derecho_pkey PRIMARY KEY (t_id);


--
-- TOC entry 6293 (class 2606 OID 376198)
-- Name: snr_titular snr_titular_pkey; Type: CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.snr_titular
    ADD CONSTRAINT snr_titular_pkey PRIMARY KEY (t_id);


--
-- TOC entry 6343 (class 2606 OID 376372)
-- Name: t_ili2db_attrname t_ili2db_attrname_pkey; Type: CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.t_ili2db_attrname
    ADD CONSTRAINT t_ili2db_attrname_pkey PRIMARY KEY (sqlname, colowner);


--
-- TOC entry 6311 (class 2606 OID 376239)
-- Name: t_ili2db_basket t_ili2db_basket_pkey; Type: CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.t_ili2db_basket
    ADD CONSTRAINT t_ili2db_basket_pkey PRIMARY KEY (t_id);


--
-- TOC entry 6341 (class 2606 OID 376364)
-- Name: t_ili2db_classname t_ili2db_classname_pkey; Type: CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.t_ili2db_classname
    ADD CONSTRAINT t_ili2db_classname_pkey PRIMARY KEY (iliname);


--
-- TOC entry 6314 (class 2606 OID 376245)
-- Name: t_ili2db_dataset t_ili2db_dataset_pkey; Type: CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.t_ili2db_dataset
    ADD CONSTRAINT t_ili2db_dataset_pkey PRIMARY KEY (t_id);


--
-- TOC entry 6316 (class 2606 OID 376253)
-- Name: t_ili2db_inheritance t_ili2db_inheritance_pkey; Type: CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.t_ili2db_inheritance
    ADD CONSTRAINT t_ili2db_inheritance_pkey PRIMARY KEY (thisclass);


--
-- TOC entry 6321 (class 2606 OID 376275)
-- Name: t_ili2db_model t_ili2db_model_pkey; Type: CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.t_ili2db_model
    ADD CONSTRAINT t_ili2db_model_pkey PRIMARY KEY (iliversion, modelname);


--
-- TOC entry 6318 (class 2606 OID 376261)
-- Name: t_ili2db_settings t_ili2db_settings_pkey; Type: CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.t_ili2db_settings
    ADD CONSTRAINT t_ili2db_settings_pkey PRIMARY KEY (tag);


--
-- TOC entry 6208 (class 1259 OID 375957)
-- Name: extarchivo_snr_fuentecabdlndrs_rchivo_idx; Type: INDEX; Schema: test_ladm_integration; Owner: postgres
--

CREATE INDEX extarchivo_snr_fuentecabdlndrs_rchivo_idx ON test_ladm_integration.extarchivo USING btree (snr_fuentecabidalndros_archivo);


--
-- TOC entry 6209 (class 1259 OID 375967)
-- Name: gc_barrio_geometria_idx; Type: INDEX; Schema: test_ladm_integration; Owner: postgres
--

CREATE INDEX gc_barrio_geometria_idx ON test_ladm_integration.gc_barrio USING gist (geometria);


--
-- TOC entry 6214 (class 1259 OID 375977)
-- Name: gc_calificacnnddcnstrccion_gc_unidadconstruccion_idx; Type: INDEX; Schema: test_ladm_integration; Owner: postgres
--

CREATE INDEX gc_calificacnnddcnstrccion_gc_unidadconstruccion_idx ON test_ladm_integration.gc_calificacionunidadconstruccion USING btree (gc_unidadconstruccion);


--
-- TOC entry 6215 (class 1259 OID 375987)
-- Name: gc_comisionesconstruccion_geometria_idx; Type: INDEX; Schema: test_ladm_integration; Owner: postgres
--

CREATE INDEX gc_comisionesconstruccion_geometria_idx ON test_ladm_integration.gc_comisionesconstruccion USING gist (geometria);


--
-- TOC entry 6221 (class 1259 OID 376007)
-- Name: gc_comisionesnddcnstrccion_geometria_idx; Type: INDEX; Schema: test_ladm_integration; Owner: postgres
--

CREATE INDEX gc_comisionesnddcnstrccion_geometria_idx ON test_ladm_integration.gc_comisionesunidadconstruccion USING gist (geometria);


--
-- TOC entry 6218 (class 1259 OID 375997)
-- Name: gc_comisionesterreno_geometria_idx; Type: INDEX; Schema: test_ladm_integration; Owner: postgres
--

CREATE INDEX gc_comisionesterreno_geometria_idx ON test_ladm_integration.gc_comisionesterreno USING gist (geometria);


--
-- TOC entry 6224 (class 1259 OID 376019)
-- Name: gc_construccion_gc_predio_idx; Type: INDEX; Schema: test_ladm_integration; Owner: postgres
--

CREATE INDEX gc_construccion_gc_predio_idx ON test_ladm_integration.gc_construccion USING btree (gc_predio);


--
-- TOC entry 6225 (class 1259 OID 376018)
-- Name: gc_construccion_geometria_idx; Type: INDEX; Schema: test_ladm_integration; Owner: postgres
--

CREATE INDEX gc_construccion_geometria_idx ON test_ladm_integration.gc_construccion USING gist (geometria);


--
-- TOC entry 6228 (class 1259 OID 376017)
-- Name: gc_construccion_tipo_construccion_idx; Type: INDEX; Schema: test_ladm_integration; Owner: postgres
--

CREATE INDEX gc_construccion_tipo_construccion_idx ON test_ladm_integration.gc_construccion USING btree (tipo_construccion);


--
-- TOC entry 6273 (class 1259 OID 376152)
-- Name: gc_copropiedad_gc_matriz_idx; Type: INDEX; Schema: test_ladm_integration; Owner: postgres
--

CREATE INDEX gc_copropiedad_gc_matriz_idx ON test_ladm_integration.gc_copropiedad USING btree (gc_matriz);


--
-- TOC entry 6274 (class 1259 OID 376153)
-- Name: gc_copropiedad_gc_unidad_idx; Type: INDEX; Schema: test_ladm_integration; Owner: postgres
--

CREATE INDEX gc_copropiedad_gc_unidad_idx ON test_ladm_integration.gc_copropiedad USING btree (gc_unidad);


--
-- TOC entry 6275 (class 1259 OID 376501)
-- Name: gc_copropiedad_gc_unidad_key; Type: INDEX; Schema: test_ladm_integration; Owner: postgres
--

CREATE UNIQUE INDEX gc_copropiedad_gc_unidad_key ON test_ladm_integration.gc_copropiedad USING btree (gc_unidad);


--
-- TOC entry 6229 (class 1259 OID 376026)
-- Name: gc_datosphcondominio_gc_predio_idx; Type: INDEX; Schema: test_ladm_integration; Owner: postgres
--

CREATE INDEX gc_datosphcondominio_gc_predio_idx ON test_ladm_integration.gc_datosphcondominio USING btree (gc_predio);


--
-- TOC entry 6232 (class 1259 OID 376033)
-- Name: gc_datostorreph_gc_datosphcondominio_idx; Type: INDEX; Schema: test_ladm_integration; Owner: postgres
--

CREATE INDEX gc_datostorreph_gc_datosphcondominio_idx ON test_ladm_integration.gc_datostorreph USING btree (gc_datosphcondominio);


--
-- TOC entry 6235 (class 1259 OID 376044)
-- Name: gc_direccion_gc_prediocatastro_dirccnes_idx; Type: INDEX; Schema: test_ladm_integration; Owner: postgres
--

CREATE INDEX gc_direccion_gc_prediocatastro_dirccnes_idx ON test_ladm_integration.gc_direccion USING btree (gc_prediocatastro_direcciones);


--
-- TOC entry 6236 (class 1259 OID 376043)
-- Name: gc_direccion_geometria_referencia_idx; Type: INDEX; Schema: test_ladm_integration; Owner: postgres
--

CREATE INDEX gc_direccion_geometria_referencia_idx ON test_ladm_integration.gc_direccion USING gist (geometria_referencia);


--
-- TOC entry 6239 (class 1259 OID 376051)
-- Name: gc_estadopredio_gc_prediocatastr_std_prdio_idx; Type: INDEX; Schema: test_ladm_integration; Owner: postgres
--

CREATE INDEX gc_estadopredio_gc_prediocatastr_std_prdio_idx ON test_ladm_integration.gc_estadopredio USING btree (gc_prediocatastro_estado_predio);


--
-- TOC entry 6242 (class 1259 OID 376061)
-- Name: gc_manzana_geometria_idx; Type: INDEX; Schema: test_ladm_integration; Owner: postgres
--

CREATE INDEX gc_manzana_geometria_idx ON test_ladm_integration.gc_manzana USING gist (geometria);


--
-- TOC entry 6245 (class 1259 OID 376071)
-- Name: gc_perimetro_geometria_idx; Type: INDEX; Schema: test_ladm_integration; Owner: postgres
--

CREATE INDEX gc_perimetro_geometria_idx ON test_ladm_integration.gc_perimetro USING gist (geometria);


--
-- TOC entry 6269 (class 1259 OID 376144)
-- Name: gc_prediocatastro_condicion_predio_idx; Type: INDEX; Schema: test_ladm_integration; Owner: postgres
--

CREATE INDEX gc_prediocatastro_condicion_predio_idx ON test_ladm_integration.gc_prediocatastro USING btree (condicion_predio);


--
-- TOC entry 6272 (class 1259 OID 376145)
-- Name: gc_prediocatastro_sistema_procedencia_datos_idx; Type: INDEX; Schema: test_ladm_integration; Owner: postgres
--

CREATE INDEX gc_prediocatastro_sistema_procedencia_datos_idx ON test_ladm_integration.gc_prediocatastro USING btree (sistema_procedencia_datos);


--
-- TOC entry 6248 (class 1259 OID 376081)
-- Name: gc_propietario_gc_predio_catastro_idx; Type: INDEX; Schema: test_ladm_integration; Owner: postgres
--

CREATE INDEX gc_propietario_gc_predio_catastro_idx ON test_ladm_integration.gc_propietario USING btree (gc_predio_catastro);


--
-- TOC entry 6251 (class 1259 OID 376091)
-- Name: gc_sectorrural_geometria_idx; Type: INDEX; Schema: test_ladm_integration; Owner: postgres
--

CREATE INDEX gc_sectorrural_geometria_idx ON test_ladm_integration.gc_sectorrural USING gist (geometria);


--
-- TOC entry 6254 (class 1259 OID 376101)
-- Name: gc_sectorurbano_geometria_idx; Type: INDEX; Schema: test_ladm_integration; Owner: postgres
--

CREATE INDEX gc_sectorurbano_geometria_idx ON test_ladm_integration.gc_sectorurbano USING gist (geometria);


--
-- TOC entry 6257 (class 1259 OID 376112)
-- Name: gc_terreno_gc_predio_idx; Type: INDEX; Schema: test_ladm_integration; Owner: postgres
--

CREATE INDEX gc_terreno_gc_predio_idx ON test_ladm_integration.gc_terreno USING btree (gc_predio);


--
-- TOC entry 6258 (class 1259 OID 376111)
-- Name: gc_terreno_geometria_idx; Type: INDEX; Schema: test_ladm_integration; Owner: postgres
--

CREATE INDEX gc_terreno_geometria_idx ON test_ladm_integration.gc_terreno USING gist (geometria);


--
-- TOC entry 6261 (class 1259 OID 376124)
-- Name: gc_unidadconstruccion_gc_construccion_idx; Type: INDEX; Schema: test_ladm_integration; Owner: postgres
--

CREATE INDEX gc_unidadconstruccion_gc_construccion_idx ON test_ladm_integration.gc_unidadconstruccion USING btree (gc_construccion);


--
-- TOC entry 6262 (class 1259 OID 376123)
-- Name: gc_unidadconstruccion_geometria_idx; Type: INDEX; Schema: test_ladm_integration; Owner: postgres
--

CREATE INDEX gc_unidadconstruccion_geometria_idx ON test_ladm_integration.gc_unidadconstruccion USING gist (geometria);


--
-- TOC entry 6265 (class 1259 OID 376122)
-- Name: gc_unidadconstruccion_tipo_construccion_idx; Type: INDEX; Schema: test_ladm_integration; Owner: postgres
--

CREATE INDEX gc_unidadconstruccion_tipo_construccion_idx ON test_ladm_integration.gc_unidadconstruccion USING btree (tipo_construccion);


--
-- TOC entry 6266 (class 1259 OID 376134)
-- Name: gc_vereda_geometria_idx; Type: INDEX; Schema: test_ladm_integration; Owner: postgres
--

CREATE INDEX gc_vereda_geometria_idx ON test_ladm_integration.gc_vereda USING gist (geometria);


--
-- TOC entry 6194 (class 1259 OID 375923)
-- Name: gm_surface2dlistvalue_avalue_idx; Type: INDEX; Schema: test_ladm_integration; Owner: postgres
--

CREATE INDEX gm_surface2dlistvalue_avalue_idx ON test_ladm_integration.gm_surface2dlistvalue USING gist (avalue);


--
-- TOC entry 6195 (class 1259 OID 375924)
-- Name: gm_surface2dlistvalue_gm_multisurface2d_geometry_idx; Type: INDEX; Schema: test_ladm_integration; Owner: postgres
--

CREATE INDEX gm_surface2dlistvalue_gm_multisurface2d_geometry_idx ON test_ladm_integration.gm_surface2dlistvalue USING btree (gm_multisurface2d_geometry);


--
-- TOC entry 6200 (class 1259 OID 375940)
-- Name: gm_surface3dlistvalue_avalue_idx; Type: INDEX; Schema: test_ladm_integration; Owner: postgres
--

CREATE INDEX gm_surface3dlistvalue_avalue_idx ON test_ladm_integration.gm_surface3dlistvalue USING gist (avalue);


--
-- TOC entry 6201 (class 1259 OID 375941)
-- Name: gm_surface3dlistvalue_gm_multisurface3d_geometry_idx; Type: INDEX; Schema: test_ladm_integration; Owner: postgres
--

CREATE INDEX gm_surface3dlistvalue_gm_multisurface3d_geometry_idx ON test_ladm_integration.gm_surface3dlistvalue USING btree (gm_multisurface3d_geometry);


--
-- TOC entry 6304 (class 1259 OID 376230)
-- Name: ini_predioinsumos_gc_predio_catastro_idx; Type: INDEX; Schema: test_ladm_integration; Owner: postgres
--

CREATE INDEX ini_predioinsumos_gc_predio_catastro_idx ON test_ladm_integration.ini_predioinsumos USING btree (gc_predio_catastro);


--
-- TOC entry 6307 (class 1259 OID 376231)
-- Name: ini_predioinsumos_snr_predio_juridico_idx; Type: INDEX; Schema: test_ladm_integration; Owner: postgres
--

CREATE INDEX ini_predioinsumos_snr_predio_juridico_idx ON test_ladm_integration.ini_predioinsumos USING btree (snr_predio_juridico);


--
-- TOC entry 6308 (class 1259 OID 376229)
-- Name: ini_predioinsumos_tipo_emparejamiento_idx; Type: INDEX; Schema: test_ladm_integration; Owner: postgres
--

CREATE INDEX ini_predioinsumos_tipo_emparejamiento_idx ON test_ladm_integration.ini_predioinsumos USING btree (tipo_emparejamiento);


--
-- TOC entry 6278 (class 1259 OID 376160)
-- Name: snr_derecho_calidad_derecho_registro_idx; Type: INDEX; Schema: test_ladm_integration; Owner: postgres
--

CREATE INDEX snr_derecho_calidad_derecho_registro_idx ON test_ladm_integration.snr_derecho USING btree (calidad_derecho_registro);


--
-- TOC entry 6281 (class 1259 OID 376161)
-- Name: snr_derecho_snr_fuente_derecho_idx; Type: INDEX; Schema: test_ladm_integration; Owner: postgres
--

CREATE INDEX snr_derecho_snr_fuente_derecho_idx ON test_ladm_integration.snr_derecho USING btree (snr_fuente_derecho);


--
-- TOC entry 6282 (class 1259 OID 376162)
-- Name: snr_derecho_snr_predio_registro_idx; Type: INDEX; Schema: test_ladm_integration; Owner: postgres
--

CREATE INDEX snr_derecho_snr_predio_registro_idx ON test_ladm_integration.snr_derecho USING btree (snr_predio_registro);


--
-- TOC entry 6283 (class 1259 OID 376169)
-- Name: snr_estructuramatriclmtriz_snr_prdrgstr_l_nmblr_mtriz_idx; Type: INDEX; Schema: test_ladm_integration; Owner: postgres
--

CREATE INDEX snr_estructuramatriclmtriz_snr_prdrgstr_l_nmblr_mtriz_idx ON test_ladm_integration.snr_estructuramatriculamatriz USING btree (snr_predioregistro_matricula_inmobiliaria_matriz);


--
-- TOC entry 6288 (class 1259 OID 376179)
-- Name: snr_fuentecabidalinderos_tipo_documento_idx; Type: INDEX; Schema: test_ladm_integration; Owner: postgres
--

CREATE INDEX snr_fuentecabidalinderos_tipo_documento_idx ON test_ladm_integration.snr_fuentecabidalinderos USING btree (tipo_documento);


--
-- TOC entry 6291 (class 1259 OID 376189)
-- Name: snr_fuentederecho_tipo_documento_idx; Type: INDEX; Schema: test_ladm_integration; Owner: postgres
--

CREATE INDEX snr_fuentederecho_tipo_documento_idx ON test_ladm_integration.snr_fuentederecho USING btree (tipo_documento);


--
-- TOC entry 6296 (class 1259 OID 376210)
-- Name: snr_predioregistro_clase_suelo_registro_idx; Type: INDEX; Schema: test_ladm_integration; Owner: postgres
--

CREATE INDEX snr_predioregistro_clase_suelo_registro_idx ON test_ladm_integration.snr_predioregistro USING btree (clase_suelo_registro);


--
-- TOC entry 6299 (class 1259 OID 376211)
-- Name: snr_predioregistro_snr_fuente_cabidalinderos_idx; Type: INDEX; Schema: test_ladm_integration; Owner: postgres
--

CREATE INDEX snr_predioregistro_snr_fuente_cabidalinderos_idx ON test_ladm_integration.snr_predioregistro USING btree (snr_fuente_cabidalinderos);


--
-- TOC entry 6302 (class 1259 OID 376219)
-- Name: snr_titular_derecho_snr_derecho_idx; Type: INDEX; Schema: test_ladm_integration; Owner: postgres
--

CREATE INDEX snr_titular_derecho_snr_derecho_idx ON test_ladm_integration.snr_titular_derecho USING btree (snr_derecho);


--
-- TOC entry 6303 (class 1259 OID 376218)
-- Name: snr_titular_derecho_snr_titular_idx; Type: INDEX; Schema: test_ladm_integration; Owner: postgres
--

CREATE INDEX snr_titular_derecho_snr_titular_idx ON test_ladm_integration.snr_titular_derecho USING btree (snr_titular);


--
-- TOC entry 6294 (class 1259 OID 376200)
-- Name: snr_titular_tipo_documento_idx; Type: INDEX; Schema: test_ladm_integration; Owner: postgres
--

CREATE INDEX snr_titular_tipo_documento_idx ON test_ladm_integration.snr_titular USING btree (tipo_documento);


--
-- TOC entry 6295 (class 1259 OID 376199)
-- Name: snr_titular_tipo_persona_idx; Type: INDEX; Schema: test_ladm_integration; Owner: postgres
--

CREATE INDEX snr_titular_tipo_persona_idx ON test_ladm_integration.snr_titular USING btree (tipo_persona);


--
-- TOC entry 6344 (class 1259 OID 376595)
-- Name: t_ili2db_attrname_sqlname_colowner_key; Type: INDEX; Schema: test_ladm_integration; Owner: postgres
--

CREATE UNIQUE INDEX t_ili2db_attrname_sqlname_colowner_key ON test_ladm_integration.t_ili2db_attrname USING btree (sqlname, colowner);


--
-- TOC entry 6309 (class 1259 OID 376240)
-- Name: t_ili2db_basket_dataset_idx; Type: INDEX; Schema: test_ladm_integration; Owner: postgres
--

CREATE INDEX t_ili2db_basket_dataset_idx ON test_ladm_integration.t_ili2db_basket USING btree (dataset);


--
-- TOC entry 6312 (class 1259 OID 376593)
-- Name: t_ili2db_dataset_datasetname_key; Type: INDEX; Schema: test_ladm_integration; Owner: postgres
--

CREATE UNIQUE INDEX t_ili2db_dataset_datasetname_key ON test_ladm_integration.t_ili2db_dataset USING btree (datasetname);


--
-- TOC entry 6319 (class 1259 OID 376594)
-- Name: t_ili2db_model_iliversion_modelname_key; Type: INDEX; Schema: test_ladm_integration; Owner: postgres
--

CREATE UNIQUE INDEX t_ili2db_model_iliversion_modelname_key ON test_ladm_integration.t_ili2db_model USING btree (iliversion, modelname);


--
-- TOC entry 6347 (class 2606 OID 376401)
-- Name: extarchivo extarchivo_snr_fuentecabdlndrs_rchivo_fkey; Type: FK CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.extarchivo
    ADD CONSTRAINT extarchivo_snr_fuentecabdlndrs_rchivo_fkey FOREIGN KEY (snr_fuentecabidalndros_archivo) REFERENCES test_ladm_integration.snr_fuentecabidalinderos(t_id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6348 (class 2606 OID 376407)
-- Name: gc_calificacionunidadconstruccion gc_calificacnnddcnstrccion_gc_unidadconstruccion_fkey; Type: FK CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.gc_calificacionunidadconstruccion
    ADD CONSTRAINT gc_calificacnnddcnstrccion_gc_unidadconstruccion_fkey FOREIGN KEY (gc_unidadconstruccion) REFERENCES test_ladm_integration.gc_unidadconstruccion(t_id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6349 (class 2606 OID 376423)
-- Name: gc_construccion gc_construccion_gc_predio_fkey; Type: FK CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.gc_construccion
    ADD CONSTRAINT gc_construccion_gc_predio_fkey FOREIGN KEY (gc_predio) REFERENCES test_ladm_integration.gc_prediocatastro(t_id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6350 (class 2606 OID 376412)
-- Name: gc_construccion gc_construccion_tipo_construccion_fkey; Type: FK CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.gc_construccion
    ADD CONSTRAINT gc_construccion_tipo_construccion_fkey FOREIGN KEY (tipo_construccion) REFERENCES test_ladm_integration.gc_unidadconstrucciontipo(t_id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6361 (class 2606 OID 376502)
-- Name: gc_copropiedad gc_copropiedad_gc_matriz_fkey; Type: FK CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.gc_copropiedad
    ADD CONSTRAINT gc_copropiedad_gc_matriz_fkey FOREIGN KEY (gc_matriz) REFERENCES test_ladm_integration.gc_prediocatastro(t_id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6362 (class 2606 OID 376507)
-- Name: gc_copropiedad gc_copropiedad_gc_unidad_fkey; Type: FK CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.gc_copropiedad
    ADD CONSTRAINT gc_copropiedad_gc_unidad_fkey FOREIGN KEY (gc_unidad) REFERENCES test_ladm_integration.gc_prediocatastro(t_id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6351 (class 2606 OID 376435)
-- Name: gc_datosphcondominio gc_datosphcondominio_gc_predio_fkey; Type: FK CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.gc_datosphcondominio
    ADD CONSTRAINT gc_datosphcondominio_gc_predio_fkey FOREIGN KEY (gc_predio) REFERENCES test_ladm_integration.gc_prediocatastro(t_id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6352 (class 2606 OID 376445)
-- Name: gc_datostorreph gc_datostorreph_gc_datosphcondominio_fkey; Type: FK CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.gc_datostorreph
    ADD CONSTRAINT gc_datostorreph_gc_datosphcondominio_fkey FOREIGN KEY (gc_datosphcondominio) REFERENCES test_ladm_integration.gc_datosphcondominio(t_id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6353 (class 2606 OID 376450)
-- Name: gc_direccion gc_direccion_gc_prediocatastro_dirccnes_fkey; Type: FK CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.gc_direccion
    ADD CONSTRAINT gc_direccion_gc_prediocatastro_dirccnes_fkey FOREIGN KEY (gc_prediocatastro_direcciones) REFERENCES test_ladm_integration.gc_prediocatastro(t_id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6354 (class 2606 OID 376455)
-- Name: gc_estadopredio gc_estadopredio_gc_prediocatastr_std_prdio_fkey; Type: FK CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.gc_estadopredio
    ADD CONSTRAINT gc_estadopredio_gc_prediocatastr_std_prdio_fkey FOREIGN KEY (gc_prediocatastro_estado_predio) REFERENCES test_ladm_integration.gc_prediocatastro(t_id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6359 (class 2606 OID 376491)
-- Name: gc_prediocatastro gc_prediocatastro_condicion_predio_fkey; Type: FK CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.gc_prediocatastro
    ADD CONSTRAINT gc_prediocatastro_condicion_predio_fkey FOREIGN KEY (condicion_predio) REFERENCES test_ladm_integration.gc_condicionprediotipo(t_id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6360 (class 2606 OID 376496)
-- Name: gc_prediocatastro gc_prediocatastro_sistema_procedencia_datos_fkey; Type: FK CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.gc_prediocatastro
    ADD CONSTRAINT gc_prediocatastro_sistema_procedencia_datos_fkey FOREIGN KEY (sistema_procedencia_datos) REFERENCES test_ladm_integration.gc_sistemaprocedenciadatostipo(t_id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6355 (class 2606 OID 376460)
-- Name: gc_propietario gc_propietario_gc_predio_catastro_fkey; Type: FK CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.gc_propietario
    ADD CONSTRAINT gc_propietario_gc_predio_catastro_fkey FOREIGN KEY (gc_predio_catastro) REFERENCES test_ladm_integration.gc_prediocatastro(t_id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6356 (class 2606 OID 376468)
-- Name: gc_terreno gc_terreno_gc_predio_fkey; Type: FK CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.gc_terreno
    ADD CONSTRAINT gc_terreno_gc_predio_fkey FOREIGN KEY (gc_predio) REFERENCES test_ladm_integration.gc_prediocatastro(t_id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6357 (class 2606 OID 376486)
-- Name: gc_unidadconstruccion gc_unidadconstruccion_gc_construccion_fkey; Type: FK CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.gc_unidadconstruccion
    ADD CONSTRAINT gc_unidadconstruccion_gc_construccion_fkey FOREIGN KEY (gc_construccion) REFERENCES test_ladm_integration.gc_construccion(t_id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6358 (class 2606 OID 376473)
-- Name: gc_unidadconstruccion gc_unidadconstruccion_tipo_construccion_fkey; Type: FK CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.gc_unidadconstruccion
    ADD CONSTRAINT gc_unidadconstruccion_tipo_construccion_fkey FOREIGN KEY (tipo_construccion) REFERENCES test_ladm_integration.gc_unidadconstrucciontipo(t_id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6345 (class 2606 OID 376391)
-- Name: gm_surface2dlistvalue gm_surface2dlistvalue_gm_multisurface2d_geometry_fkey; Type: FK CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.gm_surface2dlistvalue
    ADD CONSTRAINT gm_surface2dlistvalue_gm_multisurface2d_geometry_fkey FOREIGN KEY (gm_multisurface2d_geometry) REFERENCES test_ladm_integration.gm_multisurface2d(t_id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6346 (class 2606 OID 376396)
-- Name: gm_surface3dlistvalue gm_surface3dlistvalue_gm_multisurface3d_geometry_fkey; Type: FK CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.gm_surface3dlistvalue
    ADD CONSTRAINT gm_surface3dlistvalue_gm_multisurface3d_geometry_fkey FOREIGN KEY (gm_multisurface3d_geometry) REFERENCES test_ladm_integration.gm_multisurface3d(t_id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6375 (class 2606 OID 376578)
-- Name: ini_predioinsumos ini_predioinsumos_gc_predio_catastro_fkey; Type: FK CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.ini_predioinsumos
    ADD CONSTRAINT ini_predioinsumos_gc_predio_catastro_fkey FOREIGN KEY (gc_predio_catastro) REFERENCES test_ladm_integration.gc_prediocatastro(t_id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6376 (class 2606 OID 376583)
-- Name: ini_predioinsumos ini_predioinsumos_snr_predio_juridico_fkey; Type: FK CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.ini_predioinsumos
    ADD CONSTRAINT ini_predioinsumos_snr_predio_juridico_fkey FOREIGN KEY (snr_predio_juridico) REFERENCES test_ladm_integration.snr_predioregistro(t_id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6377 (class 2606 OID 376573)
-- Name: ini_predioinsumos ini_predioinsumos_tipo_emparejamiento_fkey; Type: FK CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.ini_predioinsumos
    ADD CONSTRAINT ini_predioinsumos_tipo_emparejamiento_fkey FOREIGN KEY (tipo_emparejamiento) REFERENCES test_ladm_integration.ini_emparejamientotipo(t_id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6363 (class 2606 OID 376513)
-- Name: snr_derecho snr_derecho_calidad_derecho_registro_fkey; Type: FK CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.snr_derecho
    ADD CONSTRAINT snr_derecho_calidad_derecho_registro_fkey FOREIGN KEY (calidad_derecho_registro) REFERENCES test_ladm_integration.snr_calidadderechotipo(t_id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6364 (class 2606 OID 376518)
-- Name: snr_derecho snr_derecho_snr_fuente_derecho_fkey; Type: FK CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.snr_derecho
    ADD CONSTRAINT snr_derecho_snr_fuente_derecho_fkey FOREIGN KEY (snr_fuente_derecho) REFERENCES test_ladm_integration.snr_fuentederecho(t_id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6365 (class 2606 OID 376523)
-- Name: snr_derecho snr_derecho_snr_predio_registro_fkey; Type: FK CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.snr_derecho
    ADD CONSTRAINT snr_derecho_snr_predio_registro_fkey FOREIGN KEY (snr_predio_registro) REFERENCES test_ladm_integration.snr_predioregistro(t_id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6366 (class 2606 OID 376528)
-- Name: snr_estructuramatriculamatriz snr_estructuramatriclmtriz_snr_prdrgstr_l_nmblr_mtriz_fkey; Type: FK CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.snr_estructuramatriculamatriz
    ADD CONSTRAINT snr_estructuramatriclmtriz_snr_prdrgstr_l_nmblr_mtriz_fkey FOREIGN KEY (snr_predioregistro_matricula_inmobiliaria_matriz) REFERENCES test_ladm_integration.snr_predioregistro(t_id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6367 (class 2606 OID 376533)
-- Name: snr_fuentecabidalinderos snr_fuentecabidalinderos_tipo_documento_fkey; Type: FK CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.snr_fuentecabidalinderos
    ADD CONSTRAINT snr_fuentecabidalinderos_tipo_documento_fkey FOREIGN KEY (tipo_documento) REFERENCES test_ladm_integration.snr_fuentetipo(t_id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6368 (class 2606 OID 376538)
-- Name: snr_fuentederecho snr_fuentederecho_tipo_documento_fkey; Type: FK CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.snr_fuentederecho
    ADD CONSTRAINT snr_fuentederecho_tipo_documento_fkey FOREIGN KEY (tipo_documento) REFERENCES test_ladm_integration.snr_fuentetipo(t_id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6371 (class 2606 OID 376553)
-- Name: snr_predioregistro snr_predioregistro_clase_suelo_registro_fkey; Type: FK CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.snr_predioregistro
    ADD CONSTRAINT snr_predioregistro_clase_suelo_registro_fkey FOREIGN KEY (clase_suelo_registro) REFERENCES test_ladm_integration.snr_clasepredioregistrotipo(t_id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6372 (class 2606 OID 376558)
-- Name: snr_predioregistro snr_predioregistro_snr_fuente_cabidalinderos_fkey; Type: FK CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.snr_predioregistro
    ADD CONSTRAINT snr_predioregistro_snr_fuente_cabidalinderos_fkey FOREIGN KEY (snr_fuente_cabidalinderos) REFERENCES test_ladm_integration.snr_fuentecabidalinderos(t_id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6373 (class 2606 OID 376568)
-- Name: snr_titular_derecho snr_titular_derecho_snr_derecho_fkey; Type: FK CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.snr_titular_derecho
    ADD CONSTRAINT snr_titular_derecho_snr_derecho_fkey FOREIGN KEY (snr_derecho) REFERENCES test_ladm_integration.snr_derecho(t_id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6374 (class 2606 OID 376563)
-- Name: snr_titular_derecho snr_titular_derecho_snr_titular_fkey; Type: FK CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.snr_titular_derecho
    ADD CONSTRAINT snr_titular_derecho_snr_titular_fkey FOREIGN KEY (snr_titular) REFERENCES test_ladm_integration.snr_titular(t_id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6369 (class 2606 OID 376548)
-- Name: snr_titular snr_titular_tipo_documento_fkey; Type: FK CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.snr_titular
    ADD CONSTRAINT snr_titular_tipo_documento_fkey FOREIGN KEY (tipo_documento) REFERENCES test_ladm_integration.snr_documentotitulartipo(t_id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6370 (class 2606 OID 376543)
-- Name: snr_titular snr_titular_tipo_persona_fkey; Type: FK CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.snr_titular
    ADD CONSTRAINT snr_titular_tipo_persona_fkey FOREIGN KEY (tipo_persona) REFERENCES test_ladm_integration.snr_personatitulartipo(t_id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6378 (class 2606 OID 376588)
-- Name: t_ili2db_basket t_ili2db_basket_dataset_fkey; Type: FK CONSTRAINT; Schema: test_ladm_integration; Owner: postgres
--

ALTER TABLE ONLY test_ladm_integration.t_ili2db_basket
    ADD CONSTRAINT t_ili2db_basket_dataset_fkey FOREIGN KEY (dataset) REFERENCES test_ladm_integration.t_ili2db_dataset(t_id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2020-07-22 11:13:45 -05

--
-- PostgreSQL database dump complete
--

