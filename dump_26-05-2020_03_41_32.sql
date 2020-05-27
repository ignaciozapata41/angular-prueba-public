--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2 (Debian 12.2-2.pgdg100+1)
-- Dumped by pg_dump version 12.2 (Debian 12.2-2.pgdg100+1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: categoria; Type: TABLE; Schema: public; Owner: georecursos
--

CREATE TABLE public.categoria (
    id bigint NOT NULL,
    nombre character varying(100) NOT NULL,
    disable boolean DEFAULT false,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone
);


ALTER TABLE public.categoria OWNER TO georecursos;

--
-- Name: estados; Type: TABLE; Schema: public; Owner: georecursos
--

CREATE TABLE public.estados (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    disable boolean DEFAULT false,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone
);


ALTER TABLE public.estados OWNER TO georecursos;

--
-- Name: estados_id_seq; Type: SEQUENCE; Schema: public; Owner: georecursos
--

CREATE SEQUENCE public.estados_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.estados_id_seq OWNER TO georecursos;

--
-- Name: estados_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: georecursos
--

ALTER SEQUENCE public.estados_id_seq OWNED BY public.estados.id;


--
-- Name: lineas; Type: TABLE; Schema: public; Owner: georecursos
--

CREATE TABLE public.lineas (
    id bigint NOT NULL,
    nombre character varying(100) NOT NULL,
    disable boolean DEFAULT false,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone
);


ALTER TABLE public.lineas OWNER TO georecursos;

--
-- Name: marcas; Type: TABLE; Schema: public; Owner: georecursos
--

CREATE TABLE public.marcas (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    disable boolean DEFAULT false,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone
);


ALTER TABLE public.marcas OWNER TO georecursos;

--
-- Name: marcas_id_seq; Type: SEQUENCE; Schema: public; Owner: georecursos
--

CREATE SEQUENCE public.marcas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.marcas_id_seq OWNER TO georecursos;

--
-- Name: marcas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: georecursos
--

ALTER SEQUENCE public.marcas_id_seq OWNED BY public.marcas.id;


--
-- Name: productos; Type: TABLE; Schema: public; Owner: georecursos
--

CREATE TABLE public.productos (
    sku character varying(255) NOT NULL,
    nombre character varying(200) NOT NULL,
    unitid character varying(255),
    precio_venta integer,
    costo_financiero numeric(10,1),
    uen character varying(255),
    precio_minimo integer,
    descripcion character varying(300),
    imagen_150 character varying(256),
    imagen_450 character varying(256),
    popularidad integer,
    fk_id_linea bigint,
    fk_id_fabricacion integer,
    fk_id_proveedor integer,
    fk_id_marca integer,
    fk_id_categoria bigint,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone,
    numero_parte character varying(100),
    fk_id_estado integer
);


ALTER TABLE public.productos OWNER TO georecursos;

--
-- Name: proveedors; Type: TABLE; Schema: public; Owner: georecursos
--

CREATE TABLE public.proveedors (
    id integer NOT NULL,
    codigo character varying(256) NOT NULL,
    nombre character varying(256),
    disable boolean DEFAULT false,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone
);


ALTER TABLE public.proveedors OWNER TO georecursos;

--
-- Name: proveedors_id_seq; Type: SEQUENCE; Schema: public; Owner: georecursos
--

CREATE SEQUENCE public.proveedors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.proveedors_id_seq OWNER TO georecursos;

--
-- Name: proveedors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: georecursos
--

ALTER SEQUENCE public.proveedors_id_seq OWNED BY public.proveedors.id;


--
-- Name: tipo_fabricacions; Type: TABLE; Schema: public; Owner: georecursos
--

CREATE TABLE public.tipo_fabricacions (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    disable boolean DEFAULT false,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone
);


ALTER TABLE public.tipo_fabricacions OWNER TO georecursos;

--
-- Name: tipo_fabricacions_id_seq; Type: SEQUENCE; Schema: public; Owner: georecursos
--

CREATE SEQUENCE public.tipo_fabricacions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_fabricacions_id_seq OWNER TO georecursos;

--
-- Name: tipo_fabricacions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: georecursos
--

ALTER SEQUENCE public.tipo_fabricacions_id_seq OWNED BY public.tipo_fabricacions.id;


--
-- Name: estados id; Type: DEFAULT; Schema: public; Owner: georecursos
--

ALTER TABLE ONLY public.estados ALTER COLUMN id SET DEFAULT nextval('public.estados_id_seq'::regclass);


--
-- Name: marcas id; Type: DEFAULT; Schema: public; Owner: georecursos
--

ALTER TABLE ONLY public.marcas ALTER COLUMN id SET DEFAULT nextval('public.marcas_id_seq'::regclass);


--
-- Name: proveedors id; Type: DEFAULT; Schema: public; Owner: georecursos
--

ALTER TABLE ONLY public.proveedors ALTER COLUMN id SET DEFAULT nextval('public.proveedors_id_seq'::regclass);


--
-- Name: tipo_fabricacions id; Type: DEFAULT; Schema: public; Owner: georecursos
--

ALTER TABLE ONLY public.tipo_fabricacions ALTER COLUMN id SET DEFAULT nextval('public.tipo_fabricacions_id_seq'::regclass);


--
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: georecursos
--

COPY public.categoria (id, nombre, disable, "createdAt", "updatedAt") FROM stdin;
5637147580	CABINA EXTERIOR CAMIONES	f	2020-05-26 04:51:16.521816+00	\N
5637147587	ACCESORIOS	f	2020-05-26 04:51:16.521816+00	\N
5637147592	FURGONES / SIDERS	f	2020-05-26 04:51:16.521816+00	\N
5637148327	CARROCERIA EXTERNA	f	2020-05-26 04:51:16.521816+00	\N
5637148328	CARROCERIA INTERNA	f	2020-05-26 04:51:16.521816+00	\N
5637148330	CLIMATIZACION	f	2020-05-26 04:51:16.521816+00	\N
5637148331	ILUMINACION	f	2020-05-26 04:51:16.521816+00	\N
5637148333	MECANISMO LIMPIAPARABRISA	f	2020-05-26 04:51:16.521816+00	\N
5637148334	PERFILES	f	2020-05-26 04:51:16.521816+00	\N
5637148335	VIDRIOS Y PARABRISAS DE BUSES	f	2020-05-26 04:51:16.521816+00	\N
5637148340	LUBRICANTES	f	2020-05-26 04:51:16.521816+00	\N
5637148341	ABS / EBS	f	2020-05-26 04:51:16.521816+00	\N
5637148342	FRENOS	f	2020-05-26 04:51:16.521816+00	\N
5637148343	FRICCION	f	2020-05-26 04:51:16.521816+00	\N
5637148345	SISTEMA NEUMATICO	f	2020-05-26 04:51:16.521816+00	\N
5637148354	EMBRAGUE	f	2020-05-26 04:51:16.521816+00	\N
5637148357	MOTOR	f	2020-05-26 04:51:16.521816+00	\N
5637148366	LIMPIEZA Y PROTECCION	f	2020-05-26 04:51:16.521816+00	\N
5637148368	SEGURIDAD VIAL	f	2020-05-26 04:51:16.521816+00	\N
5637148369	SELLANTES Y ADHESIVOS	f	2020-05-26 04:51:16.521816+00	\N
5637148371	ENGANCHE	f	2020-05-26 04:51:16.521816+00	\N
5637148373	SUSPENSIONES	f	2020-05-26 04:51:16.521816+00	\N
5637170831	COMPONENTES DE MAZAS	f	2020-05-26 04:51:16.521816+00	\N
5637170832	LLANTAS	f	2020-05-26 04:51:16.521816+00	\N
\.


--
-- Data for Name: estados; Type: TABLE DATA; Schema: public; Owner: georecursos
--

COPY public.estados (id, nombre, disable, "createdAt", "updatedAt") FROM stdin;
1	Comercial	f	2020-05-26 04:57:34.92061+00	\N
2	Descontinuado	f	2020-05-26 04:57:34.92061+00	\N
3	Normal	f	2020-05-26 04:57:34.92061+00	\N
\.


--
-- Data for Name: lineas; Type: TABLE DATA; Schema: public; Owner: georecursos
--

COPY public.lineas (id, nombre, disable, "createdAt", "updatedAt") FROM stdin;
5637148382	TAPAS DE RUEDA	f	2020-05-26 04:46:49.957715+00	\N
5637148402	CAJAS PORTA ACCESORIOS	f	2020-05-26 04:46:49.957715+00	\N
5637148404	FOCOS RQ / SEMIRQ	f	2020-05-26 04:46:49.957715+00	\N
5637148406	OTROS COMPONENTES ACCESORIOS	f	2020-05-26 04:46:49.957715+00	\N
5637148422	OTROS COMPONENTES FURGONES / SIDERS	f	2020-05-26 04:46:49.957715+00	\N
5637148431	FRENTE	f	2020-05-26 04:46:49.957715+00	\N
5637148432	LATERAL	f	2020-05-26 04:46:49.957715+00	\N
5637148433	TECHO EXT	f	2020-05-26 04:46:49.957715+00	\N
5637148436	ELECTRICO BUSES	f	2020-05-26 04:46:49.957715+00	\N
5637148445	FAROLES / OPTICOS / SOQUETES	f	2020-05-26 04:46:49.957715+00	\N
5637148456	MOTOR LP	f	2020-05-26 04:46:49.957715+00	\N
5637148460	PERFILES PVC	f	2020-05-26 04:46:49.957715+00	\N
5637148462	LUNETAS	f	2020-05-26 04:46:49.957715+00	\N
5637148465	VIDRIOS	f	2020-05-26 04:46:49.957715+00	\N
5637148491	ACEITES	f	2020-05-26 04:46:49.957715+00	\N
5637148495	ABS	f	2020-05-26 04:46:49.957715+00	\N
5637148500	KIT REPARACION FRENOS	f	2020-05-26 04:46:49.957715+00	\N
5637148519	MANGUERAS / TECALAN	f	2020-05-26 04:46:49.957715+00	\N
5637148552	OTROS REP DE EMBRAGUE	f	2020-05-26 04:46:49.957715+00	\N
5637148564	EMPAQUETADURAS / RETENES / SELLOS	f	2020-05-26 04:46:49.957715+00	\N
5637148607	ANTICORROSIVOS	f	2020-05-26 04:46:49.957715+00	\N
5637148609	PROFESIONAL	f	2020-05-26 04:46:49.957715+00	\N
5637148619	CINTAS REFLECTANTES OTRAS	f	2020-05-26 04:46:49.957715+00	\N
5637148620	CINTAS REFLECTANTES RB / B	f	2020-05-26 04:46:49.957715+00	\N
5637148621	ADHESIVOS	f	2020-05-26 04:46:49.957715+00	\N
5637148627	CANDADOS / DISCOS / ZAPATAS	f	2020-05-26 04:46:49.957715+00	\N
5637148644	AMORTIGUADORES	f	2020-05-26 04:46:49.957715+00	\N
5637148645	BALANCINES / TORRES	f	2020-05-26 04:46:49.957715+00	\N
5637148646	BUJES SUSPENSION	f	2020-05-26 04:46:49.957715+00	\N
5637148648	OTROS COMPONENTES SUSPENSIONES	f	2020-05-26 04:46:49.957715+00	\N
5637148650	PULMONES SUSPENSION / LEVANTE	f	2020-05-26 04:46:49.957715+00	\N
5637171580	LLANTAS ACERO	f	2020-05-26 04:46:49.957715+00	\N
5637171598	TAPAS / HUBODOMETROS / GOLILLAS	f	2020-05-26 04:46:49.957715+00	\N
5637173830	TAMBORES DE FRENO	f	2020-05-26 04:46:49.957715+00	\N
5637148441	AIRE ACONDICIONADO CLIMATIZACIÓN	f	2020-05-26 04:46:49.957715+00	\N
5637148633	PIÑAS	f	2020-05-26 04:46:49.957715+00	\N
\.


--
-- Data for Name: marcas; Type: TABLE DATA; Schema: public; Owner: georecursos
--

COPY public.marcas (id, nombre, disable, "createdAt", "updatedAt") FROM stdin;
1	3M	f	2020-05-26 04:48:35.287524+00	\N
2	AUTOMANN	f	2020-05-26 04:48:35.287524+00	\N
3	BATISTA	f	2020-05-26 04:48:35.287524+00	\N
4	BLACKSMITH	f	2020-05-26 04:48:35.287524+00	\N
5	FIRESTONE	f	2020-05-26 04:48:35.287524+00	\N
6	GOODYEAR	f	2020-05-26 04:48:35.287524+00	\N
7	HDP	f	2020-05-26 04:48:35.287524+00	\N
8	IMOBRAS	f	2020-05-26 04:48:35.287524+00	\N
9	JANTSA	f	2020-05-26 04:48:35.287524+00	\N
10	JOST	f	2020-05-26 04:48:35.287524+00	\N
11	MARCOPOLO	f	2020-05-26 04:48:35.287524+00	\N
12	MOBIL	f	2020-05-26 04:48:35.287524+00	\N
13	MULTIPARTES	f	2020-05-26 04:48:35.287524+00	\N
14	MWM	f	2020-05-26 04:48:35.287524+00	\N
15	PRIORITY	f	2020-05-26 04:48:35.287524+00	\N
16	RANDON	f	2020-05-26 04:48:35.287524+00	\N
17	SPHEROS	f	2020-05-26 04:48:35.287524+00	\N
18	SUNTECH	f	2020-05-26 04:48:35.287524+00	\N
19	SUSPENSYS	f	2020-05-26 04:48:35.287524+00	\N
20	TRANSACTA	f	2020-05-26 04:48:35.287524+00	\N
21	TRO-GRIM	f	2020-05-26 04:48:35.287524+00	\N
22	VALEO	f	2020-05-26 04:48:35.287524+00	\N
23	VIDROFORTE	f	2020-05-26 04:48:35.287524+00	\N
24	WD-40	f	2020-05-26 04:48:35.287524+00	\N
25	WEBASTO	f	2020-05-26 04:48:35.287524+00	\N
\.


--
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: georecursos
--

COPY public.productos (sku, nombre, unitid, precio_venta, costo_financiero, uen, precio_minimo, descripcion, imagen_150, imagen_450, popularidad, fk_id_linea, fk_id_fabricacion, fk_id_proveedor, fk_id_marca, fk_id_categoria, "createdAt", "updatedAt", numero_parte, fk_id_estado) FROM stdin;
HERCAR0023	ADHSIVO EPOXICO NEGRO PEGATANKE	Un	6990	4203.5	SEGURIDAD Y HERRAMIENTAS	6990	ADHSIVO EPOXICO NEGRO-SOLDADURA EN FRIO PEGATANKE	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FHERCAR0023.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FHERCAR0023.jpg?alt=media	\N	5637148621	3	15	1	5637148369	2020-05-26 05:43:09.241359+00	\N	01PTKNegro BL	1
MARTEC0121	BASE CUPULA EXTRACTOR G6	UN	18990	3442.5	CARROCERIAS BUSES	15624	NUEVA ( PARA CUPULA MARTEC0120 )	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FMARTEC0121.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FMARTEC0121.jpg?alt=media	\N	5637148433	3	19	11	5637148327	2020-05-26 05:43:09.241359+00	\N	10030524_1	2
MG7LAT0020	ACABADO PUERTA SERVICIO VIAGGIO 900 G7	UN	31390	7289.0	CARROCERIAS BUSES	26000	EXTERNO	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FMG7LAT0020.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FMG7LAT0020.jpg?alt=media	\N	5637148460	3	19	11	5637148334	2020-05-26 05:43:09.241359+00	\N	10032283_1	2
MG7LAT0009	ACABADO LAT. EXT. CENTRAL DER. PTA. G7	UN	7190	4784.0	CARROCERIAS BUSES	12892	PARADISO 1200	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FMG7LAT0009.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FMG7LAT0009.jpg?alt=media	\N	5637148460	3	19	11	5637148334	2020-05-26 05:43:09.241359+00	\N	10032287_1	2
MG7LAT0010	TIARA LAT. EXT. CENTRAL CHOFER G7	UN	14790	4980.0	CARROCERIAS BUSES	13433	PARADISO 1200	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FMG7LAT0010.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FMG7LAT0010.jpg?alt=media	\N	5637148460	3	19	11	5637148334	2020-05-26 05:43:09.241359+00	\N	10032288_1	2
MG7FRT0033	MASCARA SOBRE PARACHOQUES VIAGGIO 900 G7	UN	76190	28288.8	CARROCERIAS BUSES	116314	UNA PIEZA	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FMG7FRT0033.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FMG7FRT0033.jpg?alt=media	\N	5637148431	3	19	11	5637148327	2020-05-26 05:43:09.241359+00	\N	10014283_1	3
MARLAT0064	SEGURO RAPIDO TORINO/VIALE	UN	7290	2304.3	CARROCERIAS BUSES	7204	EN TAPA TORPEDO TAPA CILINDROS  TAPA ITINERARIO	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FMARLAT0064.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FMARLAT0064.jpg?alt=media	\N	5637148432	4	9	11	5637148327	2020-05-26 05:43:09.241359+00	\N	100250007_1	3
MWMMOT0478	O RING CAMISA MOTOR	UN	3190	944.8	POTENCIA Y TRANSMISION	2879	MWM 410/610TCA  MWM 412/612TCA ELECT	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FMWMMOT0478.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FMWMMOT0478.jpg?alt=media	\N	5637148564	4	10	14	5637148357	2020-05-26 05:43:09.241359+00	\N	0302AAV00110N_1	2
RANELE0119	FOCO PATENTE BLANCO 24 VOLTS	UN	5590	1405.4	CAJA DE CARGA EQUIPOS	3886	FOCO PATENTE COLOR BLANCO-CRISTAL PARA AMPOLLETA  2003 RQ FORESTAL	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FRANELE0119.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FRANELE0119.jpg?alt=media	\N	5637148404	3	20	16	5637147587	2020-05-26 05:43:09.241359+00	\N	100000155242	3
MARSAL0669	A/C MOTOR VENTILADOR EVAPORADOR SPAL 24 V	UN	178090	72026.8	CARROCERIAS BUSES	136409	SPHEROS	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FMARSAL0669.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FMARSAL0669.jpg?alt=media	\N	5637148441	3	5	17	5637148330	2020-05-26 05:43:09.241359+00	\N	021-00014-000_1	1
JOSENG0137	PIÑA CONTENEDOR JOST	UN	38990	18929.3	SUSPENSION Y ENGANCHE	38047	NUEVO MODELO  ANCHO LADO EXTERNO 91 MM	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FJOSENG0137.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FJOSENG0137.jpg?alt=media	\N	5637148633	4	18	10	5637148371	2020-05-26 05:43:09.241359+00	\N	100000158189	3
MARSAL0675	A/C SENSOR Tº INTERNO	UN	14790	7886.5	CARROCERIAS BUSES	12354	TODOS	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FMARSAL0675.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FMARSAL0675.jpg?alt=media	\N	5637148441	3	5	17	5637148330	2020-05-26 05:43:09.241359+00	\N	007-00042-000_1	3
MARSAL0673	A/C PRESOSTATO BAJA PRESION	UN	19790	8113.7	CARROCERIAS BUSES	17197	TODOS LOS COMPRESORES / SPHEROS	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FMARSAL0673.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FMARSAL0673.jpg?alt=media	\N	5637148441	3	5	25	5637148330	2020-05-26 05:43:09.241359+00	\N	010-00019-000_1	1
MARSAL0940	A/C SENSOR TEMPERATURA CABLE	UN	15290	4511.1	CARROCERIAS BUSES	12609	TODAS	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FMARSAL0940.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FMARSAL0940.jpg?alt=media	\N	5637148441	4	5	25	5637148330	2020-05-26 05:43:09.241359+00	\N	007-00007-000_1	1
MARSAL0936	A/C PLACA RELES GLW123	UN	259290	74352.2	CARROCERIAS BUSES	201728	CC430 PARADISO 1800 DD	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FMARSAL0936.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FMARSAL0936.jpg?alt=media	\N	5637148441	3	5	25	5637148330	2020-05-26 05:43:09.241359+00	\N	007-00023-000_2	3
MARSAL0908	A/C MODULO DE CONTROL ELECTRONICO GLW-180	UN	212990	72019.5	CARROCERIAS BUSES	169266	SPHEROS GLW 180 / CC430 PARADISO 1800 DD	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FMARSAL0908.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FMARSAL0908.jpg?alt=media	\N	5637148441	3	5	25	5637148330	2020-05-26 05:43:09.241359+00	\N	007-00041-000_3	3
MARSAL0919	A/C FUSIBLE 125A	UN	8790	3453.3	CARROCERIAS BUSES	7375	CC300/350 / RODOVIARIOS	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FMARSAL0919.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FMARSAL0919.jpg?alt=media	\N	5637148441	3	5	25	5637148330	2020-05-26 05:43:09.241359+00	\N	008-00025-000_2	3
MARSAL0914	A/C FILTRO DESHIDRATADOR 5/8 ORING INTERNO / NUEVO	UN	59890	11619.4	CARROCERIAS BUSES	45630	CONEXION 1 PULG / CC230/300/350 RODOVIARIOS /430 PARADISO 1800 DD	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FMARSAL0914.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FMARSAL0914.jpg?alt=media	\N	5637148441	3	5	25	5637148330	2020-05-26 05:43:09.241359+00	\N	012-00086-000_2	3
MARSAL0676	A/C MOTOR VENTILADOR AXIAL CONDENSADOR SPAL 24V	UN	166990	67118.5	CARROCERIAS BUSES	141237	SPHEROS	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FMARSAL0676.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FMARSAL0676.jpg?alt=media	\N	5637148441	3	5	25	5637148330	2020-05-26 05:43:09.241359+00	\N	021-00015-000_1	3
HERCAR0024	ADHSIVO EPOXICO BLANCO PEGATANKE	Un	6990	4196.2	SEGURIDAD Y HERRAMIENTAS	6990	ADHSIVO EPOXICO BLANCO-SOLDADURA EN FRIO PEGATANKE	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FHERCAR0024.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FHERCAR0024.jpg?alt=media	\N	5637148621	3	15	1	5637148369	2020-05-26 05:43:09.241359+00	\N	02PTKBlanco BL	1
HDPEMB0001	RODAMIENTO EMPUJE VW 9-150 RODAMIENTO MEDIO	UN	50290	20065.2	POTENCIA Y TRANSMISION	43714	MOTOR MWM CAJA ZF TEG 141 165	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FHDPEMB0001.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FHDPEMB0001.jpg?alt=media	\N	5637148552	1	1	1	5637148354	2020-05-26 05:43:09.241359+00	\N	100035_1	3
ATMFRE0015	KIT REP.FRENO 16.5 Q Q	UN	10890	3208.2	SISTEMA DE FRENO	8538	E2769SHD	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FATMFRE0015.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FATMFRE0015.jpg?alt=media	\N	5637148500	1	7	2	5637148342	2020-05-26 05:43:09.241359+00	\N	100.4515.22_1	3
BATFRE0010	TAMBOR FRENO 10 HOYOS 8" X 16.5" EUROPEO	UN	102990	42286.1	SISTEMA DE FRENO	96563	TAMBOR  DE  FRENO EUROPEO OUT BOARD ALTURA 286 MM PARA  EJE  SUSPENSYS  EQUIPO  RANDON	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FBATFRE0010.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FBATFRE0010.jpg?alt=media	\N	5637173830	1	2	3	5637148343	2020-05-26 05:43:09.241359+00	\N	6255	3
BATFRE0006	TAMBOR FRENO 6 HOYOS 128 X 325 MM. DEL / TRAS	UN	51790	29637.1	SISTEMA DE FRENO	45813	BATISTA  VW 2R0609617A DEL / TRAS BUS 8T	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FBATFRE0006.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FBATFRE0006.jpg?alt=media	\N	5637173830	1	2	3	5637148343	2020-05-26 05:43:09.241359+00	\N	8535	3
CMPACC0015	TAPA TUERCA CROMADA 33MM - CONICA	Un	11990	5200.8	CABINA CAMIONES	11990	PACK 10 UNIDADES - PLASTICO CROMADO	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FCMPACC0015.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FCMPACC0015.jpg?alt=media	\N	5637148382	1	8	4	5637147580	2020-05-26 05:43:09.241359+00	\N	017-024-4	1
RHIVIA0003	CINTA REFLECTANTE R/B RHINO - BLISTER	UN	1990	856.3	SEGURIDAD Y HERRAMIENTAS	1989	CINTA REFLECTANTE ROJO Y BLANCO RHINO  BLISTE X 4 TIRAS 18' C/U	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FRHIVIA0003.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FRHIVIA0003.jpg?alt=media	\N	5637148620	1	17	4	5637148368	2020-05-26 05:43:09.241359+00	\N	047.0067.06_1	1
RHIVIA0002	CINTA REFLECTANTE FLUOR RHINO - ROLLO	RLL	71090	24401.4	SEGURIDAD Y HERRAMIENTAS	62722	CINTA REFLECTANTE AMARILLO FLUOR RHINO  ROLLO 457 MTS	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FRHIVIA0002.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FRHIVIA0002.jpg?alt=media	\N	5637148619	1	17	4	5637148368	2020-05-26 05:43:09.241359+00	\N	047.0067.07_1	1
RHIVIA0001	CINTA REFLECTANTE R/B BLACKSMITH - ROLLO	RLL	36990	17538.4	SEGURIDAD Y HERRAMIENTAS	49989	CINTA REFLECTANTE ROJO Y BLANCO BLACKSMITH  ROLLO 457 MTS	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FRHIVIA0001.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FRHIVIA0001.jpg?alt=media	\N	5637148620	1	17	4	5637148368	2020-05-26 05:43:09.241359+00	\N	047.0067.04_1	3
FIRSUS0035	KIT BOLSA Y PLATO SUPERIOR 1T19L-11	UN	104990	67038.3	SUSPENSION Y ENGANCHE	119282	SOLO BOLSA Y PLATO SUPERIOR ( SIN CAMPANA INFERIOR)	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FFIRSUS0035.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FFIRSUS0035.jpg?alt=media	\N	5637148650	4	14	5	5637148373	2020-05-26 05:43:09.241359+00	\N	950.735	3
FIRSUS0041	PULMON SUSPENSION 1T19L-11	UN	133990	72008.4	SUSPENSION Y ENGANCHE	117889	SUSPENSION NEUMATICA COMBINADA 123 GENERACION  CON BASE INFERIOR DE ACERO	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FFIRSUS0041.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FFIRSUS0041.jpg?alt=media	\N	5637148650	4	14	5	5637148373	2020-05-26 05:43:09.241359+00	\N	950.736	3
MARSAL1114	A/C CORREA V DOBLE DENTADA 2/BX81 COMPRESOR B10R	UN	31890	16691.3	CARROCERIAS BUSES	38646	2/BX81/17X2135	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FMARSAL1114.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FMARSAL1114.jpg?alt=media	\N	5637148441	4	21	6	5637148330	2020-05-26 05:43:09.241359+00	\N	033-00187-000_2	1
HDPACC0030	SOPLADOR DE AIRE PARA CABINA	UN	11190	3642.9	CAJA DE CARGA EQUIPOS	9810	35 MT COLOR AZUL	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FHDPACC0030.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FHDPACC0030.jpg?alt=media	\N	5637148406	1	13	7	5637147587	2020-05-26 05:43:09.241359+00	\N	0831B014LCAZ	3
MARFRT1011	MOTOR L/P 24 V / IMOBRAS	UN	59790	20376.3	CARROCERIAS BUSES	55427	1 ANCLAJE 30N	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FMARFRT1011.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FMARFRT1011.jpg?alt=media	\N	5637148456	4	9	8	5637148333	2020-05-26 05:43:09.241359+00	\N	04.904.24	1
JANLLA0002	LLANTA ARTILLERA 8.50X24 HD	UN	112390	59763.8	RODADO	121280	P:48 KG CARGA 4500 KG JANTSA TURCA GRIS PLATA	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FJANLLA0002.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FJANLLA0002.jpg?alt=media	\N	5637171580	2	12	9	5637170832	2020-05-26 05:43:09.241359+00	\N	2483	3
JOSENG0140	ZAPATA TIPO S COMPLETA	UN	99690	39377.2	SUSPENSION Y ENGANCHE	79353	SOLO BASE COMPLETA /AD00511J00	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FJOSENG0140.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FJOSENG0140.jpg?alt=media	\N	5637148627	4	18	10	5637148371	2020-05-26 05:43:09.241359+00	\N	100000131413_1	3
JOSENG0138	PIÑA CONTENEDOR JOST CONTORNO LATERAL	UN	41990	19941.5	SUSPENSION Y ENGANCHE	50054	NUEVO MODELO/IDENTICA A JOSENG0137 PERO CON CONTORNO LATERAL	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FJOSENG0138.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FJOSENG0138.jpg?alt=media	\N	5637148633	4	18	10	5637148371	2020-05-26 05:43:09.241359+00	\N	100000158192	3
MG7INT0036	MULTIPLEX G7 DISPLAY 3ª GENERACION	UN	281890	77954.0	CARROCERIAS BUSES	238393	REEMPLAZADO POR MG7INT0139  // ARTICULO PARA BUSES DESDE MARZO 2016 HACIA ATRÁS	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FMG7INT0036.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FMG7INT0036.jpg?alt=media	\N	5637148436	3	19	11	5637148328	2020-05-26 05:43:09.241359+00	\N	10008582-3_1	2
MG7TRA0004	LUNETA TRASERA SIN BAÑO G7 / D/P	UN	229390	65129.4	CARROCERIAS BUSES	228516	TODOS / ALTERNATIVO MG7TRA0016 PERO CON SERIGRAFIA BAÑO	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FMG7TRA0004.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FMG7TRA0004.jpg?alt=media	\N	5637148462	3	11	11	5637148335	2020-05-26 05:43:09.241359+00	\N	10008410_1	3
MG7TEC0003	FOCO TROCHA AMARILLO/AMARILLO G7	UN	16790	4707.9	CARROCERIAS BUSES	24600	TODOS LARGO 1636 /PADRON CHILE	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FMG7TEC0003.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FMG7TEC0003.jpg?alt=media	\N	5637148445	4	19	11	5637148331	2020-05-26 05:43:09.241359+00	\N	10008322_1	3
MG7TEC0004	FOCO TROCHA BLANCO G7	UN	36290	5532.4	CARROCERIAS BUSES	24320	TODOS LUZ BLANCA LARGO 1636	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FMG7TEC0004.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FMG7TEC0004.jpg?alt=media	\N	5637148445	4	19	11	5637148331	2020-05-26 05:43:09.241359+00	\N	10008604_2	3
MG7TEC0005	FOCO TROCHA CENTRAL TRASERO ROJO G7	UN	41390	14573.5	CARROCERIAS BUSES	34371	PARADISO 1200 / 1600 D/P	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FMG7TEC0005.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FMG7TEC0005.jpg?alt=media	\N	5637148445	4	19	11	5637148331	2020-05-26 05:43:09.241359+00	\N	10008605_1	3
MG7TEC0001	FOCO TROCHA TRASERO DER. G7	UN	64890	14402.8	CARROCERIAS BUSES	51153	TODOS	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FMG7TEC0001.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FMG7TEC0001.jpg?alt=media	\N	5637148445	4	19	11	5637148331	2020-05-26 05:43:09.241359+00	\N	10008606_1	3
MG7TEC0002	FOCO TROCHA TRASERO IZQ. G7	UN	68290	13310.2	CARROCERIAS BUSES	49149	TODOS	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FMG7TEC0002.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FMG7TEC0002.jpg?alt=media	\N	5637148445	4	19	11	5637148331	2020-05-26 05:43:09.241359+00	\N	10008608_1	3
MOBLUB0098	ACEITE MOTOR MOBIL DELVAC SUPER 20W50	BO	8490	6237.0	INSUMOS PARA EQUIPOS BUSES Y CAMIONES	8406	BOTELLA 4 LTS 4X4 DIESEL	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FMOBLUB0098.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FMOBLUB0098.jpg?alt=media	\N	5637148491	1	22	12	5637148340	2020-05-26 05:43:09.241359+00	\N	100076_1	2
MOBLUB0027	ACEITE TRANSMISION MOBILUBE HD PLUS 80W90 GL5	BA	41990	31281.0	INSUMOS PARA EQUIPOS BUSES Y CAMIONES	41638	BALDE 19 LTS	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FMOBLUB0027.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FMOBLUB0027.jpg?alt=media	\N	5637148491	1	22	12	5637148340	2020-05-26 05:43:09.241359+00	\N	100212_1	2
CMPACC0003	TAPA TUERCA CROMADA 33MM - REFLEX.  CRISTAL	UN	9990	4853.5	CABINA CAMIONES	10571	PACK 10 UNIDADES - PLASTICO CROMADO	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FCMPACC0003.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FCMPACC0003.jpg?alt=media	\N	5637148382	1	8	13	5637147580	2020-05-26 05:43:09.241359+00	\N	017-022-6	3
CMPACC0002	TAPA CROMADA EJE TRASERO	UN	16790	6434.2	CABINA CAMIONES	13651	PLASTICO CROMADO  10 HOYOS	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FCMPACC0002.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FCMPACC0002.jpg?alt=media	\N	5637148382	2	8	13	5637147580	2020-05-26 05:43:09.241359+00	\N	017-020_1	3
CMPACC0001	TAPA CROMADA EJE DELANTERO	UN	14790	5341.9	CABINA CAMIONES	11946	PLASTICO CROMADO  10 HOYOS	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FCMPACC0001.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FCMPACC0001.jpg?alt=media	\N	5637148382	2	8	13	5637147580	2020-05-26 05:43:09.241359+00	\N	017-021_1	3
MG7LAT0251	FOCO LATERAL POSICION AMARILLO G7	UN	11990	5474.5	CARROCERIAS BUSES	11133	LED	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FMG7LAT0251.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FMG7LAT0251.jpg?alt=media	\N	5637148432	1	9	15	5637148327	2020-05-26 05:43:09.241359+00	\N	10008544_2	2
RANFRE0352	TAPA MAZA 5 HOYOS EJE 80/90	UN	10490	3963.7	RODADO	1189998	SR Y RQ EN GENERAL - 5 HOYOS - 17.5 CM. DIAM.	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FRANFRE0352.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FRANFRE0352.jpg?alt=media	\N	5637171598	3	4	16	5637170831	2020-05-26 05:43:09.241359+00	\N	100000133019	1
RANACC0924	CATRACA SIDER TRASERA DERECHA	UN	62790	27044.4	CAJA DE CARGA EQUIPOS	52930	SIDER LINEA R 2016	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FRANACC0924.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FRANACC0924.jpg?alt=media	\N	5637148422	3	20	16	5637147592	2020-05-26 05:43:09.241359+00	\N	100000147548_1	1
RANACC0923	CATRACA SIDER TRASERA  IZQUIERDA	UN	62790	27027.0	CAJA DE CARGA EQUIPOS	54000	SIDER LINEA R 2016	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FRANACC0923.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FRANACC0923.jpg?alt=media	\N	5637148422	3	20	16	5637147592	2020-05-26 05:43:09.241359+00	\N	100000147549_1	1
RANSUS0147	BALANCIN ESTAMPADO Ø50 MM.	UN	104690	48508.0	SUSPENSION Y ENGANCHE	104696	SR EN GENERAL  CURVO L:430 X 117	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FRANSUS0147.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FRANSUS0147.jpg?alt=media	\N	5637148645	3	20	16	5637148373	2020-05-26 05:43:09.241359+00	\N	100000038769_1	2
RANECO0002	BALANCIN ESTAMPADO 50 MM.	UN	105990	20271.5	SUSPENSION Y ENGANCHE	82422	SR EN GENERAL  CURVO L:430 X 117	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FRANECO0002.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FRANECO0002.jpg?alt=media	\N	5637148645	3	4	16	5637148373	2020-05-26 05:43:09.241359+00	\N	100000169561	3
RANSUS0493	BALANCIN LUB FREE	UN	135490	36062.1	SUSPENSION Y ENGANCHE	138100	SISTEMA LUB FREE  BUJE PASADOR M30	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FRANSUS0493.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FRANSUS0493.jpg?alt=media	\N	5637148645	3	4	16	5637148373	2020-05-26 05:43:09.241359+00	\N	100000169562	3
RANSUS0515	AMORTIGUADOR SUSPENSION FS250	UN	99990	49943.6	SUSPENSION Y ENGANCHE	103994	SUSPENSION FS250  COFAP 45223	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FRANSUS0515.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FRANSUS0515.jpg?alt=media	\N	5637148644	3	4	16	5637148373	2020-05-26 05:43:09.241359+00	\N	100000201360	3
RANECO0001	PASADOR BALANCIN 50 MM.	UN	29990	10264.8	SUSPENSION Y ENGANCHE	37070	SUSPENSION ESTAMPADA Y 2000  L:202MM DECANAL:165	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FRANECO0001.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FRANECO0001.jpg?alt=media	\N	5637148648	3	4	16	5637148373	2020-05-26 05:43:09.241359+00	\N	100000221143	3
RANACC0883	SOPORTE IZQUIERDO CAJA PLASTICA RANDON	UN	28690	12418.9	CAJA DE CARGA EQUIPOS	25183	LINEA R	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FRANACC0883.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FRANACC0883.jpg?alt=media	\N	5637148402	3	20	16	5637147587	2020-05-26 05:43:09.241359+00	\N	100000029847_1	3
RANACC0884	SOPORTE DERECHO CAJA PLASTICA RANDON	UN	28790	12686.1	CAJA DE CARGA EQUIPOS	25470	LINEA R	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FRANACC0884.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FRANACC0884.jpg?alt=media	\N	5637148402	3	20	16	5637147587	2020-05-26 05:43:09.241359+00	\N	100000029849_1	3
RANACC0882	CAJA HERRAMIENTAS  PLASTICA  500X500X500	UN	181590	40787.6	CAJA DE CARGA EQUIPOS	152028	CON CHAPA SR EN GENERAL LINEA R	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FRANACC0882.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FRANACC0882.jpg?alt=media	\N	5637148402	3	20	16	5637147587	2020-05-26 05:43:09.241359+00	\N	100000034160_1	3
RANFRE0235	ANILLO IMPULSO ABS	UN	46890	6104.5	SISTEMA DE FRENO	42610	ANILLO DENTADO ABS	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FRANFRE0235.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FRANFRE0235.jpg?alt=media	\N	5637148495	3	20	16	5637148341	2020-05-26 05:43:09.241359+00	\N	100000047899_1	3
RANACC0886	CHAPA CAJA DE HERRAMIENTAS	UN	28690	6344.0	CAJA DE CARGA EQUIPOS	21925	LINEA R	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FRANACC0886.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FRANACC0886.jpg?alt=media	\N	5637148402	3	20	16	5637147587	2020-05-26 05:43:09.241359+00	\N	100000067803_1	3
RANSUS0649	BUJE BRAZO SUSPENSION FS250	UN	89990	25998.5	SUSPENSION Y ENGANCHE	78801	NUEVO  REEMPLAZA RANSUS0529	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FRANSUS0649.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FRANSUS0649.jpg?alt=media	\N	5637148646	3	20	16	5637148373	2020-05-26 05:43:09.241359+00	\N	100000133571_1	3
RANACC0894	CAJA PORTA EXTINTOR PARA 6 KG	UN	33090	14972.8	CAJA DE CARGA EQUIPOS	29347	MEDIDAS ALTO 620/ANCHO 310 /LARGO 260	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FRANACC0894.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FRANACC0894.jpg?alt=media	\N	5637148402	3	20	16	5637147587	2020-05-26 05:43:09.241359+00	\N	100000151099_1	3
RANACC0896	CAJA PORTA EXTINTOR PARA 12 KG	UN	36390	15132.8	CAJA DE CARGA EQUIPOS	32889	MEDIDAS ALTO 770/ANCHO 310 /LARGO 260	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FRANACC0896.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FRANACC0896.jpg?alt=media	\N	5637148402	3	20	16	5637147587	2020-05-26 05:43:09.241359+00	\N	100000151100_1	3
RANACC0895	CAJA PORTA EXTINTOR PARA 9 KG	UN	34390	14515.2	CAJA DE CARGA EQUIPOS	30528	MEDIDAS ALTO 690/ANCHO 310 /LARGO 260	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FRANACC0895.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FRANACC0895.jpg?alt=media	\N	5637148402	3	20	16	5637147587	2020-05-26 05:43:09.241359+00	\N	100000154848_1	3
MARSAL1217	A/C MOTOR VENTILADOR AXIAL CONDENSADOR TRANSACTA  24V	UN	74690	18681.0	CARROCERIAS BUSES	130600	TRANSACTA	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FMARSAL1217.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FMARSAL1217.jpg?alt=media	\N	5637148441	2	6	17	5637148330	2020-05-26 05:43:09.241359+00	\N	021-00063-000_1	3
MARSAL0907	A/C MODULO DE CONTROL ELECTRONICO GLW-161	UN	141990	55675.4	CARROCERIAS BUSES	141135	SPHEROS GLW 161 / SIN RENOVACION / AEROSPFER 300/330/350 / CC160/300/350 / REEMPLAZA A GLT040 / 12V/24V	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FMARSAL0907.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FMARSAL0907.jpg?alt=media	\N	5637148441	3	5	17	5637148330	2020-05-26 05:43:09.241359+00	\N	007-00008-000_2	3
MARSAL0935	A/C PLACA RELES GLW122	UN	223390	64990.1	CARROCERIAS BUSES	183783	CC430 PARADISO 1800 DD	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FMARSAL0935.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FMARSAL0935.jpg?alt=media	\N	5637148441	3	5	17	5637148330	2020-05-26 05:43:09.241359+00	\N	007-00022-000_2	3
MARSAL0954	A/C MODULO DE CONTROL ELECTRONICO GLW-163	UN	160890	56912.2	CARROCERIAS BUSES	133750	SPHEROS GLW 163 / TODOS / CON RENOVACION / AEROSPHER 300/330/350 / CC300/350 / 12V/24V	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FMARSAL0954.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FMARSAL0954.jpg?alt=media	\N	5637148441	3	5	17	5637148330	2020-05-26 05:43:09.241359+00	\N	007-00089-000_1	3
MARSAL0942	A/C TERMOSTATO ANTICONGELAMIENTO	UN	25290	10102.1	CARROCERIAS BUSES	19084	TODAS	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FMARSAL0942.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FMARSAL0942.jpg?alt=media	\N	5637148441	3	5	17	5637148330	2020-05-26 05:43:09.241359+00	\N	010-00016-000_2	3
MARSAL0920	A/C FUSIBLE 175A	UN	8690	1848.3	CARROCERIAS BUSES	7388	CC430 PARADISO 1800 DD	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FMARSAL0920.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FMARSAL0920.jpg?alt=media	\N	5637148441	3	5	17	5637148330	2020-05-26 05:43:09.241359+00	\N	015-00030-000_1	3
MARSAL0952	A/C MOTOR VENTILADOR CONDENSADOR DCM 24VCC	UN	230490	64465.3	CARROCERIAS BUSES	180515	CC140/150/160/165S/170S / VOLARE TB11S3001	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FMARSAL0952.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FMARSAL0952.jpg?alt=media	\N	5637148441	3	5	17	5637148330	2020-05-26 05:43:09.241359+00	\N	021-00003-000_1	3
MARSAL0970	A/C SOPORTE AMORTIGUADOR BASE COMPRESOR BITZER	UN	80890	23179.9	CARROCERIAS BUSES	65115	NO DISTRIBUIR	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FMARSAL0970.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FMARSAL0970.jpg?alt=media	\N	5637148441	3	5	17	5637148330	2020-05-26 05:43:09.241359+00	\N	039-00031-000_1	3
MARSAL1081	A/C VALVULA EXPANSIÓN 2.5 TN / NUEVA / CHOFER G7	UN	53190	13691.8	CARROCERIAS BUSES	44971	CC140/150/160 VOLARE / VALVULA EXPANSION AIRE ACONDICIONADO CHOFER G7	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FMARSAL1081.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FMARSAL1081.jpg?alt=media	\N	5637148441	4	5	17	5637148330	2020-05-26 05:43:09.241359+00	\N	012-00005-001_1	3
MARSAL0941	A/C CAJA / SOPORTE / PARA FUSIBLE 125A	UN	18990	5815.5	CARROCERIAS BUSES	15467	CC160T/170T/200 SENIOR/ 300/350 RODOVIARIOS / 430 PARADISO 1800 DD	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FMARSAL0941.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FMARSAL0941.jpg?alt=media	\N	5637148441	4	5	17	5637148330	2020-05-26 05:43:09.241359+00	\N	015-00031-000_2	3
SBUAIR0049	TECALAN 1/2" NEGRO	RLL	23690	4530.8	SISTEMA DE FRENO	20990	ROLLO 25 MT 	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FSBUAIR0049.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FSBUAIR0049.jpg?alt=media	\N	5637148519	4	13	18	5637148345	2020-05-26 05:43:09.241359+00	\N	0720012T	1
SBUAIR0048	TECALAN 3/8" NEGRO	RLL	17890	8047.2	SISTEMA DE FRENO	15990	ROLLO 25 MT 	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FSBUAIR0048.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FSBUAIR0048.jpg?alt=media	\N	5637148519	4	13	18	5637148345	2020-05-26 05:43:09.241359+00	\N	0720038T	1
SBUAIR0044	TECALAN 10 MM NEGRO	RLL	22590	6628.4	SISTEMA DE FRENO	14990	ROLLO 25 MT 	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FSBUAIR0044.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FSBUAIR0044.jpg?alt=media	\N	5637148519	4	13	18	5637148345	2020-05-26 05:43:09.241359+00	\N	07201007T	1
SBUAIR0045	TECALAN 12 MM NEGRO	RLL	26790	1332.5	SISTEMA DE FRENO	19990	ROLLO 25 MT 	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FSBUAIR0045.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FSBUAIR0045.jpg?alt=media	\N	5637148519	4	13	18	5637148345	2020-05-26 05:43:09.241359+00	\N	07201209T	1
SBUAIR0046	TECALAN 16 MM NEGRO	RLL	35690	12676.5	SISTEMA DE FRENO	31990	ROLLO 25 MT 	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FSBUAIR0046.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FSBUAIR0046.jpg?alt=media	\N	5637148519	4	13	18	5637148345	2020-05-26 05:43:09.241359+00	\N	07201612T	1
SBUAIR0050	MANGUERA ESPIRAL M16 AMARILLA	Un	15890	4087.3	SISTEMA DE FRENO	9980	20 ESPIRAS 	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FSBUAIR0050.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FSBUAIR0050.jpg?alt=media	\N	5637148519	4	13	18	5637148345	2020-05-26 05:43:09.241359+00	\N	08205516VWTAM	1
SBUAIR0051	MANGUERA ESPIRAL M16 ROJA	Un	15890	4403.5	SISTEMA DE FRENO	9980	20 ESPIRAS	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FSBUAIR0051.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FSBUAIR0051.jpg?alt=media	\N	5637148519	4	13	18	5637148345	2020-05-26 05:43:09.241359+00	\N	08205516VWTVM	1
SBUAIR0052	MANGUERA ESPIRAL 1/2 AMARILLA	Un	14990	4099.6	SISTEMA DE FRENO	7989	16 ESPIRAS	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FSBUAIR0052.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FSBUAIR0052.jpg?alt=media	\N	5637148519	4	13	18	5637148345	2020-05-26 05:43:09.241359+00	\N	0820UN012TAM	1
SBUAIR0053	MANGUERA ESPIRAL 1/2 ROJA	Un	14990	4135.7	SISTEMA DE FRENO	7989	16 ESPIRAS	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FSBUAIR0053.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FSBUAIR0053.jpg?alt=media	\N	5637148519	4	13	18	5637148345	2020-05-26 05:43:09.241359+00	\N	0820UN012TVM	1
SPYSUS0043	AMORTIGUADOR SUSPENSION NEUMATICA BAJA	UN	135490	33256.9	SUSPENSION Y ENGANCHE	103816	SUSPENSION NEUMATICA COMBINADA BAJA/COFAP 45145  PARA PERNO D24 MM	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FSPYSUS0043.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FSPYSUS0043.jpg?alt=media	\N	5637148644	4	4	19	5637148373	2020-05-26 05:43:09.241359+00	\N	100000201361	3
MARSAL1249	A/C SENSOR TEMPERATURA CABLE	UN	12590	1971.1	CARROCERIAS BUSES	7950	TODAS TRANSACTA	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FMARSAL1249.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FMARSAL1249.jpg?alt=media	\N	5637148441	1	6	20	5637148330	2020-05-26 05:43:09.241359+00	\N	007-00007-000_2	1
TROELE0019	CONECTOR  ELECTRICO  FOCO LED 2 CONTACTOS	UN	1290	266.5	CAJA DE CARGA EQUIPOS	863	CONECTOR ELECTRICO DE 2 CONTACTOS PARA FOCOS TROELE	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FTROELE0019.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FTROELE0019.jpg?alt=media	\N	5637148404	2	3	21	5637147587	2020-05-26 05:43:09.241359+00	\N	0-CON-2_1	3
TROELE0020	CONECTOR  ELECTRICO  FOCO LED 3 CONTACTOS	UN	1290	365.2	CAJA DE CARGA EQUIPOS	936	CONECTOR ELECTRICO DE 3  CONTACTOS  PARA  FOCO TROELE	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FTROELE0020.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FTROELE0020.jpg?alt=media	\N	5637148404	2	3	21	5637147587	2020-05-26 05:43:09.241359+00	\N	0-CON-3_1	3
MARSAL1296	VALVULA DE EXPANSION TGEN 3,5TR	Un	69990	47879.0	CARROCERIAS BUSES	69990	TORINO NORMAL Y ARTICULADO TRANSANTIAGO 2019 / EQUIPOS CC355 Y CC640	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FMARSAL1296.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FMARSAL1296.jpg?alt=media	\N	5637148441	3	5	22	5637148330	2020-05-26 05:43:09.241359+00	\N	012-00135-000	1
MARSAL1222	MOTOR VENTILADOR RADIAL EVAPORADOR "SPHEROS/VALEO" 24 VOLTS	UN	89090	25726.6	CARROCERIAS BUSES	74589	TODOS LOS MODELOS	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FMARSAL1222.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FMARSAL1222.jpg?alt=media	\N	5637148441	3	6	22	5637148330	2020-05-26 05:43:09.241359+00	\N	021-00064-000_1	1
VIDVID0128	VIDRIO FIJO SALA LI/LD VIAGGIO 900 /1050 G7	UN	125790	44463.6	CARROCERIAS BUSES	140793	ANCHO 1690 ALTO 1065 / VIAGGIO/PARADISO PDSO 1200 G7 / QUEILENBUS	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FVIDVID0128.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FVIDVID0128.jpg?alt=media	\N	5637148465	4	11	23	5637148335	2020-05-26 05:43:09.241359+00	\N	10008269_2	3
MG7VID0019	VIDRIO ULTIMO LI. PDSO 1050 G7	UN	302890	36048.4	CARROCERIAS BUSES	198036	ANCHO 1799 ALTO 1065	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FMG7VID0019.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FMG7VID0019.jpg?alt=media	\N	5637148465	4	11	23	5637148335	2020-05-26 05:43:09.241359+00	\N	10032905_1	3
RIWANT0003	LUBRICANTE ANTICORROSIVO WD-40 311 GRS	UN	5490	3124.6	SEGURIDAD Y HERRAMIENTAS	5268	ANTICORROSIVO 311 GRS	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FRIWANT0003.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FRIWANT0003.jpg?alt=media	\N	5637148607	3	16	24	5637148366	2020-05-26 05:43:09.241359+00	\N	100050022_1	3
RIWANT0001	LUBRICANTE ANTICORROSIVO WD-40 155 GRS	UN	3990	1968.0	SEGURIDAD Y HERRAMIENTAS	3262	ANTICORROSIVO 155 GRS	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FRIWANT0001.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FRIWANT0001.jpg?alt=media	\N	5637148607	3	16	24	5637148366	2020-05-26 05:43:09.241359+00	\N	100050050_1	3
RIWANT0002	LUBRICANTE ANTICORROSIVO WD-40 254 GRS FLEXI TAPA	UN	4990	3111.9	SEGURIDAD Y HERRAMIENTAS	4587	ANTICORROSIVO 254 GRS	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FRIWANT0002.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FRIWANT0002.jpg?alt=media	\N	5637148607	3	16	24	5637148366	2020-05-26 05:43:09.241359+00	\N	100050060_1	3
RIWPRO0003	WD-40 SPECIALIST PENETRANTE 311 GRS.	UN	6290	2687.5	SEGURIDAD Y HERRAMIENTAS	4420	PENETRANTE 311 GRS	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FRIWPRO0003.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FRIWPRO0003.jpg?alt=media	\N	5637148609	3	16	24	5637148366	2020-05-26 05:43:09.241359+00	\N	100050086	3
RIWPRO0002	WD-40 SPECIALIST LUBRICANTE DE SILICONA 311 GRS.	UN	4690	2403.4	SEGURIDAD Y HERRAMIENTAS	4129	LUBRICANTE DE SILICONA 311 GRS	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FRIWPRO0002.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FRIWPRO0002.jpg?alt=media	\N	5637148609	3	16	24	5637148366	2020-05-26 05:43:09.241359+00	\N	100050087	3
RIWPRO0001	WD-40 SPECIALIST LIMPIA CONTACTOS 326 ML	UN	5990	2611.0	SEGURIDAD Y HERRAMIENTAS	4958	WD-40 Specialist LIMP. D/CONTACTOS 8OZ/226G/281ML 6C	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FRIWPRO0001.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FRIWPRO0001.jpg?alt=media	\N	5637148609	3	16	24	5637148366	2020-05-26 05:43:09.241359+00	\N	100050093	3
MARSAL0672	A/C PRESOSTATO ALTA PRESION PMAX418BPSH 6A 240VAC	UN	20090	8070.8	CARROCERIAS BUSES	21346	TODOS LOS COMPRESORES / SPHEROS	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/150%2FMARSAL0672.jpg?alt=media	https://firebasestorage.googleapis.com/v0/b/imagenimplementos.appspot.com/o/450%2FMARSAL0672.jpg?alt=media	\N	5637148441	3	5	25	5637148330	2020-05-26 05:43:09.241359+00	\N	010-00018-000_1	1
\.


--
-- Data for Name: proveedors; Type: TABLE DATA; Schema: public; Owner: georecursos
--

COPY public.proveedors (id, codigo, nombre, disable, "createdAt", "updatedAt") FROM stdin;
1	007784609/0001-48	\N	f	2020-05-26 05:23:22.626282+00	\N
2	07041007/0001-09	\N	f	2020-05-26 05:23:22.626282+00	\N
3	10102976	\N	f	2020-05-26 05:23:22.626282+00	\N
4	10523280/0001-76	\N	f	2020-05-26 05:23:22.626282+00	\N
5	17077679/0001-10	\N	f	2020-05-26 05:23:22.626282+00	\N
6	21118681000167	\N	f	2020-05-26 05:23:22.626282+00	\N
7	223313040	\N	f	2020-05-26 05:23:22.626282+00	\N
8	2427	\N	f	2020-05-26 05:23:22.626282+00	\N
9	2484	\N	f	2020-05-26 05:23:22.626282+00	\N
10	3172	\N	f	2020-05-26 05:23:22.626282+00	\N
11	411	\N	f	2020-05-26 05:23:22.626282+00	\N
12	46	\N	f	2020-05-26 05:23:22.626282+00	\N
13	470947430001-31	\N	f	2020-05-26 05:23:22.626282+00	\N
14	57497539/0001-15	\N	f	2020-05-26 05:23:22.626282+00	\N
15	76543035-6	\N	f	2020-05-26 05:23:22.626282+00	\N
16	78615470-7	\N	f	2020-05-26 05:23:22.626282+00	\N
17	799836254	\N	f	2020-05-26 05:23:22.626282+00	\N
18	843966000190	\N	f	2020-05-26 05:23:22.626282+00	\N
19	88611835/0008-03	\N	f	2020-05-26 05:23:22.626282+00	\N
20	89086144/0001-16	\N	f	2020-05-26 05:23:22.626282+00	\N
21	93725000-2	\N	f	2020-05-26 05:23:22.626282+00	\N
22	99520000-7	\N	f	2020-05-26 05:23:22.626282+00	\N
\.


--
-- Data for Name: tipo_fabricacions; Type: TABLE DATA; Schema: public; Owner: georecursos
--

COPY public.tipo_fabricacions (id, nombre, disable, "createdAt", "updatedAt") FROM stdin;
1	ALTERNATIVO	f	2020-05-26 05:07:41.437629+00	\N
2	ALTERNATIVO 1	f	2020-05-26 05:07:41.437629+00	\N
3	GENUINO	f	2020-05-26 05:07:41.437629+00	\N
4	OEM	f	2020-05-26 05:07:41.437629+00	\N
\.


--
-- Name: estados_id_seq; Type: SEQUENCE SET; Schema: public; Owner: georecursos
--

SELECT pg_catalog.setval('public.estados_id_seq', 1, false);


--
-- Name: marcas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: georecursos
--

SELECT pg_catalog.setval('public.marcas_id_seq', 1, false);


--
-- Name: proveedors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: georecursos
--

SELECT pg_catalog.setval('public.proveedors_id_seq', 1, false);


--
-- Name: tipo_fabricacions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: georecursos
--

SELECT pg_catalog.setval('public.tipo_fabricacions_id_seq', 1, false);


--
-- Name: categoria categoria_nombre_key; Type: CONSTRAINT; Schema: public; Owner: georecursos
--

ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_nombre_key UNIQUE (nombre);


--
-- Name: categoria categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: georecursos
--

ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id);


