--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: alergy; Type: TABLE; Schema: public; Owner: testeaglesusr; Tablespace:
--

CREATE TABLE alergy (
    id integer NOT NULL,
    name character varying(100),
    description character varying(500)
);


ALTER TABLE alergy OWNER TO testeaglesusr;

--
-- Name: alergy_id_seq; Type: SEQUENCE; Schema: public; Owner: testeaglesusr
--

CREATE SEQUENCE alergy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alergy_id_seq OWNER TO testeaglesusr;

--
-- Name: alergy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: testeaglesusr
--

ALTER SEQUENCE alergy_id_seq OWNED BY alergy.id;


--
-- Name: bed; Type: TABLE; Schema: public; Owner: testeaglesusr; Tablespace:
--

CREATE TABLE bed (
    id integer NOT NULL,
    wardid integer,
    patientid integer,
    beaconid integer
);


ALTER TABLE bed OWNER TO testeaglesusr;

--
-- Name: bed_id_seq; Type: SEQUENCE; Schema: public; Owner: testeaglesusr
--

CREATE SEQUENCE bed_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bed_id_seq OWNER TO testeaglesusr;

--
-- Name: bed_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: testeaglesusr
--

ALTER SEQUENCE bed_id_seq OWNED BY bed.id;


--
-- Name: ibeacon; Type: TABLE; Schema: public; Owner: testeaglesusr; Tablespace:
--

CREATE TABLE ibeacon (
    id integer NOT NULL,
    majorid integer,
    minorid integer
);


ALTER TABLE ibeacon OWNER TO testeaglesusr;

--
-- Name: ibeacon_id_seq; Type: SEQUENCE; Schema: public; Owner: testeaglesusr
--

CREATE SEQUENCE ibeacon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ibeacon_id_seq OWNER TO testeaglesusr;

--
-- Name: ibeacon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: testeaglesusr
--

ALTER SEQUENCE ibeacon_id_seq OWNED BY ibeacon.id;


--
-- Name: medication; Type: TABLE; Schema: public; Owner: testeaglesusr; Tablespace:
--

CREATE TABLE medication (
    id integer NOT NULL,
    name character varying(250),
    description character varying(500)
);


ALTER TABLE medication OWNER TO testeaglesusr;

--
-- Name: medication_id_seq; Type: SEQUENCE; Schema: public; Owner: testeaglesusr
--

CREATE SEQUENCE medication_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE medication_id_seq OWNER TO testeaglesusr;

--
-- Name: medication_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: testeaglesusr
--

ALTER SEQUENCE medication_id_seq OWNED BY medication.id;


--
-- Name: patient; Type: TABLE; Schema: public; Owner: testeaglesusr; Tablespace:
--

CREATE TABLE patient (
    id integer NOT NULL,
    name character varying(100),
    dob timestamp without time zone,
    gender character(1),
    expecteddischargedate timestamp without time zone
);


ALTER TABLE patient OWNER TO testeaglesusr;

--
-- Name: patient_id_seq; Type: SEQUENCE; Schema: public; Owner: testeaglesusr
--

CREATE SEQUENCE patient_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE patient_id_seq OWNER TO testeaglesusr;

--
-- Name: patient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: testeaglesusr
--

ALTER SEQUENCE patient_id_seq OWNED BY patient.id;


--
-- Name: patientalergy; Type: TABLE; Schema: public; Owner: testeaglesusr; Tablespace:
--

CREATE TABLE patientalergy (
    id integer NOT NULL,
    alergyid integer,
    patientid integer,
    severness integer
);


ALTER TABLE patientalergy OWNER TO testeaglesusr;

--
-- Name: patientalergy_id_seq; Type: SEQUENCE; Schema: public; Owner: testeaglesusr
--

CREATE SEQUENCE patientalergy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE patientalergy_id_seq OWNER TO testeaglesusr;

--
-- Name: patientalergy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: testeaglesusr
--

