--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.2

-- Started on 2022-10-30 18:15:49

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

DROP DATABASE db_risk_management;
--
-- TOC entry 3499 (class 1262 OID 16793)
-- Name: db_risk_management; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE db_risk_management WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_PH.UTF-8';


ALTER DATABASE db_risk_management OWNER TO postgres;

\connect db_risk_management

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
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3501 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 210 (class 1259 OID 16822)
-- Name: barangay; Type: TABLE; Schema: public; Owner: risk_management_user
--

CREATE TABLE public.barangay (
    barangay_id integer NOT NULL,
    name character varying(1028),
    political_boundaries text,
    elevation real DEFAULT 0
);


ALTER TABLE public.barangay OWNER TO risk_management_user;

--
-- TOC entry 209 (class 1259 OID 16821)
-- Name: barangay_barangay_id_seq; Type: SEQUENCE; Schema: public; Owner: risk_management_user
--

CREATE SEQUENCE public.barangay_barangay_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.barangay_barangay_id_seq OWNER TO risk_management_user;

--
-- TOC entry 3502 (class 0 OID 0)
-- Dependencies: 209
-- Name: barangay_barangay_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: risk_management_user
--

ALTER SEQUENCE public.barangay_barangay_id_seq OWNED BY public.barangay.barangay_id;


--
-- TOC entry 224 (class 1259 OID 16991)
-- Name: barangay_calamity_incident; Type: TABLE; Schema: public; Owner: risk_management_user
--

CREATE TABLE public.barangay_calamity_incident (
    calamity_incident_id integer NOT NULL,
    barangay_id integer,
    calamity_category_id integer,
    coordinates text
);


ALTER TABLE public.barangay_calamity_incident OWNER TO risk_management_user;

--
-- TOC entry 223 (class 1259 OID 16990)
-- Name: barangay_calamity_incident_calamity_incident_id_seq; Type: SEQUENCE; Schema: public; Owner: risk_management_user
--

CREATE SEQUENCE public.barangay_calamity_incident_calamity_incident_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.barangay_calamity_incident_calamity_incident_id_seq OWNER TO risk_management_user;

--
-- TOC entry 3503 (class 0 OID 0)
-- Dependencies: 223
-- Name: barangay_calamity_incident_calamity_incident_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: risk_management_user
--

ALTER SEQUENCE public.barangay_calamity_incident_calamity_incident_id_seq OWNED BY public.barangay_calamity_incident.calamity_incident_id;


--
-- TOC entry 222 (class 1259 OID 16963)
-- Name: barangay_casualty; Type: TABLE; Schema: public; Owner: risk_management_user
--

CREATE TABLE public.barangay_casualty (
    resident_id integer,
    barangay_id integer,
    casualty_category_id integer
);


ALTER TABLE public.barangay_casualty OWNER TO risk_management_user;

--
-- TOC entry 230 (class 1259 OID 17055)
-- Name: barangay_copy; Type: TABLE; Schema: public; Owner: risk_management_user
--

CREATE TABLE public.barangay_copy (
    barangay_id integer,
    name character varying(1028),
    political_boundaries text
);


ALTER TABLE public.barangay_copy OWNER TO risk_management_user;

--
-- TOC entry 233 (class 1259 OID 25380)
-- Name: barangay_copy_complete; Type: TABLE; Schema: public; Owner: risk_management_user
--

CREATE TABLE public.barangay_copy_complete (
    barangay_id integer,
    name character varying(1028),
    political_boundaries text,
    elevation real
);


ALTER TABLE public.barangay_copy_complete OWNER TO risk_management_user;

--
-- TOC entry 231 (class 1259 OID 25356)
-- Name: barangay_risk_statistics; Type: TABLE; Schema: public; Owner: risk_management_user
--

CREATE TABLE public.barangay_risk_statistics (
    barangay_id integer,
    num_exp_flooding double precision DEFAULT 0 NOT NULL,
    norm_num_exp_flooding double precision DEFAULT 0 NOT NULL,
    prop_exp_flooding double precision DEFAULT 0 NOT NULL,
    norm_prop_exp_flooding double precision DEFAULT 0 NOT NULL
);


ALTER TABLE public.barangay_risk_statistics OWNER TO risk_management_user;

--
-- TOC entry 232 (class 1259 OID 25369)
-- Name: barangay_risk_statistics_copy_complete; Type: TABLE; Schema: public; Owner: risk_management_user
--

CREATE TABLE public.barangay_risk_statistics_copy_complete (
    barangay_id integer,
    num_exp_flooding double precision,
    norm_num_exp_flooding double precision,
    prop_exp_flooding double precision,
    norm_prop_exp_flooding double precision
);


ALTER TABLE public.barangay_risk_statistics_copy_complete OWNER TO risk_management_user;

--
-- TOC entry 226 (class 1259 OID 17008)
-- Name: calamity_categories; Type: TABLE; Schema: public; Owner: risk_management_user
--

CREATE TABLE public.calamity_categories (
    calamity_category_id integer NOT NULL,
    calamity_label character varying(258)
);


ALTER TABLE public.calamity_categories OWNER TO risk_management_user;

--
-- TOC entry 225 (class 1259 OID 17007)
-- Name: calamity_categories_calamity_category_id_seq; Type: SEQUENCE; Schema: public; Owner: risk_management_user
--

CREATE SEQUENCE public.calamity_categories_calamity_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.calamity_categories_calamity_category_id_seq OWNER TO risk_management_user;

--
-- TOC entry 3504 (class 0 OID 0)
-- Dependencies: 225
-- Name: calamity_categories_calamity_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: risk_management_user
--

ALTER SEQUENCE public.calamity_categories_calamity_category_id_seq OWNED BY public.calamity_categories.calamity_category_id;


--
-- TOC entry 221 (class 1259 OID 16957)
-- Name: casualty_categories; Type: TABLE; Schema: public; Owner: risk_management_user
--

CREATE TABLE public.casualty_categories (
    casualty_category_id integer NOT NULL,
    casualty_label character varying(258)
);


ALTER TABLE public.casualty_categories OWNER TO risk_management_user;

--
-- TOC entry 220 (class 1259 OID 16956)
-- Name: casualty_categories_casualty_category_id_seq; Type: SEQUENCE; Schema: public; Owner: risk_management_user
--

CREATE SEQUENCE public.casualty_categories_casualty_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.casualty_categories_casualty_category_id_seq OWNER TO risk_management_user;

--
-- TOC entry 3505 (class 0 OID 0)
-- Dependencies: 220
-- Name: casualty_categories_casualty_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: risk_management_user
--

ALTER SEQUENCE public.casualty_categories_casualty_category_id_seq OWNED BY public.casualty_categories.casualty_category_id;


--
-- TOC entry 227 (class 1259 OID 17014)
-- Name: cauayan_city; Type: TABLE; Schema: public; Owner: risk_management_user
--

CREATE TABLE public.cauayan_city (
    name character varying(256),
    political_boundaries text
);


ALTER TABLE public.cauayan_city OWNER TO risk_management_user;

--
-- TOC entry 229 (class 1259 OID 17044)
-- Name: evacuation_center; Type: TABLE; Schema: public; Owner: risk_management_user
--

CREATE TABLE public.evacuation_center (
    evacuation_center_id integer NOT NULL,
    facility_id integer,
    date_active_start timestamp without time zone,
    date_active_end timestamp without time zone
);


ALTER TABLE public.evacuation_center OWNER TO risk_management_user;

--
-- TOC entry 235 (class 1259 OID 25397)
-- Name: evacuation_center_copy_complete; Type: TABLE; Schema: public; Owner: risk_management_user
--

CREATE TABLE public.evacuation_center_copy_complete (
    evacuation_center_id integer,
    facility_id integer,
    date_active_start timestamp without time zone,
    date_active_end timestamp without time zone
);


ALTER TABLE public.evacuation_center_copy_complete OWNER TO risk_management_user;

--
-- TOC entry 228 (class 1259 OID 17043)
-- Name: evacuation_center_evacuation_center_id_seq; Type: SEQUENCE; Schema: public; Owner: risk_management_user
--

CREATE SEQUENCE public.evacuation_center_evacuation_center_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.evacuation_center_evacuation_center_id_seq OWNER TO risk_management_user;

--
-- TOC entry 3506 (class 0 OID 0)
-- Dependencies: 228
-- Name: evacuation_center_evacuation_center_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: risk_management_user
--

ALTER SEQUENCE public.evacuation_center_evacuation_center_id_seq OWNED BY public.evacuation_center.evacuation_center_id;


--
-- TOC entry 215 (class 1259 OID 16921)
-- Name: evacuation_center_history; Type: TABLE; Schema: public; Owner: risk_management_user
--

CREATE TABLE public.evacuation_center_history (
    evacuation_center_id integer NOT NULL,
    barangay_id integer,
    name character varying(1028),
    date_active_start timestamp without time zone,
    date_active_end timestamp without time zone
);


ALTER TABLE public.evacuation_center_history OWNER TO risk_management_user;

--
-- TOC entry 214 (class 1259 OID 16920)
-- Name: evacuation_center_history_evacuation_center_id_seq; Type: SEQUENCE; Schema: public; Owner: risk_management_user
--

CREATE SEQUENCE public.evacuation_center_history_evacuation_center_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.evacuation_center_history_evacuation_center_id_seq OWNER TO risk_management_user;

--
-- TOC entry 3507 (class 0 OID 0)
-- Dependencies: 214
-- Name: evacuation_center_history_evacuation_center_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: risk_management_user
--

ALTER SEQUENCE public.evacuation_center_history_evacuation_center_id_seq OWNED BY public.evacuation_center_history.evacuation_center_id;


--
-- TOC entry 219 (class 1259 OID 16938)
-- Name: facilities; Type: TABLE; Schema: public; Owner: risk_management_user
--

CREATE TABLE public.facilities (
    facility_id integer NOT NULL,
    barangay_id integer,
    facility_type_id integer,
    name character varying(1028),
    address text,
    phone_primary character varying(128),
    phone_secondary character varying(128),
    coordinates text
);


ALTER TABLE public.facilities OWNER TO risk_management_user;

--
-- TOC entry 234 (class 1259 OID 25392)
-- Name: facilities_copy_complete; Type: TABLE; Schema: public; Owner: risk_management_user
--

CREATE TABLE public.facilities_copy_complete (
    facility_id integer,
    barangay_id integer,
    facility_type_id integer,
    name character varying(1028),
    address text,
    phone_primary character varying(128),
    phone_secondary character varying(128),
    coordinates text
);


ALTER TABLE public.facilities_copy_complete OWNER TO risk_management_user;

--
-- TOC entry 218 (class 1259 OID 16937)
-- Name: facilities_facility_id_seq; Type: SEQUENCE; Schema: public; Owner: risk_management_user
--

CREATE SEQUENCE public.facilities_facility_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.facilities_facility_id_seq OWNER TO risk_management_user;

--
-- TOC entry 3508 (class 0 OID 0)
-- Dependencies: 218
-- Name: facilities_facility_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: risk_management_user
--

ALTER SEQUENCE public.facilities_facility_id_seq OWNED BY public.facilities.facility_id;


--
-- TOC entry 217 (class 1259 OID 16931)
-- Name: facility_type; Type: TABLE; Schema: public; Owner: risk_management_user
--

CREATE TABLE public.facility_type (
    facility_type_id integer NOT NULL,
    facility_type_label character varying(256)
);


ALTER TABLE public.facility_type OWNER TO risk_management_user;

--
-- TOC entry 216 (class 1259 OID 16930)
-- Name: facility_type_facility_type_id_seq; Type: SEQUENCE; Schema: public; Owner: risk_management_user
--

CREATE SEQUENCE public.facility_type_facility_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.facility_type_facility_type_id_seq OWNER TO risk_management_user;

--
-- TOC entry 3509 (class 0 OID 0)
-- Dependencies: 216
-- Name: facility_type_facility_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: risk_management_user
--

ALTER SEQUENCE public.facility_type_facility_type_id_seq OWNED BY public.facility_type.facility_type_id;


--
-- TOC entry 213 (class 1259 OID 16902)
-- Name: resident; Type: TABLE; Schema: public; Owner: risk_management_user
--

CREATE TABLE public.resident (
    resident_id integer NOT NULL,
    barangay_id integer,
    resident_geo_id integer,
    first_name character varying(1028),
    last_name character varying(1028),
    address character varying(2048)
);


ALTER TABLE public.resident OWNER TO risk_management_user;

--
-- TOC entry 211 (class 1259 OID 16895)
-- Name: resident_geo_spatial_data; Type: TABLE; Schema: public; Owner: risk_management_user
--

CREATE TABLE public.resident_geo_spatial_data (
    resident_geo_id integer,
    coordinates text
);


ALTER TABLE public.resident_geo_spatial_data OWNER TO risk_management_user;

--
-- TOC entry 212 (class 1259 OID 16901)
-- Name: resident_resident_id_seq; Type: SEQUENCE; Schema: public; Owner: risk_management_user
--

CREATE SEQUENCE public.resident_resident_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resident_resident_id_seq OWNER TO risk_management_user;

--
-- TOC entry 3510 (class 0 OID 0)
-- Dependencies: 212
-- Name: resident_resident_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: risk_management_user
--

ALTER SEQUENCE public.resident_resident_id_seq OWNED BY public.resident.resident_id;


--
-- TOC entry 3281 (class 2604 OID 16825)
-- Name: barangay barangay_id; Type: DEFAULT; Schema: public; Owner: risk_management_user
--

ALTER TABLE ONLY public.barangay ALTER COLUMN barangay_id SET DEFAULT nextval('public.barangay_barangay_id_seq'::regclass);


--
-- TOC entry 3288 (class 2604 OID 16994)
-- Name: barangay_calamity_incident calamity_incident_id; Type: DEFAULT; Schema: public; Owner: risk_management_user
--

ALTER TABLE ONLY public.barangay_calamity_incident ALTER COLUMN calamity_incident_id SET DEFAULT nextval('public.barangay_calamity_incident_calamity_incident_id_seq'::regclass);


--
-- TOC entry 3289 (class 2604 OID 17011)
-- Name: calamity_categories calamity_category_id; Type: DEFAULT; Schema: public; Owner: risk_management_user
--

ALTER TABLE ONLY public.calamity_categories ALTER COLUMN calamity_category_id SET DEFAULT nextval('public.calamity_categories_calamity_category_id_seq'::regclass);


--
-- TOC entry 3287 (class 2604 OID 16960)
-- Name: casualty_categories casualty_category_id; Type: DEFAULT; Schema: public; Owner: risk_management_user
--

ALTER TABLE ONLY public.casualty_categories ALTER COLUMN casualty_category_id SET DEFAULT nextval('public.casualty_categories_casualty_category_id_seq'::regclass);


--
-- TOC entry 3290 (class 2604 OID 17047)
-- Name: evacuation_center evacuation_center_id; Type: DEFAULT; Schema: public; Owner: risk_management_user
--

ALTER TABLE ONLY public.evacuation_center ALTER COLUMN evacuation_center_id SET DEFAULT nextval('public.evacuation_center_evacuation_center_id_seq'::regclass);


--
-- TOC entry 3284 (class 2604 OID 16924)
-- Name: evacuation_center_history evacuation_center_id; Type: DEFAULT; Schema: public; Owner: risk_management_user
--

ALTER TABLE ONLY public.evacuation_center_history ALTER COLUMN evacuation_center_id SET DEFAULT nextval('public.evacuation_center_history_evacuation_center_id_seq'::regclass);


--
-- TOC entry 3286 (class 2604 OID 16941)
-- Name: facilities facility_id; Type: DEFAULT; Schema: public; Owner: risk_management_user
--

ALTER TABLE ONLY public.facilities ALTER COLUMN facility_id SET DEFAULT nextval('public.facilities_facility_id_seq'::regclass);


--
-- TOC entry 3285 (class 2604 OID 16934)
-- Name: facility_type facility_type_id; Type: DEFAULT; Schema: public; Owner: risk_management_user
--

ALTER TABLE ONLY public.facility_type ALTER COLUMN facility_type_id SET DEFAULT nextval('public.facility_type_facility_type_id_seq'::regclass);


--
-- TOC entry 3283 (class 2604 OID 16905)
-- Name: resident resident_id; Type: DEFAULT; Schema: public; Owner: risk_management_user
--

ALTER TABLE ONLY public.resident ALTER COLUMN resident_id SET DEFAULT nextval('public.resident_resident_id_seq'::regclass);


--
-- TOC entry 3468 (class 0 OID 16822)
-- Dependencies: 210
-- Data for Name: barangay; Type: TABLE DATA; Schema: public; Owner: risk_management_user
--