--
-- Name: estados estados_nombre_key; Type: CONSTRAINT; Schema: public; Owner: georecursos
--

ALTER TABLE ONLY public.estados
    ADD CONSTRAINT estados_nombre_key UNIQUE (nombre);


--
-- Name: estados estados_pkey; Type: CONSTRAINT; Schema: public; Owner: georecursos
--

ALTER TABLE ONLY public.estados
    ADD CONSTRAINT estados_pkey PRIMARY KEY (id);


--
-- Name: lineas lineas_nombre_key; Type: CONSTRAINT; Schema: public; Owner: georecursos
--

ALTER TABLE ONLY public.lineas
    ADD CONSTRAINT lineas_nombre_key UNIQUE (nombre);


--
-- Name: lineas lineas_pkey; Type: CONSTRAINT; Schema: public; Owner: georecursos
--

ALTER TABLE ONLY public.lineas
    ADD CONSTRAINT lineas_pkey PRIMARY KEY (id);


--
-- Name: marcas marcas_nombre_key; Type: CONSTRAINT; Schema: public; Owner: georecursos
--

ALTER TABLE ONLY public.marcas
    ADD CONSTRAINT marcas_nombre_key UNIQUE (nombre);


--
-- Name: marcas marcas_pkey; Type: CONSTRAINT; Schema: public; Owner: georecursos
--