ALTER SEQUENCE patientalergy_id_seq OWNED BY patientalergy.id;


--
-- Name: patientmedication; Type: TABLE; Schema: public; Owner: testeaglesusr; Tablespace:
--

CREATE TABLE patientmedication (
    id integer NOT NULL,
    patientid integer,
    medicationid integer,
    timetotake timestamp without time zone,
    dosage character varying(20)
);


ALTER TABLE patientmedication OWNER TO testeaglesusr;

--
-- Name: patientmedication_id_seq; Type: SEQUENCE; Schema: public; Owner: testeaglesusr
--

CREATE SEQUENCE patientmedication_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE patientmedication_id_seq OWNER TO testeaglesusr;

--
-- Name: patientmedication_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: testeaglesusr
--

ALTER SEQUENCE patientmedication_id_seq OWNED BY patientmedication.id;


--
-- Name: patientnotes; Type: TABLE; Schema: public; Owner: testeaglesusr; Tablespace:
--

CREATE TABLE patientnotes (
    id integer NOT NULL,
    patientid integer,
    note character varying(2000)
);


ALTER TABLE patientnotes OWNER TO testeaglesusr;

--
-- Name: patientnotes_id_seq; Type: SEQUENCE; Schema: public; Owner: testeaglesusr
--

CREATE SEQUENCE patientnotes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE patientnotes_id_seq OWNER TO testeaglesusr;

--
-- Name: patientnotes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: testeaglesusr
--

ALTER SEQUENCE patientnotes_id_seq OWNED BY patientnotes.id;


--
-- Name: patienttest; Type: TABLE; Schema: public; Owner: testeaglesusr; Tablespace:
--

CREATE TABLE patienttest (
    id integer NOT NULL,
    patientid integer,
    type character varying(200),
    description character varying(200),
    iscomplete boolean,
    result character varying(200)
);


ALTER TABLE patienttest OWNER TO testeaglesusr;

--
-- Name: patienttest_id_seq; Type: SEQUENCE; Schema: public; Owner: testeaglesusr
--

CREATE SEQUENCE patienttest_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE patienttest_id_seq OWNER TO testeaglesusr;

--
-- Name: patienttest_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: testeaglesusr
--

ALTER SEQUENCE patienttest_id_seq OWNED BY patienttest.id;


--
-- Name: physicalexam; Type: TABLE; Schema: public; Owner: testeaglesusr; Tablespace:
--

CREATE TABLE physicalexam (
    id integer NOT NULL,
    genapperance character varying(1000),
    eyes character varying(1000),
    earsnosemouth character varying(1000),
    respiratory character varying(1000),
    cardiovascular character varying(1000),
    skin character varying(1000),
    problem character varying(1000),
    patientid integer
);


ALTER TABLE physicalexam OWNER TO testeaglesusr;

--
-- Name: physicalexam_id_seq; Type: SEQUENCE; Schema: public; Owner: testeaglesusr
--

CREATE SEQUENCE physicalexam_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE physicalexam_id_seq OWNER TO testeaglesusr;

--
-- Name: physicalexam_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: testeaglesusr
--

ALTER SEQUENCE physicalexam_id_seq OWNED BY physicalexam.id;


--
-- Name: usr; Type: TABLE; Schema: public; Owner: testeaglesusr; Tablespace:
--

CREATE TABLE usr (
    id integer NOT NULL,
    name character varying(50),
    username character varying(100),
    password character varying(100),
    pin integer
);


ALTER TABLE usr OWNER TO testeaglesusr;

--
-- Name: usr_id_seq; Type: SEQUENCE; Schema: public; Owner: testeaglesusr
--

CREATE SEQUENCE usr_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE usr_id_seq OWNER TO testeaglesusr;

--
-- Name: usr_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: testeaglesusr
--

ALTER SEQUENCE usr_id_seq OWNED BY usr.id;