COPY public.barangay (barangay_id, name, political_boundaries, elevation) FROM stdin;
10	Cauayan City	[ {"lng": 121.816681, "lat": 16.980190}, {"lng": 121.819344, "lat": 16.979130}, {"lng": 121.821053, "lat": 16.978550}, {"lng": 121.823097, "lat": 16.976450}, {"lng": 121.823212, "lat": 16.956381}, {"lng": 121.822121, "lat": 16.955950}, {"lng": 121.812553, "lat": 16.963421}, {"lng": 121.816681, "lat": 16.980190} ]	0
7	Andarayan	[ \t{"lng": 121.812553, "lat": 16.963421}, \t{"lng": 121.822121, "lat": 16.955950}, \t{"lng": 121.812218, "lat": 16.954840}, \t{"lng": 121.808220, "lat": 16.954269}, \t{"lng": 121.802551, "lat": 16.954359}, \t{"lng": 121.804977, "lat": 16.959511}, \t{"lng": 121.807083, "lat": 16.964001}, \t{"lng": 121.812553, "lat": 16.963421} ]	43
1	Carabatan Grande	[ \t{"lng": 121.802551, "lat": 16.954359}, \t{"lng": 121.808220, "lat": 16.954269}, \t{"lng": 121.802727, "lat": 16.947420}, \t{"lng": 121.801117, "lat": 16.947769}, \t{"lng": 121.799187, "lat": 16.948820}, \t{"lng": 121.797348, "lat": 16.949640}, \t{"lng": 121.795479, "lat": 16.950211}, \t{"lng": 121.793854, "lat": 16.950590}, \t{"lng": 121.795387, "lat": 16.956181}, \t{"lng": 121.802551, "lat": 16.954359} ]	40
3	Carabatan Punta	[ \t{"lng": 121.807083, "lat": 16.964001}, \t{"lng": 121.804977, "lat": 16.959511}, \t{"lng": 121.796387, "lat": 16.959820}, \t{"lng": 121.798630, "lat": 16.964451}, \t{"lng": 121.807083, "lat": 16.964001} ]	46
6	Carabatan Bacareno	[ \t{"lng": 121.796387, "lat": 16.959820}, \t{"lng": 121.804977, "lat": 16.959511}, \t{"lng": 121.802551, "lat": 16.954359}, \t{"lng": 121.795387, "lat": 16.956181}, \t{"lng": 121.796387, "lat": 16.959820} ]	44
5	Catalina	[ \t{"lng": 121.783981, "lat": 16.956860}, \t{"lng": 121.795387, "lat": 16.956181}, \t{"lng": 121.793854, "lat": 16.950590}, \t{"lng": 121.792610, "lat": 16.950480}, \t{"lng": 121.789627, "lat": 16.950319}, \t{"lng": 121.786873, "lat": 16.950340}, \t{"lng": 121.785652, "lat": 16.950800}, \t{"lng": 121.785362, "lat": 16.951139}, \t{"lng": 121.785027, "lat": 16.951509}, \t{"lng": 121.783852, "lat": 16.953011}, \t{"lng": 121.783783, "lat": 16.954519}, \t{"lng": 121.783920, "lat": 16.956329}, \t{"lng": 121.783981, "lat": 16.956860} ]	39.76
4	Mabantad	[ \t{"lng": 121.798630, "lat": 16.964451}, \t{"lng": 121.796387, "lat": 16.959820}, \t{"lng": 121.786880, "lat": 16.961180}, \t{"lng": 121.787079, "lat": 16.962339}, \t{"lng": 121.787590, "lat": 16.964140}, \t{"lng": 121.788116, "lat": 16.965771}, \t{"lng": 121.788399, "lat": 16.966351}, \t{"lng": 121.798630, "lat": 16.964451} ]	45
2	Nagcampegan	[ \t{"lng": 121.806808, "lat": 16.981930}, \t{"lng": 121.808510, "lat": 16.981819}, \t{"lng": 121.811600, "lat": 16.981449}, \t{"lng": 121.813873, "lat": 16.981020}, \t{"lng": 121.816681, "lat": 16.980190}, \t{"lng": 121.812553, "lat": 16.963421}, \t{"lng": 121.807083, "lat": 16.964001}, \t{"lng": 121.798630, "lat": 16.964451}, \t{"lng": 121.788399, "lat": 16.966351}, \t{"lng": 121.788788, "lat": 16.967220}, \t{"lng": 121.789963, "lat": 16.970671}, \t{"lng": 121.790894, "lat": 16.972191}, \t{"lng": 121.792168, "lat": 16.974030}, \t{"lng": 121.793404, "lat": 16.975300}, \t{"lng": 121.797684, "lat": 16.981951}, \t{"lng": 121.800117, "lat": 16.981609}, \t{"lng": 121.802727, "lat": 16.981520}, \t{"lng": 121.805511, "lat": 16.981800}, \t{"lng": 121.806808, "lat": 16.981930} ]	43
9	Turayong	[ {"lng": 121.777527, "lat": 16.964100}, {"lng": 121.777763, "lat": 16.950340}, {"lng": 121.778610, "lat": 16.945829}, {"lng": 121.775597, "lat": 16.944410}, {"lng": 121.765648, "lat": 16.948469}, {"lng": 121.765266, "lat": 16.950741}, {"lng": 121.764679, "lat": 16.953421}, {"lng": 121.764900, "lat": 16.955179}, {"lng": 121.766190, "lat": 16.956970}, {"lng": 121.769081, "lat": 16.959539}, {"lng": 121.769157, "lat": 16.959909}, {"lng": 121.769707, "lat": 16.959980}, {"lng": 121.770477, "lat": 16.959949}, {"lng": 121.772003, "lat": 16.959181}, {"lng": 121.773170, "lat": 16.959360}, {"lng": 121.773659, "lat": 16.959881}, {"lng": 121.774727, "lat": 16.961571}, {"lng": 121.775688, "lat": 16.963551}, {"lng": 121.776459, "lat": 16.964239}, {"lng": 121.777527, "lat": 16.964100} ]	50.51
13	Amobocan	[{"lng": 121.816322, "lat": 16.866409}, {"lng": 121.816238, "lat": 16.866011}, {"lng": 121.815849, "lat": 16.8647}, {"lng": 121.81587999999999, "lat": 16.86331}, {"lng": 121.817146, "lat": 16.86157}, {"lng": 121.818871, "lat": 16.860069}, {"lng": 121.820427, "lat": 16.857571}, {"lng": 121.820633, "lat": 16.85635}, {"lng": 121.820213, "lat": 16.853479}, {"lng": 121.819923, "lat": 16.85203}, {"lng": 121.819283, "lat": 16.850849}, {"lng": 121.817642, "lat": 16.84845}, {"lng": 121.815277, "lat": 16.84483}, {"lng": 121.814583, "lat": 16.843229}, {"lng": 121.813873, "lat": 16.84086}, {"lng": 121.814003, "lat": 16.83922}, {"lng": 121.814171, "lat": 16.836809}, {"lng": 121.802353, "lat": 16.83416}, {"lng": 121.802544, "lat": 16.836281}, {"lng": 121.795731, "lat": 16.840561}, {"lng": 121.795097, "lat": 16.85042}, {"lng": 121.788422, "lat": 16.85132}, {"lng": 121.789177, "lat": 16.85988}, {"lng": 121.816322, "lat": 16.866409}]	61
14	Baculod	[{"lng": 121.889351, "lat": 16.87542}, {"lng": 121.908897, "lat": 16.85722}, {"lng": 121.906219, "lat": 16.855539}, {"lng": 121.905792, "lat": 16.85557}, {"lng": 121.904167, "lat": 16.854561}, {"lng": 121.884018, "lat": 16.854179}, {"lng": 121.881691, "lat": 16.85466}, {"lng": 121.879623, "lat": 16.85445}, {"lng": 121.877357, "lat": 16.85544}, {"lng": 121.875961, "lat": 16.85697}, {"lng": 121.874161, "lat": 16.858141}, {"lng": 121.87275700000001, "lat": 16.859461}, {"lng": 121.871582, "lat": 16.860189}, {"lng": 121.871384, "lat": 16.860319}, {"lng": 121.870789, "lat": 16.86132}, {"lng": 121.870773, "lat": 16.86186}, {"lng": 121.872322, "lat": 16.864759}, {"lng": 121.873154, "lat": 16.865721}, {"lng": 121.875092, "lat": 16.8673}, {"lng": 121.877136, "lat": 16.868600999999998}, {"lng": 121.87867, "lat": 16.869419}, {"lng": 121.881638, "lat": 16.86825}, {"lng": 121.883453, "lat": 16.86882}, {"lng": 121.884987, "lat": 16.870461}, {"lng": 121.88681, "lat": 16.872431}, {"lng": 121.889351, "lat": 16.87542}]	71
15	Baringin Norte	[{"lng": 121.814507, "lat": 16.93046}, {"lng": 121.814781, "lat": 16.93001}, {"lng": 121.815208, "lat": 16.92856}, {"lng": 121.816116, "lat": 16.92713}, {"lng": 121.817551, "lat": 16.925699}, {"lng": 121.8181, "lat": 16.92498}, {"lng": 121.817772, "lat": 16.923599}, {"lng": 121.817413, "lat": 16.92292}, {"lng": 121.816757, "lat": 16.92255}, {"lng": 121.816963, "lat": 16.921209}, {"lng": 121.807037, "lat": 16.919889}, {"lng": 121.805634, "lat": 16.925711}, {"lng": 121.814507, "lat": 16.93046}]	49
16	Baringin Sur	[{"lng": 121.807037, "lat": 16.919889}, {"lng": 121.816963, "lat": 16.921209}, {"lng": 121.817146, "lat": 16.920891}, {"lng": 121.817467, "lat": 16.919001}, {"lng": 121.817642, "lat": 16.91736}, {"lng": 121.813972, "lat": 16.915359}, {"lng": 121.808792, "lat": 16.915039}, {"lng": 121.807037, "lat": 16.919889}]	48
17	Buena Suerte	[{"lng": 121.80204, "lat": 16.93214}, {"lng": 121.803307, "lat": 16.93037}, {"lng": 121.803741, "lat": 16.929461}, {"lng": 121.805, "lat": 16.92837}, {"lng": 121.805634, "lat": 16.925711}, {"lng": 121.807037, "lat": 16.919889}, {"lng": 121.808792, "lat": 16.915039}, {"lng": 121.796837, "lat": 16.91452}, {"lng": 121.796288, "lat": 16.919571}, {"lng": 121.796417, "lat": 16.92412}, {"lng": 121.796471, "lat": 16.92687}, {"lng": 121.7967, "lat": 16.929939}, {"lng": 121.796806, "lat": 16.934441}, {"lng": 121.796379, "lat": 16.94137}, {"lng": 121.80204, "lat": 16.93214}]	50
18	Bugallon	[{"lng": 121.80822, "lat": 16.954269}, {"lng": 121.81794, "lat": 16.94244}, {"lng": 121.810768, "lat": 16.93689}, {"lng": 121.810028, "lat": 16.940269}, {"lng": 121.809631, "lat": 16.94166}, {"lng": 121.808357, "lat": 16.943729}, {"lng": 121.807716, "lat": 16.94458}, {"lng": 121.806259, "lat": 16.94585}, {"lng": 121.803719, "lat": 16.94729}, {"lng": 121.802727, "lat": 16.94742}, {"lng": 121.80822, "lat": 16.954269}]	47
19	Buyon	[{"lng": 121.904167, "lat": 16.854561}, {"lng": 121.902023, "lat": 16.853201}, {"lng": 121.900513, "lat": 16.852221}, {"lng": 121.898323, "lat": 16.850491}, {"lng": 121.897041, "lat": 16.84914}, {"lng": 121.894753, "lat": 16.845869}, {"lng": 121.893867, "lat": 16.84498}, {"lng": 121.892036, "lat": 16.84292}, {"lng": 121.890312, "lat": 16.8417}, {"lng": 121.888443, "lat": 16.84333}, {"lng": 121.886383, "lat": 16.84573}, {"lng": 121.884018, "lat": 16.854179}, {"lng": 121.904167, "lat": 16.854561}]	67
45	Minante II	[{"lng": 121.743263, "lat": 16.898359}, {"lng": 121.743408, "lat": 16.905781}, {"lng": 121.743301, "lat": 16.91045}, {"lng": 121.744568, "lat": 16.910549}, {"lng": 121.744949, "lat": 16.910709}, {"lng": 121.747238, "lat": 16.912149}, {"lng": 121.749046, "lat": 16.912439}, {"lng": 121.752228, "lat": 16.91292}, {"lng": 121.753563, "lat": 16.91217}, {"lng": 121.754517, "lat": 16.91115}, {"lng": 121.75605, "lat": 16.909269}, {"lng": 121.757553, "lat": 16.90872}, {"lng": 121.759804, "lat": 16.91}, {"lng": 121.762306, "lat": 16.91144}, {"lng": 121.763283, "lat": 16.8974}, {"lng": 121.743263, "lat": 16.898359}]	61
22	Carabatan Chica	[{"lng": 121.796387, "lat": 16.95982}, {"lng": 121.795387, "lat": 16.956181}, {"lng": 121.783981, "lat": 16.95686}, {"lng": 121.784523, "lat": 16.95784}, {"lng": 121.785339, "lat": 16.958481}, {"lng": 121.785927, "lat": 16.959009000000002}, {"lng": 121.786491, "lat": 16.960011}, {"lng": 121.78688, "lat": 16.96118}, {"lng": 121.796387, "lat": 16.95982}]	46
24	Cassap Fuera	[{"lng": 121.817772, "lat": 16.923599}, {"lng": 121.846519, "lat": 16.929529}, {"lng": 121.846764, "lat": 16.92923}, {"lng": 121.846619, "lat": 16.928881}, {"lng": 121.846764, "lat": 16.928329}, {"lng": 121.847977, "lat": 16.92775}, {"lng": 121.848824, "lat": 16.927059}, {"lng": 121.849701, "lat": 16.92486}, {"lng": 121.850548, "lat": 16.923059}, {"lng": 121.850037, "lat": 16.921909}, {"lng": 121.848717, "lat": 16.91991}, {"lng": 121.848328, "lat": 16.91906}, {"lng": 121.848137, "lat": 16.91748}, {"lng": 121.848091, "lat": 16.91609}, {"lng": 121.848228, "lat": 16.91551}, {"lng": 121.848137, "lat": 16.914369999999998}, {"lng": 121.848228, "lat": 16.912821}, {"lng": 121.848709, "lat": 16.912029}, {"lng": 121.849579, "lat": 16.91083}, {"lng": 121.850273, "lat": 16.90881}, {"lng": 121.850014, "lat": 16.908039}, {"lng": 121.849113, "lat": 16.907009}, {"lng": 121.848289, "lat": 16.90605}, {"lng": 121.848083, "lat": 16.904260999999998}, {"lng": 121.848557, "lat": 16.90295}, {"lng": 121.848137, "lat": 16.902241}, {"lng": 121.845703, "lat": 16.903021}, {"lng": 121.842247, "lat": 16.90498}, {"lng": 121.839607, "lat": 16.906309}, {"lng": 121.836952, "lat": 16.907909}, {"lng": 121.835037, "lat": 16.90976}, {"lng": 121.833687, "lat": 16.911409}, {"lng": 121.832542, "lat": 16.91234}, {"lng": 121.830292, "lat": 16.9133}, {"lng": 121.827393, "lat": 16.91436}, {"lng": 121.82634, "lat": 16.91468}, {"lng": 121.823578, "lat": 16.91534}, {"lng": 121.820572, "lat": 16.915199}, {"lng": 121.819183, "lat": 16.91498}, {"lng": 121.818649, "lat": 16.91371}, {"lng": 121.817802, "lat": 16.91621}, {"lng": 121.817642, "lat": 16.91736}, {"lng": 121.817467, "lat": 16.919001}, {"lng": 121.817146, "lat": 16.920891}, {"lng": 121.816963, "lat": 16.921209}, {"lng": 121.816757, "lat": 16.92255}, {"lng": 121.817413, "lat": 16.92292}, {"lng": 121.817772, "lat": 16.923599}]	56
25	Culalabat	[{"lng": 121.796837, "lat": 16.91452}, {"lng": 121.808792, "lat": 16.915039}, {"lng": 121.808083, "lat": 16.90687}, {"lng": 121.809509, "lat": 16.900721}, {"lng": 121.795937, "lat": 16.898729}, {"lng": 121.795731, "lat": 16.90815}, {"lng": 121.795464, "lat": 16.910339}, {"lng": 121.796837, "lat": 16.91452}]	51
26	Dabburab	[{"lng": 121.817642, "lat": 16.91736}, {"lng": 121.817802, "lat": 16.91621}, {"lng": 121.818649, "lat": 16.91371}, {"lng": 121.819839, "lat": 16.911551}, {"lng": 121.821388, "lat": 16.90885}, {"lng": 121.808083, "lat": 16.90687}, {"lng": 121.808792, "lat": 16.915039}, {"lng": 121.813972, "lat": 16.915359}, {"lng": 121.817642, "lat": 16.91736}]	53
27	De Vera	[{"lng": 121.882004, "lat": 16.90391}, {"lng": 121.881416, "lat": 16.89432}, {"lng": 121.878723, "lat": 16.8955}, {"lng": 121.876022, "lat": 16.89678}, {"lng": 121.873611, "lat": 16.897711}, {"lng": 121.869202, "lat": 16.898491}, {"lng": 121.867043, "lat": 16.89876}, {"lng": 121.862152, "lat": 16.90065}, {"lng": 121.859612, "lat": 16.90114}, {"lng": 121.85714, "lat": 16.90151}, {"lng": 121.883362, "lat": 16.91032}, {"lng": 121.882004, "lat": 16.90391}]	61
28	Dianao	[{"lng": 121.884018, "lat": 16.854179}, {"lng": 121.886383, "lat": 16.84573}, {"lng": 121.888443, "lat": 16.84333}, {"lng": 121.890312, "lat": 16.8417}, {"lng": 121.886948, "lat": 16.838369}, {"lng": 121.883438, "lat": 16.835779}, {"lng": 121.877663, "lat": 16.83234}, {"lng": 121.875481, "lat": 16.830481}, {"lng": 121.871834, "lat": 16.840611}, {"lng": 121.871384, "lat": 16.860319}, {"lng": 121.871582, "lat": 16.860189}, {"lng": 121.87275700000001, "lat": 16.859461}, {"lng": 121.874161, "lat": 16.858141}, {"lng": 121.875961, "lat": 16.85697}, {"lng": 121.877357, "lat": 16.85544}, {"lng": 121.879623, "lat": 16.85445}, {"lng": 121.881691, "lat": 16.85466}, {"lng": 121.884018, "lat": 16.854179}]	66
46	Naganacan	[{"lng": 121.68441, "lat": 16.9044}, {"lng": 121.690269, "lat": 16.88777}, {"lng": 121.694572, "lat": 16.867519}, {"lng": 121.68251, "lat": 16.870291}, {"lng": 121.677101, "lat": 16.871559}, {"lng": 121.67392, "lat": 16.871941}, {"lng": 121.671471, "lat": 16.872351}, {"lng": 121.667992, "lat": 16.873359999999998}, {"lng": 121.663628, "lat": 16.87425}, {"lng": 121.661346, "lat": 16.874041}, {"lng": 121.658829, "lat": 16.8752}, {"lng": 121.65686, "lat": 16.876459}, {"lng": 121.651207, "lat": 16.87878}, {"lng": 121.661636, "lat": 16.88728}, {"lng": 121.673203, "lat": 16.89654}, {"lng": 121.674156, "lat": 16.90382}, {"lng": 121.675148, "lat": 16.90362}, {"lng": 121.675613, "lat": 16.90316}, {"lng": 121.676331, "lat": 16.902691}, {"lng": 121.676468, "lat": 16.90284}, {"lng": 121.678268, "lat": 16.903839}, {"lng": 121.679108, "lat": 16.903561}, {"lng": 121.679871, "lat": 16.90321}, {"lng": 121.680817, "lat": 16.902941}, {"lng": 121.682159, "lat": 16.903311}, {"lng": 121.682808, "lat": 16.903709}, {"lng": 121.68308999999999, "lat": 16.903891}, {"lng": 121.68441, "lat": 16.9044}]	70
33	Duminit	[{"lng": 121.802727, "lat": 16.94742}, {"lng": 121.803719, "lat": 16.94729}, {"lng": 121.806259, "lat": 16.94585}, {"lng": 121.807716, "lat": 16.94458}, {"lng": 121.808357, "lat": 16.943729}, {"lng": 121.809631, "lat": 16.94166}, {"lng": 121.810028, "lat": 16.940269}, {"lng": 121.810768, "lat": 16.93689}, {"lng": 121.811043, "lat": 16.93576}, {"lng": 121.81105, "lat": 16.935579}, {"lng": 121.80204, "lat": 16.93214}, {"lng": 121.796379, "lat": 16.94137}, {"lng": 121.802727, "lat": 16.94742}]	45
35	Gagabutan	[{"lng": 121.777763, "lat": 16.95034}, {"lng": 121.785362, "lat": 16.951139}, {"lng": 121.785652, "lat": 16.9508}, {"lng": 121.786873, "lat": 16.95034}, {"lng": 121.789627, "lat": 16.950319}, {"lng": 121.79261, "lat": 16.95048}, {"lng": 121.793854, "lat": 16.95059}, {"lng": 121.795479, "lat": 16.950211}, {"lng": 121.797348, "lat": 16.94964}, {"lng": 121.799187, "lat": 16.94882}, {"lng": 121.801117, "lat": 16.947769}, {"lng": 121.802727, "lat": 16.94742}, {"lng": 121.796379, "lat": 16.94137}, {"lng": 121.783127, "lat": 16.942221}, {"lng": 121.778687, "lat": 16.944811}, {"lng": 121.77861, "lat": 16.945829}, {"lng": 121.777763, "lat": 16.95034}]	41
36	Gappal	[{"lng": 121.824348, "lat": 16.869181}, {"lng": 121.834007, "lat": 16.83609}, {"lng": 121.830856, "lat": 16.835449}, {"lng": 121.828491, "lat": 16.835698999999998}, {"lng": 121.823601, "lat": 16.835751}, {"lng": 121.817291, "lat": 16.836361}, {"lng": 121.814171, "lat": 16.836809}, {"lng": 121.814003, "lat": 16.83922}, {"lng": 121.813873, "lat": 16.84086}, {"lng": 121.814583, "lat": 16.843229}, {"lng": 121.815277, "lat": 16.84483}, {"lng": 121.817642, "lat": 16.84845}, {"lng": 121.819283, "lat": 16.850849}, {"lng": 121.819923, "lat": 16.85203}, {"lng": 121.820213, "lat": 16.853479}, {"lng": 121.820633, "lat": 16.85635}, {"lng": 121.820427, "lat": 16.857571}, {"lng": 121.818871, "lat": 16.860069}, {"lng": 121.817146, "lat": 16.86157}, {"lng": 121.81587999999999, "lat": 16.86331}, {"lng": 121.815849, "lat": 16.8647}, {"lng": 121.816238, "lat": 16.866011}, {"lng": 121.816322, "lat": 16.866409}, {"lng": 121.816902, "lat": 16.86668}, {"lng": 121.818481, "lat": 16.867359}, {"lng": 121.821716, "lat": 16.868009999999998}, {"lng": 121.823807, "lat": 16.868891}, {"lng": 121.824348, "lat": 16.869181}]	50
37	Guayabal	[{"lng": 121.80204, "lat": 16.93214}, {"lng": 121.81105, "lat": 16.935579}, {"lng": 121.811043, "lat": 16.93576}, {"lng": 121.811729, "lat": 16.93433}, {"lng": 121.813179, "lat": 16.93257}, {"lng": 121.814117, "lat": 16.93121}, {"lng": 121.814507, "lat": 16.93046}, {"lng": 121.805634, "lat": 16.925711}, {"lng": 121.805, "lat": 16.92837}, {"lng": 121.803741, "lat": 16.929461}, {"lng": 121.803307, "lat": 16.93037}, {"lng": 121.80204, "lat": 16.93214}]	49
30	District I	[{"lng": 121.780777, "lat": 16.94142}, {"lng": 121.780258, "lat": 16.940201}, {"lng": 121.78064, "lat": 16.93858}, {"lng": 121.780792, "lat": 16.93717}, {"lng": 121.780891, "lat": 16.936081}, {"lng": 121.779282, "lat": 16.935261}, {"lng": 121.777992, "lat": 16.933741}, {"lng": 121.77713, "lat": 16.93335}, {"lng": 121.776207, "lat": 16.93405}, {"lng": 121.77523, "lat": 16.93417}, {"lng": 121.77494, "lat": 16.933599}, {"lng": 121.774857, "lat": 16.933109}, {"lng": 121.765579, "lat": 16.93396}, {"lng": 121.766006, "lat": 16.934601}, {"lng": 121.765953, "lat": 16.93564}, {"lng": 121.766083, "lat": 16.935921}, {"lng": 121.76757, "lat": 16.938869}, {"lng": 121.769432, "lat": 16.94239}, {"lng": 121.775581, "lat": 16.94208}, {"lng": 121.775848, "lat": 16.941641}, {"lng": 121.775864, "lat": 16.941111}, {"lng": 121.776367, "lat": 16.94105}, {"lng": 121.780792, "lat": 16.941561}, {"lng": 121.780777, "lat": 16.94142}]	103
31	District II	[{"lng": 121.76757, "lat": 16.938869}, {"lng": 121.766083, "lat": 16.935921}, {"lng": 121.765953, "lat": 16.93564}, {"lng": 121.766006, "lat": 16.934601}, {"lng": 121.765579, "lat": 16.93396}, {"lng": 121.760452, "lat": 16.933531}, {"lng": 121.760567, "lat": 16.93556}, {"lng": 121.760857, "lat": 16.936831}, {"lng": 121.761673, "lat": 16.93923}, {"lng": 121.762222, "lat": 16.940479}, {"lng": 121.76403, "lat": 16.94021}, {"lng": 121.764236, "lat": 16.940161}, {"lng": 121.76757, "lat": 16.938869}]	58
39	Linglingay	[{"lng": 121.864037, "lat": 16.88489}, {"lng": 121.884727, "lat": 16.89098}, {"lng": 121.885277, "lat": 16.89012}, {"lng": 121.886833, "lat": 16.88876}, {"lng": 121.888649, "lat": 16.887501}, {"lng": 121.890266, "lat": 16.88637}, {"lng": 121.891647, "lat": 16.88563}, {"lng": 121.893318, "lat": 16.883301}, {"lng": 121.893013, "lat": 16.881981}, {"lng": 121.892052, "lat": 16.88088}, {"lng": 121.891792, "lat": 16.879339}, {"lng": 121.892021, "lat": 16.877979}, {"lng": 121.890663, "lat": 16.87697}, {"lng": 121.889816, "lat": 16.876459}, {"lng": 121.889481, "lat": 16.875891}, {"lng": 121.889351, "lat": 16.87542}, {"lng": 121.88681, "lat": 16.872431}, {"lng": 121.884987, "lat": 16.870461}, {"lng": 121.883453, "lat": 16.86882}, {"lng": 121.881638, "lat": 16.86825}, {"lng": 121.87867, "lat": 16.869419}, {"lng": 121.877136, "lat": 16.868600999999998}, {"lng": 121.875092, "lat": 16.8673}, {"lng": 121.873154, "lat": 16.865721}, {"lng": 121.872322, "lat": 16.864759}, {"lng": 121.864037, "lat": 16.88489}]	76
40	Maligaya	[{"lng": 121.848137, "lat": 16.902241}, {"lng": 121.85714, "lat": 16.90151}, {"lng": 121.859612, "lat": 16.90114}, {"lng": 121.864037, "lat": 16.88489}, {"lng": 121.872322, "lat": 16.864759}, {"lng": 121.870773, "lat": 16.86186}, {"lng": 121.870789, "lat": 16.86132}, {"lng": 121.871384, "lat": 16.860319}, {"lng": 121.8703, "lat": 16.860451}, {"lng": 121.869743, "lat": 16.860029}, {"lng": 121.867661, "lat": 16.859591}, {"lng": 121.864616, "lat": 16.859369}, {"lng": 121.863571, "lat": 16.859329}, {"lng": 121.861633, "lat": 16.860201}, {"lng": 121.860237, "lat": 16.86142}, {"lng": 121.857719, "lat": 16.86129}, {"lng": 121.856369, "lat": 16.861759}, {"lng": 121.854622, "lat": 16.863159}, {"lng": 121.853943, "lat": 16.8643}, {"lng": 121.853554, "lat": 16.86459}, {"lng": 121.854111, "lat": 16.865141}, {"lng": 121.853867, "lat": 16.866501}, {"lng": 121.852509, "lat": 16.86787}, {"lng": 121.851646, "lat": 16.86944}, {"lng": 121.851311, "lat": 16.87043}, {"lng": 121.850853, "lat": 16.872009}, {"lng": 121.849792, "lat": 16.87291}, {"lng": 121.848503, "lat": 16.873699}, {"lng": 121.847183, "lat": 16.87537}, {"lng": 121.845818, "lat": 16.87715}, {"lng": 121.846771, "lat": 16.87842}, {"lng": 121.846161, "lat": 16.878839}, {"lng": 121.844772, "lat": 16.87833}, {"lng": 121.844269, "lat": 16.877871}, {"lng": 121.848137, "lat": 16.902241}]	82
41	Manaoag	[{"lng": 121.825638, "lat": 16.87199}, {"lng": 121.826202, "lat": 16.871639}, {"lng": 121.827499, "lat": 16.871309}, {"lng": 121.827766, "lat": 16.87002}, {"lng": 121.827492, "lat": 16.869221}, {"lng": 121.82943, "lat": 16.867781}, {"lng": 121.830994, "lat": 16.86758}, {"lng": 121.833618, "lat": 16.867109}, {"lng": 121.835693, "lat": 16.866619}, {"lng": 121.836517, "lat": 16.868139}, {"lng": 121.836929, "lat": 16.86861}, {"lng": 121.83802, "lat": 16.86805}, {"lng": 121.839684, "lat": 16.86813}, {"lng": 121.840027, "lat": 16.86916}, {"lng": 121.840057, "lat": 16.87051}, {"lng": 121.839546, "lat": 16.87211}, {"lng": 121.840569, "lat": 16.87282}, {"lng": 121.841309, "lat": 16.873541}, {"lng": 121.841789, "lat": 16.875669}, {"lng": 121.843033, "lat": 16.876869}, {"lng": 121.844269, "lat": 16.877871}, {"lng": 121.844772, "lat": 16.87833}, {"lng": 121.846161, "lat": 16.878839}, {"lng": 121.846771, "lat": 16.87842}, {"lng": 121.845818, "lat": 16.87715}, {"lng": 121.847183, "lat": 16.87537}, {"lng": 121.848503, "lat": 16.873699}, {"lng": 121.849792, "lat": 16.87291}, {"lng": 121.850853, "lat": 16.872009}, {"lng": 121.851311, "lat": 16.87043}, {"lng": 121.851646, "lat": 16.86944}, {"lng": 121.852509, "lat": 16.86787}, {"lng": 121.853867, "lat": 16.866501}, {"lng": 121.854111, "lat": 16.865141}, {"lng": 121.853554, "lat": 16.86459}, {"lng": 121.852997, "lat": 16.86408}, {"lng": 121.852097, "lat": 16.863791}, {"lng": 121.850937, "lat": 16.863449}, {"lng": 121.849831, "lat": 16.86125}, {"lng": 121.849579, "lat": 16.86027}, {"lng": 121.849747, "lat": 16.858101}, {"lng": 121.849426, "lat": 16.856621}, {"lng": 121.848717, "lat": 16.85453}, {"lng": 121.846947, "lat": 16.85136}, {"lng": 121.846573, "lat": 16.850071}, {"lng": 121.845787, "lat": 16.848209}, {"lng": 121.844391, "lat": 16.845961}, {"lng": 121.843239, "lat": 16.8442}, {"lng": 121.840607, "lat": 16.8381}, {"lng": 121.834007, "lat": 16.83609}, {"lng": 121.824348, "lat": 16.869181}, {"lng": 121.825111, "lat": 16.87081}, {"lng": 121.825638, "lat": 16.87199}]	61
43	Marabulig II	[{"lng": 121.72921, "lat": 16.933889}, {"lng": 121.729813, "lat": 16.93326}, {"lng": 121.731148, "lat": 16.932739}, {"lng": 121.733131, "lat": 16.933161}, {"lng": 121.733299, "lat": 16.933121}, {"lng": 121.727524, "lat": 16.91325}, {"lng": 121.7136, "lat": 16.912821}, {"lng": 121.697983, "lat": 16.91243}, {"lng": 121.697983, "lat": 16.913219}, {"lng": 121.698563, "lat": 16.913231}, {"lng": 121.699387, "lat": 16.913549}, {"lng": 121.699799, "lat": 16.914539}, {"lng": 121.700394, "lat": 16.91506}, {"lng": 121.701027, "lat": 16.91641}, {"lng": 121.700897, "lat": 16.91703}, {"lng": 121.70163, "lat": 16.918341}, {"lng": 121.70076, "lat": 16.92029}, {"lng": 121.700912, "lat": 16.922119}, {"lng": 121.702522, "lat": 16.92462}, {"lng": 121.704117, "lat": 16.92643}, {"lng": 121.704803, "lat": 16.926701}, {"lng": 121.706047, "lat": 16.92753}, {"lng": 121.708427, "lat": 16.93005}, {"lng": 121.709167, "lat": 16.93078}, {"lng": 121.712173, "lat": 16.931589}, {"lng": 121.715378, "lat": 16.931471}, {"lng": 121.718224, "lat": 16.931339}, {"lng": 121.720467, "lat": 16.931641}, {"lng": 121.723373, "lat": 16.931919}, {"lng": 121.725838, "lat": 16.932961}, {"lng": 121.727997, "lat": 16.933571}, {"lng": 121.72921, "lat": 16.933889}]	59
44	Minante I	[{"lng": 121.760452, "lat": 16.933531}, {"lng": 121.765579, "lat": 16.93396}, {"lng": 121.774857, "lat": 16.933109}, {"lng": 121.775047, "lat": 16.93269}, {"lng": 121.773613, "lat": 16.93136}, {"lng": 121.772217, "lat": 16.93042}, {"lng": 121.772041, "lat": 16.930059}, {"lng": 121.772217, "lat": 16.92927}, {"lng": 121.772743, "lat": 16.92802}, {"lng": 121.772293, "lat": 16.92642}, {"lng": 121.772057, "lat": 16.925409}, {"lng": 121.772423, "lat": 16.92416}, {"lng": 121.772041, "lat": 16.92252}, {"lng": 121.770981, "lat": 16.921921}, {"lng": 121.768837, "lat": 16.921289}, {"lng": 121.77269, "lat": 16.915371}, {"lng": 121.772758, "lat": 16.915159}, {"lng": 121.773483, "lat": 16.913931}, {"lng": 121.774628, "lat": 16.912001}, {"lng": 121.775543, "lat": 16.91186}, {"lng": 121.777122, "lat": 16.91102}, {"lng": 121.776703, "lat": 16.909610999999998}, {"lng": 121.777847, "lat": 16.90937}, {"lng": 121.778038, "lat": 16.90761}, {"lng": 121.77829, "lat": 16.906731}, {"lng": 121.778419, "lat": 16.906219}, {"lng": 121.778526, "lat": 16.904551}, {"lng": 121.778107, "lat": 16.9037}, {"lng": 121.777679, "lat": 16.90197}, {"lng": 121.776733, "lat": 16.90082}, {"lng": 121.775963, "lat": 16.89925}, {"lng": 121.77504, "lat": 16.897341}, {"lng": 121.763283, "lat": 16.8974}, {"lng": 121.762306, "lat": 16.91144}, {"lng": 121.759804, "lat": 16.91}, {"lng": 121.757553, "lat": 16.90872}, {"lng": 121.75605, "lat": 16.909269}, {"lng": 121.754517, "lat": 16.91115}, {"lng": 121.753563, "lat": 16.91217}, {"lng": 121.752228, "lat": 16.91292}, {"lng": 121.749046, "lat": 16.912439}, {"lng": 121.747238, "lat": 16.912149}, {"lng": 121.744949, "lat": 16.910709}, {"lng": 121.744568, "lat": 16.910549}, {"lng": 121.743301, "lat": 16.91045}, {"lng": 121.745903, "lat": 16.920361}, {"lng": 121.747269, "lat": 16.921089}, {"lng": 121.748749, "lat": 16.922661}, {"lng": 121.749077, "lat": 16.92383}, {"lng": 121.749023, "lat": 16.925449}, {"lng": 121.749107, "lat": 16.92836}, {"lng": 121.750183, "lat": 16.930388999999998}, {"lng": 121.750511, "lat": 16.931629}, {"lng": 121.749863, "lat": 16.93298}, {"lng": 121.760452, "lat": 16.933531}]	49.04
48	Nungnungan I	[{"lng": 121.743301, "lat": 16.91045}, {"lng": 121.743408, "lat": 16.905781}, {"lng": 121.743263, "lat": 16.898359}, {"lng": 121.745758, "lat": 16.875589}, {"lng": 121.744186, "lat": 16.874149}, {"lng": 121.742363, "lat": 16.87351}, {"lng": 121.740868, "lat": 16.874029}, {"lng": 121.739563, "lat": 16.874901}, {"lng": 121.737717, "lat": 16.87616}, {"lng": 121.736343, "lat": 16.87705}, {"lng": 121.735703, "lat": 16.87727}, {"lng": 121.73439, "lat": 16.876511}, {"lng": 121.732521, "lat": 16.876051}, {"lng": 121.730476, "lat": 16.87678}, {"lng": 121.729401, "lat": 16.87841}, {"lng": 121.72831, "lat": 16.880859}, {"lng": 121.726921, "lat": 16.88402}, {"lng": 121.725502, "lat": 16.884951}, {"lng": 121.722908, "lat": 16.884769}, {"lng": 121.718536, "lat": 16.882799}, {"lng": 121.717422, "lat": 16.88574}, {"lng": 121.714417, "lat": 16.894131}, {"lng": 121.713577, "lat": 16.89624}, {"lng": 121.712883, "lat": 16.89802}, {"lng": 121.715599, "lat": 16.89768}, {"lng": 121.717369, "lat": 16.89794}, {"lng": 121.71862, "lat": 16.8983}, {"lng": 121.720177, "lat": 16.898701}, {"lng": 121.721458, "lat": 16.899639}, {"lng": 121.723793, "lat": 16.900709}, {"lng": 121.725304, "lat": 16.901501}, {"lng": 121.726578, "lat": 16.902161}, {"lng": 121.726936, "lat": 16.90218}, {"lng": 121.727951, "lat": 16.902201}, {"lng": 121.728592, "lat": 16.9021}, {"lng": 121.729507, "lat": 16.90163}, {"lng": 121.731056, "lat": 16.90164}, {"lng": 121.7314, "lat": 16.901569}, {"lng": 121.732697, "lat": 16.90251}, {"lng": 121.7342, "lat": 16.903761}, {"lng": 121.735626, "lat": 16.904659}, {"lng": 121.736366, "lat": 16.905279}, {"lng": 121.737907, "lat": 16.906349}, {"lng": 121.739304, "lat": 16.90646}, {"lng": 121.740463, "lat": 16.90737}, {"lng": 121.740967, "lat": 16.908239}, {"lng": 121.741898, "lat": 16.909439}, {"lng": 121.74292, "lat": 16.910311}, {"lng": 121.743156, "lat": 16.910379}, {"lng": 121.743301, "lat": 16.91045}]	64
49	Nungnungan II	[{"lng": 121.763283, "lat": 16.8974}, {"lng": 121.77504, "lat": 16.897341}, {"lng": 121.774841, "lat": 16.896931}, {"lng": 121.774323, "lat": 16.89584}, {"lng": 121.774208, "lat": 16.894409}, {"lng": 121.773483, "lat": 16.89307}, {"lng": 121.773819, "lat": 16.89175}, {"lng": 121.773323, "lat": 16.89069}, {"lng": 121.771957, "lat": 16.889219}, {"lng": 121.77137, "lat": 16.887699}, {"lng": 121.770554, "lat": 16.885019}, {"lng": 121.771172, "lat": 16.883089}, {"lng": 121.77179, "lat": 16.88163}, {"lng": 121.771637, "lat": 16.880779}, {"lng": 121.771446, "lat": 16.880939}, {"lng": 121.770393, "lat": 16.881901}, {"lng": 121.769203, "lat": 16.88205}, {"lng": 121.768257, "lat": 16.882151}, {"lng": 121.766853, "lat": 16.881741}, {"lng": 121.765732, "lat": 16.88184}, {"lng": 121.764473, "lat": 16.884001}, {"lng": 121.763832, "lat": 16.88475}, {"lng": 121.762138, "lat": 16.885611}, {"lng": 121.760513, "lat": 16.88542}, {"lng": 121.759697, "lat": 16.88549}, {"lng": 121.759277, "lat": 16.885839}, {"lng": 121.758362, "lat": 16.886499}, {"lng": 121.755798, "lat": 16.88649}, {"lng": 121.754593, "lat": 16.886061}, {"lng": 121.751793, "lat": 16.884809}, {"lng": 121.751343, "lat": 16.883751}, {"lng": 121.752022, "lat": 16.882429}, {"lng": 121.752953, "lat": 16.880739}, {"lng": 121.75293, "lat": 16.87956}, {"lng": 121.751968, "lat": 16.87896}, {"lng": 121.750183, "lat": 16.87912}, {"lng": 121.749107, "lat": 16.87899}, {"lng": 121.747963, "lat": 16.87788}, {"lng": 121.747383, "lat": 16.876671}, {"lng": 121.746651, "lat": 16.87591}, {"lng": 121.745758, "lat": 16.875589}, {"lng": 121.743263, "lat": 16.898359}, {"lng": 121.763283, "lat": 16.8974}]	62
50	Pinoma	[{"lng": 121.712883, "lat": 16.89802}, {"lng": 121.713577, "lat": 16.89624}, {"lng": 121.714417, "lat": 16.894131}, {"lng": 121.717422, "lat": 16.88574}, {"lng": 121.718536, "lat": 16.882799}, {"lng": 121.720757, "lat": 16.877831}, {"lng": 121.721588, "lat": 16.87332}, {"lng": 121.722542, "lat": 16.86792}, {"lng": 121.722794, "lat": 16.86101}, {"lng": 121.715446, "lat": 16.862419}, {"lng": 121.694572, "lat": 16.867519}, {"lng": 121.690269, "lat": 16.88777}, {"lng": 121.690773, "lat": 16.887951}, {"lng": 121.691521, "lat": 16.888321}, {"lng": 121.693466, "lat": 16.88909}, {"lng": 121.695236, "lat": 16.88962}, {"lng": 121.697563, "lat": 16.89064}, {"lng": 121.699226, "lat": 16.89135}, {"lng": 121.701767, "lat": 16.8916}, {"lng": 121.70314, "lat": 16.891769}, {"lng": 121.704353, "lat": 16.893009}, {"lng": 121.705063, "lat": 16.894341}, {"lng": 121.706146, "lat": 16.89609}, {"lng": 121.70755, "lat": 16.898319}, {"lng": 121.709328, "lat": 16.89937}, {"lng": 121.712227, "lat": 16.89842}, {"lng": 121.712883, "lat": 16.89802}]	67
51	Rizal	[{"lng": 121.796837, "lat": 16.91452}, {"lng": 121.795464, "lat": 16.910339}, {"lng": 121.795731, "lat": 16.90815}, {"lng": 121.795937, "lat": 16.898729}, {"lng": 121.784866, "lat": 16.8978}, {"lng": 121.77504, "lat": 16.897341}, {"lng": 121.775963, "lat": 16.89925}, {"lng": 121.776733, "lat": 16.90082}, {"lng": 121.777679, "lat": 16.90197}, {"lng": 121.778107, "lat": 16.9037}, {"lng": 121.778526, "lat": 16.904551}, {"lng": 121.778419, "lat": 16.906219}, {"lng": 121.77829, "lat": 16.906731}, {"lng": 121.778038, "lat": 16.90761}, {"lng": 121.777847, "lat": 16.90937}, {"lng": 121.776703, "lat": 16.909610999999998}, {"lng": 121.777122, "lat": 16.91102}, {"lng": 121.775543, "lat": 16.91186}, {"lng": 121.774628, "lat": 16.912001}, {"lng": 121.773483, "lat": 16.913931}, {"lng": 121.772758, "lat": 16.915159}, {"lng": 121.77269, "lat": 16.915371}, {"lng": 121.796837, "lat": 16.91452}]	65
53	San Antonio	[{"lng": 121.808823, "lat": 16.87899}, {"lng": 121.816322, "lat": 16.866409}, {"lng": 121.789177, "lat": 16.85988}, {"lng": 121.786171, "lat": 16.873409}, {"lng": 121.808823, "lat": 16.87899}]	57
54	San Francisco	[{"lng": 121.809509, "lat": 16.900721}, {"lng": 121.810143, "lat": 16.899361}, {"lng": 121.808823, "lat": 16.87899}, {"lng": 121.786171, "lat": 16.873409}, {"lng": 121.786591, "lat": 16.884211}, {"lng": 121.784866, "lat": 16.8978}, {"lng": 121.795937, "lat": 16.898729}, {"lng": 121.809509, "lat": 16.900721}]	52
56	San Luis	[{"lng": 121.83448, "lat": 16.974609}, {"lng": 121.836342, "lat": 16.971291}, {"lng": 121.837723, "lat": 16.968349}, {"lng": 121.838043, "lat": 16.96759}, {"lng": 121.838226, "lat": 16.965931}, {"lng": 121.837578, "lat": 16.964729}, {"lng": 121.83609, "lat": 16.96382}, {"lng": 121.835289, "lat": 16.963381}, {"lng": 121.834633, "lat": 16.96312}, {"lng": 121.834099, "lat": 16.96199}, {"lng": 121.835716, "lat": 16.961519}, {"lng": 121.837662, "lat": 16.961281}, {"lng": 121.838638, "lat": 16.960911}, {"lng": 121.84053, "lat": 16.959089}, {"lng": 121.840843, "lat": 16.957359}, {"lng": 121.840057, "lat": 16.95602}, {"lng": 121.839661, "lat": 16.95492}, {"lng": 121.838058, "lat": 16.954821}, {"lng": 121.835098, "lat": 16.955589}, {"lng": 121.832497, "lat": 16.95595}, {"lng": 121.828552, "lat": 16.956329}, {"lng": 121.827072, "lat": 16.956511}, {"lng": 121.823212, "lat": 16.956381}, {"lng": 121.823097, "lat": 16.97645}, {"lng": 121.827141, "lat": 16.974621}, {"lng": 121.829391, "lat": 16.973881}, {"lng": 121.831963, "lat": 16.973909}, {"lng": 121.833839, "lat": 16.974319}, {"lng": 121.83448, "lat": 16.974609}]	43
57	San Pablo	[{"lng": 121.81794, "lat": 16.94244}, {"lng": 121.819023, "lat": 16.943041}, {"lng": 121.842651, "lat": 16.948231}, {"lng": 121.844307, "lat": 16.94767}, {"lng": 121.845222, "lat": 16.947821}, {"lng": 121.846291, "lat": 16.945721}, {"lng": 121.847366, "lat": 16.945761}, {"lng": 121.847397, "lat": 16.94474}, {"lng": 121.847328, "lat": 16.944071}, {"lng": 121.847137, "lat": 16.941561}, {"lng": 121.84642, "lat": 16.93935}, {"lng": 121.845863, "lat": 16.93729}, {"lng": 121.845917, "lat": 16.93685}, {"lng": 121.847427, "lat": 16.9373}, {"lng": 121.848633, "lat": 16.937691}, {"lng": 121.849457, "lat": 16.935169}, {"lng": 121.850182, "lat": 16.932949}, {"lng": 121.848137, "lat": 16.931761}, {"lng": 121.847214, "lat": 16.931100999999998}, {"lng": 121.846733, "lat": 16.92979}, {"lng": 121.846519, "lat": 16.929529}, {"lng": 121.817772, "lat": 16.923599}, {"lng": 121.8181, "lat": 16.92498}, {"lng": 121.817551, "lat": 16.925699}, {"lng": 121.816116, "lat": 16.92713}, {"lng": 121.815208, "lat": 16.92856}, {"lng": 121.814781, "lat": 16.93001}, {"lng": 121.814507, "lat": 16.93046}, {"lng": 121.814117, "lat": 16.93121}, {"lng": 121.813179, "lat": 16.93257}, {"lng": 121.811729, "lat": 16.93433}, {"lng": 121.811043, "lat": 16.93576}, {"lng": 121.810768, "lat": 16.93689}, {"lng": 121.81794, "lat": 16.94244}]	49
58	Santa Luciana	[{"lng": 121.821388, "lat": 16.90885}, {"lng": 121.821953, "lat": 16.907761}, {"lng": 121.823669, "lat": 16.9055}, {"lng": 121.825546, "lat": 16.902531}, {"lng": 121.826019, "lat": 16.89937}, {"lng": 121.826431, "lat": 16.897079}, {"lng": 121.826576, "lat": 16.895451}, {"lng": 121.826981, "lat": 16.8943}, {"lng": 121.827766, "lat": 16.89212}, {"lng": 121.828323, "lat": 16.88924}, {"lng": 121.828697, "lat": 16.88624}, {"lng": 121.828712, "lat": 16.883801}, {"lng": 121.828323, "lat": 16.880131}, {"lng": 121.827606, "lat": 16.876301}, {"lng": 121.827087, "lat": 16.874889}, {"lng": 121.826607, "lat": 16.87365}, {"lng": 121.825638, "lat": 16.87199}, {"lng": 121.825111, "lat": 16.87081}, {"lng": 121.824348, "lat": 16.869181}, {"lng": 121.823807, "lat": 16.868891}, {"lng": 121.821716, "lat": 16.868009999999998}, {"lng": 121.818481, "lat": 16.867359}, {"lng": 121.816902, "lat": 16.86668}, {"lng": 121.816322, "lat": 16.866409}, {"lng": 121.808823, "lat": 16.87899}, {"lng": 121.810143, "lat": 16.899361}, {"lng": 121.809509, "lat": 16.900721}, {"lng": 121.808083, "lat": 16.90687}, {"lng": 121.821388, "lat": 16.90885}]	57
61	Sinippil	[{"lng": 121.821388, "lat": 16.90885}, {"lng": 121.819839, "lat": 16.911551}, {"lng": 121.818649, "lat": 16.91371}, {"lng": 121.819183, "lat": 16.91498}, {"lng": 121.820572, "lat": 16.915199}, {"lng": 121.823578, "lat": 16.91534}, {"lng": 121.82634, "lat": 16.91468}, {"lng": 121.827393, "lat": 16.91436}, {"lng": 121.830292, "lat": 16.9133}, {"lng": 121.832542, "lat": 16.91234}, {"lng": 121.833687, "lat": 16.911409}, {"lng": 121.835037, "lat": 16.90976}, {"lng": 121.836952, "lat": 16.907909}, {"lng": 121.839607, "lat": 16.906309}, {"lng": 121.842247, "lat": 16.90498}, {"lng": 121.845703, "lat": 16.903021}, {"lng": 121.848137, "lat": 16.902241}, {"lng": 121.844269, "lat": 16.877871}, {"lng": 121.843033, "lat": 16.876869}, {"lng": 121.841789, "lat": 16.875669}, {"lng": 121.841309, "lat": 16.873541}, {"lng": 121.840569, "lat": 16.87282}, {"lng": 121.839546, "lat": 16.87211}, {"lng": 121.840057, "lat": 16.87051}, {"lng": 121.840027, "lat": 16.86916}, {"lng": 121.839684, "lat": 16.86813}, {"lng": 121.83802, "lat": 16.86805}, {"lng": 121.836929, "lat": 16.86861}, {"lng": 121.836517, "lat": 16.868139}, {"lng": 121.835693, "lat": 16.866619}, {"lng": 121.833618, "lat": 16.867109}, {"lng": 121.830994, "lat": 16.86758}, {"lng": 121.82943, "lat": 16.867781}, {"lng": 121.827492, "lat": 16.869221}, {"lng": 121.827766, "lat": 16.87002}, {"lng": 121.827499, "lat": 16.871309}, {"lng": 121.826202, "lat": 16.871639}, {"lng": 121.825638, "lat": 16.87199}, {"lng": 121.826607, "lat": 16.87365}, {"lng": 121.827087, "lat": 16.874889}, {"lng": 121.827606, "lat": 16.876301}, {"lng": 121.828323, "lat": 16.880131}, {"lng": 121.828712, "lat": 16.883801}, {"lng": 121.828697, "lat": 16.88624}, {"lng": 121.828323, "lat": 16.88924}, {"lng": 121.827766, "lat": 16.89212}, {"lng": 121.826981, "lat": 16.8943}, {"lng": 121.826576, "lat": 16.895451}, {"lng": 121.826431, "lat": 16.897079}, {"lng": 121.826019, "lat": 16.89937}, {"lng": 121.825546, "lat": 16.902531}, {"lng": 121.823669, "lat": 16.9055}, {"lng": 121.821953, "lat": 16.907761}, {"lng": 121.821388, "lat": 16.90885}]	56
62	Tagaran	[{"lng": 121.796219, "lat": 16.98221}, {"lng": 121.797684, "lat": 16.981951}, {"lng": 121.793404, "lat": 16.9753}, {"lng": 121.791672, "lat": 16.97406}, {"lng": 121.788513, "lat": 16.971991}, {"lng": 121.786613, "lat": 16.970909}, {"lng": 121.785599, "lat": 16.970079}, {"lng": 121.783569, "lat": 16.96706}, {"lng": 121.782898, "lat": 16.965509}, {"lng": 121.781853, "lat": 16.963169}, {"lng": 121.781097, "lat": 16.96179}, {"lng": 121.779572, "lat": 16.961309}, {"lng": 121.778862, "lat": 16.962151}, {"lng": 121.778297, "lat": 16.962959}, {"lng": 121.778389, "lat": 16.963909}, {"lng": 121.777527, "lat": 16.9641}, {"lng": 121.776459, "lat": 16.964239}, {"lng": 121.775688, "lat": 16.963551}, {"lng": 121.774727, "lat": 16.961571}, {"lng": 121.773659, "lat": 16.959881}, {"lng": 121.77317, "lat": 16.95936}, {"lng": 121.772003, "lat": 16.959181}, {"lng": 121.770477, "lat": 16.959949}, {"lng": 121.769707, "lat": 16.95998}, {"lng": 121.769157, "lat": 16.959909}, {"lng": 121.767723, "lat": 16.960698999999998}, {"lng": 121.766167, "lat": 16.96104}, {"lng": 121.763184, "lat": 16.961309}, {"lng": 121.761879, "lat": 16.961821}, {"lng": 121.759148, "lat": 16.961559}, {"lng": 121.757172, "lat": 16.96199}, {"lng": 121.754997, "lat": 16.962151}, {"lng": 121.753036, "lat": 16.962601}, {"lng": 121.751358, "lat": 16.962999}, {"lng": 121.750168, "lat": 16.963579}, {"lng": 121.751984, "lat": 16.965771}, {"lng": 121.754143, "lat": 16.970699}, {"lng": 121.764999, "lat": 16.98521}, {"lng": 121.765907, "lat": 16.986031}, {"lng": 121.776131, "lat": 16.984489}, {"lng": 121.796219, "lat": 16.98221}]	55
63	Union	[{"lng": 121.816681, "lat": 16.98019}, {"lng": 121.819344, "lat": 16.97913}, {"lng": 121.821053, "lat": 16.97855}, {"lng": 121.823097, "lat": 16.97645}, {"lng": 121.823212, "lat": 16.956381}, {"lng": 121.822121, "lat": 16.95595}, {"lng": 121.812553, "lat": 16.963421}, {"lng": 121.816681, "lat": 16.98019}]	50.5
64	Villa Concepcion	[{"lng": 121.933746, "lat": 16.88135}, {"lng": 121.933907, "lat": 16.87966}, {"lng": 121.934692, "lat": 16.879271}, {"lng": 121.93576, "lat": 16.878}, {"lng": 121.935921, "lat": 16.875931}, {"lng": 121.935349, "lat": 16.87414}, {"lng": 121.933792, "lat": 16.872919}, {"lng": 121.93222, "lat": 16.871861}, {"lng": 121.931381, "lat": 16.87011}, {"lng": 121.931084, "lat": 16.868349}, {"lng": 121.930099, "lat": 16.867599}, {"lng": 121.928917, "lat": 16.86655}, {"lng": 121.925987, "lat": 16.864719}, {"lng": 121.924316, "lat": 16.863569}, {"lng": 121.922508, "lat": 16.86264}, {"lng": 121.91951, "lat": 16.86725}, {"lng": 121.917526, "lat": 16.86886}, {"lng": 121.916054, "lat": 16.86985}, {"lng": 121.915031, "lat": 16.870331}, {"lng": 121.914253, "lat": 16.871441}, {"lng": 121.914001, "lat": 16.872431}, {"lng": 121.912537, "lat": 16.875521}, {"lng": 121.911362, "lat": 16.87743}, {"lng": 121.910141, "lat": 16.879709}, {"lng": 121.908699, "lat": 16.880939}, {"lng": 121.908417, "lat": 16.882669}, {"lng": 121.907692, "lat": 16.885139}, {"lng": 121.907318, "lat": 16.886471}, {"lng": 121.907944, "lat": 16.88678}, {"lng": 121.909477, "lat": 16.88653}, {"lng": 121.911926, "lat": 16.88625}, {"lng": 121.914284, "lat": 16.886129}, {"lng": 121.918159, "lat": 16.88571}, {"lng": 121.922813, "lat": 16.88537}, {"lng": 121.92672, "lat": 16.885}, {"lng": 121.932121, "lat": 16.88497}, {"lng": 121.933357, "lat": 16.88376}, {"lng": 121.933434, "lat": 16.882271}, {"lng": 121.933746, "lat": 16.88135}]	89
65	Villa Luna	[{"lng": 121.823212, "lat": 16.956381}, {"lng": 121.827072, "lat": 16.956511}, {"lng": 121.828552, "lat": 16.956329}, {"lng": 121.832497, "lat": 16.95595}, {"lng": 121.835098, "lat": 16.955589}, {"lng": 121.838058, "lat": 16.954821}, {"lng": 121.839661, "lat": 16.95492}, {"lng": 121.840073, "lat": 16.95396}, {"lng": 121.842827, "lat": 16.951559}, {"lng": 121.842529, "lat": 16.95039}, {"lng": 121.842651, "lat": 16.948231}, {"lng": 121.819023, "lat": 16.943041}, {"lng": 121.81794, "lat": 16.94244}, {"lng": 121.80822, "lat": 16.954269}, {"lng": 121.812218, "lat": 16.95484}, {"lng": 121.822121, "lat": 16.95595}, {"lng": 121.823212, "lat": 16.956381}]	47
66	Villaflor	[{"lng": 121.859612, "lat": 16.90114}, {"lng": 121.862152, "lat": 16.90065}, {"lng": 121.867043, "lat": 16.89876}, {"lng": 121.869202, "lat": 16.898491}, {"lng": 121.873611, "lat": 16.897711}, {"lng": 121.876022, "lat": 16.89678}, {"lng": 121.878723, "lat": 16.8955}, {"lng": 121.881416, "lat": 16.89432}, {"lng": 121.881287, "lat": 16.89381}, {"lng": 121.881844, "lat": 16.893181}, {"lng": 121.882591, "lat": 16.89283}, {"lng": 121.883614, "lat": 16.89275}, {"lng": 121.884033, "lat": 16.891979}, {"lng": 121.884727, "lat": 16.89098}, {"lng": 121.864037, "lat": 16.88489}, {"lng": 121.859612, "lat": 16.90114}]	50.51
11	Alicaocao	[{"lng": 121.788399, "lat": 16.966351}, {"lng": 121.788116, "lat": 16.965771}, {"lng": 121.78759, "lat": 16.96414}, {"lng": 121.787079, "lat": 16.962339}, {"lng": 121.78688, "lat": 16.96118}, {"lng": 121.786491, "lat": 16.960011}, {"lng": 121.785927, "lat": 16.959009000000002}, {"lng": 121.785339, "lat": 16.958481}, {"lng": 121.784523, "lat": 16.95784}, {"lng": 121.783981, "lat": 16.95686}, {"lng": 121.78392, "lat": 16.956329}, {"lng": 121.783783, "lat": 16.954519}, {"lng": 121.783852, "lat": 16.953011}, {"lng": 121.785027, "lat": 16.951509}, {"lng": 121.785362, "lat": 16.951139}, {"lng": 121.777763, "lat": 16.95034}, {"lng": 121.777527, "lat": 16.9641}, {"lng": 121.778389, "lat": 16.963909}, {"lng": 121.778297, "lat": 16.962959}, {"lng": 121.778862, "lat": 16.962151}, {"lng": 121.779572, "lat": 16.961309}, {"lng": 121.781097, "lat": 16.96179}, {"lng": 121.781853, "lat": 16.963169}, {"lng": 121.782898, "lat": 16.965509}, {"lng": 121.783569, "lat": 16.96706}, {"lng": 121.785599, "lat": 16.970079}, {"lng": 121.786613, "lat": 16.970909}, {"lng": 121.788513, "lat": 16.971991}, {"lng": 121.791672, "lat": 16.97406}, {"lng": 121.793404, "lat": 16.9753}, {"lng": 121.792168, "lat": 16.97403}, {"lng": 121.790894, "lat": 16.972191}, {"lng": 121.789963, "lat": 16.970671}, {"lng": 121.788788, "lat": 16.96722}, {"lng": 121.788399, "lat": 16.966351}]	34
12	Alinam	[{"lng": 121.786171, "lat": 16.873409}, {"lng": 121.789177, "lat": 16.85988}, {"lng": 121.788422, "lat": 16.85132}, {"lng": 121.774147, "lat": 16.85103}, {"lng": 121.769737, "lat": 16.85578}, {"lng": 121.765602, "lat": 16.85947}, {"lng": 121.762039, "lat": 16.85919}, {"lng": 121.760483, "lat": 16.85902}, {"lng": 121.759682, "lat": 16.859209}, {"lng": 121.756889, "lat": 16.858521}, {"lng": 121.755859, "lat": 16.858299}, {"lng": 121.754753, "lat": 16.85817}, {"lng": 121.754059, "lat": 16.858249999999998}, {"lng": 121.752647, "lat": 16.8578}, {"lng": 121.751091, "lat": 16.85747}, {"lng": 121.750366, "lat": 16.857611}, {"lng": 121.748817, "lat": 16.857031}, {"lng": 121.747597, "lat": 16.85693}, {"lng": 121.746742, "lat": 16.857281}, {"lng": 121.745354, "lat": 16.856791}, {"lng": 121.743874, "lat": 16.85704}, {"lng": 121.750473, "lat": 16.871531}, {"lng": 121.758636, "lat": 16.87126}, {"lng": 121.763206, "lat": 16.868139}, {"lng": 121.774429, "lat": 16.867661}, {"lng": 121.779152, "lat": 16.869801}, {"lng": 121.786171, "lat": 16.873409}]	68
20	Cabaruan	[{"lng": 121.769157, "lat": 16.959909}, {"lng": 121.769081, "lat": 16.959539}, {"lng": 121.76619, "lat": 16.95697}, {"lng": 121.7649, "lat": 16.955179}, {"lng": 121.764679, "lat": 16.953421}, {"lng": 121.765266, "lat": 16.950741}, {"lng": 121.765648, "lat": 16.948469}, {"lng": 121.76532, "lat": 16.94771}, {"lng": 121.762543, "lat": 16.941231}, {"lng": 121.762428, "lat": 16.94096}, {"lng": 121.762222, "lat": 16.940479}, {"lng": 121.761673, "lat": 16.93923}, {"lng": 121.760857, "lat": 16.936831}, {"lng": 121.760567, "lat": 16.93556}, {"lng": 121.760452, "lat": 16.933531}, {"lng": 121.749863, "lat": 16.93298}, {"lng": 121.748573, "lat": 16.933419999999998}, {"lng": 121.746643, "lat": 16.933001}, {"lng": 121.744377, "lat": 16.932479999999998}, {"lng": 121.740837, "lat": 16.93228}, {"lng": 121.738861, "lat": 16.93252}, {"lng": 121.737587, "lat": 16.93211}, {"lng": 121.735237, "lat": 16.93243}, {"lng": 121.733818, "lat": 16.932369}, {"lng": 121.733299, "lat": 16.933121}, {"lng": 121.733131, "lat": 16.933161}, {"lng": 121.731148, "lat": 16.932739}, {"lng": 121.729813, "lat": 16.93326}, {"lng": 121.72921, "lat": 16.933889}, {"lng": 121.729507, "lat": 16.933969}, {"lng": 121.729317, "lat": 16.936291}, {"lng": 121.735123, "lat": 16.94417}, {"lng": 121.736847, "lat": 16.946369}, {"lng": 121.750168, "lat": 16.963579}, {"lng": 121.751358, "lat": 16.962999}, {"lng": 121.753036, "lat": 16.962601}, {"lng": 121.754997, "lat": 16.962151}, {"lng": 121.757172, "lat": 16.96199}, {"lng": 121.759148, "lat": 16.961559}, {"lng": 121.761879, "lat": 16.961821}, {"lng": 121.763184, "lat": 16.961309}, {"lng": 121.766167, "lat": 16.96104}, {"lng": 121.767723, "lat": 16.960698999999998}, {"lng": 121.769157, "lat": 16.959909}]	57.1
21	Cabugao	[{"lng": 121.871384, "lat": 16.860319}, {"lng": 121.871834, "lat": 16.840611}, {"lng": 121.868408, "lat": 16.842331}, {"lng": 121.855583, "lat": 16.84083}, {"lng": 121.850258, "lat": 16.839581}, {"lng": 121.846039, "lat": 16.83881}, {"lng": 121.844421, "lat": 16.83869}, {"lng": 121.842949, "lat": 16.838779}, {"lng": 121.840607, "lat": 16.8381}, {"lng": 121.843239, "lat": 16.8442}, {"lng": 121.844391, "lat": 16.845961}, {"lng": 121.845787, "lat": 16.848209}, {"lng": 121.846573, "lat": 16.850071}, {"lng": 121.846947, "lat": 16.85136}, {"lng": 121.848717, "lat": 16.85453}, {"lng": 121.849426, "lat": 16.856621}, {"lng": 121.849747, "lat": 16.858101}, {"lng": 121.849579, "lat": 16.86027}, {"lng": 121.849831, "lat": 16.86125}, {"lng": 121.850937, "lat": 16.863449}, {"lng": 121.852097, "lat": 16.863791}, {"lng": 121.852997, "lat": 16.86408}, {"lng": 121.853554, "lat": 16.86459}, {"lng": 121.853943, "lat": 16.8643}, {"lng": 121.854622, "lat": 16.863159}, {"lng": 121.856369, "lat": 16.861759}, {"lng": 121.857719, "lat": 16.86129}, {"lng": 121.860237, "lat": 16.86142}, {"lng": 121.861633, "lat": 16.860201}, {"lng": 121.863571, "lat": 16.859329}, {"lng": 121.864616, "lat": 16.859369}, {"lng": 121.867661, "lat": 16.859591}, {"lng": 121.869743, "lat": 16.860029}, {"lng": 121.8703, "lat": 16.860451}, {"lng": 121.871384, "lat": 16.860319}]	73
23	Casalatan	[{"lng": 121.883842, "lat": 16.920931}, {"lng": 121.883362, "lat": 16.91032}, {"lng": 121.85714, "lat": 16.90151}, {"lng": 121.848137, "lat": 16.902241}, {"lng": 121.848557, "lat": 16.90295}, {"lng": 121.848083, "lat": 16.904260999999998}, {"lng": 121.848289, "lat": 16.90605}, {"lng": 121.849113, "lat": 16.907009}, {"lng": 121.850014, "lat": 16.908039}, {"lng": 121.850273, "lat": 16.90881}, {"lng": 121.849579, "lat": 16.91083}, {"lng": 121.848709, "lat": 16.912029}, {"lng": 121.848228, "lat": 16.912821}, {"lng": 121.848137, "lat": 16.914369999999998}, {"lng": 121.848228, "lat": 16.91551}, {"lng": 121.848091, "lat": 16.91609}, {"lng": 121.868187, "lat": 16.922719999999998}, {"lng": 121.868507, "lat": 16.922741}, {"lng": 121.871117, "lat": 16.923059}, {"lng": 121.872368, "lat": 16.92281}, {"lng": 121.873528, "lat": 16.922319}, {"lng": 121.873909, "lat": 16.921591}, {"lng": 121.874832, "lat": 16.9203}, {"lng": 121.875618, "lat": 16.920401}, {"lng": 121.87722, "lat": 16.921221}, {"lng": 121.877861, "lat": 16.92067}, {"lng": 121.880188, "lat": 16.919849}, {"lng": 121.880638, "lat": 16.920191}, {"lng": 121.881523, "lat": 16.920429}, {"lng": 121.882767, "lat": 16.920891}, {"lng": 121.883842, "lat": 16.920931}]	75
34	Faustino	[{"lng": 121.77504, "lat": 16.897341}, {"lng": 121.784866, "lat": 16.8978}, {"lng": 121.786591, "lat": 16.884211}, {"lng": 121.786171, "lat": 16.873409}, {"lng": 121.779152, "lat": 16.869801}, {"lng": 121.77858, "lat": 16.87038}, {"lng": 121.778374, "lat": 16.87245}, {"lng": 121.778198, "lat": 16.874109}, {"lng": 121.777679, "lat": 16.875071}, {"lng": 121.777107, "lat": 16.875389}, {"lng": 121.776443, "lat": 16.87686}, {"lng": 121.775864, "lat": 16.878321}, {"lng": 121.775421, "lat": 16.879551}, {"lng": 121.774147, "lat": 16.88027}, {"lng": 121.77346, "lat": 16.88093}, {"lng": 121.773277, "lat": 16.88162}, {"lng": 121.772537, "lat": 16.88184}, {"lng": 121.77179, "lat": 16.88163}, {"lng": 121.771172, "lat": 16.883089}, {"lng": 121.770554, "lat": 16.885019}, {"lng": 121.77137, "lat": 16.887699}, {"lng": 121.771957, "lat": 16.889219}, {"lng": 121.773323, "lat": 16.89069}, {"lng": 121.773819, "lat": 16.89175}, {"lng": 121.773483, "lat": 16.89307}, {"lng": 121.774208, "lat": 16.894409}, {"lng": 121.774323, "lat": 16.89584}, {"lng": 121.774841, "lat": 16.896931}, {"lng": 121.77504, "lat": 16.897341}]	53
29	Disimuray	[{"lng": 121.846519, "lat": 16.929529}, {"lng": 121.846733, "lat": 16.92979}, {"lng": 121.847214, "lat": 16.931100999999998}, {"lng": 121.848137, "lat": 16.931761}, {"lng": 121.850182, "lat": 16.932949}, {"lng": 121.850517, "lat": 16.932541}, {"lng": 121.852348, "lat": 16.932541}, {"lng": 121.854309, "lat": 16.934031}, {"lng": 121.855133, "lat": 16.93494}, {"lng": 121.856003, "lat": 16.93729}, {"lng": 121.857567, "lat": 16.936911}, {"lng": 121.858673, "lat": 16.93646}, {"lng": 121.860687, "lat": 16.93774}, {"lng": 121.863037, "lat": 16.937941}, {"lng": 121.865334, "lat": 16.93738}, {"lng": 121.865662, "lat": 16.936899}, {"lng": 121.864647, "lat": 16.93531}, {"lng": 121.865128, "lat": 16.933981}, {"lng": 121.866432, "lat": 16.932199}, {"lng": 121.86676, "lat": 16.931471}, {"lng": 121.865799, "lat": 16.93009}, {"lng": 121.864662, "lat": 16.929001}, {"lng": 121.864029, "lat": 16.927811}, {"lng": 121.865097, "lat": 16.92658}, {"lng": 121.865921, "lat": 16.92531}, {"lng": 121.866272, "lat": 16.92411}, {"lng": 121.868187, "lat": 16.922719999999998}, {"lng": 121.848091, "lat": 16.91609}, {"lng": 121.848137, "lat": 16.91748}, {"lng": 121.848328, "lat": 16.91906}, {"lng": 121.848717, "lat": 16.91991}, {"lng": 121.850037, "lat": 16.921909}, {"lng": 121.850548, "lat": 16.923059}, {"lng": 121.849701, "lat": 16.92486}, {"lng": 121.848824, "lat": 16.927059}, {"lng": 121.847977, "lat": 16.92775}, {"lng": 121.846764, "lat": 16.928329}, {"lng": 121.846619, "lat": 16.928881}, {"lng": 121.846764, "lat": 16.92923}, {"lng": 121.846519, "lat": 16.929529}]	55
38	Labinab	[{"lng": 121.783127, "lat": 16.942221}, {"lng": 121.796379, "lat": 16.94137}, {"lng": 121.796806, "lat": 16.934441}, {"lng": 121.7967, "lat": 16.929939}, {"lng": 121.796471, "lat": 16.92687}, {"lng": 121.796417, "lat": 16.92412}, {"lng": 121.796288, "lat": 16.919571}, {"lng": 121.796837, "lat": 16.91452}, {"lng": 121.77269, "lat": 16.915371}, {"lng": 121.768837, "lat": 16.921289}, {"lng": 121.770981, "lat": 16.921921}, {"lng": 121.772041, "lat": 16.92252}, {"lng": 121.772423, "lat": 16.92416}, {"lng": 121.772057, "lat": 16.925409}, {"lng": 121.772293, "lat": 16.92642}, {"lng": 121.772743, "lat": 16.92802}, {"lng": 121.772217, "lat": 16.92927}, {"lng": 121.772041, "lat": 16.930059}, {"lng": 121.772217, "lat": 16.93042}, {"lng": 121.773613, "lat": 16.93136}, {"lng": 121.775047, "lat": 16.93269}, {"lng": 121.774857, "lat": 16.933109}, {"lng": 121.77494, "lat": 16.933599}, {"lng": 121.77523, "lat": 16.93417}, {"lng": 121.776207, "lat": 16.93405}, {"lng": 121.77713, "lat": 16.93335}, {"lng": 121.777992, "lat": 16.933741}, {"lng": 121.779282, "lat": 16.935261}, {"lng": 121.780891, "lat": 16.936081}, {"lng": 121.780792, "lat": 16.93717}, {"lng": 121.78064, "lat": 16.93858}, {"lng": 121.780258, "lat": 16.940201}, {"lng": 121.780777, "lat": 16.94142}, {"lng": 121.783127, "lat": 16.942221}]	46
42	Marabulig I	[{"lng": 121.733299, "lat": 16.933121}, {"lng": 121.733818, "lat": 16.932369}, {"lng": 121.735237, "lat": 16.93243}, {"lng": 121.737587, "lat": 16.93211}, {"lng": 121.738861, "lat": 16.93252}, {"lng": 121.740837, "lat": 16.93228}, {"lng": 121.744377, "lat": 16.932479999999998}, {"lng": 121.746643, "lat": 16.933001}, {"lng": 121.748573, "lat": 16.933419999999998}, {"lng": 121.749863, "lat": 16.93298}, {"lng": 121.750511, "lat": 16.931629}, {"lng": 121.750183, "lat": 16.930388999999998}, {"lng": 121.749107, "lat": 16.92836}, {"lng": 121.749023, "lat": 16.925449}, {"lng": 121.749077, "lat": 16.92383}, {"lng": 121.748749, "lat": 16.922661}, {"lng": 121.747269, "lat": 16.921089}, {"lng": 121.745903, "lat": 16.920361}, {"lng": 121.743301, "lat": 16.91045}, {"lng": 121.743156, "lat": 16.910379}, {"lng": 121.74292, "lat": 16.910311}, {"lng": 121.741898, "lat": 16.909439}, {"lng": 121.740967, "lat": 16.908239}, {"lng": 121.740463, "lat": 16.90737}, {"lng": 121.739304, "lat": 16.90646}, {"lng": 121.737907, "lat": 16.906349}, {"lng": 121.736366, "lat": 16.905279}, {"lng": 121.735626, "lat": 16.904659}, {"lng": 121.7342, "lat": 16.903761}, {"lng": 121.732697, "lat": 16.90251}, {"lng": 121.7314, "lat": 16.901569}, {"lng": 121.727127, "lat": 16.911421}, {"lng": 121.727524, "lat": 16.91325}, {"lng": 121.733299, "lat": 16.933121}]	63
47	Nagrumbuan	[{"lng": 121.697983, "lat": 16.91243}, {"lng": 121.7136, "lat": 16.912821}, {"lng": 121.727524, "lat": 16.91325}, {"lng": 121.727127, "lat": 16.911421}, {"lng": 121.7314, "lat": 16.901569}, {"lng": 121.731056, "lat": 16.90164}, {"lng": 121.729507, "lat": 16.90163}, {"lng": 121.728592, "lat": 16.9021}, {"lng": 121.727951, "lat": 16.902201}, {"lng": 121.726936, "lat": 16.90218}, {"lng": 121.726578, "lat": 16.902161}, {"lng": 121.725304, "lat": 16.901501}, {"lng": 121.723793, "lat": 16.900709}, {"lng": 121.721458, "lat": 16.899639}, {"lng": 121.720177, "lat": 16.898701}, {"lng": 121.71862, "lat": 16.8983}, {"lng": 121.717369, "lat": 16.89794}, {"lng": 121.715599, "lat": 16.89768}, {"lng": 121.712883, "lat": 16.89802}, {"lng": 121.712227, "lat": 16.89842}, {"lng": 121.709328, "lat": 16.89937}, {"lng": 121.70755, "lat": 16.898319}, {"lng": 121.706146, "lat": 16.89609}, {"lng": 121.705063, "lat": 16.894341}, {"lng": 121.704353, "lat": 16.893009}, {"lng": 121.70314, "lat": 16.891769}, {"lng": 121.701767, "lat": 16.8916}, {"lng": 121.699226, "lat": 16.89135}, {"lng": 121.697563, "lat": 16.89064}, {"lng": 121.695236, "lat": 16.88962}, {"lng": 121.693466, "lat": 16.88909}, {"lng": 121.691521, "lat": 16.888321}, {"lng": 121.690773, "lat": 16.887951}, {"lng": 121.690269, "lat": 16.88777}, {"lng": 121.68441, "lat": 16.9044}, {"lng": 121.684837, "lat": 16.90435}, {"lng": 121.686623, "lat": 16.904659}, {"lng": 121.688477, "lat": 16.905451}, {"lng": 121.689339, "lat": 16.905701}, {"lng": 121.690498, "lat": 16.906071}, {"lng": 121.691582, "lat": 16.9065}, {"lng": 121.692543, "lat": 16.906639}, {"lng": 121.693916, "lat": 16.906509}, {"lng": 121.694992, "lat": 16.907301}, {"lng": 121.695686, "lat": 16.908291}, {"lng": 121.695717, "lat": 16.9091}, {"lng": 121.696037, "lat": 16.910851}, {"lng": 121.696136, "lat": 16.911501}, {"lng": 121.697983, "lat": 16.91243}]	64
52	Rogus	[{"lng": 121.893066, "lat": 16.91412}, {"lng": 121.893608, "lat": 16.912861}, {"lng": 121.894058, "lat": 16.911699}, {"lng": 121.895126, "lat": 16.91115}, {"lng": 121.896019, "lat": 16.91017}, {"lng": 121.896797, "lat": 16.90933}, {"lng": 121.897926, "lat": 16.90847}, {"lng": 121.882004, "lat": 16.90391}, {"lng": 121.883362, "lat": 16.91032}, {"lng": 121.883842, "lat": 16.920931}, {"lng": 121.884941, "lat": 16.920931}, {"lng": 121.886253, "lat": 16.921141}, {"lng": 121.887611, "lat": 16.9214}, {"lng": 121.88932, "lat": 16.922251}, {"lng": 121.890717, "lat": 16.922859}, {"lng": 121.89193, "lat": 16.922371}, {"lng": 121.891129, "lat": 16.920509}, {"lng": 121.89048, "lat": 16.919621}, {"lng": 121.890587, "lat": 16.918261}, {"lng": 121.890999, "lat": 16.91688}, {"lng": 121.892548, "lat": 16.91485}, {"lng": 121.893066, "lat": 16.91412}]	75
8	San Fermin	[ \t{"lng": 121.909363, "lat": 16.893270}, \t{"lng": 121.909943, "lat": 16.892920}, \t{"lng": 121.909920, "lat": 16.892250}, \t{"lng": 121.909813, "lat": 16.890591}, \t{"lng": 121.909332, "lat": 16.889549}, \t{"lng": 121.908669, "lat": 16.888460}, \t{"lng": 121.907867, "lat": 16.887409}, \t{"lng": 121.907944, "lat": 16.886780}, \t{"lng": 121.907318, "lat": 16.886471}, \t{"lng": 121.907692, "lat": 16.885139}, \t{"lng": 121.908417, "lat": 16.882669}, \t{"lng": 121.908699, "lat": 16.880939}, \t{"lng": 121.910141, "lat": 16.879709}, \t{"lng": 121.911362, "lat": 16.877430}, \t{"lng": 121.912537, "lat": 16.875521}, \t{"lng": 121.914001, "lat": 16.872431}, \t{"lng": 121.914253, "lat": 16.871441}, \t{"lng": 121.915031, "lat": 16.870331}, \t{"lng": 121.916054, "lat": 16.869850}, \t{"lng": 121.917526, "lat": 16.868860}, \t{"lng": 121.919510, "lat": 16.867250}, \t{"lng": 121.922508, "lat": 16.862640}, \t{"lng": 121.919937, "lat": 16.861500}, \t{"lng": 121.913353, "lat": 16.859470}, \t{"lng": 121.910820, "lat": 16.858400}, \t{"lng": 121.908897, "lat": 16.857220}, \t{"lng": 121.889351, "lat": 16.875420}, \t{"lng": 121.889481, "lat": 16.875891}, \t{"lng": 121.889816, "lat": 16.876459}, \t{"lng": 121.890663, "lat": 16.876970}, \t{"lng": 121.892021, "lat": 16.877979}, \t{"lng": 121.891792, "lat": 16.879339}, \t{"lng": 121.892052, "lat": 16.880880}, \t{"lng": 121.893013, "lat": 16.881981}, \t{"lng": 121.893318, "lat": 16.883301}, \t{"lng": 121.893799, "lat": 16.884850}, \t{"lng": 121.894737, "lat": 16.885900}, \t{"lng": 121.896843, "lat": 16.887369}, \t{"lng": 121.898216, "lat": 16.889120}, \t{"lng": 121.898933, "lat": 16.891399}, \t{"lng": 121.899918, "lat": 16.892780}, \t{"lng": 121.902191, "lat": 16.893530}, \t{"lng": 121.904617, "lat": 16.894260}, \t{"lng": 121.905167, "lat": 16.893400}, \t{"lng": 121.906921, "lat": 16.893141}, \t{"lng": 121.909363, "lat": 16.893270} ]	87.27
55	San Isidro	[{"lng": 121.77179, "lat": 16.88163}, {"lng": 121.772537, "lat": 16.88184}, {"lng": 121.773277, "lat": 16.88162}, {"lng": 121.77346, "lat": 16.88093}, {"lng": 121.774147, "lat": 16.88027}, {"lng": 121.775421, "lat": 16.879551}, {"lng": 121.775864, "lat": 16.878321}, {"lng": 121.776443, "lat": 16.87686}, {"lng": 121.777107, "lat": 16.875389}, {"lng": 121.777679, "lat": 16.875071}, {"lng": 121.778198, "lat": 16.874109}, {"lng": 121.778374, "lat": 16.87245}, {"lng": 121.77858, "lat": 16.87038}, {"lng": 121.779152, "lat": 16.869801}, {"lng": 121.774429, "lat": 16.867661}, {"lng": 121.763206, "lat": 16.868139}, {"lng": 121.758636, "lat": 16.87126}, {"lng": 121.75885, "lat": 16.875}, {"lng": 121.758987, "lat": 16.87891}, {"lng": 121.759117, "lat": 16.88217}, {"lng": 121.759392, "lat": 16.8839}, {"lng": 121.759697, "lat": 16.884991}, {"lng": 121.759697, "lat": 16.88549}, {"lng": 121.760513, "lat": 16.88542}, {"lng": 121.762138, "lat": 16.885611}, {"lng": 121.763832, "lat": 16.88475}, {"lng": 121.764473, "lat": 16.884001}, {"lng": 121.765732, "lat": 16.88184}, {"lng": 121.766853, "lat": 16.881741}, {"lng": 121.768257, "lat": 16.882151}, {"lng": 121.769203, "lat": 16.88205}, {"lng": 121.770393, "lat": 16.881901}, {"lng": 121.771446, "lat": 16.880939}, {"lng": 121.771637, "lat": 16.880779}, {"lng": 121.77179, "lat": 16.88163}]	58
59	Santa Maria	[{"lng": 121.897926, "lat": 16.90847}, {"lng": 121.898773, "lat": 16.907921}, {"lng": 121.899971, "lat": 16.90773}, {"lng": 121.90078, "lat": 16.90848}, {"lng": 121.90152, "lat": 16.90921}, {"lng": 121.902161, "lat": 16.908581}, {"lng": 121.903252, "lat": 16.908251}, {"lng": 121.905281, "lat": 16.90777}, {"lng": 121.905853, "lat": 16.906981}, {"lng": 121.905952, "lat": 16.90531}, {"lng": 121.905472, "lat": 16.90443}, {"lng": 121.904404, "lat": 16.90283}, {"lng": 121.904984, "lat": 16.90037}, {"lng": 121.904984, "lat": 16.898809}, {"lng": 121.904739, "lat": 16.89571}, {"lng": 121.904617, "lat": 16.89426}, {"lng": 121.902191, "lat": 16.89353}, {"lng": 121.899918, "lat": 16.89278}, {"lng": 121.898933, "lat": 16.891399}, {"lng": 121.898216, "lat": 16.88912}, {"lng": 121.896843, "lat": 16.887369}, {"lng": 121.894737, "lat": 16.8859}, {"lng": 121.893799, "lat": 16.88485}, {"lng": 121.893318, "lat": 16.883301}, {"lng": 121.891647, "lat": 16.88563}, {"lng": 121.890266, "lat": 16.88637}, {"lng": 121.888649, "lat": 16.887501}, {"lng": 121.886833, "lat": 16.88876}, {"lng": 121.885277, "lat": 16.89012}, {"lng": 121.884727, "lat": 16.89098}, {"lng": 121.884033, "lat": 16.891979}, {"lng": 121.883614, "lat": 16.89275}, {"lng": 121.882591, "lat": 16.89283}, {"lng": 121.881844, "lat": 16.893181}, {"lng": 121.881287, "lat": 16.89381}, {"lng": 121.881416, "lat": 16.89432}, {"lng": 121.882004, "lat": 16.90391}, {"lng": 121.897926, "lat": 16.90847}]	50.5
60	Sillawit	[{"lng": 121.759697, "lat": 16.88549}, {"lng": 121.759697, "lat": 16.884991}, {"lng": 121.759392, "lat": 16.8839}, {"lng": 121.759117, "lat": 16.88217}, {"lng": 121.758987, "lat": 16.87891}, {"lng": 121.75885, "lat": 16.875}, {"lng": 121.758636, "lat": 16.87126}, {"lng": 121.750473, "lat": 16.871531}, {"lng": 121.743874, "lat": 16.85704}, {"lng": 121.722794, "lat": 16.86101}, {"lng": 121.722542, "lat": 16.86792}, {"lng": 121.721588, "lat": 16.87332}, {"lng": 121.720757, "lat": 16.877831}, {"lng": 121.718536, "lat": 16.882799}, {"lng": 121.722908, "lat": 16.884769}, {"lng": 121.725502, "lat": 16.884951}, {"lng": 121.726921, "lat": 16.88402}, {"lng": 121.72831, "lat": 16.880859}, {"lng": 121.729401, "lat": 16.87841}, {"lng": 121.730476, "lat": 16.87678}, {"lng": 121.732521, "lat": 16.876051}, {"lng": 121.73439, "lat": 16.876511}, {"lng": 121.735703, "lat": 16.87727}, {"lng": 121.736343, "lat": 16.87705}, {"lng": 121.737717, "lat": 16.87616}, {"lng": 121.739563, "lat": 16.874901}, {"lng": 121.740868, "lat": 16.874029}, {"lng": 121.742363, "lat": 16.87351}, {"lng": 121.744186, "lat": 16.874149}, {"lng": 121.745758, "lat": 16.875589}, {"lng": 121.746651, "lat": 16.87591}, {"lng": 121.747383, "lat": 16.876671}, {"lng": 121.747963, "lat": 16.87788}, {"lng": 121.749107, "lat": 16.87899}, {"lng": 121.750183, "lat": 16.87912}, {"lng": 121.751968, "lat": 16.87896}, {"lng": 121.75293, "lat": 16.87956}, {"lng": 121.752953, "lat": 16.880739}, {"lng": 121.752022, "lat": 16.882429}, {"lng": 121.751343, "lat": 16.883751}, {"lng": 121.751793, "lat": 16.884809}, {"lng": 121.754593, "lat": 16.886061}, {"lng": 121.755798, "lat": 16.88649}, {"lng": 121.758362, "lat": 16.886499}, {"lng": 121.759277, "lat": 16.885839}, {"lng": 121.759697, "lat": 16.88549}]	64
32	District III	[{"lng": 121.765648, "lat": 16.948469}, {"lng": 121.775597, "lat": 16.94441}, {"lng": 121.77861, "lat": 16.945829}, {"lng": 121.778687, "lat": 16.944811}, {"lng": 121.783127, "lat": 16.942221}, {"lng": 121.780777, "lat": 16.94142}, {"lng": 121.780792, "lat": 16.941561}, {"lng": 121.776367, "lat": 16.94105}, {"lng": 121.775864, "lat": 16.941111}, {"lng": 121.775848, "lat": 16.941641}, {"lng": 121.775581, "lat": 16.94208}, {"lng": 121.769432, "lat": 16.94239}, {"lng": 121.76757, "lat": 16.938869}, {"lng": 121.764236, "lat": 16.940161}, {"lng": 121.76403, "lat": 16.94021}, {"lng": 121.762222, "lat": 16.940479}, {"lng": 121.762428, "lat": 16.94096}, {"lng": 121.762543, "lat": 16.941231}, {"lng": 121.76532, "lat": 16.94771}, {"lng": 121.765648, "lat": 16.948469}]	50
\.