ALTER TABLE ONLY public.marcas
    ADD CONSTRAINT marcas_pkey PRIMARY KEY (id);


--
-- Name: productos productos_pkey; Type: CONSTRAINT; Schema: public; Owner: georecursos
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (sku);


--
-- Name: proveedors proveedors_codigo_key; Type: CONSTRAINT; Schema: public; Owner: georecursos
--

ALTER TABLE ONLY public.proveedors
    ADD CONSTRAINT proveedors_codigo_key UNIQUE (codigo);


--
-- Name: proveedors proveedors_nombre_key; Type: CONSTRAINT; Schema: public; Owner: georecursos
--

ALTER TABLE ONLY public.proveedors
    ADD CONSTRAINT proveedors_nombre_key UNIQUE (nombre);


--
-- Name: proveedors proveedors_pkey; Type: CONSTRAINT; Schema: public; Owner: georecursos
--

ALTER TABLE ONLY public.proveedors
    ADD CONSTRAINT proveedors_pkey PRIMARY KEY (id);


--
-- Name: tipo_fabricacions tipo_fabricacions_nombre_key; Type: CONSTRAINT; Schema: public; Owner: georecursos
--

ALTER TABLE ONLY public.tipo_fabricacions
    ADD CONSTRAINT tipo_fabricacions_nombre_key UNIQUE (nombre);