--
-- Name: ward; Type: TABLE; Schema: public; Owner: testeaglesusr; Tablespace:
--

CREATE TABLE ward (
    id integer NOT NULL,
    location character varying(200)
);


ALTER TABLE ward OWNER TO testeaglesusr;

--
-- Name: ward_id_seq; Type: SEQUENCE; Schema: public; Owner: testeaglesusr
--

CREATE SEQUENCE ward_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ward_id_seq OWNER TO testeaglesusr;

--
-- Name: ward_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: testeaglesusr
--

ALTER SEQUENCE ward_id_seq OWNED BY ward.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: testeaglesusr
--

ALTER TABLE ONLY alergy ALTER COLUMN id SET DEFAULT nextval('alergy_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: testeaglesusr
--

ALTER TABLE ONLY bed ALTER COLUMN id SET DEFAULT nextval('bed_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: testeaglesusr
--

ALTER TABLE ONLY ibeacon ALTER COLUMN id SET DEFAULT nextval('ibeacon_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: testeaglesusr
--

ALTER TABLE ONLY medication ALTER COLUMN id SET DEFAULT nextval('medication_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: testeaglesusr
--

ALTER TABLE ONLY patient ALTER COLUMN id SET DEFAULT nextval('patient_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: testeaglesusr
--

ALTER TABLE ONLY patientalergy ALTER COLUMN id SET DEFAULT nextval('patientalergy_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: testeaglesusr
--

ALTER TABLE ONLY patientmedication ALTER COLUMN id SET DEFAULT nextval('patientmedication_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: testeaglesusr
--

ALTER TABLE ONLY patientnotes ALTER COLUMN id SET DEFAULT nextval('patientnotes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: testeaglesusr
--

ALTER TABLE ONLY patienttest ALTER COLUMN id SET DEFAULT nextval('patienttest_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: testeaglesusr
--

ALTER TABLE ONLY physicalexam ALTER COLUMN id SET DEFAULT nextval('physicalexam_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: testeaglesusr
--

ALTER TABLE ONLY usr ALTER COLUMN id SET DEFAULT nextval('usr_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: testeaglesusr
--

ALTER TABLE ONLY ward ALTER COLUMN id SET DEFAULT nextval('ward_id_seq'::regclass);


--
-- Data for Name: alergy; Type: TABLE DATA; Schema: public; Owner: testeaglesusr
--

COPY alergy (id, name, description) FROM stdin;
1	cats	runny eyes n shit
2	flowers	Itching
3	penacillin	convulsing
4	nuts	choking
5	Latex	rashing
\.


--
-- Name: alergy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: testeaglesusr
--

SELECT pg_catalog.setval('alergy_id_seq', 5, true);


--
-- Data for Name: bed; Type: TABLE DATA; Schema: public; Owner: testeaglesusr
--

COPY bed (id, wardid, patientid, beaconid) FROM stdin;
1	1	1	1
2	3	2	4
3	6	6	2
4	4	3	5
5	2	4	3
\.


--
-- Name: bed_id_seq; Type: SEQUENCE SET; Schema: public; Owner: testeaglesusr
--

SELECT pg_catalog.setval('bed_id_seq', 5, true);


--
-- Data for Name: ibeacon; Type: TABLE DATA; Schema: public; Owner: testeaglesusr
--

COPY ibeacon (id, majorid, minorid) FROM stdin;
1	12345	1223
2	392349	23943
3	329429	20032
4	202301	20320
5	230022	54030
\.


--
-- Name: ibeacon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: testeaglesusr
--

SELECT pg_catalog.setval('ibeacon_id_seq', 5, true);


--
-- Data for Name: medication; Type: TABLE DATA; Schema: public; Owner: testeaglesusr
--

COPY medication (id, name, description) FROM stdin;
3	Penacillin	Helps infections
4	Fluxacillin	Helps severe infections
2	Steroids	For immune systems
1	ran out of names	ran out of desc
\.


--
-- Name: medication_id_seq; Type: SEQUENCE SET; Schema: public; Owner: testeaglesusr
--

SELECT pg_catalog.setval('medication_id_seq', 4, true);


--
-- Data for Name: patient; Type: TABLE DATA; Schema: public; Owner: testeaglesusr
--

COPY patient (id, name, dob, gender, expecteddischargedate) FROM stdin;
1	alex	2015-04-01 14:49:26	m	2015-04-18 17:19:54
2	Jeff	1988-04-10 00:00:00	m	2014-04-13 00:00:00
6	MAX POWER	1920-05-05 00:00:00	m	2015-10-20 00:00:00
4	Lexington Bellen	1989-02-15 00:00:00	f	2015-04-21 00:00:00
5	Sashie Gray	1992-10-23 00:00:00	f	2015-05-05 00:00:00
3	Rachelle Storr	1992-04-12 00:00:00	f	2015-07-10 00:00:00
\.


--
-- Name: patient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: testeaglesusr
--

SELECT pg_catalog.setval('patient_id_seq', 6, true);


--
-- Data for Name: patientalergy; Type: TABLE DATA; Schema: public; Owner: testeaglesusr
--

COPY patientalergy (id, alergyid, patientid, severness) FROM stdin;
1	1	1	4
3	4	4	5
6	2	4	2
5	3	4	1
2	2	1	2
4	5	4	4
7	2	1	5
\.


--
-- Name: patientalergy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: testeaglesusr
--

SELECT pg_catalog.setval('patientalergy_id_seq', 7, true);


--
-- Data for Name: patientmedication; Type: TABLE DATA; Schema: public; Owner: testeaglesusr
--

COPY patientmedication (id, patientid, medicationid, timetotake, dosage) FROM stdin;
1	1	1	2015-04-08 16:01:15	10ML
2	1	2	2015-04-08 16:59:42	50ML
5	4	3	2015-04-14 23:47:21	5ML
4	4	2	2015-04-16 23:47:56	15ML
3	4	4	2015-04-23 23:48:02	20ML
\.


--
-- Name: patientmedication_id_seq; Type: SEQUENCE SET; Schema: public; Owner: testeaglesusr
--

SELECT pg_catalog.setval('patientmedication_id_seq', 5, true);


--
-- Data for Name: patientnotes; Type: TABLE DATA; Schema: public; Owner: testeaglesusr
--

COPY patientnotes (id, patientid, note) FROM stdin;
1	1	beauty
2	4	Guy has severe eye fluttering
3	4	Laboured breathing
4	4	yellowish skin tint
5	4	pain around abdomen
6	1	Chesty coughs
7	1	Dialated pupils
8	1	Swollen tongue, red and sore throat
\.


--
-- Name: patientnotes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: testeaglesusr
--

SELECT pg_catalog.setval('patientnotes_id_seq', 8, true);


--
-- Data for Name: patienttest; Type: TABLE DATA; Schema: public; Owner: testeaglesusr
--

COPY patienttest (id, patientid, type, description, iscomplete, result) FROM stdin;
1	1	Bloods	Get his bloods	t	great
2	4	Dye	Dye test for circulatory system	f	\N
3	4	CAT SCAN	tumors	f	\N
4	4	colonoscopy	checking for bum grapes	t	plums found
5	4	prostate exam	Routine checkup	f	All good
6	1	Eye exam	Clouding of irish needs investigated	f	\N
7	1	Blood Pressure	Dudes raging	f	\N
\.


--
-- Name: patienttest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: testeaglesusr
--

SELECT pg_catalog.setval('patienttest_id_seq', 7, true);


--
-- Data for Name: physicalexam; Type: TABLE DATA; Schema: public; Owner: testeaglesusr
--

COPY physicalexam (id, genapperance, eyes, earsnosemouth, respiratory, cardiovascular, skin, problem, patientid) FROM stdin;
1	Frail	blue eyes	ears	respire	heat	exzema	problem	1
2	Yellow	Pale Grey	Mucus mouth	Crackly	sexy	okay	liver	1
3	GREY	BLUE	white	none	none	cold	WhiteWalker	4
4	SWOLLEN	SWOLLEN	SWOLLEN	SWOLLEN	SWOLLEN	SWOLLEN	SWOLLEN	4
\.


--
-- Name: physicalexam_id_seq; Type: SEQUENCE SET; Schema: public; Owner: testeaglesusr
--

SELECT pg_catalog.setval('physicalexam_id_seq', 4, true);


--
-- Data for Name: usr; Type: TABLE DATA; Schema: public; Owner: testeaglesusr
--

COPY usr (id, name, username, password, pin) FROM stdin;
1	Alex	testeaglesusr	password	1234
2	Steven	steven	password	1234
3	Kris	kris	password	1234
4	Ryan	ryan	password	1234
\.


--
-- Name: usr_id_seq; Type: SEQUENCE SET; Schema: public; Owner: testeaglesusr
--

SELECT pg_catalog.setval('usr_id_seq', 4, true);


--
-- Data for Name: ward; Type: TABLE DATA; Schema: public; Owner: testeaglesusr
--

COPY ward (id, location) FROM stdin;
1	3E
2	1W
3	2NE
4	1NW
5	1NE
6	4SW
7	3S
\.


--
-- Name: ward_id_seq; Type: SEQUENCE SET; Schema: public; Owner: testeaglesusr
--

SELECT pg_catalog.setval('ward_id_seq', 7, true);


--
-- Name: alergy_pkey; Type: CONSTRAINT; Schema: public; Owner: testeaglesusr; Tablespace:
--

ALTER TABLE ONLY alergy
    ADD CONSTRAINT alergy_pkey PRIMARY KEY (id);


--
-- Name: bed_pkey; Type: CONSTRAINT; Schema: public; Owner: testeaglesusr; Tablespace:
--

ALTER TABLE ONLY bed
    ADD CONSTRAINT bed_pkey PRIMARY KEY (id);


--
-- Name: ibeacon_pkey; Type: CONSTRAINT; Schema: public; Owner: testeaglesusr; Tablespace:
--

ALTER TABLE ONLY ibeacon
    ADD CONSTRAINT ibeacon_pkey PRIMARY KEY (id);


--
-- Name: medication_pkey; Type: CONSTRAINT; Schema: public; Owner: testeaglesusr; Tablespace:
--

ALTER TABLE ONLY medication
    ADD CONSTRAINT medication_pkey PRIMARY KEY (id);


--
-- Name: patient_pkey; Type: CONSTRAINT; Schema: public; Owner: testeaglesusr; Tablespace:
--

ALTER TABLE ONLY patient
    ADD CONSTRAINT patient_pkey PRIMARY KEY (id);


--
-- Name: patientalergy_pkey; Type: CONSTRAINT; Schema: public; Owner: testeaglesusr; Tablespace:
--

ALTER TABLE ONLY patientalergy
    ADD CONSTRAINT patientalergy_pkey PRIMARY KEY (id);


--
-- Name: patientmedication_pkey; Type: CONSTRAINT; Schema: public; Owner: testeaglesusr; Tablespace:
--

ALTER TABLE ONLY patientmedication
    ADD CONSTRAINT patientmedication_pkey PRIMARY KEY (id);


--
-- Name: patientnotes_pkey; Type: CONSTRAINT; Schema: public; Owner: testeaglesusr; Tablespace:
--

ALTER TABLE ONLY patientnotes
    ADD CONSTRAINT patientnotes_pkey PRIMARY KEY (id);


--
-- Name: patienttest_pkey; Type: CONSTRAINT; Schema: public; Owner: testeaglesusr; Tablespace:
--

ALTER TABLE ONLY patienttest
    ADD CONSTRAINT patienttest_pkey PRIMARY KEY (id);


--
-- Name: physicalexam_pkey; Type: CONSTRAINT; Schema: public; Owner: testeaglesusr; Tablespace:
--

ALTER TABLE ONLY physicalexam
    ADD CONSTRAINT physicalexam_pkey PRIMARY KEY (id);


--
-- Name: usr_pkey; Type: CONSTRAINT; Schema: public; Owner: testeaglesusr; Tablespace:
--

ALTER TABLE ONLY usr
    ADD CONSTRAINT usr_pkey PRIMARY KEY (id);


--
-- Name: ward_pkey; Type: CONSTRAINT; Schema: public; Owner: testeaglesusr; Tablespace:
--

ALTER TABLE ONLY ward
    ADD CONSTRAINT ward_pkey PRIMARY KEY (id);


--
-- Name: bed_beacon; Type: FK CONSTRAINT; Schema: public; Owner: testeaglesusr
--

ALTER TABLE ONLY bed
    ADD CONSTRAINT bed_beacon FOREIGN KEY (beaconid) REFERENCES ibeacon(id);


--
-- Name: bed_patient; Type: FK CONSTRAINT; Schema: public; Owner: testeaglesusr
--

ALTER TABLE ONLY bed
    ADD CONSTRAINT bed_patient FOREIGN KEY (patientid) REFERENCES patient(id);


--
-- Name: fk_bed_ward; Type: FK CONSTRAINT; Schema: public; Owner: testeaglesusr
--

ALTER TABLE ONLY bed
    ADD CONSTRAINT fk_bed_ward FOREIGN KEY (wardid) REFERENCES ward(id);


--
-- Name: fk_exam_patient; Type: FK CONSTRAINT; Schema: public; Owner: testeaglesusr
--

ALTER TABLE ONLY physicalexam
    ADD CONSTRAINT fk_exam_patient FOREIGN KEY (patientid) REFERENCES patient(id);


--
-- Name: fk_patient_notes; Type: FK CONSTRAINT; Schema: public; Owner: testeaglesusr
--

ALTER TABLE ONLY patientnotes
    ADD CONSTRAINT fk_patient_notes FOREIGN KEY (patientid) REFERENCES patient(id);


--
-- Name: fk_patient_test; Type: FK CONSTRAINT; Schema: public; Owner: testeaglesusr
--

ALTER TABLE ONLY patienttest
    ADD CONSTRAINT fk_patient_test FOREIGN KEY (patientid) REFERENCES patient(id);


--
-- Name: fk_patientalergy_alergy; Type: FK CONSTRAINT; Schema: public; Owner: testeaglesusr
--

ALTER TABLE ONLY patientalergy
    ADD CONSTRAINT fk_patientalergy_alergy FOREIGN KEY (alergyid) REFERENCES alergy(id);


--
-- Name: fk_patientalergy_patient; Type: FK CONSTRAINT; Schema: public; Owner: testeaglesusr
--

ALTER TABLE ONLY patientalergy
    ADD CONSTRAINT fk_patientalergy_patient FOREIGN KEY (patientid) REFERENCES patient(id);


--
-- Name: fk_patientmedication_medication; Type: FK CONSTRAINT; Schema: public; Owner: testeaglesusr
--

ALTER TABLE ONLY patientmedication
    ADD CONSTRAINT fk_patientmedication_medication FOREIGN KEY (medicationid) REFERENCES medication(id);


--
-- Name: fk_patientmedication_patient; Type: FK CONSTRAINT; Schema: public; Owner: testeaglesusr
--

ALTER TABLE ONLY patientmedication
    ADD CONSTRAINT fk_patientmedication_patient FOREIGN KEY (patientid) REFERENCES patient(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: testeaglesusr
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM testeaglesusr;
GRANT ALL ON SCHEMA public TO testeaglesusr;
GRANT ALL ON SCHEMA public TO testeaglesusr;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--