--
-- TOC entry 3482 (class 0 OID 16991)
-- Dependencies: 224
-- Data for Name: barangay_calamity_incident; Type: TABLE DATA; Schema: public; Owner: risk_management_user
--

COPY public.barangay_calamity_incident (calamity_incident_id, barangay_id, calamity_category_id, coordinates) FROM stdin;
\.


--
-- TOC entry 3480 (class 0 OID 16963)
-- Dependencies: 222
-- Data for Name: barangay_casualty; Type: TABLE DATA; Schema: public; Owner: risk_management_user
--

COPY public.barangay_casualty (resident_id, barangay_id, casualty_category_id) FROM stdin;
\.


--
-- TOC entry 3488 (class 0 OID 17055)
-- Dependencies: 230
-- Data for Name: barangay_copy; Type: TABLE DATA; Schema: public; Owner: risk_management_user
--

COPY public.barangay_copy (barangay_id, name, political_boundaries) FROM stdin;
1	Carabatan Grande	[ \t{"lng": 121.802551, "lat": 16.954359}, \t{"lng": 121.808220, "lat": 16.954269}, \t{"lng": 121.802727, "lat": 16.947420}, \t{"lng": 121.801117, "lat": 16.947769}, \t{"lng": 121.799187, "lat": 16.948820}, \t{"lng": 121.797348, "lat": 16.949640}, \t{"lng": 121.795479, "lat": 16.950211}, \t{"lng": 121.793854, "lat": 16.950590}, \t{"lng": 121.795387, "lat": 16.956181}, \t{"lng": 121.802551, "lat": 16.954359} ]
2	Nagcampegan	[ \t{"lng": 121.806808, "lat": 16.981930}, \t{"lng": 121.808510, "lat": 16.981819}, \t{"lng": 121.811600, "lat": 16.981449}, \t{"lng": 121.813873, "lat": 16.981020}, \t{"lng": 121.816681, "lat": 16.980190}, \t{"lng": 121.812553, "lat": 16.963421}, \t{"lng": 121.807083, "lat": 16.964001}, \t{"lng": 121.798630, "lat": 16.964451}, \t{"lng": 121.788399, "lat": 16.966351}, \t{"lng": 121.788788, "lat": 16.967220}, \t{"lng": 121.789963, "lat": 16.970671}, \t{"lng": 121.790894, "lat": 16.972191}, \t{"lng": 121.792168, "lat": 16.974030}, \t{"lng": 121.793404, "lat": 16.975300}, \t{"lng": 121.797684, "lat": 16.981951}, \t{"lng": 121.800117, "lat": 16.981609}, \t{"lng": 121.802727, "lat": 16.981520}, \t{"lng": 121.805511, "lat": 16.981800}, \t{"lng": 121.806808, "lat": 16.981930} ]
3	Carabatan Punta	[ \t{"lng": 121.807083, "lat": 16.964001}, \t{"lng": 121.804977, "lat": 16.959511}, \t{"lng": 121.796387, "lat": 16.959820}, \t{"lng": 121.798630, "lat": 16.964451}, \t{"lng": 121.807083, "lat": 16.964001} ]
4	Mabantad	[ \t{"lng": 121.798630, "lat": 16.964451}, \t{"lng": 121.796387, "lat": 16.959820}, \t{"lng": 121.786880, "lat": 16.961180}, \t{"lng": 121.787079, "lat": 16.962339}, \t{"lng": 121.787590, "lat": 16.964140}, \t{"lng": 121.788116, "lat": 16.965771}, \t{"lng": 121.788399, "lat": 16.966351}, \t{"lng": 121.798630, "lat": 16.964451} ]
5	Catalina	[ \t{"lng": 121.783981, "lat": 16.956860}, \t{"lng": 121.795387, "lat": 16.956181}, \t{"lng": 121.793854, "lat": 16.950590}, \t{"lng": 121.792610, "lat": 16.950480}, \t{"lng": 121.789627, "lat": 16.950319}, \t{"lng": 121.786873, "lat": 16.950340}, \t{"lng": 121.785652, "lat": 16.950800}, \t{"lng": 121.785362, "lat": 16.951139}, \t{"lng": 121.785027, "lat": 16.951509}, \t{"lng": 121.783852, "lat": 16.953011}, \t{"lng": 121.783783, "lat": 16.954519}, \t{"lng": 121.783920, "lat": 16.956329}, \t{"lng": 121.783981, "lat": 16.956860} ]
6	Carabatan Bacareno	[ \t{"lng": 121.796387, "lat": 16.959820}, \t{"lng": 121.804977, "lat": 16.959511}, \t{"lng": 121.802551, "lat": 16.954359}, \t{"lng": 121.795387, "lat": 16.956181}, \t{"lng": 121.796387, "lat": 16.959820} ]
7	Andarayan	[ \t{"lng": 121.812553, "lat": 16.963421}, \t{"lng": 121.822121, "lat": 16.955950}, \t{"lng": 121.812218, "lat": 16.954840}, \t{"lng": 121.808220, "lat": 16.954269}, \t{"lng": 121.802551, "lat": 16.954359}, \t{"lng": 121.804977, "lat": 16.959511}, \t{"lng": 121.807083, "lat": 16.964001}, \t{"lng": 121.812553, "lat": 16.963421} ]
8	San Fermin	[ \t{"lng": 121.909363, "lat": 16.893270}, \t{"lng": 121.909943, "lat": 16.892920}, \t{"lng": 121.909920, "lat": 16.892250}, \t{"lng": 121.909813, "lat": 16.890591}, \t{"lng": 121.909332, "lat": 16.889549}, \t{"lng": 121.908669, "lat": 16.888460}, \t{"lng": 121.907867, "lat": 16.887409}, \t{"lng": 121.907944, "lat": 16.886780}, \t{"lng": 121.907318, "lat": 16.886471}, \t{"lng": 121.907692, "lat": 16.885139}, \t{"lng": 121.908417, "lat": 16.882669}, \t{"lng": 121.908699, "lat": 16.880939}, \t{"lng": 121.910141, "lat": 16.879709}, \t{"lng": 121.911362, "lat": 16.877430}, \t{"lng": 121.912537, "lat": 16.875521}, \t{"lng": 121.914001, "lat": 16.872431}, \t{"lng": 121.914253, "lat": 16.871441}, \t{"lng": 121.915031, "lat": 16.870331}, \t{"lng": 121.916054, "lat": 16.869850}, \t{"lng": 121.917526, "lat": 16.868860}, \t{"lng": 121.919510, "lat": 16.867250}, \t{"lng": 121.922508, "lat": 16.862640}, \t{"lng": 121.919937, "lat": 16.861500}, \t{"lng": 121.913353, "lat": 16.859470}, \t{"lng": 121.910820, "lat": 16.858400}, \t{"lng": 121.908897, "lat": 16.857220}, \t{"lng": 121.889351, "lat": 16.875420}, \t{"lng": 121.889481, "lat": 16.875891}, \t{"lng": 121.889816, "lat": 16.876459}, \t{"lng": 121.890663, "lat": 16.876970}, \t{"lng": 121.892021, "lat": 16.877979}, \t{"lng": 121.891792, "lat": 16.879339}, \t{"lng": 121.892052, "lat": 16.880880}, \t{"lng": 121.893013, "lat": 16.881981}, \t{"lng": 121.893318, "lat": 16.883301}, \t{"lng": 121.893799, "lat": 16.884850}, \t{"lng": 121.894737, "lat": 16.885900}, \t{"lng": 121.896843, "lat": 16.887369}, \t{"lng": 121.898216, "lat": 16.889120}, \t{"lng": 121.898933, "lat": 16.891399}, \t{"lng": 121.899918, "lat": 16.892780}, \t{"lng": 121.902191, "lat": 16.893530}, \t{"lng": 121.904617, "lat": 16.894260}, \t{"lng": 121.905167, "lat": 16.893400}, \t{"lng": 121.906921, "lat": 16.893141}, \t{"lng": 121.909363, "lat": 16.893270} ]
10	Turayong	[ {"lng": 121.777527, "lat": 16.964100}, {"lng": 121.777763, "lat": 16.950340}, {"lng": 121.778610, "lat": 16.945829}, {"lng": 121.775597, "lat": 16.944410}, {"lng": 121.765648, "lat": 16.948469}, {"lng": 121.765266, "lat": 16.950741}, {"lng": 121.764679, "lat": 16.953421}, {"lng": 121.764900, "lat": 16.955179}, {"lng": 121.766190, "lat": 16.956970}, {"lng": 121.769081, "lat": 16.959539}, {"lng": 121.769157, "lat": 16.959909}, {"lng": 121.769707, "lat": 16.959980}, {"lng": 121.770477, "lat": 16.959949}, {"lng": 121.772003, "lat": 16.959181}, {"lng": 121.773170, "lat": 16.959360}, {"lng": 121.773659, "lat": 16.959881}, {"lng": 121.774727, "lat": 16.961571}, {"lng": 121.775688, "lat": 16.963551}, {"lng": 121.776459, "lat": 16.964239}, {"lng": 121.777527, "lat": 16.964100} ]
9	Cauayan City	[ {"lng": 121.816681, "lat": 16.980190], {"lng": 121.819344, "lat": 16.979130], {"lng": 121.821053, "lat": 16.978550], {"lng": 121.823097, "lat": 16.976450], {"lng": 121.823212, "lat": 16.956381], {"lng": 121.822121, "lat": 16.955950], {"lng": 121.812553, "lat": 16.963421], {"lng": 121.816681, "lat": 16.980190] ]
\.