--
-- Name: tipo_fabricacions tipo_fabricacions_pkey; Type: CONSTRAINT; Schema: public; Owner: georecursos
--

ALTER TABLE ONLY public.tipo_fabricacions
    ADD CONSTRAINT tipo_fabricacions_pkey PRIMARY KEY (id);


--
-- Name: fki_fk_id_estado; Type: INDEX; Schema: public; Owner: georecursos
--

CREATE INDEX fki_fk_id_estado ON public.productos USING btree (fk_id_estado);


--
-- Name: productos productos_fk_id_categoria_fkey; Type: FK CONSTRAINT; Schema: public; Owner: georecursos
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_fk_id_categoria_fkey FOREIGN KEY (fk_id_categoria) REFERENCES public.categoria(id) ON DELETE CASCADE;


--
-- Name: productos productos_fk_id_estado_fkey; Type: FK CONSTRAINT; Schema: public; Owner: georecursos
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_fk_id_estado_fkey FOREIGN KEY (fk_id_estado) REFERENCES public.estados(id) ON DELETE CASCADE;


--
-- Name: productos productos_fk_id_fabricacion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: georecursos
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_fk_id_fabricacion_fkey FOREIGN KEY (fk_id_fabricacion) REFERENCES public.tipo_fabricacions(id) ON DELETE CASCADE;


--
-- Name: productos productos_fk_id_linea_fkey; Type: FK CONSTRAINT; Schema: public; Owner: georecursos
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_fk_id_linea_fkey FOREIGN KEY (fk_id_linea) REFERENCES public.lineas(id) ON DELETE CASCADE;


--
-- Name: productos productos_fk_id_marca_fkey; Type: FK CONSTRAINT; Schema: public; Owner: georecursos
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_fk_id_marca_fkey FOREIGN KEY (fk_id_marca) REFERENCES public.marcas(id) ON DELETE CASCADE;


--
-- Name: productos productos_fk_id_proveedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: georecursos
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_fk_id_proveedor_fkey FOREIGN KEY (fk_id_proveedor) REFERENCES public.proveedors(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