--
-- TOC entry 3491 (class 0 OID 25380)
-- Dependencies: 233
-- Data for Name: barangay_copy_complete; Type: TABLE DATA; Schema: public; Owner: risk_management_user
--

COPY public.barangay_copy_complete (barangay_id, name, political_boundaries, elevation) FROM stdin;
10	Cauayan City	[ {"lng": 121.816681, "lat": 16.980190}, {"lng": 121.819344, "lat": 16.979130}, {"lng": 121.821053, "lat": 16.978550}, {"lng": 121.823097, "lat": 16.976450}, {"lng": 121.823212, "lat": 16.956381}, {"lng": 121.822121, "lat": 16.955950}, {"lng": 121.812553, "lat": 16.963421}, {"lng": 121.816681, "lat": 16.980190} ]	0
7	Andarayan	[ \t{"lng": 121.812553, "lat": 16.963421}, \t{"lng": 121.822121, "lat": 16.955950}, \t{"lng": 121.812218, "lat": 16.954840}, \t{"lng": 121.808220, "lat": 16.954269}, \t{"lng": 121.802551, "lat": 16.954359}, \t{"lng": 121.804977, "lat": 16.959511}, \t{"lng": 121.807083, "lat": 16.964001}, \t{"lng": 121.812553, "lat": 16.963421} ]	43
1	Carabatan Grande	[ \t{"lng": 121.802551, "lat": 16.954359}, \t{"lng": 121.808220, "lat": 16.954269}, \t{"lng": 121.802727, "lat": 16.947420}, \t{"lng": 121.801117, "lat": 16.947769}, \t{"lng": 121.799187, "lat": 16.948820}, \t{"lng": 121.797348, "lat": 16.949640}, \t{"lng": 121.795479, "lat": 16.950211}, \t{"lng": 121.793854, "lat": 16.950590}, \t{"lng": 121.795387, "lat": 16.956181}, \t{"lng": 121.802551, "lat": 16.954359} ]	40
3	Carabatan Punta	[ \t{"lng": 121.807083, "lat": 16.964001}, \t{"lng": 121.804977, "lat": 16.959511}, \t{"lng": 121.796387, "lat": 16.959820}, \t{"lng": 121.798630, "lat": 16.964451}, \t{"lng": 121.807083, "lat": 16.964001} ]	46
6	Carabatan Bacareno	[ \t{"lng": 121.796387, "lat": 16.959820}, \t{"lng": 121.804977, "lat": 16.959511}, \t{"lng": 121.802551, "lat": 16.954359}, \t{"lng": 121.795387, "lat": 16.956181}, \t{"lng": 121.796387, "lat": 16.959820} ]	44
5	Catalina	[ \t{"lng": 121.783981, "lat": 16.956860}, \t{"lng": 121.795387, "lat": 16.956181}, \t{"lng": 121.793854, "lat": 16.950590}, \t{"lng": 121.792610, "lat": 16.950480}, \t{"lng": 121.789627, "lat": 16.950319}, \t{"lng": 121.786873, "lat": 16.950340}, \t{"lng": 121.785652, "lat": 16.950800}, \t{"lng": 121.785362, "lat": 16.951139}, \t{"lng": 121.785027, "lat": 16.951509}, \t{"lng": 121.783852, "lat": 16.953011}, \t{"lng": 121.783783, "lat": 16.954519}, \t{"lng": 121.783920, "lat": 16.956329}, \t{"lng": 121.783981, "lat": 16.956860} ]	39.76
4	Mabantad	[ \t{"lng": 121.798630, "lat": 16.964451}, \t{"lng": 121.796387, "lat": 16.959820}, \t{"lng": 121.786880, "lat": 16.961180}, \t{"lng": 121.787079, "lat": 16.962339}, \t{"lng": 121.787590, "lat": 16.964140}, \t{"lng": 121.788116, "lat": 16.965771}, \t{"lng": 121.788399, "lat": 16.966351}, \t{"lng": 121.798630, "lat": 16.964451} ]	45
2	Nagcampegan	[ \t{"lng": 121.806808, "lat": 16.981930}, \t{"lng": 121.808510, "lat": 16.981819}, \t{"lng": 121.811600, "lat": 16.981449}, \t{"lng": 121.813873, "lat": 16.981020}, \t{"lng": 121.816681, "lat": 16.980190}, \t{"lng": 121.812553, "lat": 16.963421}, \t{"lng": 121.807083, "lat": 16.964001}, \t{"lng": 121.798630, "lat": 16.964451}, \t{"lng": 121.788399, "lat": 16.966351}, \t{"lng": 121.788788, "lat": 16.967220}, \t{"lng": 121.789963, "lat": 16.970671}, \t{"lng": 121.790894, "lat": 16.972191}, \t{"lng": 121.792168, "lat": 16.974030}, \t{"lng": 121.793404, "lat": 16.975300}, \t{"lng": 121.797684, "lat": 16.981951}, \t{"lng": 121.800117, "lat": 16.981609}, \t{"lng": 121.802727, "lat": 16.981520}, \t{"lng": 121.805511, "lat": 16.981800}, \t{"lng": 121.806808, "lat": 16.981930} ]	43
9	Turayong	[ {"lng": 121.777527, "lat": 16.964100}, {"lng": 121.777763, "lat": 16.950340}, {"lng": 121.778610, "lat": 16.945829}, {"lng": 121.775597, "lat": 16.944410}, {"lng": 121.765648, "lat": 16.948469}, {"lng": 121.765266, "lat": 16.950741}, {"lng": 121.764679, "lat": 16.953421}, {"lng": 121.764900, "lat": 16.955179}, {"lng": 121.766190, "lat": 16.956970}, {"lng": 121.769081, "lat": 16.959539}, {"lng": 121.769157, "lat": 16.959909}, {"lng": 121.769707, "lat": 16.959980}, {"lng": 121.770477, "lat": 16.959949}, {"lng": 121.772003, "lat": 16.959181}, {"lng": 121.773170, "lat": 16.959360}, {"lng": 121.773659, "lat": 16.959881}, {"lng": 121.774727, "lat": 16.961571}, {"lng": 121.775688, "lat": 16.963551}, {"lng": 121.776459, "lat": 16.964239}, {"lng": 121.777527, "lat": 16.964100} ]	50.51
13	Amobocan	[{"lng": 121.816322, "lat": 16.866409}, {"lng": 121.816238, "lat": 16.866011}, {"lng": 121.815849, "lat": 16.8647}, {"lng": 121.81587999999999, "lat": 16.86331}, {"lng": 121.817146, "lat": 16.86157}, {"lng": 121.818871, "lat": 16.860069}, {"lng": 121.820427, "lat": 16.857571}, {"lng": 121.820633, "lat": 16.85635}, {"lng": 121.820213, "lat": 16.853479}, {"lng": 121.819923, "lat": 16.85203}, {"lng": 121.819283, "lat": 16.850849}, {"lng": 121.817642, "lat": 16.84845}, {"lng": 121.815277, "lat": 16.84483}, {"lng": 121.814583, "lat": 16.843229}, {"lng": 121.813873, "lat": 16.84086}, {"lng": 121.814003, "lat": 16.83922}, {"lng": 121.814171, "lat": 16.836809}, {"lng": 121.802353, "lat": 16.83416}, {"lng": 121.802544, "lat": 16.836281}, {"lng": 121.795731, "lat": 16.840561}, {"lng": 121.795097, "lat": 16.85042}, {"lng": 121.788422, "lat": 16.85132}, {"lng": 121.789177, "lat": 16.85988}, {"lng": 121.816322, "lat": 16.866409}]	61
14	Baculod	[{"lng": 121.889351, "lat": 16.87542}, {"lng": 121.908897, "lat": 16.85722}, {"lng": 121.906219, "lat": 16.855539}, {"lng": 121.905792, "lat": 16.85557}, {"lng": 121.904167, "lat": 16.854561}, {"lng": 121.884018, "lat": 16.854179}, {"lng": 121.881691, "lat": 16.85466}, {"lng": 121.879623, "lat": 16.85445}, {"lng": 121.877357, "lat": 16.85544}, {"lng": 121.875961, "lat": 16.85697}, {"lng": 121.874161, "lat": 16.858141}, {"lng": 121.87275700000001, "lat": 16.859461}, {"lng": 121.871582, "lat": 16.860189}, {"lng": 121.871384, "lat": 16.860319}, {"lng": 121.870789, "lat": 16.86132}, {"lng": 121.870773, "lat": 16.86186}, {"lng": 121.872322, "lat": 16.864759}, {"lng": 121.873154, "lat": 16.865721}, {"lng": 121.875092, "lat": 16.8673}, {"lng": 121.877136, "lat": 16.868600999999998}, {"lng": 121.87867, "lat": 16.869419}, {"lng": 121.881638, "lat": 16.86825}, {"lng": 121.883453, "lat": 16.86882}, {"lng": 121.884987, "lat": 16.870461}, {"lng": 121.88681, "lat": 16.872431}, {"lng": 121.889351, "lat": 16.87542}]	71
15	Baringin Norte	[{"lng": 121.814507, "lat": 16.93046}, {"lng": 121.814781, "lat": 16.93001}, {"lng": 121.815208, "lat": 16.92856}, {"lng": 121.816116, "lat": 16.92713}, {"lng": 121.817551, "lat": 16.925699}, {"lng": 121.8181, "lat": 16.92498}, {"lng": 121.817772, "lat": 16.923599}, {"lng": 121.817413, "lat": 16.92292}, {"lng": 121.816757, "lat": 16.92255}, {"lng": 121.816963, "lat": 16.921209}, {"lng": 121.807037, "lat": 16.919889}, {"lng": 121.805634, "lat": 16.925711}, {"lng": 121.814507, "lat": 16.93046}]	49
16	Baringin Sur	[{"lng": 121.807037, "lat": 16.919889}, {"lng": 121.816963, "lat": 16.921209}, {"lng": 121.817146, "lat": 16.920891}, {"lng": 121.817467, "lat": 16.919001}, {"lng": 121.817642, "lat": 16.91736}, {"lng": 121.813972, "lat": 16.915359}, {"lng": 121.808792, "lat": 16.915039}, {"lng": 121.807037, "lat": 16.919889}]	48
17	Buena Suerte	[{"lng": 121.80204, "lat": 16.93214}, {"lng": 121.803307, "lat": 16.93037}, {"lng": 121.803741, "lat": 16.929461}, {"lng": 121.805, "lat": 16.92837}, {"lng": 121.805634, "lat": 16.925711}, {"lng": 121.807037, "lat": 16.919889}, {"lng": 121.808792, "lat": 16.915039}, {"lng": 121.796837, "lat": 16.91452}, {"lng": 121.796288, "lat": 16.919571}, {"lng": 121.796417, "lat": 16.92412}, {"lng": 121.796471, "lat": 16.92687}, {"lng": 121.7967, "lat": 16.929939}, {"lng": 121.796806, "lat": 16.934441}, {"lng": 121.796379, "lat": 16.94137}, {"lng": 121.80204, "lat": 16.93214}]	50
18	Bugallon	[{"lng": 121.80822, "lat": 16.954269}, {"lng": 121.81794, "lat": 16.94244}, {"lng": 121.810768, "lat": 16.93689}, {"lng": 121.810028, "lat": 16.940269}, {"lng": 121.809631, "lat": 16.94166}, {"lng": 121.808357, "lat": 16.943729}, {"lng": 121.807716, "lat": 16.94458}, {"lng": 121.806259, "lat": 16.94585}, {"lng": 121.803719, "lat": 16.94729}, {"lng": 121.802727, "lat": 16.94742}, {"lng": 121.80822, "lat": 16.954269}]	47
19	Buyon	[{"lng": 121.904167, "lat": 16.854561}, {"lng": 121.902023, "lat": 16.853201}, {"lng": 121.900513, "lat": 16.852221}, {"lng": 121.898323, "lat": 16.850491}, {"lng": 121.897041, "lat": 16.84914}, {"lng": 121.894753, "lat": 16.845869}, {"lng": 121.893867, "lat": 16.84498}, {"lng": 121.892036, "lat": 16.84292}, {"lng": 121.890312, "lat": 16.8417}, {"lng": 121.888443, "lat": 16.84333}, {"lng": 121.886383, "lat": 16.84573}, {"lng": 121.884018, "lat": 16.854179}, {"lng": 121.904167, "lat": 16.854561}]	67
45	Minante II	[{"lng": 121.743263, "lat": 16.898359}, {"lng": 121.743408, "lat": 16.905781}, {"lng": 121.743301, "lat": 16.91045}, {"lng": 121.744568, "lat": 16.910549}, {"lng": 121.744949, "lat": 16.910709}, {"lng": 121.747238, "lat": 16.912149}, {"lng": 121.749046, "lat": 16.912439}, {"lng": 121.752228, "lat": 16.91292}, {"lng": 121.753563, "lat": 16.91217}, {"lng": 121.754517, "lat": 16.91115}, {"lng": 121.75605, "lat": 16.909269}, {"lng": 121.757553, "lat": 16.90872}, {"lng": 121.759804, "lat": 16.91}, {"lng": 121.762306, "lat": 16.91144}, {"lng": 121.763283, "lat": 16.8974}, {"lng": 121.743263, "lat": 16.898359}]	61
22	Carabatan Chica	[{"lng": 121.796387, "lat": 16.95982}, {"lng": 121.795387, "lat": 16.956181}, {"lng": 121.783981, "lat": 16.95686}, {"lng": 121.784523, "lat": 16.95784}, {"lng": 121.785339, "lat": 16.958481}, {"lng": 121.785927, "lat": 16.959009000000002}, {"lng": 121.786491, "lat": 16.960011}, {"lng": 121.78688, "lat": 16.96118}, {"lng": 121.796387, "lat": 16.95982}]	46
24	Cassap Fuera	[{"lng": 121.817772, "lat": 16.923599}, {"lng": 121.846519, "lat": 16.929529}, {"lng": 121.846764, "lat": 16.92923}, {"lng": 121.846619, "lat": 16.928881}, {"lng": 121.846764, "lat": 16.928329}, {"lng": 121.847977, "lat": 16.92775}, {"lng": 121.848824, "lat": 16.927059}, {"lng": 121.849701, "lat": 16.92486}, {"lng": 121.850548, "lat": 16.923059}, {"lng": 121.850037, "lat": 16.921909}, {"lng": 121.848717, "lat": 16.91991}, {"lng": 121.848328, "lat": 16.91906}, {"lng": 121.848137, "lat": 16.91748}, {"lng": 121.848091, "lat": 16.91609}, {"lng": 121.848228, "lat": 16.91551}, {"lng": 121.848137, "lat": 16.914369999999998}, {"lng": 121.848228, "lat": 16.912821}, {"lng": 121.848709, "lat": 16.912029}, {"lng": 121.849579, "lat": 16.91083}, {"lng": 121.850273, "lat": 16.90881}, {"lng": 121.850014, "lat": 16.908039}, {"lng": 121.849113, "lat": 16.907009}, {"lng": 121.848289, "lat": 16.90605}, {"lng": 121.848083, "lat": 16.904260999999998}, {"lng": 121.848557, "lat": 16.90295}, {"lng": 121.848137, "lat": 16.902241}, {"lng": 121.845703, "lat": 16.903021}, {"lng": 121.842247, "lat": 16.90498}, {"lng": 121.839607, "lat": 16.906309}, {"lng": 121.836952, "lat": 16.907909}, {"lng": 121.835037, "lat": 16.90976}, {"lng": 121.833687, "lat": 16.911409}, {"lng": 121.832542, "lat": 16.91234}, {"lng": 121.830292, "lat": 16.9133}, {"lng": 121.827393, "lat": 16.91436}, {"lng": 121.82634, "lat": 16.91468}, {"lng": 121.823578, "lat": 16.91534}, {"lng": 121.820572, "lat": 16.915199}, {"lng": 121.819183, "lat": 16.91498}, {"lng": 121.818649, "lat": 16.91371}, {"lng": 121.817802, "lat": 16.91621}, {"lng": 121.817642, "lat": 16.91736}, {"lng": 121.817467, "lat": 16.919001}, {"lng": 121.817146, "lat": 16.920891}, {"lng": 121.816963, "lat": 16.921209}, {"lng": 121.816757, "lat": 16.92255}, {"lng": 121.817413, "lat": 16.92292}, {"lng": 121.817772, "lat": 16.923599}]	56
25	Culalabat	[{"lng": 121.796837, "lat": 16.91452}, {"lng": 121.808792, "lat": 16.915039}, {"lng": 121.808083, "lat": 16.90687}, {"lng": 121.809509, "lat": 16.900721}, {"lng": 121.795937, "lat": 16.898729}, {"lng": 121.795731, "lat": 16.90815}, {"lng": 121.795464, "lat": 16.910339}, {"lng": 121.796837, "lat": 16.91452}]	51
26	Dabburab	[{"lng": 121.817642, "lat": 16.91736}, {"lng": 121.817802, "lat": 16.91621}, {"lng": 121.818649, "lat": 16.91371}, {"lng": 121.819839, "lat": 16.911551}, {"lng": 121.821388, "lat": 16.90885}, {"lng": 121.808083, "lat": 16.90687}, {"lng": 121.808792, "lat": 16.915039}, {"lng": 121.813972, "lat": 16.915359}, {"lng": 121.817642, "lat": 16.91736}]	53
27	De Vera	[{"lng": 121.882004, "lat": 16.90391}, {"lng": 121.881416, "lat": 16.89432}, {"lng": 121.878723, "lat": 16.8955}, {"lng": 121.876022, "lat": 16.89678}, {"lng": 121.873611, "lat": 16.897711}, {"lng": 121.869202, "lat": 16.898491}, {"lng": 121.867043, "lat": 16.89876}, {"lng": 121.862152, "lat": 16.90065}, {"lng": 121.859612, "lat": 16.90114}, {"lng": 121.85714, "lat": 16.90151}, {"lng": 121.883362, "lat": 16.91032}, {"lng": 121.882004, "lat": 16.90391}]	61
28	Dianao	[{"lng": 121.884018, "lat": 16.854179}, {"lng": 121.886383, "lat": 16.84573}, {"lng": 121.888443, "lat": 16.84333}, {"lng": 121.890312, "lat": 16.8417}, {"lng": 121.886948, "lat": 16.838369}, {"lng": 121.883438, "lat": 16.835779}, {"lng": 121.877663, "lat": 16.83234}, {"lng": 121.875481, "lat": 16.830481}, {"lng": 121.871834, "lat": 16.840611}, {"lng": 121.871384, "lat": 16.860319}, {"lng": 121.871582, "lat": 16.860189}, {"lng": 121.87275700000001, "lat": 16.859461}, {"lng": 121.874161, "lat": 16.858141}, {"lng": 121.875961, "lat": 16.85697}, {"lng": 121.877357, "lat": 16.85544}, {"lng": 121.879623, "lat": 16.85445}, {"lng": 121.881691, "lat": 16.85466}, {"lng": 121.884018, "lat": 16.854179}]	66
46	Naganacan	[{"lng": 121.68441, "lat": 16.9044}, {"lng": 121.690269, "lat": 16.88777}, {"lng": 121.694572, "lat": 16.867519}, {"lng": 121.68251, "lat": 16.870291}, {"lng": 121.677101, "lat": 16.871559}, {"lng": 121.67392, "lat": 16.871941}, {"lng": 121.671471, "lat": 16.872351}, {"lng": 121.667992, "lat": 16.873359999999998}, {"lng": 121.663628, "lat": 16.87425}, {"lng": 121.661346, "lat": 16.874041}, {"lng": 121.658829, "lat": 16.8752}, {"lng": 121.65686, "lat": 16.876459}, {"lng": 121.651207, "lat": 16.87878}, {"lng": 121.661636, "lat": 16.88728}, {"lng": 121.673203, "lat": 16.89654}, {"lng": 121.674156, "lat": 16.90382}, {"lng": 121.675148, "lat": 16.90362}, {"lng": 121.675613, "lat": 16.90316}, {"lng": 121.676331, "lat": 16.902691}, {"lng": 121.676468, "lat": 16.90284}, {"lng": 121.678268, "lat": 16.903839}, {"lng": 121.679108, "lat": 16.903561}, {"lng": 121.679871, "lat": 16.90321}, {"lng": 121.680817, "lat": 16.902941}, {"lng": 121.682159, "lat": 16.903311}, {"lng": 121.682808, "lat": 16.903709}, {"lng": 121.68308999999999, "lat": 16.903891}, {"lng": 121.68441, "lat": 16.9044}]	70
33	Duminit	[{"lng": 121.802727, "lat": 16.94742}, {"lng": 121.803719, "lat": 16.94729}, {"lng": 121.806259, "lat": 16.94585}, {"lng": 121.807716, "lat": 16.94458}, {"lng": 121.808357, "lat": 16.943729}, {"lng": 121.809631, "lat": 16.94166}, {"lng": 121.810028, "lat": 16.940269}, {"lng": 121.810768, "lat": 16.93689}, {"lng": 121.811043, "lat": 16.93576}, {"lng": 121.81105, "lat": 16.935579}, {"lng": 121.80204, "lat": 16.93214}, {"lng": 121.796379, "lat": 16.94137}, {"lng": 121.802727, "lat": 16.94742}]	45
35	Gagabutan	[{"lng": 121.777763, "lat": 16.95034}, {"lng": 121.785362, "lat": 16.951139}, {"lng": 121.785652, "lat": 16.9508}, {"lng": 121.786873, "lat": 16.95034}, {"lng": 121.789627, "lat": 16.950319}, {"lng": 121.79261, "lat": 16.95048}, {"lng": 121.793854, "lat": 16.95059}, {"lng": 121.795479, "lat": 16.950211}, {"lng": 121.797348, "lat": 16.94964}, {"lng": 121.799187, "lat": 16.94882}, {"lng": 121.801117, "lat": 16.947769}, {"lng": 121.802727, "lat": 16.94742}, {"lng": 121.796379, "lat": 16.94137}, {"lng": 121.783127, "lat": 16.942221}, {"lng": 121.778687, "lat": 16.944811}, {"lng": 121.77861, "lat": 16.945829}, {"lng": 121.777763, "lat": 16.95034}]	41
36	Gappal	[{"lng": 121.824348, "lat": 16.869181}, {"lng": 121.834007, "lat": 16.83609}, {"lng": 121.830856, "lat": 16.835449}, {"lng": 121.828491, "lat": 16.835698999999998}, {"lng": 121.823601, "lat": 16.835751}, {"lng": 121.817291, "lat": 16.836361}, {"lng": 121.814171, "lat": 16.836809}, {"lng": 121.814003, "lat": 16.83922}, {"lng": 121.813873, "lat": 16.84086}, {"lng": 121.814583, "lat": 16.843229}, {"lng": 121.815277, "lat": 16.84483}, {"lng": 121.817642, "lat": 16.84845}, {"lng": 121.819283, "lat": 16.850849}, {"lng": 121.819923, "lat": 16.85203}, {"lng": 121.820213, "lat": 16.853479}, {"lng": 121.820633, "lat": 16.85635}, {"lng": 121.820427, "lat": 16.857571}, {"lng": 121.818871, "lat": 16.860069}, {"lng": 121.817146, "lat": 16.86157}, {"lng": 121.81587999999999, "lat": 16.86331}, {"lng": 121.815849, "lat": 16.8647}, {"lng": 121.816238, "lat": 16.866011}, {"lng": 121.816322, "lat": 16.866409}, {"lng": 121.816902, "lat": 16.86668}, {"lng": 121.818481, "lat": 16.867359}, {"lng": 121.821716, "lat": 16.868009999999998}, {"lng": 121.823807, "lat": 16.868891}, {"lng": 121.824348, "lat": 16.869181}]	50
37	Guayabal	[{"lng": 121.80204, "lat": 16.93214}, {"lng": 121.81105, "lat": 16.935579}, {"lng": 121.811043, "lat": 16.93576}, {"lng": 121.811729, "lat": 16.93433}, {"lng": 121.813179, "lat": 16.93257}, {"lng": 121.814117, "lat": 16.93121}, {"lng": 121.814507, "lat": 16.93046}, {"lng": 121.805634, "lat": 16.925711}, {"lng": 121.805, "lat": 16.92837}, {"lng": 121.803741, "lat": 16.929461}, {"lng": 121.803307, "lat": 16.93037}, {"lng": 121.80204, "lat": 16.93214}]	49
30	District I	[{"lng": 121.780777, "lat": 16.94142}, {"lng": 121.780258, "lat": 16.940201}, {"lng": 121.78064, "lat": 16.93858}, {"lng": 121.780792, "lat": 16.93717}, {"lng": 121.780891, "lat": 16.936081}, {"lng": 121.779282, "lat": 16.935261}, {"lng": 121.777992, "lat": 16.933741}, {"lng": 121.77713, "lat": 16.93335}, {"lng": 121.776207, "lat": 16.93405}, {"lng": 121.77523, "lat": 16.93417}, {"lng": 121.77494, "lat": 16.933599}, {"lng": 121.774857, "lat": 16.933109}, {"lng": 121.765579, "lat": 16.93396}, {"lng": 121.766006, "lat": 16.934601}, {"lng": 121.765953, "lat": 16.93564}, {"lng": 121.766083, "lat": 16.935921}, {"lng": 121.76757, "lat": 16.938869}, {"lng": 121.769432, "lat": 16.94239}, {"lng": 121.775581, "lat": 16.94208}, {"lng": 121.775848, "lat": 16.941641}, {"lng": 121.775864, "lat": 16.941111}, {"lng": 121.776367, "lat": 16.94105}, {"lng": 121.780792, "lat": 16.941561}, {"lng": 121.780777, "lat": 16.94142}]	103
31	District II	[{"lng": 121.76757, "lat": 16.938869}, {"lng": 121.766083, "lat": 16.935921}, {"lng": 121.765953, "lat": 16.93564}, {"lng": 121.766006, "lat": 16.934601}, {"lng": 121.765579, "lat": 16.93396}, {"lng": 121.760452, "lat": 16.933531}, {"lng": 121.760567, "lat": 16.93556}, {"lng": 121.760857, "lat": 16.936831}, {"lng": 121.761673, "lat": 16.93923}, {"lng": 121.762222, "lat": 16.940479}, {"lng": 121.76403, "lat": 16.94021}, {"lng": 121.764236, "lat": 16.940161}, {"lng": 121.76757, "lat": 16.938869}]	58
39	Linglingay	[{"lng": 121.864037, "lat": 16.88489}, {"lng": 121.884727, "lat": 16.89098}, {"lng": 121.885277, "lat": 16.89012}, {"lng": 121.886833, "lat": 16.88876}, {"lng": 121.888649, "lat": 16.887501}, {"lng": 121.890266, "lat": 16.88637}, {"lng": 121.891647, "lat": 16.88563}, {"lng": 121.893318, "lat": 16.883301}, {"lng": 121.893013, "lat": 16.881981}, {"lng": 121.892052, "lat": 16.88088}, {"lng": 121.891792, "lat": 16.879339}, {"lng": 121.892021, "lat": 16.877979}, {"lng": 121.890663, "lat": 16.87697}, {"lng": 121.889816, "lat": 16.876459}, {"lng": 121.889481, "lat": 16.875891}, {"lng": 121.889351, "lat": 16.87542}, {"lng": 121.88681, "lat": 16.872431}, {"lng": 121.884987, "lat": 16.870461}, {"lng": 121.883453, "lat": 16.86882}, {"lng": 121.881638, "lat": 16.86825}, {"lng": 121.87867, "lat": 16.869419}, {"lng": 121.877136, "lat": 16.868600999999998}, {"lng": 121.875092, "lat": 16.8673}, {"lng": 121.873154, "lat": 16.865721}, {"lng": 121.872322, "lat": 16.864759}, {"lng": 121.864037, "lat": 16.88489}]	76
40	Maligaya	[{"lng": 121.848137, "lat": 16.902241}, {"lng": 121.85714, "lat": 16.90151}, {"lng": 121.859612, "lat": 16.90114}, {"lng": 121.864037, "lat": 16.88489}, {"lng": 121.872322, "lat": 16.864759}, {"lng": 121.870773, "lat": 16.86186}, {"lng": 121.870789, "lat": 16.86132}, {"lng": 121.871384, "lat": 16.860319}, {"lng": 121.8703, "lat": 16.860451}, {"lng": 121.869743, "lat": 16.860029}, {"lng": 121.867661, "lat": 16.859591}, {"lng": 121.864616, "lat": 16.859369}, {"lng": 121.863571, "lat": 16.859329}, {"lng": 121.861633, "lat": 16.860201}, {"lng": 121.860237, "lat": 16.86142}, {"lng": 121.857719, "lat": 16.86129}, {"lng": 121.856369, "lat": 16.861759}, {"lng": 121.854622, "lat": 16.863159}, {"lng": 121.853943, "lat": 16.8643}, {"lng": 121.853554, "lat": 16.86459}, {"lng": 121.854111, "lat": 16.865141}, {"lng": 121.853867, "lat": 16.866501}, {"lng": 121.852509, "lat": 16.86787}, {"lng": 121.851646, "lat": 16.86944}, {"lng": 121.851311, "lat": 16.87043}, {"lng": 121.850853, "lat": 16.872009}, {"lng": 121.849792, "lat": 16.87291}, {"lng": 121.848503, "lat": 16.873699}, {"lng": 121.847183, "lat": 16.87537}, {"lng": 121.845818, "lat": 16.87715}, {"lng": 121.846771, "lat": 16.87842}, {"lng": 121.846161, "lat": 16.878839}, {"lng": 121.844772, "lat": 16.87833}, {"lng": 121.844269, "lat": 16.877871}, {"lng": 121.848137, "lat": 16.902241}]	82
41	Manaoag	[{"lng": 121.825638, "lat": 16.87199}, {"lng": 121.826202, "lat": 16.871639}, {"lng": 121.827499, "lat": 16.871309}, {"lng": 121.827766, "lat": 16.87002}, {"lng": 121.827492, "lat": 16.869221}, {"lng": 121.82943, "lat": 16.867781}, {"lng": 121.830994, "lat": 16.86758}, {"lng": 121.833618, "lat": 16.867109}, {"lng": 121.835693, "lat": 16.866619}, {"lng": 121.836517, "lat": 16.868139}, {"lng": 121.836929, "lat": 16.86861}, {"lng": 121.83802, "lat": 16.86805}, {"lng": 121.839684, "lat": 16.86813}, {"lng": 121.840027, "lat": 16.86916}, {"lng": 121.840057, "lat": 16.87051}, {"lng": 121.839546, "lat": 16.87211}, {"lng": 121.840569, "lat": 16.87282}, {"lng": 121.841309, "lat": 16.873541}, {"lng": 121.841789, "lat": 16.875669}, {"lng": 121.843033, "lat": 16.876869}, {"lng": 121.844269, "lat": 16.877871}, {"lng": 121.844772, "lat": 16.87833}, {"lng": 121.846161, "lat": 16.878839}, {"lng": 121.846771, "lat": 16.87842}, {"lng": 121.845818, "lat": 16.87715}, {"lng": 121.847183, "lat": 16.87537}, {"lng": 121.848503, "lat": 16.873699}, {"lng": 121.849792, "lat": 16.87291}, {"lng": 121.850853, "lat": 16.872009}, {"lng": 121.851311, "lat": 16.87043}, {"lng": 121.851646, "lat": 16.86944}, {"lng": 121.852509, "lat": 16.86787}, {"lng": 121.853867, "lat": 16.866501}, {"lng": 121.854111, "lat": 16.865141}, {"lng": 121.853554, "lat": 16.86459}, {"lng": 121.852997, "lat": 16.86408}, {"lng": 121.852097, "lat": 16.863791}, {"lng": 121.850937, "lat": 16.863449}, {"lng": 121.849831, "lat": 16.86125}, {"lng": 121.849579, "lat": 16.86027}, {"lng": 121.849747, "lat": 16.858101}, {"lng": 121.849426, "lat": 16.856621}, {"lng": 121.848717, "lat": 16.85453}, {"lng": 121.846947, "lat": 16.85136}, {"lng": 121.846573, "lat": 16.850071}, {"lng": 121.845787, "lat": 16.848209}, {"lng": 121.844391, "lat": 16.845961}, {"lng": 121.843239, "lat": 16.8442}, {"lng": 121.840607, "lat": 16.8381}, {"lng": 121.834007, "lat": 16.83609}, {"lng": 121.824348, "lat": 16.869181}, {"lng": 121.825111, "lat": 16.87081}, {"lng": 121.825638, "lat": 16.87199}]	61
43	Marabulig II	[{"lng": 121.72921, "lat": 16.933889}, {"lng": 121.729813, "lat": 16.93326}, {"lng": 121.731148, "lat": 16.932739}, {"lng": 121.733131, "lat": 16.933161}, {"lng": 121.733299, "lat": 16.933121}, {"lng": 121.727524, "lat": 16.91325}, {"lng": 121.7136, "lat": 16.912821}, {"lng": 121.697983, "lat": 16.91243}, {"lng": 121.697983, "lat": 16.913219}, {"lng": 121.698563, "lat": 16.913231}, {"lng": 121.699387, "lat": 16.913549}, {"lng": 121.699799, "lat": 16.914539}, {"lng": 121.700394, "lat": 16.91506}, {"lng": 121.701027, "lat": 16.91641}, {"lng": 121.700897, "lat": 16.91703}, {"lng": 121.70163, "lat": 16.918341}, {"lng": 121.70076, "lat": 16.92029}, {"lng": 121.700912, "lat": 16.922119}, {"lng": 121.702522, "lat": 16.92462}, {"lng": 121.704117, "lat": 16.92643}, {"lng": 121.704803, "lat": 16.926701}, {"lng": 121.706047, "lat": 16.92753}, {"lng": 121.708427, "lat": 16.93005}, {"lng": 121.709167, "lat": 16.93078}, {"lng": 121.712173, "lat": 16.931589}, {"lng": 121.715378, "lat": 16.931471}, {"lng": 121.718224, "lat": 16.931339}, {"lng": 121.720467, "lat": 16.931641}, {"lng": 121.723373, "lat": 16.931919}, {"lng": 121.725838, "lat": 16.932961}, {"lng": 121.727997, "lat": 16.933571}, {"lng": 121.72921, "lat": 16.933889}]	59
44	Minante I	[{"lng": 121.760452, "lat": 16.933531}, {"lng": 121.765579, "lat": 16.93396}, {"lng": 121.774857, "lat": 16.933109}, {"lng": 121.775047, "lat": 16.93269}, {"lng": 121.773613, "lat": 16.93136}, {"lng": 121.772217, "lat": 16.93042}, {"lng": 121.772041, "lat": 16.930059}, {"lng": 121.772217, "lat": 16.92927}, {"lng": 121.772743, "lat": 16.92802}, {"lng": 121.772293, "lat": 16.92642}, {"lng": 121.772057, "lat": 16.925409}, {"lng": 121.772423, "lat": 16.92416}, {"lng": 121.772041, "lat": 16.92252}, {"lng": 121.770981, "lat": 16.921921}, {"lng": 121.768837, "lat": 16.921289}, {"lng": 121.77269, "lat": 16.915371}, {"lng": 121.772758, "lat": 16.915159}, {"lng": 121.773483, "lat": 16.913931}, {"lng": 121.774628, "lat": 16.912001}, {"lng": 121.775543, "lat": 16.91186}, {"lng": 121.777122, "lat": 16.91102}, {"lng": 121.776703, "lat": 16.909610999999998}, {"lng": 121.777847, "lat": 16.90937}, {"lng": 121.778038, "lat": 16.90761}, {"lng": 121.77829, "lat": 16.906731}, {"lng": 121.778419, "lat": 16.906219}, {"lng": 121.778526, "lat": 16.904551}, {"lng": 121.778107, "lat": 16.9037}, {"lng": 121.777679, "lat": 16.90197}, {"lng": 121.776733, "lat": 16.90082}, {"lng": 121.775963, "lat": 16.89925}, {"lng": 121.77504, "lat": 16.897341}, {"lng": 121.763283, "lat": 16.8974}, {"lng": 121.762306, "lat": 16.91144}, {"lng": 121.759804, "lat": 16.91}, {"lng": 121.757553, "lat": 16.90872}, {"lng": 121.75605, "lat": 16.909269}, {"lng": 121.754517, "lat": 16.91115}, {"lng": 121.753563, "lat": 16.91217}, {"lng": 121.752228, "lat": 16.91292}, {"lng": 121.749046, "lat": 16.912439}, {"lng": 121.747238, "lat": 16.912149}, {"lng": 121.744949, "lat": 16.910709}, {"lng": 121.744568, "lat": 16.910549}, {"lng": 121.743301, "lat": 16.91045}, {"lng": 121.745903, "lat": 16.920361}, {"lng": 121.747269, "lat": 16.921089}, {"lng": 121.748749, "lat": 16.922661}, {"lng": 121.749077, "lat": 16.92383}, {"lng": 121.749023, "lat": 16.925449}, {"lng": 121.749107, "lat": 16.92836}, {"lng": 121.750183, "lat": 16.930388999999998}, {"lng": 121.750511, "lat": 16.931629}, {"lng": 121.749863, "lat": 16.93298}, {"lng": 121.760452, "lat": 16.933531}]	49.04
48	Nungnungan I	[{"lng": 121.743301, "lat": 16.91045}, {"lng": 121.743408, "lat": 16.905781}, {"lng": 121.743263, "lat": 16.898359}, {"lng": 121.745758, "lat": 16.875589}, {"lng": 121.744186, "lat": 16.874149}, {"lng": 121.742363, "lat": 16.87351}, {"lng": 121.740868, "lat": 16.874029}, {"lng": 121.739563, "lat": 16.874901}, {"lng": 121.737717, "lat": 16.87616}, {"lng": 121.736343, "lat": 16.87705}, {"lng": 121.735703, "lat": 16.87727}, {"lng": 121.73439, "lat": 16.876511}, {"lng": 121.732521, "lat": 16.876051}, {"lng": 121.730476, "lat": 16.87678}, {"lng": 121.729401, "lat": 16.87841}, {"lng": 121.72831, "lat": 16.880859}, {"lng": 121.726921, "lat": 16.88402}, {"lng": 121.725502, "lat": 16.884951}, {"lng": 121.722908, "lat": 16.884769}, {"lng": 121.718536, "lat": 16.882799}, {"lng": 121.717422, "lat": 16.88574}, {"lng": 121.714417, "lat": 16.894131}, {"lng": 121.713577, "lat": 16.89624}, {"lng": 121.712883, "lat": 16.89802}, {"lng": 121.715599, "lat": 16.89768}, {"lng": 121.717369, "lat": 16.89794}, {"lng": 121.71862, "lat": 16.8983}, {"lng": 121.720177, "lat": 16.898701}, {"lng": 121.721458, "lat": 16.899639}, {"lng": 121.723793, "lat": 16.900709}, {"lng": 121.725304, "lat": 16.901501}, {"lng": 121.726578, "lat": 16.902161}, {"lng": 121.726936, "lat": 16.90218}, {"lng": 121.727951, "lat": 16.902201}, {"lng": 121.728592, "lat": 16.9021}, {"lng": 121.729507, "lat": 16.90163}, {"lng": 121.731056, "lat": 16.90164}, {"lng": 121.7314, "lat": 16.901569}, {"lng": 121.732697, "lat": 16.90251}, {"lng": 121.7342, "lat": 16.903761}, {"lng": 121.735626, "lat": 16.904659}, {"lng": 121.736366, "lat": 16.905279}, {"lng": 121.737907, "lat": 16.906349}, {"lng": 121.739304, "lat": 16.90646}, {"lng": 121.740463, "lat": 16.90737}, {"lng": 121.740967, "lat": 16.908239}, {"lng": 121.741898, "lat": 16.909439}, {"lng": 121.74292, "lat": 16.910311}, {"lng": 121.743156, "lat": 16.910379}, {"lng": 121.743301, "lat": 16.91045}]	64
49	Nungnungan II	[{"lng": 121.763283, "lat": 16.8974}, {"lng": 121.77504, "lat": 16.897341}, {"lng": 121.774841, "lat": 16.896931}, {"lng": 121.774323, "lat": 16.89584}, {"lng": 121.774208, "lat": 16.894409}, {"lng": 121.773483, "lat": 16.89307}, {"lng": 121.773819, "lat": 16.89175}, {"lng": 121.773323, "lat": 16.89069}, {"lng": 121.771957, "lat": 16.889219}, {"lng": 121.77137, "lat": 16.887699}, {"lng": 121.770554, "lat": 16.885019}, {"lng": 121.771172, "lat": 16.883089}, {"lng": 121.77179, "lat": 16.88163}, {"lng": 121.771637, "lat": 16.880779}, {"lng": 121.771446, "lat": 16.880939}, {"lng": 121.770393, "lat": 16.881901}, {"lng": 121.769203, "lat": 16.88205}, {"lng": 121.768257, "lat": 16.882151}, {"lng": 121.766853, "lat": 16.881741}, {"lng": 121.765732, "lat": 16.88184}, {"lng": 121.764473, "lat": 16.884001}, {"lng": 121.763832, "lat": 16.88475}, {"lng": 121.762138, "lat": 16.885611}, {"lng": 121.760513, "lat": 16.88542}, {"lng": 121.759697, "lat": 16.88549}, {"lng": 121.759277, "lat": 16.885839}, {"lng": 121.758362, "lat": 16.886499}, {"lng": 121.755798, "lat": 16.88649}, {"lng": 121.754593, "lat": 16.886061}, {"lng": 121.751793, "lat": 16.884809}, {"lng": 121.751343, "lat": 16.883751}, {"lng": 121.752022, "lat": 16.882429}, {"lng": 121.752953, "lat": 16.880739}, {"lng": 121.75293, "lat": 16.87956}, {"lng": 121.751968, "lat": 16.87896}, {"lng": 121.750183, "lat": 16.87912}, {"lng": 121.749107, "lat": 16.87899}, {"lng": 121.747963, "lat": 16.87788}, {"lng": 121.747383, "lat": 16.876671}, {"lng": 121.746651, "lat": 16.87591}, {"lng": 121.745758, "lat": 16.875589}, {"lng": 121.743263, "lat": 16.898359}, {"lng": 121.763283, "lat": 16.8974}]	62
50	Pinoma	[{"lng": 121.712883, "lat": 16.89802}, {"lng": 121.713577, "lat": 16.89624}, {"lng": 121.714417, "lat": 16.894131}, {"lng": 121.717422, "lat": 16.88574}, {"lng": 121.718536, "lat": 16.882799}, {"lng": 121.720757, "lat": 16.877831}, {"lng": 121.721588, "lat": 16.87332}, {"lng": 121.722542, "lat": 16.86792}, {"lng": 121.722794, "lat": 16.86101}, {"lng": 121.715446, "lat": 16.862419}, {"lng": 121.694572, "lat": 16.867519}, {"lng": 121.690269, "lat": 16.88777}, {"lng": 121.690773, "lat": 16.887951}, {"lng": 121.691521, "lat": 16.888321}, {"lng": 121.693466, "lat": 16.88909}, {"lng": 121.695236, "lat": 16.88962}, {"lng": 121.697563, "lat": 16.89064}, {"lng": 121.699226, "lat": 16.89135}, {"lng": 121.701767, "lat": 16.8916}, {"lng": 121.70314, "lat": 16.891769}, {"lng": 121.704353, "lat": 16.893009}, {"lng": 121.705063, "lat": 16.894341}, {"lng": 121.706146, "lat": 16.89609}, {"lng": 121.70755, "lat": 16.898319}, {"lng": 121.709328, "lat": 16.89937}, {"lng": 121.712227, "lat": 16.89842}, {"lng": 121.712883, "lat": 16.89802}]	67
51	Rizal	[{"lng": 121.796837, "lat": 16.91452}, {"lng": 121.795464, "lat": 16.910339}, {"lng": 121.795731, "lat": 16.90815}, {"lng": 121.795937, "lat": 16.898729}, {"lng": 121.784866, "lat": 16.8978}, {"lng": 121.77504, "lat": 16.897341}, {"lng": 121.775963, "lat": 16.89925}, {"lng": 121.776733, "lat": 16.90082}, {"lng": 121.777679, "lat": 16.90197}, {"lng": 121.778107, "lat": 16.9037}, {"lng": 121.778526, "lat": 16.904551}, {"lng": 121.778419, "lat": 16.906219}, {"lng": 121.77829, "lat": 16.906731}, {"lng": 121.778038, "lat": 16.90761}, {"lng": 121.777847, "lat": 16.90937}, {"lng": 121.776703, "lat": 16.909610999999998}, {"lng": 121.777122, "lat": 16.91102}, {"lng": 121.775543, "lat": 16.91186}, {"lng": 121.774628, "lat": 16.912001}, {"lng": 121.773483, "lat": 16.913931}, {"lng": 121.772758, "lat": 16.915159}, {"lng": 121.77269, "lat": 16.915371}, {"lng": 121.796837, "lat": 16.91452}]	65
53	San Antonio	[{"lng": 121.808823, "lat": 16.87899}, {"lng": 121.816322, "lat": 16.866409}, {"lng": 121.789177, "lat": 16.85988}, {"lng": 121.786171, "lat": 16.873409}, {"lng": 121.808823, "lat": 16.87899}]	57
54	San Francisco	[{"lng": 121.809509, "lat": 16.900721}, {"lng": 121.810143, "lat": 16.899361}, {"lng": 121.808823, "lat": 16.87899}, {"lng": 121.786171, "lat": 16.873409}, {"lng": 121.786591, "lat": 16.884211}, {"lng": 121.784866, "lat": 16.8978}, {"lng": 121.795937, "lat": 16.898729}, {"lng": 121.809509, "lat": 16.900721}]	52
56	San Luis	[{"lng": 121.83448, "lat": 16.974609}, {"lng": 121.836342, "lat": 16.971291}, {"lng": 121.837723, "lat": 16.968349}, {"lng": 121.838043, "lat": 16.96759}, {"lng": 121.838226, "lat": 16.965931}, {"lng": 121.837578, "lat": 16.964729}, {"lng": 121.83609, "lat": 16.96382}, {"lng": 121.835289, "lat": 16.963381}, {"lng": 121.834633, "lat": 16.96312}, {"lng": 121.834099, "lat": 16.96199}, {"lng": 121.835716, "lat": 16.961519}, {"lng": 121.837662, "lat": 16.961281}, {"lng": 121.838638, "lat": 16.960911}, {"lng": 121.84053, "lat": 16.959089}, {"lng": 121.840843, "lat": 16.957359}, {"lng": 121.840057, "lat": 16.95602}, {"lng": 121.839661, "lat": 16.95492}, {"lng": 121.838058, "lat": 16.954821}, {"lng": 121.835098, "lat": 16.955589}, {"lng": 121.832497, "lat": 16.95595}, {"lng": 121.828552, "lat": 16.956329}, {"lng": 121.827072, "lat": 16.956511}, {"lng": 121.823212, "lat": 16.956381}, {"lng": 121.823097, "lat": 16.97645}, {"lng": 121.827141, "lat": 16.974621}, {"lng": 121.829391, "lat": 16.973881}, {"lng": 121.831963, "lat": 16.973909}, {"lng": 121.833839, "lat": 16.974319}, {"lng": 121.83448, "lat": 16.974609}]	43
57	San Pablo	[{"lng": 121.81794, "lat": 16.94244}, {"lng": 121.819023, "lat": 16.943041}, {"lng": 121.842651, "lat": 16.948231}, {"lng": 121.844307, "lat": 16.94767}, {"lng": 121.845222, "lat": 16.947821}, {"lng": 121.846291, "lat": 16.945721}, {"lng": 121.847366, "lat": 16.945761}, {"lng": 121.847397, "lat": 16.94474}, {"lng": 121.847328, "lat": 16.944071}, {"lng": 121.847137, "lat": 16.941561}, {"lng": 121.84642, "lat": 16.93935}, {"lng": 121.845863, "lat": 16.93729}, {"lng": 121.845917, "lat": 16.93685}, {"lng": 121.847427, "lat": 16.9373}, {"lng": 121.848633, "lat": 16.937691}, {"lng": 121.849457, "lat": 16.935169}, {"lng": 121.850182, "lat": 16.932949}, {"lng": 121.848137, "lat": 16.931761}, {"lng": 121.847214, "lat": 16.931100999999998}, {"lng": 121.846733, "lat": 16.92979}, {"lng": 121.846519, "lat": 16.929529}, {"lng": 121.817772, "lat": 16.923599}, {"lng": 121.8181, "lat": 16.92498}, {"lng": 121.817551, "lat": 16.925699}, {"lng": 121.816116, "lat": 16.92713}, {"lng": 121.815208, "lat": 16.92856}, {"lng": 121.814781, "lat": 16.93001}, {"lng": 121.814507, "lat": 16.93046}, {"lng": 121.814117, "lat": 16.93121}, {"lng": 121.813179, "lat": 16.93257}, {"lng": 121.811729, "lat": 16.93433}, {"lng": 121.811043, "lat": 16.93576}, {"lng": 121.810768, "lat": 16.93689}, {"lng": 121.81794, "lat": 16.94244}]	49
58	Santa Luciana	[{"lng": 121.821388, "lat": 16.90885}, {"lng": 121.821953, "lat": 16.907761}, {"lng": 121.823669, "lat": 16.9055}, {"lng": 121.825546, "lat": 16.902531}, {"lng": 121.826019, "lat": 16.89937}, {"lng": 121.826431, "lat": 16.897079}, {"lng": 121.826576, "lat": 16.895451}, {"lng": 121.826981, "lat": 16.8943}, {"lng": 121.827766, "lat": 16.89212}, {"lng": 121.828323, "lat": 16.88924}, {"lng": 121.828697, "lat": 16.88624}, {"lng": 121.828712, "lat": 16.883801}, {"lng": 121.828323, "lat": 16.880131}, {"lng": 121.827606, "lat": 16.876301}, {"lng": 121.827087, "lat": 16.874889}, {"lng": 121.826607, "lat": 16.87365}, {"lng": 121.825638, "lat": 16.87199}, {"lng": 121.825111, "lat": 16.87081}, {"lng": 121.824348, "lat": 16.869181}, {"lng": 121.823807, "lat": 16.868891}, {"lng": 121.821716, "lat": 16.868009999999998}, {"lng": 121.818481, "lat": 16.867359}, {"lng": 121.816902, "lat": 16.86668}, {"lng": 121.816322, "lat": 16.866409}, {"lng": 121.808823, "lat": 16.87899}, {"lng": 121.810143, "lat": 16.899361}, {"lng": 121.809509, "lat": 16.900721}, {"lng": 121.808083, "lat": 16.90687}, {"lng": 121.821388, "lat": 16.90885}]	57
61	Sinippil	[{"lng": 121.821388, "lat": 16.90885}, {"lng": 121.819839, "lat": 16.911551}, {"lng": 121.818649, "lat": 16.91371}, {"lng": 121.819183, "lat": 16.91498}, {"lng": 121.820572, "lat": 16.915199}, {"lng": 121.823578, "lat": 16.91534}, {"lng": 121.82634, "lat": 16.91468}, {"lng": 121.827393, "lat": 16.91436}, {"lng": 121.830292, "lat": 16.9133}, {"lng": 121.832542, "lat": 16.91234}, {"lng": 121.833687, "lat": 16.911409}, {"lng": 121.835037, "lat": 16.90976}, {"lng": 121.836952, "lat": 16.907909}, {"lng": 121.839607, "lat": 16.906309}, {"lng": 121.842247, "lat": 16.90498}, {"lng": 121.845703, "lat": 16.903021}, {"lng": 121.848137, "lat": 16.902241}, {"lng": 121.844269, "lat": 16.877871}, {"lng": 121.843033, "lat": 16.876869}, {"lng": 121.841789, "lat": 16.875669}, {"lng": 121.841309, "lat": 16.873541}, {"lng": 121.840569, "lat": 16.87282}, {"lng": 121.839546, "lat": 16.87211}, {"lng": 121.840057, "lat": 16.87051}, {"lng": 121.840027, "lat": 16.86916}, {"lng": 121.839684, "lat": 16.86813}, {"lng": 121.83802, "lat": 16.86805}, {"lng": 121.836929, "lat": 16.86861}, {"lng": 121.836517, "lat": 16.868139}, {"lng": 121.835693, "lat": 16.866619}, {"lng": 121.833618, "lat": 16.867109}, {"lng": 121.830994, "lat": 16.86758}, {"lng": 121.82943, "lat": 16.867781}, {"lng": 121.827492, "lat": 16.869221}, {"lng": 121.827766, "lat": 16.87002}, {"lng": 121.827499, "lat": 16.871309}, {"lng": 121.826202, "lat": 16.871639}, {"lng": 121.825638, "lat": 16.87199}, {"lng": 121.826607, "lat": 16.87365}, {"lng": 121.827087, "lat": 16.874889}, {"lng": 121.827606, "lat": 16.876301}, {"lng": 121.828323, "lat": 16.880131}, {"lng": 121.828712, "lat": 16.883801}, {"lng": 121.828697, "lat": 16.88624}, {"lng": 121.828323, "lat": 16.88924}, {"lng": 121.827766, "lat": 16.89212}, {"lng": 121.826981, "lat": 16.8943}, {"lng": 121.826576, "lat": 16.895451}, {"lng": 121.826431, "lat": 16.897079}, {"lng": 121.826019, "lat": 16.89937}, {"lng": 121.825546, "lat": 16.902531}, {"lng": 121.823669, "lat": 16.9055}, {"lng": 121.821953, "lat": 16.907761}, {"lng": 121.821388, "lat": 16.90885}]	56
62	Tagaran	[{"lng": 121.796219, "lat": 16.98221}, {"lng": 121.797684, "lat": 16.981951}, {"lng": 121.793404, "lat": 16.9753}, {"lng": 121.791672, "lat": 16.97406}, {"lng": 121.788513, "lat": 16.971991}, {"lng": 121.786613, "lat": 16.970909}, {"lng": 121.785599, "lat": 16.970079}, {"lng": 121.783569, "lat": 16.96706}, {"lng": 121.782898, "lat": 16.965509}, {"lng": 121.781853, "lat": 16.963169}, {"lng": 121.781097, "lat": 16.96179}, {"lng": 121.779572, "lat": 16.961309}, {"lng": 121.778862, "lat": 16.962151}, {"lng": 121.778297, "lat": 16.962959}, {"lng": 121.778389, "lat": 16.963909}, {"lng": 121.777527, "lat": 16.9641}, {"lng": 121.776459, "lat": 16.964239}, {"lng": 121.775688, "lat": 16.963551}, {"lng": 121.774727, "lat": 16.961571}, {"lng": 121.773659, "lat": 16.959881}, {"lng": 121.77317, "lat": 16.95936}, {"lng": 121.772003, "lat": 16.959181}, {"lng": 121.770477, "lat": 16.959949}, {"lng": 121.769707, "lat": 16.95998}, {"lng": 121.769157, "lat": 16.959909}, {"lng": 121.767723, "lat": 16.960698999999998}, {"lng": 121.766167, "lat": 16.96104}, {"lng": 121.763184, "lat": 16.961309}, {"lng": 121.761879, "lat": 16.961821}, {"lng": 121.759148, "lat": 16.961559}, {"lng": 121.757172, "lat": 16.96199}, {"lng": 121.754997, "lat": 16.962151}, {"lng": 121.753036, "lat": 16.962601}, {"lng": 121.751358, "lat": 16.962999}, {"lng": 121.750168, "lat": 16.963579}, {"lng": 121.751984, "lat": 16.965771}, {"lng": 121.754143, "lat": 16.970699}, {"lng": 121.764999, "lat": 16.98521}, {"lng": 121.765907, "lat": 16.986031}, {"lng": 121.776131, "lat": 16.984489}, {"lng": 121.796219, "lat": 16.98221}]	55
63	Union	[{"lng": 121.816681, "lat": 16.98019}, {"lng": 121.819344, "lat": 16.97913}, {"lng": 121.821053, "lat": 16.97855}, {"lng": 121.823097, "lat": 16.97645}, {"lng": 121.823212, "lat": 16.956381}, {"lng": 121.822121, "lat": 16.95595}, {"lng": 121.812553, "lat": 16.963421}, {"lng": 121.816681, "lat": 16.98019}]	50.5
64	Villa Concepcion	[{"lng": 121.933746, "lat": 16.88135}, {"lng": 121.933907, "lat": 16.87966}, {"lng": 121.934692, "lat": 16.879271}, {"lng": 121.93576, "lat": 16.878}, {"lng": 121.935921, "lat": 16.875931}, {"lng": 121.935349, "lat": 16.87414}, {"lng": 121.933792, "lat": 16.872919}, {"lng": 121.93222, "lat": 16.871861}, {"lng": 121.931381, "lat": 16.87011}, {"lng": 121.931084, "lat": 16.868349}, {"lng": 121.930099, "lat": 16.867599}, {"lng": 121.928917, "lat": 16.86655}, {"lng": 121.925987, "lat": 16.864719}, {"lng": 121.924316, "lat": 16.863569}, {"lng": 121.922508, "lat": 16.86264}, {"lng": 121.91951, "lat": 16.86725}, {"lng": 121.917526, "lat": 16.86886}, {"lng": 121.916054, "lat": 16.86985}, {"lng": 121.915031, "lat": 16.870331}, {"lng": 121.914253, "lat": 16.871441}, {"lng": 121.914001, "lat": 16.872431}, {"lng": 121.912537, "lat": 16.875521}, {"lng": 121.911362, "lat": 16.87743}, {"lng": 121.910141, "lat": 16.879709}, {"lng": 121.908699, "lat": 16.880939}, {"lng": 121.908417, "lat": 16.882669}, {"lng": 121.907692, "lat": 16.885139}, {"lng": 121.907318, "lat": 16.886471}, {"lng": 121.907944, "lat": 16.88678}, {"lng": 121.909477, "lat": 16.88653}, {"lng": 121.911926, "lat": 16.88625}, {"lng": 121.914284, "lat": 16.886129}, {"lng": 121.918159, "lat": 16.88571}, {"lng": 121.922813, "lat": 16.88537}, {"lng": 121.92672, "lat": 16.885}, {"lng": 121.932121, "lat": 16.88497}, {"lng": 121.933357, "lat": 16.88376}, {"lng": 121.933434, "lat": 16.882271}, {"lng": 121.933746, "lat": 16.88135}]	89
65	Villa Luna	[{"lng": 121.823212, "lat": 16.956381}, {"lng": 121.827072, "lat": 16.956511}, {"lng": 121.828552, "lat": 16.956329}, {"lng": 121.832497, "lat": 16.95595}, {"lng": 121.835098, "lat": 16.955589}, {"lng": 121.838058, "lat": 16.954821}, {"lng": 121.839661, "lat": 16.95492}, {"lng": 121.840073, "lat": 16.95396}, {"lng": 121.842827, "lat": 16.951559}, {"lng": 121.842529, "lat": 16.95039}, {"lng": 121.842651, "lat": 16.948231}, {"lng": 121.819023, "lat": 16.943041}, {"lng": 121.81794, "lat": 16.94244}, {"lng": 121.80822, "lat": 16.954269}, {"lng": 121.812218, "lat": 16.95484}, {"lng": 121.822121, "lat": 16.95595}, {"lng": 121.823212, "lat": 16.956381}]	47
66	Villaflor	[{"lng": 121.859612, "lat": 16.90114}, {"lng": 121.862152, "lat": 16.90065}, {"lng": 121.867043, "lat": 16.89876}, {"lng": 121.869202, "lat": 16.898491}, {"lng": 121.873611, "lat": 16.897711}, {"lng": 121.876022, "lat": 16.89678}, {"lng": 121.878723, "lat": 16.8955}, {"lng": 121.881416, "lat": 16.89432}, {"lng": 121.881287, "lat": 16.89381}, {"lng": 121.881844, "lat": 16.893181}, {"lng": 121.882591, "lat": 16.89283}, {"lng": 121.883614, "lat": 16.89275}, {"lng": 121.884033, "lat": 16.891979}, {"lng": 121.884727, "lat": 16.89098}, {"lng": 121.864037, "lat": 16.88489}, {"lng": 121.859612, "lat": 16.90114}]	50.51
11	Alicaocao	[{"lng": 121.788399, "lat": 16.966351}, {"lng": 121.788116, "lat": 16.965771}, {"lng": 121.78759, "lat": 16.96414}, {"lng": 121.787079, "lat": 16.962339}, {"lng": 121.78688, "lat": 16.96118}, {"lng": 121.786491, "lat": 16.960011}, {"lng": 121.785927, "lat": 16.959009000000002}, {"lng": 121.785339, "lat": 16.958481}, {"lng": 121.784523, "lat": 16.95784}, {"lng": 121.783981, "lat": 16.95686}, {"lng": 121.78392, "lat": 16.956329}, {"lng": 121.783783, "lat": 16.954519}, {"lng": 121.783852, "lat": 16.953011}, {"lng": 121.785027, "lat": 16.951509}, {"lng": 121.785362, "lat": 16.951139}, {"lng": 121.777763, "lat": 16.95034}, {"lng": 121.777527, "lat": 16.9641}, {"lng": 121.778389, "lat": 16.963909}, {"lng": 121.778297, "lat": 16.962959}, {"lng": 121.778862, "lat": 16.962151}, {"lng": 121.779572, "lat": 16.961309}, {"lng": 121.781097, "lat": 16.96179}, {"lng": 121.781853, "lat": 16.963169}, {"lng": 121.782898, "lat": 16.965509}, {"lng": 121.783569, "lat": 16.96706}, {"lng": 121.785599, "lat": 16.970079}, {"lng": 121.786613, "lat": 16.970909}, {"lng": 121.788513, "lat": 16.971991}, {"lng": 121.791672, "lat": 16.97406}, {"lng": 121.793404, "lat": 16.9753}, {"lng": 121.792168, "lat": 16.97403}, {"lng": 121.790894, "lat": 16.972191}, {"lng": 121.789963, "lat": 16.970671}, {"lng": 121.788788, "lat": 16.96722}, {"lng": 121.788399, "lat": 16.966351}]	34
12	Alinam	[{"lng": 121.786171, "lat": 16.873409}, {"lng": 121.789177, "lat": 16.85988}, {"lng": 121.788422, "lat": 16.85132}, {"lng": 121.774147, "lat": 16.85103}, {"lng": 121.769737, "lat": 16.85578}, {"lng": 121.765602, "lat": 16.85947}, {"lng": 121.762039, "lat": 16.85919}, {"lng": 121.760483, "lat": 16.85902}, {"lng": 121.759682, "lat": 16.859209}, {"lng": 121.756889, "lat": 16.858521}, {"lng": 121.755859, "lat": 16.858299}, {"lng": 121.754753, "lat": 16.85817}, {"lng": 121.754059, "lat": 16.858249999999998}, {"lng": 121.752647, "lat": 16.8578}, {"lng": 121.751091, "lat": 16.85747}, {"lng": 121.750366, "lat": 16.857611}, {"lng": 121.748817, "lat": 16.857031}, {"lng": 121.747597, "lat": 16.85693}, {"lng": 121.746742, "lat": 16.857281}, {"lng": 121.745354, "lat": 16.856791}, {"lng": 121.743874, "lat": 16.85704}, {"lng": 121.750473, "lat": 16.871531}, {"lng": 121.758636, "lat": 16.87126}, {"lng": 121.763206, "lat": 16.868139}, {"lng": 121.774429, "lat": 16.867661}, {"lng": 121.779152, "lat": 16.869801}, {"lng": 121.786171, "lat": 16.873409}]	68
20	Cabaruan	[{"lng": 121.769157, "lat": 16.959909}, {"lng": 121.769081, "lat": 16.959539}, {"lng": 121.76619, "lat": 16.95697}, {"lng": 121.7649, "lat": 16.955179}, {"lng": 121.764679, "lat": 16.953421}, {"lng": 121.765266, "lat": 16.950741}, {"lng": 121.765648, "lat": 16.948469}, {"lng": 121.76532, "lat": 16.94771}, {"lng": 121.762543, "lat": 16.941231}, {"lng": 121.762428, "lat": 16.94096}, {"lng": 121.762222, "lat": 16.940479}, {"lng": 121.761673, "lat": 16.93923}, {"lng": 121.760857, "lat": 16.936831}, {"lng": 121.760567, "lat": 16.93556}, {"lng": 121.760452, "lat": 16.933531}, {"lng": 121.749863, "lat": 16.93298}, {"lng": 121.748573, "lat": 16.933419999999998}, {"lng": 121.746643, "lat": 16.933001}, {"lng": 121.744377, "lat": 16.932479999999998}, {"lng": 121.740837, "lat": 16.93228}, {"lng": 121.738861, "lat": 16.93252}, {"lng": 121.737587, "lat": 16.93211}, {"lng": 121.735237, "lat": 16.93243}, {"lng": 121.733818, "lat": 16.932369}, {"lng": 121.733299, "lat": 16.933121}, {"lng": 121.733131, "lat": 16.933161}, {"lng": 121.731148, "lat": 16.932739}, {"lng": 121.729813, "lat": 16.93326}, {"lng": 121.72921, "lat": 16.933889}, {"lng": 121.729507, "lat": 16.933969}, {"lng": 121.729317, "lat": 16.936291}, {"lng": 121.735123, "lat": 16.94417}, {"lng": 121.736847, "lat": 16.946369}, {"lng": 121.750168, "lat": 16.963579}, {"lng": 121.751358, "lat": 16.962999}, {"lng": 121.753036, "lat": 16.962601}, {"lng": 121.754997, "lat": 16.962151}, {"lng": 121.757172, "lat": 16.96199}, {"lng": 121.759148, "lat": 16.961559}, {"lng": 121.761879, "lat": 16.961821}, {"lng": 121.763184, "lat": 16.961309}, {"lng": 121.766167, "lat": 16.96104}, {"lng": 121.767723, "lat": 16.960698999999998}, {"lng": 121.769157, "lat": 16.959909}]	57.1
21	Cabugao	[{"lng": 121.871384, "lat": 16.860319}, {"lng": 121.871834, "lat": 16.840611}, {"lng": 121.868408, "lat": 16.842331}, {"lng": 121.855583, "lat": 16.84083}, {"lng": 121.850258, "lat": 16.839581}, {"lng": 121.846039, "lat": 16.83881}, {"lng": 121.844421, "lat": 16.83869}, {"lng": 121.842949, "lat": 16.838779}, {"lng": 121.840607, "lat": 16.8381}, {"lng": 121.843239, "lat": 16.8442}, {"lng": 121.844391, "lat": 16.845961}, {"lng": 121.845787, "lat": 16.848209}, {"lng": 121.846573, "lat": 16.850071}, {"lng": 121.846947, "lat": 16.85136}, {"lng": 121.848717, "lat": 16.85453}, {"lng": 121.849426, "lat": 16.856621}, {"lng": 121.849747, "lat": 16.858101}, {"lng": 121.849579, "lat": 16.86027}, {"lng": 121.849831, "lat": 16.86125}, {"lng": 121.850937, "lat": 16.863449}, {"lng": 121.852097, "lat": 16.863791}, {"lng": 121.852997, "lat": 16.86408}, {"lng": 121.853554, "lat": 16.86459}, {"lng": 121.853943, "lat": 16.8643}, {"lng": 121.854622, "lat": 16.863159}, {"lng": 121.856369, "lat": 16.861759}, {"lng": 121.857719, "lat": 16.86129}, {"lng": 121.860237, "lat": 16.86142}, {"lng": 121.861633, "lat": 16.860201}, {"lng": 121.863571, "lat": 16.859329}, {"lng": 121.864616, "lat": 16.859369}, {"lng": 121.867661, "lat": 16.859591}, {"lng": 121.869743, "lat": 16.860029}, {"lng": 121.8703, "lat": 16.860451}, {"lng": 121.871384, "lat": 16.860319}]	73
23	Casalatan	[{"lng": 121.883842, "lat": 16.920931}, {"lng": 121.883362, "lat": 16.91032}, {"lng": 121.85714, "lat": 16.90151}, {"lng": 121.848137, "lat": 16.902241}, {"lng": 121.848557, "lat": 16.90295}, {"lng": 121.848083, "lat": 16.904260999999998}, {"lng": 121.848289, "lat": 16.90605}, {"lng": 121.849113, "lat": 16.907009}, {"lng": 121.850014, "lat": 16.908039}, {"lng": 121.850273, "lat": 16.90881}, {"lng": 121.849579, "lat": 16.91083}, {"lng": 121.848709, "lat": 16.912029}, {"lng": 121.848228, "lat": 16.912821}, {"lng": 121.848137, "lat": 16.914369999999998}, {"lng": 121.848228, "lat": 16.91551}, {"lng": 121.848091, "lat": 16.91609}, {"lng": 121.868187, "lat": 16.922719999999998}, {"lng": 121.868507, "lat": 16.922741}, {"lng": 121.871117, "lat": 16.923059}, {"lng": 121.872368, "lat": 16.92281}, {"lng": 121.873528, "lat": 16.922319}, {"lng": 121.873909, "lat": 16.921591}, {"lng": 121.874832, "lat": 16.9203}, {"lng": 121.875618, "lat": 16.920401}, {"lng": 121.87722, "lat": 16.921221}, {"lng": 121.877861, "lat": 16.92067}, {"lng": 121.880188, "lat": 16.919849}, {"lng": 121.880638, "lat": 16.920191}, {"lng": 121.881523, "lat": 16.920429}, {"lng": 121.882767, "lat": 16.920891}, {"lng": 121.883842, "lat": 16.920931}]	75
34	Faustino	[{"lng": 121.77504, "lat": 16.897341}, {"lng": 121.784866, "lat": 16.8978}, {"lng": 121.786591, "lat": 16.884211}, {"lng": 121.786171, "lat": 16.873409}, {"lng": 121.779152, "lat": 16.869801}, {"lng": 121.77858, "lat": 16.87038}, {"lng": 121.778374, "lat": 16.87245}, {"lng": 121.778198, "lat": 16.874109}, {"lng": 121.777679, "lat": 16.875071}, {"lng": 121.777107, "lat": 16.875389}, {"lng": 121.776443, "lat": 16.87686}, {"lng": 121.775864, "lat": 16.878321}, {"lng": 121.775421, "lat": 16.879551}, {"lng": 121.774147, "lat": 16.88027}, {"lng": 121.77346, "lat": 16.88093}, {"lng": 121.773277, "lat": 16.88162}, {"lng": 121.772537, "lat": 16.88184}, {"lng": 121.77179, "lat": 16.88163}, {"lng": 121.771172, "lat": 16.883089}, {"lng": 121.770554, "lat": 16.885019}, {"lng": 121.77137, "lat": 16.887699}, {"lng": 121.771957, "lat": 16.889219}, {"lng": 121.773323, "lat": 16.89069}, {"lng": 121.773819, "lat": 16.89175}, {"lng": 121.773483, "lat": 16.89307}, {"lng": 121.774208, "lat": 16.894409}, {"lng": 121.774323, "lat": 16.89584}, {"lng": 121.774841, "lat": 16.896931}, {"lng": 121.77504, "lat": 16.897341}]	53
29	Disimuray	[{"lng": 121.846519, "lat": 16.929529}, {"lng": 121.846733, "lat": 16.92979}, {"lng": 121.847214, "lat": 16.931100999999998}, {"lng": 121.848137, "lat": 16.931761}, {"lng": 121.850182, "lat": 16.932949}, {"lng": 121.850517, "lat": 16.932541}, {"lng": 121.852348, "lat": 16.932541}, {"lng": 121.854309, "lat": 16.934031}, {"lng": 121.855133, "lat": 16.93494}, {"lng": 121.856003, "lat": 16.93729}, {"lng": 121.857567, "lat": 16.936911}, {"lng": 121.858673, "lat": 16.93646}, {"lng": 121.860687, "lat": 16.93774}, {"lng": 121.863037, "lat": 16.937941}, {"lng": 121.865334, "lat": 16.93738}, {"lng": 121.865662, "lat": 16.936899}, {"lng": 121.864647, "lat": 16.93531}, {"lng": 121.865128, "lat": 16.933981}, {"lng": 121.866432, "lat": 16.932199}, {"lng": 121.86676, "lat": 16.931471}, {"lng": 121.865799, "lat": 16.93009}, {"lng": 121.864662, "lat": 16.929001}, {"lng": 121.864029, "lat": 16.927811}, {"lng": 121.865097, "lat": 16.92658}, {"lng": 121.865921, "lat": 16.92531}, {"lng": 121.866272, "lat": 16.92411}, {"lng": 121.868187, "lat": 16.922719999999998}, {"lng": 121.848091, "lat": 16.91609}, {"lng": 121.848137, "lat": 16.91748}, {"lng": 121.848328, "lat": 16.91906}, {"lng": 121.848717, "lat": 16.91991}, {"lng": 121.850037, "lat": 16.921909}, {"lng": 121.850548, "lat": 16.923059}, {"lng": 121.849701, "lat": 16.92486}, {"lng": 121.848824, "lat": 16.927059}, {"lng": 121.847977, "lat": 16.92775}, {"lng": 121.846764, "lat": 16.928329}, {"lng": 121.846619, "lat": 16.928881}, {"lng": 121.846764, "lat": 16.92923}, {"lng": 121.846519, "lat": 16.929529}]	55
38	Labinab	[{"lng": 121.783127, "lat": 16.942221}, {"lng": 121.796379, "lat": 16.94137}, {"lng": 121.796806, "lat": 16.934441}, {"lng": 121.7967, "lat": 16.929939}, {"lng": 121.796471, "lat": 16.92687}, {"lng": 121.796417, "lat": 16.92412}, {"lng": 121.796288, "lat": 16.919571}, {"lng": 121.796837, "lat": 16.91452}, {"lng": 121.77269, "lat": 16.915371}, {"lng": 121.768837, "lat": 16.921289}, {"lng": 121.770981, "lat": 16.921921}, {"lng": 121.772041, "lat": 16.92252}, {"lng": 121.772423, "lat": 16.92416}, {"lng": 121.772057, "lat": 16.925409}, {"lng": 121.772293, "lat": 16.92642}, {"lng": 121.772743, "lat": 16.92802}, {"lng": 121.772217, "lat": 16.92927}, {"lng": 121.772041, "lat": 16.930059}, {"lng": 121.772217, "lat": 16.93042}, {"lng": 121.773613, "lat": 16.93136}, {"lng": 121.775047, "lat": 16.93269}, {"lng": 121.774857, "lat": 16.933109}, {"lng": 121.77494, "lat": 16.933599}, {"lng": 121.77523, "lat": 16.93417}, {"lng": 121.776207, "lat": 16.93405}, {"lng": 121.77713, "lat": 16.93335}, {"lng": 121.777992, "lat": 16.933741}, {"lng": 121.779282, "lat": 16.935261}, {"lng": 121.780891, "lat": 16.936081}, {"lng": 121.780792, "lat": 16.93717}, {"lng": 121.78064, "lat": 16.93858}, {"lng": 121.780258, "lat": 16.940201}, {"lng": 121.780777, "lat": 16.94142}, {"lng": 121.783127, "lat": 16.942221}]	46
42	Marabulig I	[{"lng": 121.733299, "lat": 16.933121}, {"lng": 121.733818, "lat": 16.932369}, {"lng": 121.735237, "lat": 16.93243}, {"lng": 121.737587, "lat": 16.93211}, {"lng": 121.738861, "lat": 16.93252}, {"lng": 121.740837, "lat": 16.93228}, {"lng": 121.744377, "lat": 16.932479999999998}, {"lng": 121.746643, "lat": 16.933001}, {"lng": 121.748573, "lat": 16.933419999999998}, {"lng": 121.749863, "lat": 16.93298}, {"lng": 121.750511, "lat": 16.931629}, {"lng": 121.750183, "lat": 16.930388999999998}, {"lng": 121.749107, "lat": 16.92836}, {"lng": 121.749023, "lat": 16.925449}, {"lng": 121.749077, "lat": 16.92383}, {"lng": 121.748749, "lat": 16.922661}, {"lng": 121.747269, "lat": 16.921089}, {"lng": 121.745903, "lat": 16.920361}, {"lng": 121.743301, "lat": 16.91045}, {"lng": 121.743156, "lat": 16.910379}, {"lng": 121.74292, "lat": 16.910311}, {"lng": 121.741898, "lat": 16.909439}, {"lng": 121.740967, "lat": 16.908239}, {"lng": 121.740463, "lat": 16.90737}, {"lng": 121.739304, "lat": 16.90646}, {"lng": 121.737907, "lat": 16.906349}, {"lng": 121.736366, "lat": 16.905279}, {"lng": 121.735626, "lat": 16.904659}, {"lng": 121.7342, "lat": 16.903761}, {"lng": 121.732697, "lat": 16.90251}, {"lng": 121.7314, "lat": 16.901569}, {"lng": 121.727127, "lat": 16.911421}, {"lng": 121.727524, "lat": 16.91325}, {"lng": 121.733299, "lat": 16.933121}]	63
47	Nagrumbuan	[{"lng": 121.697983, "lat": 16.91243}, {"lng": 121.7136, "lat": 16.912821}, {"lng": 121.727524, "lat": 16.91325}, {"lng": 121.727127, "lat": 16.911421}, {"lng": 121.7314, "lat": 16.901569}, {"lng": 121.731056, "lat": 16.90164}, {"lng": 121.729507, "lat": 16.90163}, {"lng": 121.728592, "lat": 16.9021}, {"lng": 121.727951, "lat": 16.902201}, {"lng": 121.726936, "lat": 16.90218}, {"lng": 121.726578, "lat": 16.902161}, {"lng": 121.725304, "lat": 16.901501}, {"lng": 121.723793, "lat": 16.900709}, {"lng": 121.721458, "lat": 16.899639}, {"lng": 121.720177, "lat": 16.898701}, {"lng": 121.71862, "lat": 16.8983}, {"lng": 121.717369, "lat": 16.89794}, {"lng": 121.715599, "lat": 16.89768}, {"lng": 121.712883, "lat": 16.89802}, {"lng": 121.712227, "lat": 16.89842}, {"lng": 121.709328, "lat": 16.89937}, {"lng": 121.70755, "lat": 16.898319}, {"lng": 121.706146, "lat": 16.89609}, {"lng": 121.705063, "lat": 16.894341}, {"lng": 121.704353, "lat": 16.893009}, {"lng": 121.70314, "lat": 16.891769}, {"lng": 121.701767, "lat": 16.8916}, {"lng": 121.699226, "lat": 16.89135}, {"lng": 121.697563, "lat": 16.89064}, {"lng": 121.695236, "lat": 16.88962}, {"lng": 121.693466, "lat": 16.88909}, {"lng": 121.691521, "lat": 16.888321}, {"lng": 121.690773, "lat": 16.887951}, {"lng": 121.690269, "lat": 16.88777}, {"lng": 121.68441, "lat": 16.9044}, {"lng": 121.684837, "lat": 16.90435}, {"lng": 121.686623, "lat": 16.904659}, {"lng": 121.688477, "lat": 16.905451}, {"lng": 121.689339, "lat": 16.905701}, {"lng": 121.690498, "lat": 16.906071}, {"lng": 121.691582, "lat": 16.9065}, {"lng": 121.692543, "lat": 16.906639}, {"lng": 121.693916, "lat": 16.906509}, {"lng": 121.694992, "lat": 16.907301}, {"lng": 121.695686, "lat": 16.908291}, {"lng": 121.695717, "lat": 16.9091}, {"lng": 121.696037, "lat": 16.910851}, {"lng": 121.696136, "lat": 16.911501}, {"lng": 121.697983, "lat": 16.91243}]	64
52	Rogus	[{"lng": 121.893066, "lat": 16.91412}, {"lng": 121.893608, "lat": 16.912861}, {"lng": 121.894058, "lat": 16.911699}, {"lng": 121.895126, "lat": 16.91115}, {"lng": 121.896019, "lat": 16.91017}, {"lng": 121.896797, "lat": 16.90933}, {"lng": 121.897926, "lat": 16.90847}, {"lng": 121.882004, "lat": 16.90391}, {"lng": 121.883362, "lat": 16.91032}, {"lng": 121.883842, "lat": 16.920931}, {"lng": 121.884941, "lat": 16.920931}, {"lng": 121.886253, "lat": 16.921141}, {"lng": 121.887611, "lat": 16.9214}, {"lng": 121.88932, "lat": 16.922251}, {"lng": 121.890717, "lat": 16.922859}, {"lng": 121.89193, "lat": 16.922371}, {"lng": 121.891129, "lat": 16.920509}, {"lng": 121.89048, "lat": 16.919621}, {"lng": 121.890587, "lat": 16.918261}, {"lng": 121.890999, "lat": 16.91688}, {"lng": 121.892548, "lat": 16.91485}, {"lng": 121.893066, "lat": 16.91412}]	75
8	San Fermin	[ \t{"lng": 121.909363, "lat": 16.893270}, \t{"lng": 121.909943, "lat": 16.892920}, \t{"lng": 121.909920, "lat": 16.892250}, \t{"lng": 121.909813, "lat": 16.890591}, \t{"lng": 121.909332, "lat": 16.889549}, \t{"lng": 121.908669, "lat": 16.888460}, \t{"lng": 121.907867, "lat": 16.887409}, \t{"lng": 121.907944, "lat": 16.886780}, \t{"lng": 121.907318, "lat": 16.886471}, \t{"lng": 121.907692, "lat": 16.885139}, \t{"lng": 121.908417, "lat": 16.882669}, \t{"lng": 121.908699, "lat": 16.880939}, \t{"lng": 121.910141, "lat": 16.879709}, \t{"lng": 121.911362, "lat": 16.877430}, \t{"lng": 121.912537, "lat": 16.875521}, \t{"lng": 121.914001, "lat": 16.872431}, \t{"lng": 121.914253, "lat": 16.871441}, \t{"lng": 121.915031, "lat": 16.870331}, \t{"lng": 121.916054, "lat": 16.869850}, \t{"lng": 121.917526, "lat": 16.868860}, \t{"lng": 121.919510, "lat": 16.867250}, \t{"lng": 121.922508, "lat": 16.862640}, \t{"lng": 121.919937, "lat": 16.861500}, \t{"lng": 121.913353, "lat": 16.859470}, \t{"lng": 121.910820, "lat": 16.858400}, \t{"lng": 121.908897, "lat": 16.857220}, \t{"lng": 121.889351, "lat": 16.875420}, \t{"lng": 121.889481, "lat": 16.875891}, \t{"lng": 121.889816, "lat": 16.876459}, \t{"lng": 121.890663, "lat": 16.876970}, \t{"lng": 121.892021, "lat": 16.877979}, \t{"lng": 121.891792, "lat": 16.879339}, \t{"lng": 121.892052, "lat": 16.880880}, \t{"lng": 121.893013, "lat": 16.881981}, \t{"lng": 121.893318, "lat": 16.883301}, \t{"lng": 121.893799, "lat": 16.884850}, \t{"lng": 121.894737, "lat": 16.885900}, \t{"lng": 121.896843, "lat": 16.887369}, \t{"lng": 121.898216, "lat": 16.889120}, \t{"lng": 121.898933, "lat": 16.891399}, \t{"lng": 121.899918, "lat": 16.892780}, \t{"lng": 121.902191, "lat": 16.893530}, \t{"lng": 121.904617, "lat": 16.894260}, \t{"lng": 121.905167, "lat": 16.893400}, \t{"lng": 121.906921, "lat": 16.893141}, \t{"lng": 121.909363, "lat": 16.893270} ]	87.27
55	San Isidro	[{"lng": 121.77179, "lat": 16.88163}, {"lng": 121.772537, "lat": 16.88184}, {"lng": 121.773277, "lat": 16.88162}, {"lng": 121.77346, "lat": 16.88093}, {"lng": 121.774147, "lat": 16.88027}, {"lng": 121.775421, "lat": 16.879551}, {"lng": 121.775864, "lat": 16.878321}, {"lng": 121.776443, "lat": 16.87686}, {"lng": 121.777107, "lat": 16.875389}, {"lng": 121.777679, "lat": 16.875071}, {"lng": 121.778198, "lat": 16.874109}, {"lng": 121.778374, "lat": 16.87245}, {"lng": 121.77858, "lat": 16.87038}, {"lng": 121.779152, "lat": 16.869801}, {"lng": 121.774429, "lat": 16.867661}, {"lng": 121.763206, "lat": 16.868139}, {"lng": 121.758636, "lat": 16.87126}, {"lng": 121.75885, "lat": 16.875}, {"lng": 121.758987, "lat": 16.87891}, {"lng": 121.759117, "lat": 16.88217}, {"lng": 121.759392, "lat": 16.8839}, {"lng": 121.759697, "lat": 16.884991}, {"lng": 121.759697, "lat": 16.88549}, {"lng": 121.760513, "lat": 16.88542}, {"lng": 121.762138, "lat": 16.885611}, {"lng": 121.763832, "lat": 16.88475}, {"lng": 121.764473, "lat": 16.884001}, {"lng": 121.765732, "lat": 16.88184}, {"lng": 121.766853, "lat": 16.881741}, {"lng": 121.768257, "lat": 16.882151}, {"lng": 121.769203, "lat": 16.88205}, {"lng": 121.770393, "lat": 16.881901}, {"lng": 121.771446, "lat": 16.880939}, {"lng": 121.771637, "lat": 16.880779}, {"lng": 121.77179, "lat": 16.88163}]	58
59	Santa Maria	[{"lng": 121.897926, "lat": 16.90847}, {"lng": 121.898773, "lat": 16.907921}, {"lng": 121.899971, "lat": 16.90773}, {"lng": 121.90078, "lat": 16.90848}, {"lng": 121.90152, "lat": 16.90921}, {"lng": 121.902161, "lat": 16.908581}, {"lng": 121.903252, "lat": 16.908251}, {"lng": 121.905281, "lat": 16.90777}, {"lng": 121.905853, "lat": 16.906981}, {"lng": 121.905952, "lat": 16.90531}, {"lng": 121.905472, "lat": 16.90443}, {"lng": 121.904404, "lat": 16.90283}, {"lng": 121.904984, "lat": 16.90037}, {"lng": 121.904984, "lat": 16.898809}, {"lng": 121.904739, "lat": 16.89571}, {"lng": 121.904617, "lat": 16.89426}, {"lng": 121.902191, "lat": 16.89353}, {"lng": 121.899918, "lat": 16.89278}, {"lng": 121.898933, "lat": 16.891399}, {"lng": 121.898216, "lat": 16.88912}, {"lng": 121.896843, "lat": 16.887369}, {"lng": 121.894737, "lat": 16.8859}, {"lng": 121.893799, "lat": 16.88485}, {"lng": 121.893318, "lat": 16.883301}, {"lng": 121.891647, "lat": 16.88563}, {"lng": 121.890266, "lat": 16.88637}, {"lng": 121.888649, "lat": 16.887501}, {"lng": 121.886833, "lat": 16.88876}, {"lng": 121.885277, "lat": 16.89012}, {"lng": 121.884727, "lat": 16.89098}, {"lng": 121.884033, "lat": 16.891979}, {"lng": 121.883614, "lat": 16.89275}, {"lng": 121.882591, "lat": 16.89283}, {"lng": 121.881844, "lat": 16.893181}, {"lng": 121.881287, "lat": 16.89381}, {"lng": 121.881416, "lat": 16.89432}, {"lng": 121.882004, "lat": 16.90391}, {"lng": 121.897926, "lat": 16.90847}]	50.5
60	Sillawit	[{"lng": 121.759697, "lat": 16.88549}, {"lng": 121.759697, "lat": 16.884991}, {"lng": 121.759392, "lat": 16.8839}, {"lng": 121.759117, "lat": 16.88217}, {"lng": 121.758987, "lat": 16.87891}, {"lng": 121.75885, "lat": 16.875}, {"lng": 121.758636, "lat": 16.87126}, {"lng": 121.750473, "lat": 16.871531}, {"lng": 121.743874, "lat": 16.85704}, {"lng": 121.722794, "lat": 16.86101}, {"lng": 121.722542, "lat": 16.86792}, {"lng": 121.721588, "lat": 16.87332}, {"lng": 121.720757, "lat": 16.877831}, {"lng": 121.718536, "lat": 16.882799}, {"lng": 121.722908, "lat": 16.884769}, {"lng": 121.725502, "lat": 16.884951}, {"lng": 121.726921, "lat": 16.88402}, {"lng": 121.72831, "lat": 16.880859}, {"lng": 121.729401, "lat": 16.87841}, {"lng": 121.730476, "lat": 16.87678}, {"lng": 121.732521, "lat": 16.876051}, {"lng": 121.73439, "lat": 16.876511}, {"lng": 121.735703, "lat": 16.87727}, {"lng": 121.736343, "lat": 16.87705}, {"lng": 121.737717, "lat": 16.87616}, {"lng": 121.739563, "lat": 16.874901}, {"lng": 121.740868, "lat": 16.874029}, {"lng": 121.742363, "lat": 16.87351}, {"lng": 121.744186, "lat": 16.874149}, {"lng": 121.745758, "lat": 16.875589}, {"lng": 121.746651, "lat": 16.87591}, {"lng": 121.747383, "lat": 16.876671}, {"lng": 121.747963, "lat": 16.87788}, {"lng": 121.749107, "lat": 16.87899}, {"lng": 121.750183, "lat": 16.87912}, {"lng": 121.751968, "lat": 16.87896}, {"lng": 121.75293, "lat": 16.87956}, {"lng": 121.752953, "lat": 16.880739}, {"lng": 121.752022, "lat": 16.882429}, {"lng": 121.751343, "lat": 16.883751}, {"lng": 121.751793, "lat": 16.884809}, {"lng": 121.754593, "lat": 16.886061}, {"lng": 121.755798, "lat": 16.88649}, {"lng": 121.758362, "lat": 16.886499}, {"lng": 121.759277, "lat": 16.885839}, {"lng": 121.759697, "lat": 16.88549}]	64
32	District III	[{"lng": 121.765648, "lat": 16.948469}, {"lng": 121.775597, "lat": 16.94441}, {"lng": 121.77861, "lat": 16.945829}, {"lng": 121.778687, "lat": 16.944811}, {"lng": 121.783127, "lat": 16.942221}, {"lng": 121.780777, "lat": 16.94142}, {"lng": 121.780792, "lat": 16.941561}, {"lng": 121.776367, "lat": 16.94105}, {"lng": 121.775864, "lat": 16.941111}, {"lng": 121.775848, "lat": 16.941641}, {"lng": 121.775581, "lat": 16.94208}, {"lng": 121.769432, "lat": 16.94239}, {"lng": 121.76757, "lat": 16.938869}, {"lng": 121.764236, "lat": 16.940161}, {"lng": 121.76403, "lat": 16.94021}, {"lng": 121.762222, "lat": 16.940479}, {"lng": 121.762428, "lat": 16.94096}, {"lng": 121.762543, "lat": 16.941231}, {"lng": 121.76532, "lat": 16.94771}, {"lng": 121.765648, "lat": 16.948469}]	50
\.


--
-- TOC entry 3489 (class 0 OID 25356)
-- Dependencies: 231
-- Data for Name: barangay_risk_statistics; Type: TABLE DATA; Schema: public; Owner: risk_management_user
--

COPY public.barangay_risk_statistics (barangay_id, num_exp_flooding, norm_num_exp_flooding, prop_exp_flooding, norm_prop_exp_flooding) FROM stdin;
11	39	0.19	18.4	0.11
12	3	0.01	3.09	0.02
13	10	0.05	10.31	0.06
7	43	0.21	91.49	0.56
14	0	0	0	0
15	24	0.12	66.67	0.41
16	1	0	0.87	0.01
17	3	0.01	2.8	0.02
18	8	0.04	16.67	0.1
19	6	0.03	4.32	0.03
20	10	0.05	1.96	0.01
21	0	0	0	0
22	57	0.28	81.43	0.5
1	55	0.27	157.14	0.97
3	83	0.4	162.75	1
6	38	0.18	115.15	0.71
23	0	0	0	0
24	0	0	0	0
5	15	0.07	115.38	0.71
25	0	0	0	0
26	0	0	0	0
27	3	0.01	2.7	0.02
28	0	0	0	0
29	0	0	0	0
33	95	0.46	62.5	0.38
35	50	0.24	71.43	0.44
36	0	0	0	0
37	20	0.1	12.82	0.08
38	34	0.16	17.8	0.11
39	0	0	0	0
4	207	1	126.22	0.78
40	3	0.01	1.53	0.01
41	0	0	0	0
42	7	0.03	2.04	0.01
43	1	0	0.38	0
44	5	0.02	1.03	0.01
45	0	0	0	0
2	75	0.36	131.58	0.81
46	0	0	0	0
47	0	0	0	0
48	0	0	0	0
49	0	0	0	0
50	14	0.07	4.71	0.03
51	9	0.04	11.11	0.07
52	2	0.01	1.2	0.01
53	6	0.03	2.17	0.01
8	16	0.08	1.58	0.01
54	3	0.01	1.3	0.01
55	7	0.03	11.67	0.07
56	96	0.46	38.4	0.24
59	2	0.01	2.41	0.01
60	8	0.04	2.35	0.01
61	1	0	7.69	0.05
62	7	0.03	1.18	0.01
9	62	0.3	17.56	0.11
63	33	0.16	23.24	0.14
64	30	0.14	8.62	0.05
65	105	0.51	46.46	0.29
66	0	0	0	0
57	7	0.03	3.03	0.02
30	40	0.19	3.4	0.02
31	3	0.01	1.1	1.01
32	59	0.29	9.62	0.06
34	3	0.01	1.62	0.01
58	3	0.01	1.48	0.01
\.


--
-- TOC entry 3490 (class 0 OID 25369)
-- Dependencies: 232
-- Data for Name: barangay_risk_statistics_copy_complete; Type: TABLE DATA; Schema: public; Owner: risk_management_user
--

COPY public.barangay_risk_statistics_copy_complete (barangay_id, num_exp_flooding, norm_num_exp_flooding, prop_exp_flooding, norm_prop_exp_flooding) FROM stdin;
11	39	0.19	18.4	0.11
12	3	0.01	3.09	0.02
13	10	0.05	10.31	0.06
7	43	0.21	91.49	0.56
14	0	0	0	0
15	24	0.12	66.67	0.41
16	1	0	0.87	0.01
17	3	0.01	2.8	0.02
18	8	0.04	16.67	0.1
19	6	0.03	4.32	0.03
20	10	0.05	1.96	0.01
21	0	0	0	0
22	57	0.28	81.43	0.5
1	55	0.27	157.14	0.97
3	83	0.4	162.75	1
6	38	0.18	115.15	0.71
23	0	0	0	0
24	0	0	0	0
5	15	0.07	115.38	0.71
25	0	0	0	0
26	0	0	0	0
27	3	0.01	2.7	0.02
28	0	0	0	0
29	0	0	0	0
33	95	0.46	62.5	0.38
35	50	0.24	71.43	0.44
36	0	0	0	0
37	20	0.1	12.82	0.08
38	34	0.16	17.8	0.11
39	0	0	0	0
4	207	1	126.22	0.78
40	3	0.01	1.53	0.01
41	0	0	0	0
42	7	0.03	2.04	0.01
43	1	0	0.38	0
44	5	0.02	1.03	0.01
45	0	0	0	0
2	75	0.36	131.58	0.81
46	0	0	0	0
47	0	0	0	0
48	0	0	0	0
49	0	0	0	0
50	14	0.07	4.71	0.03
51	9	0.04	11.11	0.07
52	2	0.01	1.2	0.01
53	6	0.03	2.17	0.01
8	16	0.08	1.58	0.01
54	3	0.01	1.3	0.01
55	7	0.03	11.67	0.07
56	96	0.46	38.4	0.24
59	2	0.01	2.41	0.01
60	8	0.04	2.35	0.01
61	1	0	7.69	0.05
62	7	0.03	1.18	0.01
9	62	0.3	17.56	0.11
63	33	0.16	23.24	0.14
64	30	0.14	8.62	0.05
65	105	0.51	46.46	0.29
66	0	0	0	0
57	7	0.03	3.03	0.02
30	40	0.19	3.4	0.02
31	3	0.01	1.1	1.01
32	59	0.29	9.62	0.06
34	3	0.01	1.62	0.01
58	3	0.01	1.48	0.01
\.


--
-- TOC entry 3484 (class 0 OID 17008)
-- Dependencies: 226
-- Data for Name: calamity_categories; Type: TABLE DATA; Schema: public; Owner: risk_management_user
--

COPY public.calamity_categories (calamity_category_id, calamity_label) FROM stdin;
1	Typhoon
2	Earthquake
\.


--
-- TOC entry 3479 (class 0 OID 16957)
-- Dependencies: 221
-- Data for Name: casualty_categories; Type: TABLE DATA; Schema: public; Owner: risk_management_user
--

COPY public.casualty_categories (casualty_category_id, casualty_label) FROM stdin;
4	Electricution
5	Health-related
3	Drowning
\.


--
-- TOC entry 3485 (class 0 OID 17014)
-- Dependencies: 227
-- Data for Name: cauayan_city; Type: TABLE DATA; Schema: public; Owner: risk_management_user
--

COPY public.cauayan_city (name, political_boundaries) FROM stdin;
Cauayan City	[ {"lng":121.800117, "lat":16.981609}, {"lng":121.802727, "lat":16.981520}, {"lng":121.805511, "lat":16.981800}, {"lng":121.806808, "lat":16.981930}, {"lng":121.808510, "lat":16.981819}, {"lng":121.811600, "lat":16.981449}, {"lng":121.813873, "lat":16.981020}, {"lng":121.816681, "lat":16.980190}, {"lng":121.819344, "lat":16.979130}, {"lng":121.821053, "lat":16.978550}, {"lng":121.823097, "lat":16.976450}, {"lng":121.827141, "lat":16.974621}, {"lng":121.829391, "lat":16.973881}, {"lng":121.831963, "lat":16.973909}, {"lng":121.833839, "lat":16.974319}, {"lng":121.834480, "lat":16.974609}, {"lng":121.836342, "lat":16.971291}, {"lng":121.837723, "lat":16.968349}, {"lng":121.838043, "lat":16.967590}, {"lng":121.838226, "lat":16.965931}, {"lng":121.837578, "lat":16.964729}, {"lng":121.836090, "lat":16.963820}, {"lng":121.835289, "lat":16.963381}, {"lng":121.834633, "lat":16.963120}, {"lng":121.834099, "lat":16.961990}, {"lng":121.835716, "lat":16.961519}, {"lng":121.837662, "lat":16.961281}, {"lng":121.838638, "lat":16.960911}, {"lng":121.840530, "lat":16.959089}, {"lng":121.840843, "lat":16.957359}, {"lng":121.840057, "lat":16.956020}, {"lng":121.839661, "lat":16.954920}, {"lng":121.840073, "lat":16.953960}, {"lng":121.842827, "lat":16.951559}, {"lng":121.842529, "lat":16.950390}, {"lng":121.842651, "lat":16.948231}, {"lng":121.844307, "lat":16.947670}, {"lng":121.845222, "lat":16.947821}, {"lng":121.846291, "lat":16.945721}, {"lng":121.847366, "lat":16.945761}, {"lng":121.847397, "lat":16.944740}, {"lng":121.847328, "lat":16.944071}, {"lng":121.847137, "lat":16.941561}, {"lng":121.846420, "lat":16.939350}, {"lng":121.845863, "lat":16.937290}, {"lng":121.845917, "lat":16.936850}, {"lng":121.847427, "lat":16.937300}, {"lng":121.848633, "lat":16.937691}, {"lng":121.849457, "lat":16.935169}, {"lng":121.850182, "lat":16.932949}, {"lng":121.850517, "lat":16.932541}, {"lng":121.852348, "lat":16.932541}, {"lng":121.854309, "lat":16.934031}, {"lng":121.855133, "lat":16.934940}, {"lng":121.856003, "lat":16.937290}, {"lng":121.857567, "lat":16.936911}, {"lng":121.858673, "lat":16.936460}, {"lng":121.860687, "lat":16.937740}, {"lng":121.863037, "lat":16.937941}, {"lng":121.865334, "lat":16.937380}, {"lng":121.865662, "lat":16.936899}, {"lng":121.864647, "lat":16.935310}, {"lng":121.865128, "lat":16.933981}, {"lng":121.866432, "lat":16.932199}, {"lng":121.866760, "lat":16.931471}, {"lng":121.865799, "lat":16.930090}, {"lng":121.864662, "lat":16.929001}, {"lng":121.864029, "lat":16.927811}, {"lng":121.865097, "lat":16.926580}, {"lng":121.865921, "lat":16.925310}, {"lng":121.866272, "lat":16.924110}, {"lng":121.868187, "lat":16.922720}, {"lng":121.868507, "lat":16.922741}, {"lng":121.871117, "lat":16.923059}, {"lng":121.872368, "lat":16.922810}, {"lng":121.873528, "lat":16.922319}, {"lng":121.873909, "lat":16.921591}, {"lng":121.874832, "lat":16.920300}, {"lng":121.875618, "lat":16.920401}, {"lng":121.877220, "lat":16.921221}, {"lng":121.877861, "lat":16.920670}, {"lng":121.880188, "lat":16.919849}, {"lng":121.880638, "lat":16.920191}, {"lng":121.881523, "lat":16.920429}, {"lng":121.882767, "lat":16.920891}, {"lng":121.883842, "lat":16.920931}, {"lng":121.884941, "lat":16.920931}, {"lng":121.886253, "lat":16.921141}, {"lng":121.887611, "lat":16.921400}, {"lng":121.889320, "lat":16.922251}, {"lng":121.890717, "lat":16.922859}, {"lng":121.891930, "lat":16.922371}, {"lng":121.891129, "lat":16.920509}, {"lng":121.890480, "lat":16.919621}, {"lng":121.890587, "lat":16.918261}, {"lng":121.890999, "lat":16.916880}, {"lng":121.892548, "lat":16.914850}, {"lng":121.893066, "lat":16.914120}, {"lng":121.893608, "lat":16.912861}, {"lng":121.894058, "lat":16.911699}, {"lng":121.895126, "lat":16.911150}, {"lng":121.896019, "lat":16.910170}, {"lng":121.896797, "lat":16.909330}, {"lng":121.897926, "lat":16.908470}, {"lng":121.898773, "lat":16.907921}, {"lng":121.899971, "lat":16.907730}, {"lng":121.900780, "lat":16.908480}, {"lng":121.901520, "lat":16.909210}, {"lng":121.902161, "lat":16.908581}, {"lng":121.903252, "lat":16.908251}, {"lng":121.905281, "lat":16.907770}, {"lng":121.905853, "lat":16.906981}, {"lng":121.905952, "lat":16.905310}, {"lng":121.905472, "lat":16.904430}, {"lng":121.904404, "lat":16.902830}, {"lng":121.904984, "lat":16.900370}, {"lng":121.904984, "lat":16.898809}, {"lng":121.904739, "lat":16.895710}, {"lng":121.904617, "lat":16.894260}, {"lng":121.905167, "lat":16.893400}, {"lng":121.906921, "lat":16.893141}, {"lng":121.909363, "lat":16.893270}, {"lng":121.909943, "lat":16.892920}, {"lng":121.909920, "lat":16.892250}, {"lng":121.909813, "lat":16.890591}, {"lng":121.909332, "lat":16.889549}, {"lng":121.908669, "lat":16.888460}, {"lng":121.907867, "lat":16.887409}, {"lng":121.907944, "lat":16.886780}, {"lng":121.909477, "lat":16.886530}, {"lng":121.911926, "lat":16.886250}, {"lng":121.914284, "lat":16.886129}, {"lng":121.918159, "lat":16.885710}, {"lng":121.922813, "lat":16.885370}, {"lng":121.926720, "lat":16.885000}, {"lng":121.932121, "lat":16.884970}, {"lng":121.933357, "lat":16.883760}, {"lng":121.933434, "lat":16.882271}, {"lng":121.933746, "lat":16.881350}, {"lng":121.933907, "lat":16.879660}, {"lng":121.934692, "lat":16.879271}, {"lng":121.935760, "lat":16.878000}, {"lng":121.935921, "lat":16.875931}, {"lng":121.935349, "lat":16.874140}, {"lng":121.933792, "lat":16.872919}, {"lng":121.932220, "lat":16.871861}, {"lng":121.931381, "lat":16.870110}, {"lng":121.931084, "lat":16.868349}, {"lng":121.930099, "lat":16.867599}, {"lng":121.928917, "lat":16.866550}, {"lng":121.925987, "lat":16.864719}, {"lng":121.924316, "lat":16.863569}, {"lng":121.922508, "lat":16.862640}, {"lng":121.919937, "lat":16.861500}, {"lng":121.913353, "lat":16.859470}, {"lng":121.910820, "lat":16.858400}, {"lng":121.908897, "lat":16.857220}, {"lng":121.906219, "lat":16.855539}, {"lng":121.905792, "lat":16.855570}, {"lng":121.904167, "lat":16.854561}, {"lng":121.902023, "lat":16.853201}, {"lng":121.900513, "lat":16.852221}, {"lng":121.898323, "lat":16.850491}, {"lng":121.897041, "lat":16.849140}, {"lng":121.894753, "lat":16.845869}, {"lng":121.893867, "lat":16.844980}, {"lng":121.892036, "lat":16.842920}, {"lng":121.890312, "lat":16.841700}, {"lng":121.886948, "lat":16.838369}, {"lng":121.883438, "lat":16.835779}, {"lng":121.877663, "lat":16.832340}, {"lng":121.875481, "lat":16.830481}, {"lng":121.871834, "lat":16.840611}, {"lng":121.868408, "lat":16.842331}, {"lng":121.855583, "lat":16.840830}, {"lng":121.850258, "lat":16.839581}, {"lng":121.846039, "lat":16.838810}, {"lng":121.844421, "lat":16.838690}, {"lng":121.842949, "lat":16.838779}, {"lng":121.840607, "lat":16.838100}, {"lng":121.834007, "lat":16.836090}, {"lng":121.830856, "lat":16.835449}, {"lng":121.828491, "lat":16.835699}, {"lng":121.823601, "lat":16.835751}, {"lng":121.817291, "lat":16.836361}, {"lng":121.814171, "lat":16.836809}, {"lng":121.802353, "lat":16.834160}, {"lng":121.802544, "lat":16.836281}, {"lng":121.795731, "lat":16.840561}, {"lng":121.795097, "lat":16.850420}, {"lng":121.788422, "lat":16.851320}, {"lng":121.774147, "lat":16.851030}, {"lng":121.769737, "lat":16.855780}, {"lng":121.765602, "lat":16.859470}, {"lng":121.762039, "lat":16.859190}, {"lng":121.760483, "lat":16.859020}, {"lng":121.759682, "lat":16.859209}, {"lng":121.756889, "lat":16.858521}, {"lng":121.755859, "lat":16.858299}, {"lng":121.754753, "lat":16.858170}, {"lng":121.754059, "lat":16.858250}, {"lng":121.752647, "lat":16.857800}, {"lng":121.751091, "lat":16.857470}, {"lng":121.750366, "lat":16.857611}, {"lng":121.748817, "lat":16.857031}, {"lng":121.747597, "lat":16.856930}, {"lng":121.746742, "lat":16.857281}, {"lng":121.745354, "lat":16.856791}, {"lng":121.743874, "lat":16.857040}, {"lng":121.722794, "lat":16.861010}, {"lng":121.715446, "lat":16.862419}, {"lng":121.694572, "lat":16.867519}, {"lng":121.682510, "lat":16.870291}, {"lng":121.677101, "lat":16.871559}, {"lng":121.673920, "lat":16.871941}, {"lng":121.671471, "lat":16.872351}, {"lng":121.667992, "lat":16.873360}, {"lng":121.663628, "lat":16.874250}, {"lng":121.661346, "lat":16.874041}, {"lng":121.658829, "lat":16.875200}, {"lng":121.656860, "lat":16.876459}, {"lng":121.651207, "lat":16.878780}, {"lng":121.661636, "lat":16.887280}, {"lng":121.673203, "lat":16.896540}, {"lng":121.674156, "lat":16.903820}, {"lng":121.675148, "lat":16.903620}, {"lng":121.675613, "lat":16.903160}, {"lng":121.676331, "lat":16.902691}, {"lng":121.676468, "lat":16.902840}, {"lng":121.678268, "lat":16.903839}, {"lng":121.679108, "lat":16.903561}, {"lng":121.679871, "lat":16.903210}, {"lng":121.680817, "lat":16.902941}, {"lng":121.682159, "lat":16.903311}, {"lng":121.682808, "lat":16.903709}, {"lng":121.683090, "lat":16.903891}, {"lng":121.684410, "lat":16.904400}, {"lng":121.684837, "lat":16.904350}, {"lng":121.686623, "lat":16.904659}, {"lng":121.688477, "lat":16.905451}, {"lng":121.689339, "lat":16.905701}, {"lng":121.690498, "lat":16.906071}, {"lng":121.691582, "lat":16.906500}, {"lng":121.692543, "lat":16.906639}, {"lng":121.693916, "lat":16.906509}, {"lng":121.694992, "lat":16.907301}, {"lng":121.695686, "lat":16.908291}, {"lng":121.695717, "lat":16.909100}, {"lng":121.696037, "lat":16.910851}, {"lng":121.696136, "lat":16.911501}, {"lng":121.697983, "lat":16.912430}, {"lng":121.697983, "lat":16.913219}, {"lng":121.698563, "lat":16.913231}, {"lng":121.699387, "lat":16.913549}, {"lng":121.699799, "lat":16.914539}, {"lng":121.700394, "lat":16.915060}, {"lng":121.701027, "lat":16.916410}, {"lng":121.700897, "lat":16.917030}, {"lng":121.701630, "lat":16.918341}, {"lng":121.700760, "lat":16.920290}, {"lng":121.700912, "lat":16.922119}, {"lng":121.702522, "lat":16.924620}, {"lng":121.704117, "lat":16.926430}, {"lng":121.704803, "lat":16.926701}, {"lng":121.706047, "lat":16.927530}, {"lng":121.708427, "lat":16.930050}, {"lng":121.709167, "lat":16.930780}, {"lng":121.712173, "lat":16.931589}, {"lng":121.715378, "lat":16.931471}, {"lng":121.718224, "lat":16.931339}, {"lng":121.720467, "lat":16.931641}, {"lng":121.723373, "lat":16.931919}, {"lng":121.725838, "lat":16.932961}, {"lng":121.727997, "lat":16.933571}, {"lng":121.729210, "lat":16.933889}, {"lng":121.729507, "lat":16.933969}, {"lng":121.729317, "lat":16.936291}, {"lng":121.735123, "lat":16.944170}, {"lng":121.736847, "lat":16.946369}, {"lng":121.750168, "lat":16.963579}, {"lng":121.751984, "lat":16.965771}, {"lng":121.754143, "lat":16.970699}, {"lng":121.764999, "lat":16.985210}, {"lng":121.765907, "lat":16.986031}, {"lng":121.776131, "lat":16.984489}, {"lng":121.796219, "lat":16.982210}, {"lng":121.797684, "lat":16.981951}, {"lng":121.800117, "lat":16.981609} ]
\.


--
-- TOC entry 3487 (class 0 OID 17044)
-- Dependencies: 229
-- Data for Name: evacuation_center; Type: TABLE DATA; Schema: public; Owner: risk_management_user
--

COPY public.evacuation_center (evacuation_center_id, facility_id, date_active_start, date_active_end) FROM stdin;
1	12	2022-10-30 11:25:53.368068	\N
2	14	2022-10-30 11:25:53.368068	\N
3	4	2022-10-30 11:25:53.368068	\N
4	3	2022-10-30 11:25:53.368068	\N
\.


--
-- TOC entry 3493 (class 0 OID 25397)
-- Dependencies: 235
-- Data for Name: evacuation_center_copy_complete; Type: TABLE DATA; Schema: public; Owner: risk_management_user
--

COPY public.evacuation_center_copy_complete (evacuation_center_id, facility_id, date_active_start, date_active_end) FROM stdin;
1	12	2022-10-30 11:25:53.368068	\N
2	14	2022-10-30 11:25:53.368068	\N
3	4	2022-10-30 11:25:53.368068	\N
4	3	2022-10-30 11:25:53.368068	\N
\.


--
-- TOC entry 3473 (class 0 OID 16921)
-- Dependencies: 215
-- Data for Name: evacuation_center_history; Type: TABLE DATA; Schema: public; Owner: risk_management_user
--

COPY public.evacuation_center_history (evacuation_center_id, barangay_id, name, date_active_start, date_active_end) FROM stdin;
\.


--
-- TOC entry 3477 (class 0 OID 16938)
-- Dependencies: 219
-- Data for Name: facilities; Type: TABLE DATA; Schema: public; Owner: risk_management_user
--

COPY public.facilities (facility_id, barangay_id, facility_type_id, name, address, phone_primary, phone_secondary, coordinates) FROM stdin;
2	6	6	Union Multi Purpose Gym	XR58+XHW, Cauayan City, Isabela	\N	\N	{"lat": 16.96090271033915, "lng": 121.81641256664983}
3	38	6	Brgy Labinan Covered Court	WQJM+2XQ, Cauayan City, Isabela	\N	\N	{"lat":16.93251864825743, "lng": 121.78527732970372}
4	62	6	Cauayan Sports Complex	XQ87+RM Cauayan City, Isabela	\N	\N	{"lat":16.96888981675695, "lng": 121.764313494183}
6	30	2	Cauayan South Central School	WQJC+MM2, Cauayan City, Isabela	\N	\N	{"lat":16.934266611715906, "lng": 121.77229692726415}
7	25	2	Rizal Elementary School	WR73+3CV, Cauayan City, Isabela	\N	\N	{"lat":16.914025623069456, "lng": 121.80371907137865}
8	56	2	San Luis Integrated School	XR8H+8WG, Cauayan City, Isabela	\N	\N	{"lat":16.966980038507337, "lng": 121.83010908550433}
9	38	1	Cauayan Disrict Hospital	District 1, Cauayan City, Isabela	\N	\N	{"lat":16.92046110554025, "lng": 121.78410409257594}
10	38	1	Cauayan Family Hospital	WQ9Q+552, Prenza, Cauayan City, 3305	0786523399	\N	{"lat":16.918969627663014, "lng": 121.78822779260145}
11	9	1	Isabela United Doctors Medical Center	National Highway, Brgy. Cabaruan Cauayan City, Isabela, AH26, Cauayan City, Isabela	\N	\N	{"lat":16.94951732146819, "lng": 121.77190704174951}
12	44	4	Cauayan City Airport	WQG3+VM3, Airport Rd, Cauayan City, 3305 Isabela	0786522314	\N	{"lat":16.930099532166516, "lng": 121.75516952398826}
13	44	7	District 1 Barangay Hall, Cauayan City	WQJ9+PV6, Mabini St, Cauayan City, Isabela	\N	\N	{"lat":16.932924114674876, "lng": 121.76962511880019}
14	32	7	Cabaruan Barangay Hall	WQWC+QQF, Cauayan City, Isabela	\N	\N	{"lat":16.947741045594867, "lng": 121.7718881249536}
15	6	7	Union Barangay Hall	XR68+3H4, Unnamed Rd, Cauayan City, Isabela	\N	\N	{"lat":16.961765994869648, "lng": 121.81648769305868}
16	23	7	Cabugao Barangay Hall	WV73+V5C, Cabugao, Cauayan City, Isabela	\N	\N	{"lat":16.916004965785536, "lng": 121.85225141685322}
\.


--
-- TOC entry 3492 (class 0 OID 25392)
-- Dependencies: 234
-- Data for Name: facilities_copy_complete; Type: TABLE DATA; Schema: public; Owner: risk_management_user
--

COPY public.facilities_copy_complete (facility_id, barangay_id, facility_type_id, name, address, phone_primary, phone_secondary, coordinates) FROM stdin;
2	6	6	Union Multi Purpose Gym	XR58+XHW, Cauayan City, Isabela	\N	\N	{"lat": 16.96090271033915, "lng": 121.81641256664983}
3	38	6	Brgy Labinan Covered Court	WQJM+2XQ, Cauayan City, Isabela	\N	\N	{"lat":16.93251864825743, "lng": 121.78527732970372}
4	62	6	Cauayan Sports Complex	XQ87+RM Cauayan City, Isabela	\N	\N	{"lat":16.96888981675695, "lng": 121.764313494183}
5	56	6	Minanga Multi Purpose Gym	XRFP+946, Minanga, Naguilian, Isabela	\N	\N	{"lat":16.974793914107707, "lng": 121.83549356648649}
6	30	2	Cauayan South Central School	WQJC+MM2, Cauayan City, Isabela	\N	\N	{"lat":16.934266611715906, "lng": 121.77229692726415}
7	25	2	Rizal Elementary School	WR73+3CV, Cauayan City, Isabela	\N	\N	{"lat":16.914025623069456, "lng": 121.80371907137865}
8	56	2	San Luis Integrated School	XR8H+8WG, Cauayan City, Isabela	\N	\N	{"lat":16.966980038507337, "lng": 121.83010908550433}
9	38	1	Cauayan Disrict Hospital	District 1, Cauayan City, Isabela	\N	\N	{"lat":16.92046110554025, "lng": 121.78410409257594}
10	38	1	Cauayan Family Hospital	WQ9Q+552, Prenza, Cauayan City, 3305	0786523399	\N	{"lat":16.918969627663014, "lng": 121.78822779260145}
11	9	1	Isabela United Doctors Medical Center	National Highway, Brgy. Cabaruan Cauayan City, Isabela, AH26, Cauayan City, Isabela	\N	\N	{"lat":16.94951732146819, "lng": 121.77190704174951}
12	44	4	Cauayan City Airport	WQG3+VM3, Airport Rd, Cauayan City, 3305 Isabela	0786522314	\N	{"lat":16.930099532166516, "lng": 121.75516952398826}
13	44	7	District 1 Barangay Hall, Cauayan City	WQJ9+PV6, Mabini St, Cauayan City, Isabela	\N	\N	{"lat":16.932924114674876, "lng": 121.76962511880019}
14	32	7	Cabaruan Barangay Hall	WQWC+QQF, Cauayan City, Isabela	\N	\N	{"lat":16.947741045594867, "lng": 121.7718881249536}
15	6	7	Union Barangay Hall	XR68+3H4, Unnamed Rd, Cauayan City, Isabela	\N	\N	{"lat":16.961765994869648, "lng": 121.81648769305868}
16	23	7	Cabugao Barangay Hall	WV73+V5C, Cabugao, Cauayan City, Isabela	\N	\N	{"lat":16.916004965785536, "lng": 121.85225141685322}
\.


--
-- TOC entry 3475 (class 0 OID 16931)
-- Dependencies: 217
-- Data for Name: facility_type; Type: TABLE DATA; Schema: public; Owner: risk_management_user
--

COPY public.facility_type (facility_type_id, facility_type_label) FROM stdin;
1	Hospital
2	School
3	Police Station
4	Airport
5	Church
7	Barangay Hall
6	Sports Complex / Covered Court
\.


--
-- TOC entry 3471 (class 0 OID 16902)
-- Dependencies: 213
-- Data for Name: resident; Type: TABLE DATA; Schema: public; Owner: risk_management_user
--

COPY public.resident (resident_id, barangay_id, resident_geo_id, first_name, last_name, address) FROM stdin;
\.


--
-- TOC entry 3469 (class 0 OID 16895)
-- Dependencies: 211
-- Data for Name: resident_geo_spatial_data; Type: TABLE DATA; Schema: public; Owner: risk_management_user
--

COPY public.resident_geo_spatial_data (resident_geo_id, coordinates) FROM stdin;
\.


--
-- TOC entry 3511 (class 0 OID 0)
-- Dependencies: 209
-- Name: barangay_barangay_id_seq; Type: SEQUENCE SET; Schema: public; Owner: risk_management_user
--

SELECT pg_catalog.setval('public.barangay_barangay_id_seq', 66, true);


--
-- TOC entry 3512 (class 0 OID 0)
-- Dependencies: 223
-- Name: barangay_calamity_incident_calamity_incident_id_seq; Type: SEQUENCE SET; Schema: public; Owner: risk_management_user
--

SELECT pg_catalog.setval('public.barangay_calamity_incident_calamity_incident_id_seq', 1, false);


--
-- TOC entry 3513 (class 0 OID 0)
-- Dependencies: 225
-- Name: calamity_categories_calamity_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: risk_management_user
--

SELECT pg_catalog.setval('public.calamity_categories_calamity_category_id_seq', 2, true);


--
-- TOC entry 3514 (class 0 OID 0)
-- Dependencies: 220
-- Name: casualty_categories_casualty_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: risk_management_user
--

SELECT pg_catalog.setval('public.casualty_categories_casualty_category_id_seq', 5, true);


--
-- TOC entry 3515 (class 0 OID 0)
-- Dependencies: 228
-- Name: evacuation_center_evacuation_center_id_seq; Type: SEQUENCE SET; Schema: public; Owner: risk_management_user
--

SELECT pg_catalog.setval('public.evacuation_center_evacuation_center_id_seq', 4, true);


--
-- TOC entry 3516 (class 0 OID 0)
-- Dependencies: 214
-- Name: evacuation_center_history_evacuation_center_id_seq; Type: SEQUENCE SET; Schema: public; Owner: risk_management_user
--

SELECT pg_catalog.setval('public.evacuation_center_history_evacuation_center_id_seq', 1, false);


--
-- TOC entry 3517 (class 0 OID 0)
-- Dependencies: 218
-- Name: facilities_facility_id_seq; Type: SEQUENCE SET; Schema: public; Owner: risk_management_user
--

SELECT pg_catalog.setval('public.facilities_facility_id_seq', 16, true);


--
-- TOC entry 3518 (class 0 OID 0)
-- Dependencies: 216
-- Name: facility_type_facility_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: risk_management_user
--

SELECT pg_catalog.setval('public.facility_type_facility_type_id_seq', 7, true);


--
-- TOC entry 3519 (class 0 OID 0)
-- Dependencies: 212
-- Name: resident_resident_id_seq; Type: SEQUENCE SET; Schema: public; Owner: risk_management_user
--

SELECT pg_catalog.setval('public.resident_resident_id_seq', 1, false);


--
-- TOC entry 3316 (class 2606 OID 16998)
-- Name: barangay_calamity_incident barangay_calamity_incident_pkey; Type: CONSTRAINT; Schema: public; Owner: risk_management_user
--

ALTER TABLE ONLY public.barangay_calamity_incident
    ADD CONSTRAINT barangay_calamity_incident_pkey PRIMARY KEY (calamity_incident_id);


--
-- TOC entry 3297 (class 2606 OID 16829)
-- Name: barangay barangay_pkey; Type: CONSTRAINT; Schema: public; Owner: risk_management_user
--

ALTER TABLE ONLY public.barangay
    ADD CONSTRAINT barangay_pkey PRIMARY KEY (barangay_id);


--
-- TOC entry 3318 (class 2606 OID 17013)
-- Name: calamity_categories calamity_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: risk_management_user
--

ALTER TABLE ONLY public.calamity_categories
    ADD CONSTRAINT calamity_categories_pkey PRIMARY KEY (calamity_category_id);


--
-- TOC entry 3308 (class 2606 OID 16962)
-- Name: casualty_categories casualty_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: risk_management_user
--

ALTER TABLE ONLY public.casualty_categories
    ADD CONSTRAINT casualty_categories_pkey PRIMARY KEY (casualty_category_id);


--
-- TOC entry 3302 (class 2606 OID 16928)
-- Name: evacuation_center_history evacuation_center_history_pkey; Type: CONSTRAINT; Schema: public; Owner: risk_management_user
--

ALTER TABLE ONLY public.evacuation_center_history
    ADD CONSTRAINT evacuation_center_history_pkey PRIMARY KEY (evacuation_center_id);


--
-- TOC entry 3320 (class 2606 OID 17049)
-- Name: evacuation_center evacuation_center_pkey; Type: CONSTRAINT; Schema: public; Owner: risk_management_user
--

ALTER TABLE ONLY public.evacuation_center
    ADD CONSTRAINT evacuation_center_pkey PRIMARY KEY (evacuation_center_id);


--
-- TOC entry 3306 (class 2606 OID 16945)
-- Name: facilities facilities_pkey; Type: CONSTRAINT; Schema: public; Owner: risk_management_user
--

ALTER TABLE ONLY public.facilities
    ADD CONSTRAINT facilities_pkey PRIMARY KEY (facility_id);


--
-- TOC entry 3304 (class 2606 OID 16936)
-- Name: facility_type facility_type_pkey; Type: CONSTRAINT; Schema: public; Owner: risk_management_user
--

ALTER TABLE ONLY public.facility_type
    ADD CONSTRAINT facility_type_pkey PRIMARY KEY (facility_type_id);


--
-- TOC entry 3300 (class 2606 OID 16909)
-- Name: resident resident_pkey; Type: CONSTRAINT; Schema: public; Owner: risk_management_user
--

ALTER TABLE ONLY public.resident
    ADD CONSTRAINT resident_pkey PRIMARY KEY (resident_id);


--
-- TOC entry 3295 (class 1259 OID 25368)
-- Name: barangay_barangay_id_idx; Type: INDEX; Schema: public; Owner: risk_management_user
--

CREATE INDEX barangay_barangay_id_idx ON public.barangay USING btree (barangay_id);


--
-- TOC entry 3310 (class 1259 OID 17004)
-- Name: barangay_calamity_incident_calamity_category_id_idx; Type: INDEX; Schema: public; Owner: risk_management_user
--

CREATE INDEX barangay_calamity_incident_calamity_category_id_idx ON public.barangay_calamity_incident USING btree (calamity_category_id);


--
-- TOC entry 3311 (class 1259 OID 25324)
-- Name: barangay_calamity_incident_calamity_category_id_idx1; Type: INDEX; Schema: public; Owner: risk_management_user
--

CREATE INDEX barangay_calamity_incident_calamity_category_id_idx1 ON public.barangay_calamity_incident USING btree (calamity_category_id);


--
-- TOC entry 3312 (class 1259 OID 25333)
-- Name: barangay_calamity_incident_calamity_category_id_idx2; Type: INDEX; Schema: public; Owner: risk_management_user
--

CREATE INDEX barangay_calamity_incident_calamity_category_id_idx2 ON public.barangay_calamity_incident USING btree (calamity_category_id);


--
-- TOC entry 3313 (class 1259 OID 25342)
-- Name: barangay_calamity_incident_calamity_category_id_idx3; Type: INDEX; Schema: public; Owner: risk_management_user
--

CREATE INDEX barangay_calamity_incident_calamity_category_id_idx3 ON public.barangay_calamity_incident USING btree (calamity_category_id);


--
-- TOC entry 3314 (class 1259 OID 25355)
-- Name: barangay_calamity_incident_calamity_category_id_idx4; Type: INDEX; Schema: public; Owner: risk_management_user
--

CREATE INDEX barangay_calamity_incident_calamity_category_id_idx4 ON public.barangay_calamity_incident USING btree (calamity_category_id);


--
-- TOC entry 3309 (class 1259 OID 16966)
-- Name: barangay_casualty_resident_id_idx; Type: INDEX; Schema: public; Owner: risk_management_user
--

CREATE UNIQUE INDEX barangay_casualty_resident_id_idx ON public.barangay_casualty USING btree (resident_id);


--
-- TOC entry 3298 (class 1259 OID 16900)
-- Name: resident_geo_spatial_data_resident_geo_id_idx; Type: INDEX; Schema: public; Owner: risk_management_user
--

CREATE UNIQUE INDEX resident_geo_spatial_data_resident_geo_id_idx ON public.resident_geo_spatial_data USING btree (resident_geo_id);


--
-- TOC entry 3325 (class 2606 OID 16999)
-- Name: barangay_calamity_incident fk_barangay_calamity_incident_barangay_id; Type: FK CONSTRAINT; Schema: public; Owner: risk_management_user
--

ALTER TABLE ONLY public.barangay_calamity_incident
    ADD CONSTRAINT fk_barangay_calamity_incident_barangay_id FOREIGN KEY (barangay_id) REFERENCES public.barangay(barangay_id);


--
-- TOC entry 3327 (class 2606 OID 25363)
-- Name: barangay_risk_statistics fk_barangay_calamity_incident_barangay_id; Type: FK CONSTRAINT; Schema: public; Owner: risk_management_user
--

ALTER TABLE ONLY public.barangay_risk_statistics
    ADD CONSTRAINT fk_barangay_calamity_incident_barangay_id FOREIGN KEY (barangay_id) REFERENCES public.barangay(barangay_id);


--
-- TOC entry 3321 (class 2606 OID 16910)
-- Name: resident fk_barangay_id; Type: FK CONSTRAINT; Schema: public; Owner: risk_management_user
--

ALTER TABLE ONLY public.resident
    ADD CONSTRAINT fk_barangay_id FOREIGN KEY (barangay_id) REFERENCES public.barangay(barangay_id);


--
-- TOC entry 3323 (class 2606 OID 16946)
-- Name: facilities fk_barangay_id; Type: FK CONSTRAINT; Schema: public; Owner: risk_management_user
--

ALTER TABLE ONLY public.facilities
    ADD CONSTRAINT fk_barangay_id FOREIGN KEY (barangay_id) REFERENCES public.barangay(barangay_id);


--
-- TOC entry 3326 (class 2606 OID 17050)
-- Name: evacuation_center fk_facility_id; Type: FK CONSTRAINT; Schema: public; Owner: risk_management_user
--

ALTER TABLE ONLY public.evacuation_center
    ADD CONSTRAINT fk_facility_id FOREIGN KEY (facility_id) REFERENCES public.facilities(facility_id);


--
-- TOC entry 3324 (class 2606 OID 16951)
-- Name: facilities fk_facility_type_id; Type: FK CONSTRAINT; Schema: public; Owner: risk_management_user
--

ALTER TABLE ONLY public.facilities
    ADD CONSTRAINT fk_facility_type_id FOREIGN KEY (facility_type_id) REFERENCES public.facility_type(facility_type_id);


--
-- TOC entry 3322 (class 2606 OID 16915)
-- Name: resident fk_resident_geo_id; Type: FK CONSTRAINT; Schema: public; Owner: risk_management_user
--

ALTER TABLE ONLY public.resident
    ADD CONSTRAINT fk_resident_geo_id FOREIGN KEY (resident_geo_id) REFERENCES public.resident_geo_spatial_data(resident_geo_id);


--
-- TOC entry 3500 (class 0 OID 0)
-- Dependencies: 3499
-- Name: DATABASE db_risk_management; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON DATABASE db_risk_management TO risk_mangement_user;
GRANT ALL ON DATABASE db_risk_management TO risk_management_user;
GRANT ALL ON DATABASE db_risk_management TO admin_3;


-- Completed on 2022-10-30 18:15:49

--
-- PostgreSQL database dump complete
--

