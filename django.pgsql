--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
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

--
-- Name: accounts_contact_information_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE accounts_contact_information_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_contact_information_id_seq OWNER TO django;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: accounts_contact_information; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE accounts_contact_information (
    id integer DEFAULT nextval('accounts_contact_information_id_seq'::regclass) NOT NULL,
    phone character varying(100) DEFAULT NULL::character varying,
    office character varying(200) DEFAULT NULL::character varying,
    email character varying(150) DEFAULT NULL::character varying,
    github character varying(50),
    bitbucket character varying(50)
);


ALTER TABLE public.accounts_contact_information OWNER TO django;

--
-- Name: accounts_days_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE accounts_days_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_days_id_seq OWNER TO django;

--
-- Name: accounts_days; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE accounts_days (
    id integer DEFAULT nextval('accounts_days_id_seq'::regclass) NOT NULL,
    days character varying(20) NOT NULL,
    from_time time without time zone NOT NULL,
    to_time time without time zone NOT NULL,
    contact_id integer NOT NULL
);


ALTER TABLE public.accounts_days OWNER TO django;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO django;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE auth_group (
    id integer DEFAULT nextval('auth_group_id_seq'::regclass) NOT NULL,
    name character varying(160) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO django;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO django;

--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer DEFAULT nextval('auth_group_permissions_id_seq'::regclass) NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO django;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO django;

--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer DEFAULT nextval('auth_permission_id_seq'::regclass) NOT NULL,
    name character varying(100) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(200) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO django;

--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO django;

--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE auth_user (
    id integer DEFAULT nextval('auth_user_id_seq'::regclass) NOT NULL,
    username character varying(60) NOT NULL,
    first_name character varying(60) NOT NULL,
    last_name character varying(60) NOT NULL,
    email character varying(150) NOT NULL,
    password character varying(256) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    is_superuser boolean NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO django;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO django;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer DEFAULT nextval('auth_user_groups_id_seq'::regclass) NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO django;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO django;

--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass) NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO django;

--
-- Name: captcha_captchastore_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE captcha_captchastore_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.captcha_captchastore_id_seq OWNER TO django;

--
-- Name: captcha_captchastore; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE captcha_captchastore (
    id integer DEFAULT nextval('captcha_captchastore_id_seq'::regclass) NOT NULL,
    challenge character varying(64) NOT NULL,
    response character varying(64) NOT NULL,
    hashkey character varying(80) NOT NULL,
    expiration timestamp with time zone NOT NULL
);


ALTER TABLE public.captcha_captchastore OWNER TO django;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO django;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer DEFAULT nextval('django_admin_log_id_seq'::regclass) NOT NULL,
    action_time timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    content_type_id integer,
    object_id text,
    object_repr character varying(400) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL
);


ALTER TABLE public.django_admin_log OWNER TO django;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO django;

--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer DEFAULT nextval('django_content_type_id_seq'::regclass) NOT NULL,
    name character varying(200) NOT NULL,
    app_label character varying(200) NOT NULL,
    model character varying(200) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO django;

--
-- Name: django_session; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(80) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO django;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO django;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE django_site (
    id integer DEFAULT nextval('django_site_id_seq'::regclass) NOT NULL,
    domain character varying(200) NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.django_site OWNER TO django;

--
-- Name: labs_class_section_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE labs_class_section_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.labs_class_section_id_seq OWNER TO django;

--
-- Name: labs_class_section; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE labs_class_section (
    id integer DEFAULT nextval('labs_class_section_id_seq'::regclass) NOT NULL,
    day character varying(20) NOT NULL,
    "time" time without time zone NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL,
    section_number integer NOT NULL,
    syllabus character varying(200) DEFAULT NULL::character varying,
    room character varying(40) DEFAULT NULL::character varying,
    style character varying(100)
);


ALTER TABLE public.labs_class_section OWNER TO django;

--
-- Name: labs_lab_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE labs_lab_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.labs_lab_id_seq OWNER TO django;

--
-- Name: labs_lab; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE labs_lab (
    id integer DEFAULT nextval('labs_lab_id_seq'::regclass) NOT NULL,
    number integer NOT NULL,
    title text NOT NULL,
    description text NOT NULL,
    labfile character varying(200) DEFAULT NULL::character varying,
    class_section_id integer NOT NULL,
    visible boolean NOT NULL,
    date date,
    adminfile character varying(200),
    solution_visible boolean NOT NULL
);


ALTER TABLE public.labs_lab OWNER TO django;

--
-- Name: labs_quote_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE labs_quote_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.labs_quote_id_seq OWNER TO django;

--
-- Name: labs_quote; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE labs_quote (
    id integer DEFAULT nextval('labs_quote_id_seq'::regclass) NOT NULL,
    text text,
    author character varying(200) DEFAULT NULL::character varying
);


ALTER TABLE public.labs_quote OWNER TO django;

--
-- Name: labs_section_link_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE labs_section_link_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.labs_section_link_id_seq OWNER TO django;

--
-- Name: labs_section_link; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE labs_section_link (
    id integer DEFAULT nextval('labs_section_link_id_seq'::regclass) NOT NULL,
    url character varying(600) DEFAULT NULL::character varying,
    title character varying(100) DEFAULT NULL::character varying,
    section_id integer
);


ALTER TABLE public.labs_section_link OWNER TO django;

--
-- Name: my_calendar_entry_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE my_calendar_entry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.my_calendar_entry_id_seq OWNER TO django;

--
-- Name: my_calendar_entry; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE my_calendar_entry (
    id integer DEFAULT nextval('my_calendar_entry_id_seq'::regclass) NOT NULL,
    title character varying(80) NOT NULL,
    snippet character varying(300) NOT NULL,
    body text NOT NULL,
    created timestamp with time zone NOT NULL,
    date date NOT NULL,
    creator_id integer,
    remind boolean NOT NULL
);


ALTER TABLE public.my_calendar_entry OWNER TO django;

--
-- Name: projects_project_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE projects_project_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_project_id_seq OWNER TO django;

--
-- Name: projects_project; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE projects_project (
    id integer DEFAULT nextval('projects_project_id_seq'::regclass) NOT NULL,
    title character varying(400) NOT NULL,
    shortdescription character varying(400) NOT NULL,
    fulldescription text NOT NULL,
    binaryfile character varying(200) DEFAULT NULL::character varying,
    sourcefile character varying(200) DEFAULT NULL::character varying,
    language character varying(40) NOT NULL,
    classification character varying(16) NOT NULL,
    created_date timestamp with time zone NOT NULL
);


ALTER TABLE public.projects_project OWNER TO django;

--
-- Name: projects_screenshots_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE projects_screenshots_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_screenshots_id_seq OWNER TO django;

--
-- Name: projects_screenshots; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE projects_screenshots (
    id integer DEFAULT nextval('projects_screenshots_id_seq'::regclass) NOT NULL,
    project_id integer NOT NULL,
    image character varying(200) NOT NULL
);


ALTER TABLE public.projects_screenshots OWNER TO django;

--
-- Name: registration_registrationprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE registration_registrationprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.registration_registrationprofile_id_seq OWNER TO django;

--
-- Name: registration_registrationprofile; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE registration_registrationprofile (
    id integer DEFAULT nextval('registration_registrationprofile_id_seq'::regclass) NOT NULL,
    user_id integer NOT NULL,
    activation_key character varying(80) NOT NULL
);


ALTER TABLE public.registration_registrationprofile OWNER TO django;

--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE south_migrationhistory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.south_migrationhistory_id_seq OWNER TO django;

--
-- Name: south_migrationhistory; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE south_migrationhistory (
    id integer DEFAULT nextval('south_migrationhistory_id_seq'::regclass) NOT NULL,
    app_name character varying(510) NOT NULL,
    migration character varying(510) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.south_migrationhistory OWNER TO django;

--
-- Data for Name: accounts_contact_information; Type: TABLE DATA; Schema: public; Owner: django
--

COPY accounts_contact_information (id, phone, office, email, github, bitbucket) FROM stdin;
1	(512) 981-7659	7H-019	jared@jared-wallace.com	https://github.com/jared-wallace	https://bitbucket.org/jared-wallace
\.


--
-- Name: accounts_contact_information_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('accounts_contact_information_id_seq', 1, true);


--
-- Data for Name: accounts_days; Type: TABLE DATA; Schema: public; Owner: django
--

COPY accounts_days (id, days, from_time, to_time, contact_id) FROM stdin;
1	Monday	07:30:00	03:30:00	1
2	Tuesday	07:30:00	03:30:00	1
3	Wednesday	07:30:00	03:30:00	1
4	Thursday	07:30:00	03:30:00	1
5	Friday	07:30:00	03:30:00	1
\.


--
-- Name: accounts_days_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('accounts_days_id_seq', 5, true);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: django
--

COPY auth_group (id, name) FROM stdin;
1	Lab Students
2	labstaff
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('auth_group_id_seq', 2, true);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: django
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: django
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can add group	2	add_group
5	Can change group	2	change_group
6	Can delete group	2	delete_group
7	Can add user	3	add_user
8	Can change user	3	change_user
9	Can delete user	3	delete_user
10	Can add content type	4	add_contenttype
11	Can change content type	4	change_contenttype
12	Can delete content type	4	delete_contenttype
13	Can add session	5	add_session
14	Can change session	5	change_session
15	Can delete session	5	delete_session
16	Can add site	6	add_site
17	Can change site	6	change_site
18	Can delete site	6	delete_site
19	Can add log entry	7	add_logentry
20	Can change log entry	7	change_logentry
21	Can delete log entry	7	delete_logentry
22	Can add project	8	add_project
23	Can change project	8	change_project
24	Can delete project	8	delete_project
25	Can add migration history	9	add_migrationhistory
26	Can change migration history	9	change_migrationhistory
27	Can delete migration history	9	delete_migrationhistory
31	Can add post	11	add_post
32	Can change post	11	change_post
33	Can delete post	11	delete_post
34	Can add comment	12	add_comment
35	Can change comment	12	change_comment
36	Can delete comment	12	delete_comment
37	Can add screenshots	13	add_screenshots
38	Can change screenshots	13	change_screenshots
39	Can delete screenshots	13	delete_screenshots
40	Can add entry	14	add_entry
41	Can change entry	14	change_entry
42	Can delete entry	14	delete_entry
43	Can add entry	15	add_entry
44	Can change entry	15	change_entry
45	Can delete entry	15	delete_entry
46	Can add entry	16	add_entry
47	Can change entry	16	change_entry
48	Can delete entry	16	delete_entry
49	Can add class_ section	17	add_class_section
50	Can change class_ section	17	change_class_section
51	Can delete class_ section	17	delete_class_section
52	Can add lab	18	add_lab
53	Can change lab	18	change_lab
54	Can delete lab	18	delete_lab
55	Can add Contact Information	19	add_contact_information
56	Can change Contact Information	19	change_contact_information
57	Can delete Contact Information	19	delete_contact_information
58	Can add days	20	add_days
59	Can change days	20	change_days
60	Can delete days	20	delete_days
61	Can add Quote	21	add_quote
62	Can change Quote	21	change_quote
63	Can delete Quote	21	delete_quote
64	Can add registration profile	22	add_registrationprofile
65	Can change registration profile	22	change_registrationprofile
66	Can delete registration profile	22	delete_registrationprofile
67	Can add captcha store	23	add_captchastore
68	Can change captcha store	23	change_captchastore
69	Can delete captcha store	23	delete_captchastore
70	Can add Link	24	add_section_link
71	Can change Link	24	change_section_link
72	Can delete Link	24	delete_section_link
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('auth_permission_id_seq', 72, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: django
--

COPY auth_user (id, username, first_name, last_name, email, password, is_staff, is_active, is_superuser, last_login, date_joined) FROM stdin;
2	jwallace	Jared	Wallace	jared.lee.wallace@gmail.com	pbkdf2_sha256$12000$xp7Y30RM7A4P$dl0U+qA5u86Nos7JYCV7/Skz0sfDcEXvpOR8y1PgepU=	t	t	t	2014-08-15 19:36:49-05	2014-07-24 18:18:13-05
8	jared	Jared	Wallace	jared@jared-wallace.com	pbkdf2_sha256$30000$CkdOH9hdB5SL$gMOJdrfLORt8eDMpk24jWDhxZ2rgxH9aOgcOr55tCQM=	t	t	t	2017-06-14 12:49:03.860353-05	2015-01-14 11:25:09-06
1	wallace	Jared	Wallace	jared.lee.wallace@gmail.com	pbkdf2_sha256$30000$uAOybqFLARgW$L7KqQaw1w2BpKK9OBZHCpRB+pZcRYCe/1o2XlMf7NSk=	t	t	t	2017-08-30 10:30:33.893966-05	2014-04-11 14:48:46-05
4	dennis	Dennis	Porter	dennis@cs.txstate.edu	pbkdf2_sha256$12000$4DNQ7Xem7vNE$xGCg/DmLCpg2lwquEbrzPXmXYXc4oFUOhc/63dWbgg8=	f	t	f	2014-11-13 10:52:00.719618-06	2014-08-15 15:53:14-05
7	tester			wallace@jared-wallace.com	pbkdf2_sha256$12000$Xgg34OMLvSRv$kQqmYo8wwcIjZrinPgkh6hF+GuB4wJvBH2cHxOVxjDQ=	f	t	f	2014-08-15 19:00:59-05	2014-08-15 18:54:24-05
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: django
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
4	1	2
1	2	2
3	4	2
5	8	2
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 5, true);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('auth_user_id_seq', 11, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: django
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: captcha_captchastore; Type: TABLE DATA; Schema: public; Owner: django
--

COPY captcha_captchastore (id, challenge, response, hashkey, expiration) FROM stdin;
\.


--
-- Name: captcha_captchastore_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('captcha_captchastore_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: django
--

COPY django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) FROM stdin;
1	2014-04-11 17:11:30-05	1	8	1	Project object	1	
2	2014-04-11 22:22:36-05	1	8	1	Project object	3	
3	2014-04-11 22:28:11-05	1	8	2	Project object	3	
4	2014-04-11 22:34:44-05	1	8	6	Project object	1	
5	2014-04-11 22:34:56-05	1	8	6	Project object	3	
6	2014-04-11 22:34:56-05	1	8	5	Project object	3	
7	2014-04-11 22:34:56-05	1	8	4	Project object	3	
8	2014-04-11 22:34:56-05	1	8	3	Project object	3	
9	2014-04-11 22:35:34-05	1	8	7	Project object	1	
11	2014-04-12 23:36:37-05	1	8	8	Project object	1	
12	2014-04-13 03:44:55-05	1	8	St.Somewhere	St.Somewhere	1	
13	2014-04-13 03:50:18-05	1	8	1	St.Somewhere	1	
14	2014-04-13 04:06:11-05	1	8	2	Game of Life	1	
15	2014-04-13 04:08:10-05	1	8	3	Deal or No Deal	1	
16	2014-04-13 04:11:22-05	1	8	4	Custom Assembler	1	
17	2014-04-13 04:26:43-05	1	8	5	University Netboot	1	
18	2014-04-13 04:33:10-05	1	8	5	University Netboot	2	Changed fulldescription.
19	2014-04-13 04:33:32-05	1	8	5	University Netboot	2	Changed fulldescription.
20	2014-04-13 04:33:58-05	1	8	5	University Netboot	2	Changed fulldescription.
21	2014-05-25 05:04:43-05	1	8	5	University Netboot	2	Changed classification.
22	2014-05-25 05:04:49-05	1	8	4	Custom Assembler	2	Changed classification.
23	2014-05-25 05:04:55-05	1	8	3	Deal or No Deal	2	Changed classification.
24	2014-05-25 05:05:01-05	1	8	2	Game of Life	2	Changed classification.
25	2014-05-25 05:05:07-05	1	8	1	St.Somewhere	2	Changed classification.
26	2014-05-25 13:17:42-05	1	3	1	wallace	2	Changed password, first_name and last_name.
27	2014-05-25 15:13:37-05	1	8	6	Personal webpage	1	
28	2014-05-25 17:02:13-05	1	8	5	University Netboot	2	Changed created_date.
29	2014-05-25 17:02:42-05	1	8	4	Custom Assembler	2	Changed created_date.
30	2014-05-25 17:03:06-05	1	8	3	Deal or No Deal	2	Changed created_date.
31	2014-05-25 17:03:25-05	1	8	2	Game of Life	2	Changed created_date.
32	2014-05-25 17:03:40-05	1	8	1	St.Somewhere	2	Changed created_date.
33	2014-05-25 17:27:00-05	1	8	3	Deal or No Deal	2	Added screenshots "Screenshots object". Added screenshots "Screenshots object". Added screenshots "Screenshots object".
34	2014-05-25 18:04:10-05	1	8	2	Game of Life	2	Added screenshots "Screenshots object". Added screenshots "Screenshots object". Added screenshots "Screenshots object".
35	2014-05-25 18:05:25-05	1	8	1	St.Somewhere	2	Added screenshots "Screenshots object". Added screenshots "Screenshots object". Added screenshots "Screenshots object".
36	2014-05-25 18:17:49-05	1	8	7	University webpage	1	
37	2014-05-25 18:25:26-05	1	8	7	University Webpage	2	Changed title and sourcefile.
38	2014-05-25 18:25:51-05	1	8	7	University Webpage	2	Changed sourcefile. Added screenshots "Screenshots object". Added screenshots "Screenshots object".
39	2014-05-25 18:25:59-05	1	8	6	Personal Webpage	2	Changed title.
40	2014-05-27 00:42:10-05	1	14	1	wallace - Test Title	1	
41	2014-05-29 12:56:55-05	1	8	7	University Webpage	2	Changed fulldescription.
42	2014-06-17 19:21:10-05	1	8	7	University Webpage	2	Added screenshots "Screenshots object".
43	2014-07-18 23:17:48-05	1	8	5	University Netboot	2	Changed fulldescription.
44	2014-07-24 20:02:48-05	2	17	1	Fundamentals of Computer Science I (Honors)	1	
45	2014-07-24 20:46:23-05	2	18	1	Introduction to the development environment	1	
46	2014-07-25 16:12:31-05	2	18	1	Introduction to the development environment	2	Changed visible.
47	2014-07-25 18:02:16-05	2	17	3	Embedded Computer Systems	1	
48	2014-07-25 18:02:24-05	2	18	2	Introduction to embedded systems programming	1	
49	2014-07-25 18:04:16-05	2	18	3	First Embedded Program	1	
50	2014-07-25 18:11:20-05	2	18	4	Radio Communication	1	
51	2014-07-25 18:13:37-05	2	17	3	Embedded Computer Systems	2	Changed description.
52	2014-07-25 18:14:43-05	2	17	3	Embedded Computer Systems	2	Changed description.
53	2014-07-25 18:20:51-05	2	17	1	Fundamentals of Computer Science I (Honors)	2	Changed room.
54	2014-07-25 18:21:02-05	2	17	3	Embedded Computer Systems	2	Changed room.
55	2014-07-25 18:21:14-05	2	17	2	Foundations of Computer Science I	2	Changed room.
56	2014-07-25 20:10:30-05	2	18	5	Homemade Assembler, the beginning of a beautiful friendship	1	
57	2014-07-25 20:10:58-05	2	18	5	Homemade Assembler	2	Changed title.
58	2014-07-25 20:11:07-05	2	18	5	Homemade Assembler, Part 1	2	Changed title.
59	2014-07-25 21:17:00-05	2	18	6	A Simple Calculator	1	
60	2014-07-25 21:58:43-05	2	18	7	Fun and Games	1	
61	2014-07-25 23:12:17-05	1	21	1	Linus Torvalds	1	
62	2014-07-25 23:13:30-05	1	21	2	John Fitzgerald Kennedy	1	
63	2014-07-25 23:14:32-05	1	21	3	Joseph Campbell	1	
64	2014-07-25 23:15:03-05	1	21	4	Steve Wozniak	1	
65	2014-07-25 23:49:22-05	1	21	5	Jef Raskin	1	
66	2014-07-25 23:50:00-05	1	21	6	Bruce Schneier	1	
67	2014-07-25 23:50:30-05	1	21	7	Mike Royko	1	
68	2014-07-25 23:55:10-05	1	21	8	Linus Torvalds	1	
69	2014-07-25 23:55:56-05	1	21	9	Linus Torvalds	1	
70	2014-07-25 23:56:50-05	1	21	10	Linus Torvalds	1	
71	2014-07-28 20:53:48-05	2	18	8	Homemade Assembler, Part 2	1	
72	2014-07-29 18:01:27-05	2	21	10	Linus Torvalds	2	Changed text.
73	2014-07-30 17:45:57-05	2	18	9	Homemade Assembler, Part 3	1	
74	2014-07-30 17:47:08-05	2	18	10	Conway's Game of Life	1	
75	2014-07-30 17:48:40-05	2	18	1	Introduction to the Development Environment	2	Changed title.
76	2014-07-31 18:49:39-05	2	18	4	Radio Communication	2	Changed labfile.
77	2014-08-01 20:31:23-05	2	18	11	Homemade Assembler, Part 4	1	
78	2014-08-04 16:45:31-05	2	18	5	Homemade Assembler, Part 1	2	Changed labfile.
79	2014-08-04 16:46:23-05	2	18	8	Homemade Assembler, Part 2	2	Changed labfile.
80	2014-08-04 18:34:39-05	2	18	9	Homemade Assembler, Part 3	2	Changed labfile.
81	2014-08-04 18:36:50-05	2	18	9	Homemade Assembler, Part 3	2	Changed labfile.
82	2014-08-04 18:53:01-05	2	18	11	Homemade Assembler, Part 4	2	Changed labfile.
83	2014-08-04 21:22:54-05	2	18	12	Homemade Assembler, Part 5	1	
84	2014-08-05 16:25:05-05	1	2	1	Lab Students	1	
85	2014-08-05 22:10:34-05	1	6	1	jared-wallace.com	2	Changed domain and name.
86	2014-08-07 19:42:22-05	2	18	13	Sensors, Part 1	1	
87	2014-08-08 18:54:42-05	2	8	7	University Webpage	2	Changed fulldescription.
88	2014-08-08 19:10:14-05	2	8	5	University Netboot	2	Changed fulldescription.
89	2014-08-08 19:21:54-05	2	8	5	University Netboot	2	Changed sourcefile.
90	2014-08-08 20:34:19-05	2	18	14	Play That Funky Music	1	
91	2014-08-09 15:00:53-05	1	16	1	wallace - Test	1	
92	2014-08-09 15:04:23-05	1	16	1	wallace - Test	3	
93	2014-08-09 15:05:27-05	1	16	2	wallace - First day of class	1	
94	2014-08-09 15:06:20-05	1	16	2	wallace - Notice	2	Changed title and snippet.
95	2014-08-09 15:07:16-05	1	16	3	wallace - Notice	1	
96	2014-08-09 15:07:56-05	1	16	4	wallace - Notice	1	
97	2014-08-09 15:08:43-05	1	16	5	wallace - Holiday	1	
98	2014-08-09 15:09:09-05	1	16	6	wallace - Holiday	1	
99	2014-08-09 15:09:25-05	1	16	7	wallace - Holiday	1	
100	2014-08-09 15:09:53-05	1	16	8	wallace - Notice	1	
101	2014-08-09 15:10:41-05	1	16	9	wallace - Notice	1	
102	2014-08-09 15:11:23-05	1	16	10	wallace - Notice	1	
103	2014-08-09 15:12:29-05	1	16	10	wallace - Finals	2	Changed title and snippet.
104	2014-08-09 15:12:38-05	1	16	9	wallace - Dead	2	Changed title.
105	2014-08-09 15:13:14-05	1	16	11	wallace - Finals	1	
106	2014-08-09 15:13:27-05	1	16	12	wallace - Finals	1	
107	2014-08-09 15:13:38-05	1	16	13	wallace - Finals	1	
108	2014-08-09 15:13:49-05	1	16	14	wallace - Finals	1	
109	2014-08-09 15:15:09-05	1	16	10	wallace - Finals	2	Changed body.
110	2014-08-09 15:16:17-05	1	16	10	wallace - Finals	2	Changed body.
111	2014-08-09 15:16:40-05	1	16	11	wallace - Finals	2	Changed body.
112	2014-08-09 15:16:46-05	1	16	12	wallace - Finals	2	Changed body.
113	2014-08-09 15:16:51-05	1	16	13	wallace - Finals	2	Changed body.
114	2014-08-09 15:16:55-05	1	16	14	wallace - Finals	2	Changed body.
115	2014-08-09 15:17:08-05	1	16	10	wallace - Finals	2	Changed snippet.
116	2014-08-09 15:17:13-05	1	16	12	wallace - Finals	2	Changed snippet.
117	2014-08-09 15:17:18-05	1	16	11	wallace - Finals	2	Changed snippet.
118	2014-08-09 15:17:22-05	1	16	13	wallace - Finals	2	Changed snippet.
119	2014-08-09 15:17:27-05	1	16	14	wallace - Finals	2	Changed snippet.
120	2014-08-11 13:25:39-05	2	18	2	Introduction to embedded systems programming	2	Changed date.
121	2014-08-11 13:25:51-05	2	18	3	First Embedded Program	2	Changed date.
122	2014-08-11 13:26:54-05	2	18	4	Radio Communication, Part 1	2	Changed title and date.
123	2014-08-11 13:27:02-05	2	18	13	Sensors, Part 1	3	
124	2014-08-11 13:28:14-05	2	18	15	Radio Communication, Part 2	1	
125	2014-08-11 13:30:37-05	2	18	16	Sensing Light, Part 1	1	
126	2014-08-11 13:31:53-05	2	18	17	Sensing Light, Part 2	1	
127	2014-08-11 13:32:56-05	2	18	18	Serial Communication, Part 1	1	
128	2014-08-11 13:33:33-05	2	18	19	Serial Communication, Part 2	1	
129	2014-08-11 13:34:20-05	2	18	20	Project, Part 1	1	
130	2014-08-11 13:34:48-05	2	18	21	Project, Part 2	1	
131	2014-08-11 13:35:29-05	2	18	22	Serial Communication with Assembly, Part 1	1	
132	2014-08-11 13:35:51-05	2	18	23	Serial Communication with Assembly, Part 2	1	
133	2014-08-11 13:36:56-05	2	18	24	Wrap up the Loose Ends	1	
134	2014-08-12 18:43:09-05	2	18	18	Serial Communication, Part 1	2	Changed description and labfile.
135	2014-08-12 18:43:34-05	2	18	19	Serial Communication, Part 2	2	Changed description and labfile.
136	2014-08-14 14:26:39-05	2	18	2	Introduction to embedded systems programming	2	Changed visible.
137	2014-08-14 14:29:06-05	2	18	2	Introduction to embedded systems programming	2	Changed description.
138	2014-08-14 14:29:44-05	2	18	2	Introduction to embedded systems programming	2	Changed description.
139	2014-08-14 14:30:09-05	2	18	2	Introduction to embedded systems programming	2	Changed description.
140	2014-08-15 15:51:21-05	2	2	2	labstaff	1	
141	2014-08-15 15:52:08-05	2	3	2	jwallace	2	Changed first_name, last_name and groups.
142	2014-08-15 15:52:37-05	2	3	3	Test_Student	1	
143	2014-08-15 15:52:46-05	2	3	3	Test_Student	2	Changed groups.
144	2014-08-15 15:53:14-05	2	3	4	dennis	1	
145	2014-08-15 15:53:38-05	2	3	4	dennis	2	Changed first_name, last_name, email and groups.
146	2014-08-15 16:21:46-05	2	18	3	First Embedded Program	2	Changed adminfile.
147	2014-08-15 16:23:13-05	2	18	3	First Embedded Program	2	Changed visible.
148	2014-08-15 16:23:36-05	2	18	3	First Embedded Program	2	Changed visible.
149	2014-08-15 16:24:36-05	2	18	4	Radio Communication, Part 1	2	Changed adminfile.
150	2014-08-15 16:24:47-05	2	18	15	Radio Communication, Part 2	2	Changed adminfile.
151	2014-08-15 16:25:44-05	2	18	16	Sensing Light, Part 1	2	Changed adminfile.
152	2014-08-15 16:25:52-05	2	18	17	Sensing Light, Part 2	2	Changed adminfile.
153	2014-08-15 16:28:34-05	2	18	18	Serial Communication, Part 1	2	Changed adminfile.
154	2014-08-15 16:28:41-05	2	18	19	Serial Communication, Part 2	2	Changed adminfile.
155	2014-08-15 16:29:41-05	2	18	22	Serial Communication with Assembly, Part 1	2	Changed adminfile.
156	2014-08-15 16:29:49-05	2	18	23	Serial Communication with Assembly, Part 2	2	Changed adminfile.
157	2014-08-15 16:30:03-05	2	18	18	Serial Communication, Part 1	2	Changed adminfile.
158	2014-08-15 16:30:13-05	2	18	19	Serial Communication, Part 2	2	Changed adminfile.
159	2014-08-15 16:31:17-05	2	18	20	Project, Part 1	2	Changed adminfile.
160	2014-08-15 16:31:26-05	2	18	21	Project, Part 2	2	Changed adminfile.
161	2014-08-15 16:33:20-05	2	18	3	First Embedded Program	2	Changed description.
162	2014-08-15 16:34:54-05	2	18	4	Radio Communication, Part 1	2	Changed description.
163	2014-08-15 16:35:37-05	2	18	15	Radio Communication, Part 2	2	Changed description.
164	2014-08-15 16:36:36-05	2	18	16	Sensing Light, Part 1	2	Changed description.
165	2014-08-15 16:37:01-05	2	18	17	Sensing Light, Part 2	2	Changed description.
166	2014-08-15 16:38:13-05	2	18	18	Serial Communication, Part 1	2	Changed description.
167	2014-08-15 16:38:43-05	2	18	19	Serial Communication, Part 2	2	Changed description.
168	2014-08-15 16:39:37-05	2	18	20	Project, Part 1	2	Changed description.
169	2014-08-15 16:40:14-05	2	18	21	Project, Part 2	2	Changed description.
170	2014-08-15 16:41:38-05	2	18	22	Serial Communication with Assembly, Part 1	2	Changed description.
171	2014-08-15 16:42:13-05	2	18	23	Serial Communication with Assembly, Part 2	2	Changed description.
172	2014-08-15 16:42:26-05	2	18	24	Wrap up the Loose Ends	2	No fields changed.
173	2014-08-15 18:43:25-05	2	3	5	tester	3	
174	2014-08-15 18:43:34-05	2	3	3	Test_Student	3	
175	2014-08-15 18:52:00-05	2	3	6	tester	3	
176	2014-08-16 18:15:11-05	1	3	1	wallace	2	Changed groups.
177	2014-08-17 03:53:06-05	1	8	8	Personal Server	1	
178	2014-08-17 19:52:39-05	1	16	4	None - School starts	1	
179	2014-08-17 19:54:00-05	1	16	5	None - Census Day	1	
180	2014-08-17 19:54:57-05	1	16	6	None - Registration	1	
181	2014-08-17 19:55:42-05	1	16	7	None - Last Drop	1	
182	2014-08-17 19:56:58-05	1	16	8	None - Thanksgiving	1	
183	2014-08-17 19:57:17-05	1	16	9	None - Thanksgiving	1	
184	2014-08-17 19:57:29-05	1	16	10	None - Thanksgiving	1	
185	2014-08-17 19:58:18-05	1	16	11	None - Last Day	1	
186	2014-08-17 19:59:13-05	1	16	12	None - Finals	1	
187	2014-08-17 19:59:22-05	1	16	13	None - Finals	1	
188	2014-08-17 19:59:30-05	1	16	14	None - Finals	1	
189	2014-08-17 19:59:38-05	1	16	15	None - Finals	1	
190	2014-08-17 19:59:47-05	1	16	16	None - Finals	1	
191	2014-08-18 14:31:49-05	1	18	22	Serial Communication with Assembly, Part 1	2	Changed labfile.
192	2014-08-18 14:32:08-05	1	18	23	Serial Communication with Assembly, Part 2	2	Changed labfile.
193	2014-08-18 16:11:24-05	2	17	3	Embedded Computer Systems	2	Changed syllabus.
194	2014-08-18 16:57:57-05	2	17	1	Fundamentals of Computer Science I (Honors)	2	Changed syllabus.
195	2014-08-18 17:40:32-05	2	17	1	Fundamentals of Computer Science I (Honors)	2	Added Link "Git Tutorial". Added Link "Stack Overflow". Added Link "Cplusplus".
196	2014-08-18 18:21:20-05	1	17	3	Embedded Computer Systems	2	Added Link "TinyOS Tutorials".
197	2014-08-18 18:23:14-05	1	17	2	Foundations of Computer Science I	2	Changed section_number.
198	2014-08-19 09:47:29.031309-05	1	21	11	Jared Wallace	1	
199	2014-08-19 09:47:44.294014-05	1	21	11	Jared Wallace	3	
200	2014-08-19 11:41:44.480956-05	1	21	12	Charles Forsythe	1	
201	2014-08-20 09:33:51.159794-05	1	21	13	Anonymous	1	
202	2014-08-20 09:34:25.595806-05	1	21	14	Anonymous	1	
203	2014-08-20 09:34:43.470733-05	1	21	15	Anonymous	1	
204	2014-08-20 09:35:01.885187-05	1	21	16	Anonymous	1	
205	2014-08-20 09:35:33.337781-05	1	21	17	Anonymous	1	
206	2014-08-20 09:35:54.652447-05	1	21	18	Anonymous	1	
207	2014-08-20 09:36:24.7239-05	1	21	19	Anonymous	1	
208	2014-08-20 09:36:42.120471-05	1	21	20	Anonymous	1	
209	2014-08-20 09:37:01.995016-05	1	21	21	Anonymous	1	
210	2014-08-20 09:37:35.154123-05	1	21	22	Anonymous	1	
211	2014-08-20 09:38:22.288814-05	1	21	23	Anonymous	1	
212	2014-08-20 09:39:02.385506-05	1	21	24	Waldi Ravens	1	
213	2014-08-20 09:40:00.321626-05	1	21	25	E. W. Dijkstra	1	
214	2014-08-20 09:41:01.536641-05	1	21	26	Jon Ribbens	1	
215	2014-08-20 09:41:22.961773-05	1	21	27	Keith Bostik	1	
216	2014-08-20 09:42:53.832231-05	1	21	28	Martin Golding	1	
217	2014-08-20 09:43:21.896514-05	1	21	29	L. Peter Deutsch	1	
218	2014-08-20 09:46:54.525496-05	1	21	30	Gene Spafford	1	
219	2014-08-20 09:49:55.998929-05	1	21	31	Confucius	1	
220	2014-08-20 09:50:07.289794-05	1	21	32	Ryan Campbell	1	
221	2014-08-20 09:51:01.233278-05	1	21	33	Bill Venners	1	
222	2014-08-20 09:52:28.400047-05	1	21	34	E. W. Dijkstra	1	
223	2014-08-20 09:52:52.988157-05	1	21	35	Anonymous	1	
224	2014-08-20 09:53:15.666319-05	1	21	36	Alan Kay	1	
225	2014-08-20 09:53:30.41787-05	1	21	37	Jeff Polk	1	
226	2014-08-20 09:54:10.233161-05	1	21	38	Dennis Ritchie	1	
227	2014-08-20 09:55:10.485422-05	1	21	39	Nicholas Petreley	1	
228	2014-08-20 10:00:39.198684-05	1	21	40	Anonymous	1	
229	2014-08-20 10:31:35.719553-05	1	21	41	Scott Adams	1	
230	2014-08-20 10:33:19.54479-05	1	21	42	Anonymous	1	
231	2014-08-20 10:34:02.464068-05	1	21	43	Anonymous	1	
232	2014-08-20 10:40:25.830297-05	1	21	44	Anonymous	1	
233	2014-08-20 10:41:57.047711-05	1	21	45	Anonymous	1	
234	2014-08-20 10:45:34.434984-05	1	21	46	Delmore Schwartz	1	
235	2014-08-20 10:49:07.950191-05	1	21	47	Anonymous	1	
236	2014-08-20 10:49:55.141746-05	1	21	48	Anonymous	1	
237	2014-08-20 10:52:06.229459-05	1	21	48	Mitch Ratcliffe	2	Changed author.
238	2014-08-20 10:52:43.126396-05	1	21	49	John Barlow	1	
239	2014-08-20 11:11:07.877985-05	1	21	50	Jeremy Anderson	1	
240	2014-08-20 11:11:58.150137-05	1	21	51	Jerry Olsen	1	
241	2014-08-20 11:12:36.416439-05	1	21	52	Thomas Edison	1	
242	2014-08-20 11:13:39.933419-05	1	21	53	Doug Linder	1	
243	2014-08-20 11:16:26.167924-05	1	21	54	Anonymous	1	
244	2014-08-20 11:17:03.900157-05	1	21	55	Anonymous	1	
245	2014-08-20 11:17:20.947208-05	1	21	56	Anonymous	1	
246	2014-08-20 11:18:09.376185-05	1	21	57	Dave Barry	1	
247	2014-08-20 11:29:13.526407-05	1	21	58	Anonymous	1	
248	2014-08-20 11:30:37.391072-05	1	21	59	Anonymous	1	
249	2014-08-20 11:32:33.341918-05	1	21	60	Raymond Kennington	1	
250	2014-08-20 11:37:15.885236-05	1	21	61	Einstein	1	
251	2014-08-20 11:49:04.884537-05	1	21	62	The Blues Brothers	1	
252	2014-08-21 08:54:20.29867-05	1	18	1	Introduction to the Development Environment	2	Changed date.
253	2014-08-21 08:54:49.516234-05	1	18	5	Homemade Assembler, Part 1	2	Changed date.
254	2014-08-21 08:55:04.23369-05	1	18	6	A Simple Calculator	2	Changed date.
255	2014-08-21 08:56:34.139001-05	1	18	7	Fun and Games	2	Changed date.
256	2014-08-21 08:56:58.332312-05	1	18	8	Homemade Assembler, Part 2	2	Changed date.
257	2014-08-21 08:57:29.267152-05	1	18	1	Introduction to the Development Environment	2	Changed date.
258	2014-08-21 08:57:38.522197-05	1	18	5	Homemade Assembler, Part 1	2	Changed date.
259	2014-08-21 08:57:45.989791-05	1	18	6	A Simple Calculator	2	Changed date.
260	2014-08-21 08:57:52.575352-05	1	18	7	Fun and Games	2	Changed date.
261	2014-08-21 08:58:02.277128-05	1	18	8	Homemade Assembler, Part 2	2	Changed date.
262	2014-08-21 08:58:23.890222-05	1	18	9	Homemade Assembler, Part 3	2	Changed date.
263	2014-08-21 08:58:35.555637-05	1	18	10	Conway's Game of Life	2	Changed date.
264	2014-08-21 08:58:46.917965-05	1	18	11	Homemade Assembler, Part 4	2	Changed date.
265	2014-08-21 08:58:59.067222-05	1	18	12	Homemade Assembler, Part 5	2	Changed date.
266	2014-08-21 08:59:11.653413-05	1	18	14	Play That Funky Music	2	Changed date.
267	2014-08-21 10:09:03.659964-05	1	18	20	Project, Part 1	2	Changed labfile.
268	2014-08-21 10:09:11.903497-05	1	18	21	Project, Part 2	2	Changed labfile.
269	2014-08-21 13:44:41.605172-05	1	18	25	If you're happy and you know it...	1	
270	2014-08-21 13:49:49.593639-05	1	18	14	Play That Funky Music	2	Changed labfile.
271	2014-08-21 13:50:01.417959-05	1	18	25	If you're happy and you know it...	2	Changed labfile.
272	2014-08-24 20:34:23.461673-05	1	19	1	Contact_Information object	1	
273	2014-08-25 10:38:59.856857-05	1	19	1	Contact_Information object	2	Added days "Days object". Added days "Days object". Added days "Days object".
274	2014-08-25 11:05:22.660612-05	1	16	17	jwallace - Labor Day	1	
275	2014-08-25 14:50:38.497962-05	1	18	1	Introduction to the Development Environment	2	Changed labfile.
276	2014-08-25 14:57:13.762527-05	1	17	1	Fundamentals of Computer Science I (Honors)	2	Changed syllabus.
277	2014-08-25 15:02:24.758096-05	1	18	5	Homemade Assembler, Part 1	2	Changed labfile.
278	2014-08-26 09:48:43.03464-05	1	18	5	Homemade Assembler, Part 1	2	Changed labfile.
279	2014-08-27 12:08:34.265138-05	1	17	1	Fundamentals of Computer Science I (Honors)	2	Changed style.
280	2014-08-27 16:52:38.937634-05	1	18	1	Introduction to the Development Environment	2	Changed labfile.
281	2014-08-28 09:06:20.046931-05	1	17	1	Fundamentals of Computer Science I (Honors)	2	Changed section_number.
282	2014-08-29 09:15:24.652701-05	1	18	2	Introduction to embedded systems programming	2	Changed labfile.
283	2014-08-29 09:19:48.955554-05	1	18	3	First Embedded Program	2	Changed labfile.
284	2014-08-29 11:00:57.744739-05	1	18	4	Radio Communication, Part 1	2	Changed labfile.
285	2014-08-29 11:01:10.560407-05	1	18	15	Radio Communication, Part 2	2	Changed labfile.
286	2014-08-29 11:02:15.88876-05	1	18	16	Sensing Light, Part 1	2	Changed labfile.
287	2014-08-29 11:02:27.526018-05	1	18	17	Sensing Light, Part 2	2	Changed labfile.
288	2014-08-29 11:03:21.020671-05	1	18	18	Serial Communication, Part 1	2	Changed labfile.
289	2014-08-29 11:03:28.065493-05	1	18	19	Serial Communication, Part 2	2	Changed labfile.
290	2014-08-29 11:06:38.199329-05	1	18	22	Serial Communication with Assembly, Part 1	2	Changed labfile.
291	2014-08-29 11:06:47.174201-05	1	18	23	Serial Communication with Assembly, Part 2	2	Changed labfile.
292	2014-08-29 11:08:39.297508-05	1	18	20	Project, Part 1	2	Changed labfile.
293	2014-08-29 11:09:21.148707-05	1	18	21	Project, Part 2	2	Changed labfile.
294	2014-08-31 21:50:09.036636-05	1	19	1	Contact_Information object	2	Changed days for days "Days object".
295	2014-08-31 21:50:24.928895-05	1	19	1	Contact_Information object	2	No fields changed.
296	2014-09-01 12:46:01.026357-05	1	18	5	Homemade Assembler, Part 1	2	Changed description.
297	2014-09-02 08:17:52.39672-05	1	19	1	Contact_Information object	2	Changed days for days "Days object".
298	2014-09-03 12:21:24.43867-05	1	18	5	Homemade Assembler, Part 1	2	Changed labfile.
299	2014-09-03 17:27:34.597608-05	1	18	5	Homemade Assembler, Part 1	2	Changed visible.
300	2014-09-04 08:33:06.947055-05	1	18	3	First Embedded Program	2	Changed visible.
301	2014-09-04 10:29:48.938098-05	1	18	5	Homemade Assembler, Part 1	2	Changed adminfile and solution_visible.
302	2014-09-04 11:12:01.124556-05	1	17	3	Embedded Computer Systems	2	Added Link "IEEE Report Guide".
303	2014-09-05 16:52:11.107204-05	1	18	6	A Simple Calculator	2	Changed labfile.
304	2014-09-10 16:57:04.675599-05	1	18	6	A Simple Calculator	2	Changed visible.
305	2014-09-11 07:28:22.884723-05	1	18	3	First Embedded Program	2	Changed labfile.
306	2014-09-11 07:28:46.787622-05	1	18	2	Introduction to embedded systems programming	2	Changed labfile.
307	2014-09-11 15:17:00.392184-05	1	18	6	A Simple Calculator	2	Changed adminfile and solution_visible.
308	2014-09-15 09:50:00.348056-05	1	18	4	Radio Communication, Part 1	2	Changed visible.
309	2014-09-17 17:55:42.852431-05	1	18	7	Fun and Games	2	Changed visible.
310	2014-09-18 09:43:55.27114-05	1	18	3	First Embedded Program	2	Changed solution_visible.
311	2014-09-24 16:55:27.16984-05	1	18	8	Homemade Assembler, Part 2	2	Changed visible.
312	2014-09-26 10:14:41.834277-05	1	18	7	Fun and Games	2	Changed adminfile and solution_visible.
313	2014-09-26 10:30:11.552673-05	1	18	8	Homemade Assembler, Part 2	2	Changed adminfile and solution_visible.
314	2014-09-26 10:31:51.152383-05	1	18	15	Radio Communication, Part 2	2	Changed visible.
315	2014-09-26 10:31:59.265075-05	1	18	16	Sensing Light, Part 1	2	Changed visible.
316	2014-09-26 17:13:51.182608-05	1	18	9	Homemade Assembler, Part 3	2	Changed description.
317	2014-10-01 09:30:03.59015-05	1	8	9	Inventory Management System	1	
318	2014-10-01 16:58:35.770834-05	1	18	9	Homemade Assembler, Part 3	2	Changed visible.
319	2014-10-07 21:33:37.736899-05	1	18	10	Conway's Game of Life	2	Changed labfile.
320	2014-10-08 11:28:32.931393-05	1	18	9	Homemade Assembler, Part 3	2	Changed adminfile.
321	2014-10-08 11:28:38.821859-05	1	18	9	Homemade Assembler, Part 3	2	Changed solution_visible.
322	2014-10-08 16:58:17.851225-05	1	18	10	Conway's Game of Life	2	Changed visible.
323	2014-10-14 15:04:20.073825-05	1	18	10	Conway's Game of Life	2	Changed adminfile and solution_visible.
324	2014-10-15 07:53:40.008636-05	1	18	10	Conway's Game of Life	2	Changed adminfile.
325	2014-10-15 17:21:00.946733-05	1	18	11	Homemade Assembler, Part 4	2	Changed visible.
326	2014-10-15 20:05:13.349247-05	1	18	20	Project, Part 1	2	Changed visible.
327	2014-10-16 07:58:12.714969-05	1	18	18	Serial Communication, Part 1	2	Changed visible.
328	2014-10-21 17:11:50.707393-05	1	18	11	Homemade Assembler, Part 4	2	Changed adminfile and solution_visible.
329	2014-10-22 17:27:44.479999-05	1	18	12	Homemade Assembler, Part 5	2	Changed visible.
330	2014-10-22 17:56:22.123752-05	1	18	12	Homemade Assembler, Part 5	2	Changed labfile.
331	2014-10-23 08:25:41.043396-05	1	18	17	Sensing Light, Part 2	2	Changed visible.
332	2014-10-23 08:25:49.256767-05	1	18	19	Serial Communication, Part 2	2	Changed visible.
333	2014-10-29 17:41:37.035631-05	1	18	14	Play That Funky Music	2	Changed visible.
334	2014-10-31 14:01:59.499514-05	1	18	12	Homemade Assembler, Part 5	2	Changed adminfile and solution_visible.
335	2014-11-05 11:04:53.732139-06	1	18	25	If you're happy and you know it...	2	Changed adminfile and visible.
336	2014-11-05 17:34:18.82333-06	1	18	25	If you're happy and you know it...	2	Changed labfile.
337	2014-11-06 08:08:44.804579-06	1	18	21	Project, Part 2	2	Changed adminfile, visible and solution_visible.
338	2014-11-09 18:42:23.779844-06	1	17	1	Fundamentals of Computer Science I (Honors)	2	Added Link "Learn Python the Correct Way".
421	2015-03-23 10:58:58.548932-05	8	18	44	Logical Operators	1	
339	2014-11-09 18:45:17.771201-06	1	17	1	Fundamentals of Computer Science I (Honors)	2	Added Link "I'm too Lazy to Learn Python the Correct Way".
340	2014-11-09 19:57:09.239491-06	1	17	1	Fundamentals of Computer Science I (Honors)	2	Added Link "This site is addictive. You've been warned.".
341	2014-11-10 16:58:41.216661-06	1	18	26	How are you flying?	1	
342	2014-11-12 17:33:22.038597-06	1	18	26	How are you flying?	2	Changed visible.
343	2014-11-13 07:27:35.476521-06	1	18	22	Serial Communication with Assembly, Part 1	2	Changed visible.
344	2014-11-13 07:27:41.752606-06	1	18	23	Serial Communication with Assembly, Part 2	2	Changed visible.
345	2014-11-13 07:28:10.383605-06	1	18	22	Serial Communication with Assembly, Part 1	2	Changed description.
346	2014-11-13 07:28:55.759929-06	1	18	22	Serial Communication with Assembly, Part 1	2	Changed description.
347	2014-11-18 12:26:53.889212-06	1	18	27	Recursion	1	
348	2014-11-19 17:09:22.944096-06	1	18	27	Recursion	2	Changed visible.
349	2014-11-21 14:08:22.029163-06	1	3	7	tester	2	Changed password.
350	2014-12-01 07:28:06.87013-06	1	19	1	Contact_Information object	2	Changed github.
351	2014-12-01 07:29:14.641776-06	1	19	1	Contact_Information object	2	Changed github.
352	2014-12-02 11:10:34.889108-06	1	18	27	Recursion	2	Changed adminfile and solution_visible.
353	2015-01-14 11:26:30.479955-06	8	3	8	jared	2	Changed first_name and last_name.
354	2015-01-14 11:29:51.207813-06	8	17	4	Digital Logic	1	
355	2015-01-14 11:43:31.353772-06	8	17	4	Digital Logic	2	Added Link "IEEE Report guide".
356	2015-01-21 09:18:35.418287-06	8	17	4	Digital Logic	2	Added Link "Logisim (free software)".
357	2015-01-21 09:19:59.545299-06	8	17	4	Digital Logic	2	Changed description.
358	2015-01-22 08:56:17.018261-06	8	17	4	Digital Logic	2	Changed syllabus.
359	2015-01-22 09:01:37.541447-06	8	17	4	Digital Logic	2	Changed style. Changed url and title for Link "Logisim (free software)". Changed url and title for Link "".
360	2015-01-22 09:17:01.323127-06	8	18	28	Introduction to the Elvis Board	1	
361	2015-01-22 09:18:25.963476-06	8	18	29	Logic Gates and Basic Chips	1	
362	2015-01-22 09:19:30.830491-06	8	18	30	Logic and Delay in Chips	1	
363	2015-01-22 09:20:49.38267-06	8	18	31	Introduction to DSCH	1	
364	2015-01-22 09:51:53.216184-06	8	18	32	SOP/POS Equations and K-Maps	1	
365	2015-01-22 09:53:41.767789-06	8	18	33	Combinational Logic Function Design, Optimization and Implementation	1	
366	2015-01-22 09:54:36.485886-06	8	18	34	Latches and Flip-Flips from NAND Gates	1	
367	2015-01-22 09:56:00.597989-06	8	18	35	Finite State Machine Design – Mealy Machine	1	
368	2015-01-22 09:56:41.485456-06	8	18	36	Finite State Machine Design – Moore Machine	1	
369	2015-01-22 09:57:36.18386-06	8	18	37	Sequential Logic Design	1	
370	2015-01-22 09:58:39.112887-06	8	18	38	Busses and Memories	1	
371	2015-01-22 11:07:33.07518-06	8	21	63	Anonymous	1	
372	2015-01-22 11:08:06.401474-06	8	21	64	Anonymous	1	
373	2015-01-22 11:08:25.571715-06	8	21	65	Anonymous	1	
374	2015-01-22 11:08:47.114526-06	8	21	66	Anonymous	1	
375	2015-01-22 11:09:02.664587-06	8	21	67	Anonymous	1	
376	2015-01-22 11:09:20.992885-06	8	21	68	Anonymous	1	
377	2015-01-22 11:09:37.778482-06	8	21	69	Anonymous	1	
378	2015-01-22 11:09:54.326562-06	8	21	70	Anonymous	1	
379	2015-01-22 11:10:17.302005-06	8	21	71	Anonymous	1	
380	2015-01-22 11:10:36.234829-06	8	21	72	Anonymous	1	
381	2015-01-22 11:10:49.783293-06	8	21	73	Anonymous	1	
382	2015-01-22 11:11:11.721469-06	8	21	74	Anonymous	1	
383	2015-01-22 11:11:28.250286-06	8	21	75	Anonymous	1	
384	2015-01-22 11:11:47.161479-06	8	21	76	Anonymous	1	
385	2015-01-22 11:12:13.250415-06	8	21	76	Anonymous	2	No fields changed.
386	2015-01-22 11:12:32.697304-06	8	21	77	Anonymous	1	
387	2015-01-22 11:12:52.94475-06	8	21	78	Anonymous	1	
388	2015-01-22 11:13:24.519476-06	8	21	79	Anonymous	1	
389	2015-01-22 11:13:52.360107-06	8	21	80	Anonymous	1	
390	2015-02-03 09:49:58.309944-06	8	18	28	Introduction to the Elvis Board	2	Changed date.
391	2015-02-03 09:50:07.080119-06	8	18	29	Logic Gates and Basic Chips	2	Changed date.
392	2015-02-03 09:50:15.13249-06	8	18	30	Logic and Delay in Chips	2	Changed date.
393	2015-02-03 09:50:26.321546-06	8	18	31	Introduction to DSCH	2	Changed date.
394	2015-02-03 09:50:35.251629-06	8	18	32	SOP/POS Equations and K-Maps	2	Changed date.
395	2015-02-03 09:50:42.606786-06	8	18	33	Combinational Logic Function Design, Optimization and Implementation	2	Changed date.
396	2015-02-03 09:50:50.072374-06	8	18	34	Latches and Flip-Flips from NAND Gates	2	Changed date.
397	2015-02-03 09:50:57.819711-06	8	18	35	Finite State Machine Design – Mealy Machine	2	Changed date.
398	2015-02-03 09:51:07.56193-06	8	18	36	Finite State Machine Design – Moore Machine	2	Changed date.
399	2015-02-03 09:51:14.561082-06	8	18	37	Sequential Logic Design	2	Changed date.
400	2015-02-03 09:51:22.589618-06	8	18	38	Busses and Memories	2	Changed date.
401	2015-02-17 06:28:11.422453-06	8	18	28	Introduction to the Elvis Board	2	Changed adminfile.
402	2015-02-17 06:28:20.396787-06	8	18	29	Logic Gates and Basic Chips	2	Changed adminfile.
403	2015-02-17 06:28:29.736994-06	8	18	30	Logic and Delay in Chips	2	Changed adminfile and visible.
404	2015-02-17 06:28:38.431201-06	8	18	31	Introduction to DSCH	2	Changed adminfile.
405	2015-02-17 06:28:46.596162-06	8	18	32	SOP/POS Equations and K-Maps	2	Changed adminfile.
406	2015-02-17 06:28:53.971117-06	8	18	33	Combinational Logic Function Design, Optimization and Implementation	2	Changed adminfile.
407	2015-02-17 06:29:00.306008-06	8	18	34	Latches and Flip-Flips from NAND Gates	2	Changed adminfile.
408	2015-02-17 06:29:09.031409-06	8	18	35	Finite State Machine Design – Mealy Machine	2	Changed adminfile.
409	2015-02-17 06:29:16.18939-06	8	18	36	Finite State Machine Design – Moore Machine	2	Changed adminfile.
410	2015-02-17 06:29:23.848922-06	8	18	37	Sequential Logic Design	2	Changed adminfile.
411	2015-02-17 06:29:30.772607-06	8	18	38	Busses and Memories	2	Changed adminfile.
412	2015-02-17 06:31:42.037341-06	8	3	8	jared	2	Changed groups.
413	2015-02-24 09:07:18.840392-06	8	18	31	Introduction to DSCH	2	Changed visible.
414	2015-03-03 06:39:58.982724-06	8	18	32	SOP/POS Equations and K-Maps	2	Changed visible.
415	2015-03-10 11:47:28.824116-05	1	18	33	Combinational Logic Function Design, Optimization and Implementation	2	Changed visible.
416	2015-03-23 10:48:13.021204-05	8	18	39	Introduction	1	
417	2015-03-23 10:49:49.456444-05	8	18	40	C++ basics	1	
418	2015-03-23 10:52:30.107565-05	8	18	41	Console I/O	1	
419	2015-03-23 10:54:06.196356-05	8	18	42	File I/O	1	
420	2015-03-23 10:57:25.338817-05	8	18	43	Conditional Statements	1	
422	2015-03-23 11:00:28.048937-05	8	18	45	For Loops	1	
423	2015-03-23 11:02:20.776775-05	8	18	46	(Do) While Loops	1	
424	2015-03-23 11:04:02.498135-05	8	18	47	1-D arrays and Char arrays	1	
425	2015-03-23 11:05:40.674368-05	8	18	48	Functions	1	
426	2015-03-23 11:07:08.075182-05	8	18	49	Functions (cont.)	1	
427	2015-03-23 11:08:52.615075-05	8	18	50	Functions (cont.)	1	
428	2015-03-23 11:11:22.575551-05	8	18	51	Structs	1	
429	2015-03-23 11:13:42.625976-05	8	18	52	Final	1	
430	2015-03-23 11:14:22.378702-05	8	17	2	Foundations of Computer Science I	2	Changed day.
431	2015-03-31 06:00:18.413536-05	8	18	34	Latches and Flip-Flips from NAND Gates	2	Changed visible.
432	2015-03-31 06:01:39.021204-05	8	18	34	Latches and Flip-Flips from NAND Gates	2	Changed date.
433	2015-03-31 06:01:50.157794-05	8	18	35	Finite State Machine Design – Mealy Machine	2	Changed date.
434	2015-03-31 06:02:03.502504-05	8	18	36	Finite State Machine Design – Moore Machine	2	Changed date.
435	2015-03-31 06:02:12.515436-05	8	18	37	Sequential Logic Design	2	Changed date.
436	2015-03-31 06:02:18.869341-05	8	18	38	Busses and Memories	2	Changed date.
437	2015-03-31 06:03:01.242162-05	8	18	33	Combinational Logic Function Design, Optimization and Implementation	2	Changed date.
438	2015-03-31 06:03:07.517307-05	8	18	35	Finite State Machine Design – Mealy Machine	2	Changed visible.
439	2015-04-07 10:30:54.809322-05	8	18	36	Finite State Machine Design – Moore Machine	2	Changed visible.
440	2015-04-14 07:52:54.585392-05	8	18	37	Sequential Logic Design	2	Changed visible.
441	2015-04-21 11:15:58.237313-05	8	18	38	Busses and Memories	2	Changed visible.
442	2015-05-09 08:32:26.056468-05	8	21	81	Anonymous	1	
443	2015-05-09 08:49:56.937745-05	8	8	10	Super Simple C Compiler	1	
444	2015-07-03 10:48:19.039587-05	8	8	7	University Webpage	2	Changed fulldescription.
445	2015-07-03 10:49:04.452832-05	8	8	7	University Webpage	2	Changed fulldescription.
446	2015-07-03 10:49:26.109002-05	8	8	7	University Webpage	2	Changed fulldescription.
447	2015-07-03 10:53:36.070295-05	8	8	7	University Webpage	2	Changed fulldescription.
448	2015-07-03 10:54:47.028106-05	8	8	7	University Webpage	2	Changed fulldescription.
449	2015-07-03 10:55:21.392691-05	8	8	7	University Webpage	2	Changed fulldescription.
450	2015-07-03 10:55:57.41248-05	8	8	7	University Webpage	2	Changed fulldescription.
451	2015-07-03 10:57:55.903563-05	8	8	7	University Webpage	2	Changed fulldescription.
452	2015-07-03 10:59:41.415545-05	8	8	7	University Webpage	2	Changed image for screenshots "Screenshots object".
453	2015-07-03 11:02:59.218591-05	8	8	7	University Webpage	2	Changed fulldescription.
454	2015-07-03 11:24:18.519906-05	8	19	1	Contact_Information object	2	Changed office.
455	2015-07-03 11:25:39.691557-05	8	19	1	Contact_Information object	2	Added days "Days object". Added days "Days object". Changed from_time and to_time for days "Days object". Changed days, from_time and to_time for days "Days object". Changed days, from_time and to_time for days "Days object".
456	2015-07-03 11:34:41.60532-05	8	19	1	Contact_Information object	2	Changed bitbucket.
457	2015-09-29 13:41:29.349129-05	8	17	1	Fundamentals of Computer Science I (Honors)	2	Changed url for Link "Git Tutorial".
458	2015-09-29 13:42:37.009829-05	8	17	1	Fundamentals of Computer Science I (Honors)	2	No fields changed.
459	2015-09-29 13:54:09.216016-05	8	17	1	Fundamentals of Computer Science I (Honors)	2	Changed title for Link "Git Tutorial (new and improved)".
460	2016-06-01 06:36:24.812412-05	8	21	82	Mark Twain	1	
461	2016-06-07 13:23:03.1067-05	8	8	11	Macintosh OSX WebPlayer plugin fix	1	
462	2016-06-07 13:24:02.315205-05	1	8	7	University Webpage	2	Changed shortdescription.
463	2016-06-07 13:26:58.391714-05	1	8	11	Macintosh OSX WebPlayer plugin fix	2	Changed fulldescription.
464	2016-06-07 13:27:56.966448-05	1	8	11	Macintosh OSX WebPlayer plugin fix	2	Changed shortdescription and fulldescription.
465	2016-08-12 16:20:56.243259-05	1	8	10	Super Simple C Compiler	2	Changed fulldescription and binaryfile.
466	2016-08-12 16:22:28.8691-05	1	8	10	Super Simple C Compiler	2	Changed binaryfile and sourcefile.
467	2016-08-12 16:23:21.648793-05	1	8	10	Super Simple C Compiler	2	Changed fulldescription.
468	2016-08-12 16:32:09.30683-05	1	8	11	Macintosh OSX WebPlayer plugin fix	2	Changed fulldescription.
469	2016-08-12 16:45:48.586177-05	1	8	12	Zlib Scripts	1	
470	2016-10-13 15:32:47.997421-05	1	8	12	Zlib Scripts	2	Changed fulldescription.
471	2016-10-13 15:36:57.872998-05	1	8	12	Zlib Scripts	2	Changed fulldescription.
472	2016-10-13 15:37:34.681251-05	1	8	12	Zlib Scripts	2	Changed fulldescription.
473	2016-10-13 15:44:45.277307-05	1	8	13	Orpie package for Fedora 24-26	1	
474	2016-10-13 15:45:12.40079-05	1	8	13	Orpie package for Fedora 24-26	2	Changed fulldescription.
475	2016-10-13 15:45:39.191875-05	1	8	13	Orpie package for Fedora 24-26	2	Changed fulldescription.
476	2016-10-13 15:46:01.07371-05	1	8	13	Orpie package for Fedora 24-26	2	Changed fulldescription.
477	2016-10-13 15:47:41.599569-05	1	8	13	Orpie package for Fedora 24-26	2	Changed fulldescription.
478	2016-12-17 22:26:20.83564-06	1	8	13	Orpie package for Fedora 24-26	2	[{"changed": {"fields": ["fulldescription"]}}]
479	2016-12-17 22:36:13.392937-06	1	8	14	TravisMcGee	1	[{"added": {}}, {"added": {"object": "Screenshots object", "name": "screenshots"}}]
480	2017-01-02 08:28:12.659216-06	1	8	14	TravisMcGee	2	[{"changed": {"fields": ["fulldescription"]}}]
481	2017-01-02 08:28:44.691568-06	1	8	14	TravisMcGee	2	[{"changed": {"fields": ["fulldescription"]}}]
482	2017-01-02 08:29:41.34338-06	1	8	14	TravisMcGee	2	[{"changed": {"fields": ["fulldescription"]}}]
483	2017-01-02 08:31:21.220208-06	1	8	14	TravisMcGee	2	[{"changed": {"fields": ["fulldescription"]}}]
484	2017-01-02 08:31:48.193628-06	1	8	14	TravisMcGee	2	[{"changed": {"fields": ["fulldescription"]}}]
485	2017-01-02 08:32:34.068762-06	1	8	14	TravisMcGee	2	[{"changed": {"fields": ["fulldescription"]}}]
486	2017-02-03 08:20:01.74022-06	1	8	14	TravisMcGee	2	[{"changed": {"fields": ["fulldescription"]}}]
487	2017-04-18 10:21:21.684023-05	1	8	15	Zendesk integration for Watson Workspace	1	[{"added": {}}]
488	2017-05-27 11:00:05.573412-05	8	8	16	IRC integration	1	[{"added": {}}, {"added": {"object": "Screenshots object", "name": "screenshots"}}, {"added": {"object": "Screenshots object", "name": "screenshots"}}]
489	2017-05-27 11:03:57.628517-05	8	8	16	IRC integration	2	[{"added": {"object": "Screenshots object", "name": "screenshots"}}]
490	2017-05-27 11:04:14.618259-05	8	8	15	Zendesk integration for Watson Workspace	2	[{"changed": {"fields": ["classification"]}}]
491	2017-05-27 11:13:15.271703-05	8	8	17	ww-box	1	[{"added": {}}, {"added": {"object": "Screenshots object", "name": "screenshots"}}, {"added": {"object": "Screenshots object", "name": "screenshots"}}]
492	2017-05-27 11:14:22.060932-05	8	8	17	ww-box	2	[{"changed": {"fields": ["fulldescription"]}}]
493	2017-05-27 11:22:49.718169-05	8	8	18	TravisMcGee Version 2.0	1	[{"added": {}}, {"added": {"object": "Screenshots object", "name": "screenshots"}}]
494	2017-06-14 13:42:42.920122-05	8	21	83	Anonymous	1	[{"added": {}}]
495	2017-06-14 13:43:32.356578-05	8	21	84	Anonymous	1	[{"added": {}}]
496	2017-06-14 13:43:48.998225-05	8	21	85	Anonymous	1	[{"added": {}}]
497	2017-06-14 13:44:14.152197-05	8	21	86	Anonymous	1	[{"added": {}}]
498	2017-06-14 13:44:35.359531-05	8	21	87	Anonymous	1	[{"added": {}}]
499	2017-06-14 13:45:02.344857-05	8	21	88	Anonymous	1	[{"added": {}}]
500	2017-06-14 13:45:47.272578-05	8	21	89	Anonymous	1	[{"added": {}}]
501	2017-06-14 13:46:32.466787-05	8	21	90	Anonymous	1	[{"added": {}}]
502	2017-06-14 13:47:02.508627-05	8	21	91	Anonymous	1	[{"added": {}}]
503	2017-06-14 13:47:29.97553-05	8	21	92	Anonymous	1	[{"added": {}}]
504	2017-06-14 13:47:44.671344-05	8	21	93	Anonymous	1	[{"added": {}}]
505	2017-06-14 13:48:01.459588-05	8	21	94	Anonymous	1	[{"added": {}}]
506	2017-06-14 13:48:21.88484-05	8	21	95	Anonymous	1	[{"added": {}}]
507	2017-06-14 13:48:51.440626-05	8	21	96	Anonymous	1	[{"added": {}}]
508	2017-06-14 13:49:08.494933-05	8	21	97	Anonymous	1	[{"added": {}}]
509	2017-06-14 13:49:28.471799-05	8	21	98	Anonymous	1	[{"added": {}}]
510	2017-06-14 15:06:57.444018-05	8	21	99	Anonymous	1	[{"added": {}}]
511	2017-06-14 15:07:28.880528-05	8	21	100	Anonymous	1	[{"added": {}}]
512	2017-06-14 15:07:50.556683-05	8	21	101	Anonymous	1	[{"added": {}}]
513	2017-06-14 15:08:09.414163-05	8	21	102	Anonymous	1	[{"added": {}}]
514	2017-06-14 15:08:29.857533-05	8	21	103	Anonymous	1	[{"added": {}}]
515	2017-06-14 15:08:45.444445-05	8	21	104	Anonymous	1	[{"added": {}}]
516	2017-06-14 15:09:09.666311-05	8	21	105	Anonymous	1	[{"added": {}}]
517	2017-06-14 15:09:44.235671-05	8	21	106	Anonymous	1	[{"added": {}}]
518	2017-06-14 15:10:15.875705-05	8	21	107	Anonymous	1	[{"added": {}}]
519	2017-06-14 15:10:59.210101-05	8	21	108	Anonymous	1	[{"added": {}}]
520	2017-06-14 15:11:32.632807-05	8	21	109	Anonymous	1	[{"added": {}}]
521	2017-06-14 15:35:24.123061-05	8	21	110	Anonymous	1	[{"added": {}}]
522	2017-06-14 15:35:53.299882-05	8	21	110	Anonymous	3	
523	2017-06-14 15:38:29.118535-05	8	21	111	Anonymous	1	[{"added": {}}]
524	2017-06-14 15:39:47.888943-05	8	21	112	Anonymous	1	[{"added": {}}]
525	2017-06-14 15:41:35.791994-05	8	21	113	Anonymous	1	[{"added": {}}]
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 525, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: django
--

COPY django_content_type (id, name, app_label, model) FROM stdin;
1	permission	auth	permission
2	group	auth	group
3	user	auth	user
4	content type	contenttypes	contenttype
5	session	sessions	session
6	site	sites	site
7	log entry	admin	logentry
8	project	projects	project
9	migration history	south	migrationhistory
13	screenshots	projects	screenshots
14	entry	calender	entry
15	entry	calendar	entry
16	entry	my_calendar	entry
17	class_ section	labs	class_section
18	lab	labs	lab
19	Contact Information	accounts	contact_information
20	days	accounts	days
21	Quote	labs	quote
22	registration profile	registration	registrationprofile
23	captcha store	captcha	captchastore
24	Link	labs	section_link
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('django_content_type_id_seq', 24, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: django
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
00551f88e49437d2f8387214c12251c7	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-06-23 17:33:19-05
02b8572ae6cd1a7640e9d639d269a2aa	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-07-23 04:32:10-05
06f01b05e68d175a417b6f30f3a12e9b	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-06-10 16:03:09-05
076e6bd5f0e767f3ecd0a8e847d6cef9	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-07-14 17:36:01-05
08086b498ba99bb6e9ae5feb46d97f24	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-06-18 10:56:56-05
0f8a83ec4c8f8a93358b72cdcd1736ef	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-08-15 00:01:52-05
0fac4978033aea2089e0ca8e42104315	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-06-22 23:01:10-05
100aa7046d4fd54c24e84079a9780897	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-06-30 20:06:56-05
177bfefd0cbaf98cfc4f26cf60a63c5c	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-07-09 10:10:09-05
180b915bc3e144ba9a22e8ac16f1182d	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-06-14 17:34:23-05
183dbeadbb8fda8474b2b4d8effcda8a	NmY5ZmYzODE4Y2VlYTRlOTVkMTg4M2YyNDVkZGMyNjU1NjdiZTllYTqAAn1xAShVB3dlYnNpdGVx\nAlgAAAAAVQRuYW1lcQNYBQAAAEphcmVkcQRVDV9hdXRoX3VzZXJfaWRxBYoBAVUKdGVzdGNvb2tp\nZXEGVQZ3b3JrZWRxB1USX2F1dGhfdXNlcl9iYWNrZW5kcQhVKWRqYW5nby5jb250cmliLmF1dGgu\nYmFja2VuZHMuTW9kZWxCYWNrZW5kcQlVBWVtYWlscQpYDwAAAGphcmVkQGdtYWlsLmNvbXELdS4=\n	2014-04-26 18:27:58-05
194899702a863c12487752954d476bbd	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-06-25 01:36:38-05
1bb8fa9ffc04b64a02377f710fe45c3a	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-06-27 16:25:21-05
1bbb7ffffe3ab1921825630d95c27029	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-08-18 09:27:27-05
1ec449056d4bdad7c7a61bd1132d4689	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-08-14 06:54:35-05
1f46b6d396524dfcf0e532447e2c2976	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-06-22 15:40:45-05
1hiwkdaw2pp7gxbi61fwqvpc7iayvu5i	MTRmOWFkOGYwMDlhNTE0YzVlOGU5NzJmYmM5ZmNlMTYzZmUwZDYwYzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Mn0=	2014-08-25 23:42:39-05
284e9e0337f0a96d9750a768b00c84ac	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-06-08 13:13:10-05
29baa27b562ebcfe5a23d72293d3a5a4	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-07-14 06:03:33-05
2bb1d3c494559b87f78aa3e948f0b7a3	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-06-21 18:18:50-05
2d0dd40cd10362ae3f664d8264165549	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-07-30 05:45:22-05
2d1a2ed367cb2a9e5e425da0985abef0	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-08-16 01:41:11-05
3162a570fcb64c43ad0befefb6070bda	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-08-05 12:01:19-05
3248023e9c94540e7f9368ec909ac31c	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-06-10 19:03:04-05
32a2c8dadccaaaf87f9bd50ee72198a3	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-06-14 19:32:53-05
33deab2499c8711d936bbf48bcdd9711	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-06-12 13:20:38-05
3515924ddb948cf5a3a5e472a828ddab	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-06-27 09:55:07-05
38e64e2bca863d2de5147eb5acf55f90	MGIzMzdmZGI1MTBiN2NmOTc2MjI4NDM3MjY5ODY1YzBiMzU4YTFjMDqAAn1xAS4=\n	2014-06-19 02:27:38-05
3b77f3ca18376ed4f548c7d244bfbd1f	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-06-12 18:01:15-05
3da622dc7f29c0707b6b89aa69f05162	ZjNiNDk1MWExZTE5OTY0MTAwNDIzNmRlMzcwMGFlNzU5NTJkZmI4ZDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n	2014-04-26 17:22:46-05
43c048836ba8f55f0bc14a8d67a0fbfd	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-07-09 09:38:07-05
44b6b8b19eeca387fd6dd3ce6ceb7015	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-07-31 20:19:45-05
45dd74c26e1ccf8f53eac65df90b6801	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-06-10 16:28:43-05
467630713ab853ac5a566ca82bb0bb84	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-07-12 12:55:09-05
487121be000d8b7f9773c3f6e069bebd	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-08-25 15:24:10-05
4917653f6543984588a8ce6cbfa1d420	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-08-15 23:02:32-05
49a8bdfde8171a7566de069628c6a0bf	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-08-24 20:41:06-05
4e31bedf0dd645abb4630dcdc229e1b7	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-08-09 01:53:30-05
51498fd70927aac4c0b1f80ecae8dbab	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-06-15 05:42:39-05
5184232090c8f681bcf3036cb88f1d0d	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-07-03 19:02:33-05
54d64a05d9681dfdecfdb28fd6a76506	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-07-16 18:50:24-05
55b7e37dc1738d531a68ee21aad88824	ZjNiNDk1MWExZTE5OTY0MTAwNDIzNmRlMzcwMGFlNzU5NTJkZmI4ZDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n	2014-08-01 23:17:25-05
55d83919eac8ba85504005802c9235a7	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-08-11 16:40:22-05
2zaz5v91nfxj7hl4p8o731i0bw1h89ev	NDVmYTdhMjU5MjgyZmRiYjBiY2FlMzA5MjlmZGNmN2FiNTYyMjQyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=	2014-11-27 10:52:00.721723-06
581cfd55f8862bbf57cfe9150fbc0331	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-08-15 10:43:04-05
59710d50d80a17266b5277acee00d3a6	ZjNiNDk1MWExZTE5OTY0MTAwNDIzNmRlMzcwMGFlNzU5NTJkZmI4ZDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n	2014-06-08 13:16:22-05
5bb7d369864a97cf7f6dcc83150e5c39	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-06-12 12:36:12-05
5c84193daf32bafc022395113cec65bd	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-07-19 04:38:44-05
5f000b91919680b72b7c8b5ce889be45	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-08-08 17:44:35-05
6345900b66397e29cba0d676833e570f	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-06-20 06:57:39-05
65af7ef88c83abbe8098521e8ccc9963	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-08-18 17:47:16-05
6a976570ba5bac9ad51404d5ec1bbd21	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-07-03 06:16:57-05
6ae3c1009e1cbb9bff32b9c21a5444ae	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-06-25 19:06:38-05
6c24f2b4e62103af67c84dfb5178fbf7	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-06-13 18:19:02-05
7363ea61c9c6ed30d61f6525bbb7392e	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-06-14 19:10:46-05
792d8f10738bc20adfe76bf31d738854	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-06-11 21:11:13-05
7b7845fc565be9c265d48ac8e56d747a	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-06-18 22:31:50-05
7c273ebe094117999bad088b460be430	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-08-17 05:52:59-05
7c6daee695dd4b6ce32a8c15650ca95f	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-08-23 12:40:53-05
7d0e2a8c85c9b3303ad40d1b43a2fc80	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-07-09 07:11:44-05
8141120805d8aa67ed0d329e10979b85	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-07-29 09:46:10-05
8270f8949268b20e0c67fe441f64e2cb	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-08-14 09:39:59-05
8344d59ecf43a9bf262e9935683e209d	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-07-23 17:19:19-05
83c2460262e5a1df8cb6a421e57f4835	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-07-18 05:57:35-05
84cd96eb0db26bb272fe8b573a9fad64	ZjNiNDk1MWExZTE5OTY0MTAwNDIzNmRlMzcwMGFlNzU5NTJkZmI4ZDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n	2014-06-12 12:52:59-05
897c9b1bd9ea7dc3169028430a9d951f	ZjNiNDk1MWExZTE5OTY0MTAwNDIzNmRlMzcwMGFlNzU5NTJkZmI4ZDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n	2014-04-25 16:04:10-05
8a83cef1791388696720c83790383c52	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-07-25 08:11:30-05
8bdc7610fbc171acba961e4c632720db	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-06-16 03:03:07-05
8e1a804f2da9995f06bb3496311adc59	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-06-23 00:11:49-05
8fa86cd25a3f73d26e9493f51916a0f9	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-06-12 03:30:26-05
9212b20a6858d6fbf13c69ede7e851fb	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-08-08 22:47:56-05
9439480a67e83faa381d1e045c3f4d35	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-06-23 13:15:46-05
9c5f05c0ba0bb3d5fea0d912a6bd8f7e	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-08-21 06:51:07-05
9caacde2dc536af4889a9ddebbb23fc7	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-08-05 01:10:54-05
a04644cbb59b999af34d8e1650cc0963	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-06-17 16:00:01-05
a08ae4789388b7cc6f52f9c7c8e6e6ed	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-08-06 05:04:15-05
a19454140423f5d038348abd559eba6a	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-08-02 00:55:35-05
a35d8a2b65b85aa345c22744a62505f9	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-06-12 01:05:31-05
a61ebf7e4532a43ecef5dc2c63ab1874	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-06-12 17:26:22-05
a9e9b1cce23bd6fa85fd17f25bd77412	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-06-25 18:57:09-05
a9fcea08665854ab28ebde263163772b	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-06-14 20:03:57-05
aa1e9405e2b22b5997a8adac962b681d	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-06-26 14:57:40-05
aa76b56f40e836231e922819430b9898	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-06-12 12:34:57-05
aab09b69c92450fbb5b3984916b7d2fe	ZjNiNDk1MWExZTE5OTY0MTAwNDIzNmRlMzcwMGFlNzU5NTJkZmI4ZDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n	2014-07-01 19:19:38-05
ab34770e4bc4390dc134b7d3e715323f	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-07-25 08:11:04-05
ac4b8a91196dde009162cbb8fdf3c274	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-07-25 23:38:55-05
ae62bb0e47c25953314a17b62b336feb	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-06-24 23:16:10-05
ae9db2e7f7d07a0576498853487eb0d3	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-08-15 00:49:13-05
af7c252881915add68a5e50fbc9b3b49	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-08-25 13:47:17-05
b0527d746d7a5ecbfabc02291c9dfc8b	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-07-30 14:10:56-05
b45ae60a02fe2ac6b7cd4379f0fcd414	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-07-20 19:43:19-05
b4894625a704b9e19c2531fe367c6588	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-06-18 19:09:15-05
bb8274ff92e143276a3deae1e0120ccd	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-07-04 07:08:23-05
bca7712e71c99d3db95e8fb6b025c4d2	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-08-16 09:00:17-05
bcdd2b06665abd9b667b6cf3f1e62214	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-07-01 10:41:03-05
bf03eb63de349d99c5f26fc16e89237d	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-08-12 03:09:56-05
c1faab04d29298db426d6aa1677ca3bc	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-08-11 05:27:25-05
c4cb77acd9f833c47e01d22992acbd64	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-06-20 05:04:39-05
c53aa07bdbc100dacef52c423023729e	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-07-20 06:45:15-05
c8afbd2943cc2841caa2a21bc814517e	MDQ3NDk0ZDAzODU1YWRlODY3Y2MyZDIyYjliZWNkODEwOTE0MTYyMzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQJ1Lg==\n	2014-08-14 18:47:02-05
cdb8b9c07f8b36263e645176e1d67556	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-07-11 20:29:40-05
d01cba866ef9c574d0aced96e9fc1154	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-06-28 15:15:54-05
d1f461f44d686309d792bba6c34fb770	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-07-25 09:31:48-05
d6fa7bdc4a99f48c42ab6eb871fa4d1e	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-08-17 13:42:21-05
d8652b21d3d66f1ff88b644cc7a3c6b1	MDQ3NDk0ZDAzODU1YWRlODY3Y2MyZDIyYjliZWNkODEwOTE0MTYyMzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQJ1Lg==\n	2014-08-10 14:24:22-05
d86ee3f6674b3e018ca18e099e2a13cc	MGIzMzdmZGI1MTBiN2NmOTc2MjI4NDM3MjY5ODY1YzBiMzU4YTFjMDqAAn1xAS4=\n	2014-04-28 12:06:53-05
daa596eeca1a9a0714759af9d6347731	MDQ3NDk0ZDAzODU1YWRlODY3Y2MyZDIyYjliZWNkODEwOTE0MTYyMzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQJ1Lg==\n	2014-08-08 17:00:23-05
dda618e6aa79ad4abd7b6c0fd5acdbcc	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-06-14 19:33:31-05
deedcf35ff477ed21f63aac2ab3048dc	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-06-12 14:55:15-05
df2c6fb9704951dfde1408459a2ecc6c	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-08-23 19:19:12-05
dfa9e282ab6a17642cac1a3d4b8d16e6	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-08-13 02:33:57-05
e2696f2e555581c7bc3197819018b02a	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-07-03 11:42:28-05
e327a8c9a2e02132a9ff22c22a19f71b	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-06-19 03:19:12-05
e36509677c13f80875f6927e7f937740	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-07-17 06:56:38-05
e7d531da328527e22e511ffb20808013	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-08-08 22:48:17-05
e9488cdd20809bcdf4666192227529b2	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-07-30 04:38:54-05
ec288d27239a351aa33e7c16120fbebb	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-07-07 03:08:15-05
ef65bf7a1359b856c9a5f947937cc1ad	MGIzMzdmZGI1MTBiN2NmOTc2MjI4NDM3MjY5ODY1YzBiMzU4YTFjMDqAAn1xAS4=\n	2014-06-14 20:01:50-05
efb4f78767461a16aa2f0ea14ae74d1c	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-06-22 11:53:13-05
f0d3a2c887c2ff4118c97fac523ba535	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-07-29 08:13:10-05
f2cd122e957b36493f9da6ce36baf31e	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-06-25 18:56:54-05
f48447b2edf2074f4738fca5be62bbd4	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-07-27 17:44:33-05
f56f8eac166e54ff23f79f26fd52ab8d	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-07-24 05:35:24-05
f7f66b858204161cfb9e5d6a12449b03	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-07-24 19:49:58-05
fd80d648205446e786fd8155a3310c7b	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-07-26 23:11:13-05
ff71917ba9f06102a505f8937f858fe9	Y2E4NjVkN2VlN2NiZDM0YmIzY2UzZGQzMGE0MGM0ZTYzNjRmMzI1NzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2014-07-04 20:08:09-05
i8u9g24oablax8kborrxb3anky0fga4v	MWEwMDU3NzQ1OWFlNzk1YzdmZjQ5MWIzMGIzMDlkYjc1ZWEzMThhYTp7Il9tZXNzYWdlcyI6IltbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJUaGUgQ291cnNlIHNlY3Rpb24gXFxcIkVtYmVkZGVkIENvbXB1dGVyIFN5c3RlbXNcXFwiIHdhcyBjaGFuZ2VkIHN1Y2Nlc3NmdWxseS5cIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwiVGhlIENvdXJzZSBzZWN0aW9uIFxcXCJGdW5kYW1lbnRhbHMgb2YgQ29tcHV0ZXIgU2NpZW5jZSBJIChIb25vcnMpXFxcIiB3YXMgY2hhbmdlZCBzdWNjZXNzZnVsbHkuXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIlRoZSBDb3Vyc2Ugc2VjdGlvbiBcXFwiRnVuZGFtZW50YWxzIG9mIENvbXB1dGVyIFNjaWVuY2UgSSAoSG9ub3JzKVxcXCIgd2FzIGNoYW5nZWQgc3VjY2Vzc2Z1bGx5LlwiXV0iLCJfYXV0aF91c2VyX2lkIjoyLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2014-09-01 17:40:32-05
t5m5rqq909y7ujdy361nfoipu8v5yaeh	N2M1NTY4OTA5NTUyMTc3OGY0MjlkNjcyOGFkZjgyMzg1MGU0ODMwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-08-31 03:55:51-05
p6lqgx5k4esngx33oe9xfo7bxblvs3vg	N2M1NTY4OTA5NTUyMTc3OGY0MjlkNjcyOGFkZjgyMzg1MGU0ODMwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-10-21 21:12:13.861882-05
iuj2y4cp1znbju709963r8wz5mpt26t1	N2M1NTY4OTA5NTUyMTc3OGY0MjlkNjcyOGFkZjgyMzg1MGU0ODMwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-10-29 17:20:45.848439-05
jxueyi5gm04ysmpepnkub3ufpah3oi9q	N2M1NTY4OTA5NTUyMTc3OGY0MjlkNjcyOGFkZjgyMzg1MGU0ODMwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-12-02 12:25:09.251754-06
gxf2lrtgitr7hezvfac6hvfb39x8pvkj	N2M1NTY4OTA5NTUyMTc3OGY0MjlkNjcyOGFkZjgyMzg1MGU0ODMwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-10-22 11:28:07.557245-05
jvrw5a6elran9uj9g8x0thqa4u7sku5z	N2M1NTY4OTA5NTUyMTc3OGY0MjlkNjcyOGFkZjgyMzg1MGU0ODMwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-12-05 11:21:52.091908-06
happ4w4h717scjc2w1ungm489i6q1wrb	N2M1NTY4OTA5NTUyMTc3OGY0MjlkNjcyOGFkZjgyMzg1MGU0ODMwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-10-29 07:53:21.989167-05
93zy8kjx0eywahtbghd66me8b7wieq8i	N2M1NTY4OTA5NTUyMTc3OGY0MjlkNjcyOGFkZjgyMzg1MGU0ODMwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-10-29 20:04:32.083802-05
1zhe8axbp9jxvt9qd80eeigwqbrnkrp3	N2M1NTY4OTA5NTUyMTc3OGY0MjlkNjcyOGFkZjgyMzg1MGU0ODMwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-12-05 13:00:22.696788-06
bsth227h8thaifcjvceb8y2ryqljsqs6	N2M1NTY4OTA5NTUyMTc3OGY0MjlkNjcyOGFkZjgyMzg1MGU0ODMwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-12-15 07:19:11.245561-06
r9rd1q50g3no1q9hkyj0634vpxyg5w5m	N2M1NTY4OTA5NTUyMTc3OGY0MjlkNjcyOGFkZjgyMzg1MGU0ODMwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-12-16 08:47:50.830191-06
3bnbcftcl2s30yq578ixze7omfcmf0wz	NWVmZGNkZjUyNmI3NzY5NjQzOGNmMzEzNTRiYzFiOTRlMDNjZmI5MTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6OH0=	2015-01-28 11:25:17.032767-06
0jglhyj1tv6z6m97rgqxirc1fsqjbtvp	N2M1NTY4OTA5NTUyMTc3OGY0MjlkNjcyOGFkZjgyMzg1MGU0ODMwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-11-05 08:47:17.914128-06
vvejmliwftf8c23l7m52phiyupjfor3d	N2M1NTY4OTA5NTUyMTc3OGY0MjlkNjcyOGFkZjgyMzg1MGU0ODMwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-11-05 16:27:32.83834-06
0whrmiy8219lv0gdl2w0i1kcfgcsfh6e	N2M1NTY4OTA5NTUyMTc3OGY0MjlkNjcyOGFkZjgyMzg1MGU0ODMwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2015-02-03 10:11:25.9018-06
jl1om5hjpc7akqv3ne5343ruhyrvblt4	N2M1NTY4OTA5NTUyMTc3OGY0MjlkNjcyOGFkZjgyMzg1MGU0ODMwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-11-11 16:38:26.005177-06
pot56uc4ognrg17ok4xs1hntf2lc7h3m	N2M1NTY4OTA5NTUyMTc3OGY0MjlkNjcyOGFkZjgyMzg1MGU0ODMwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-11-11 17:12:59.176818-06
9tq5gj2mmj9f5rosp7prf2dssqm38dj7	NWVmZGNkZjUyNmI3NzY5NjQzOGNmMzEzNTRiYzFiOTRlMDNjZmI5MTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6OH0=	2015-03-03 06:27:36.661689-06
44di0lin3jhi6119u336m2q2oxa2p2b0	NWVmZGNkZjUyNmI3NzY5NjQzOGNmMzEzNTRiYzFiOTRlMDNjZmI5MTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6OH0=	2015-03-03 08:01:04.330153-06
dzeu8qhsa36hel717wuzx0axdyo5acbi	N2M1NTY4OTA5NTUyMTc3OGY0MjlkNjcyOGFkZjgyMzg1MGU0ODMwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-11-18 17:29:59.368131-06
twf876hz6pxrbbxjq0074x5xl6go2pxn	MGE3YWIyZDk5ODNiOTQwNGExMjQ0M2Y2NTJhYThiNjQ0ZWUwZWM1NDp7Il9hdXRoX3VzZXJfaWQiOjEsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2014-11-23 18:43:48.371885-06
wks8g5oylcln93et4yij5sjwc7zie76u	NWVmZGNkZjUyNmI3NzY5NjQzOGNmMzEzNTRiYzFiOTRlMDNjZmI5MTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6OH0=	2015-03-03 09:06:44.949763-06
fv8o26kho4igx6d7lbbnosowif7jqorb	N2M1NTY4OTA5NTUyMTc3OGY0MjlkNjcyOGFkZjgyMzg1MGU0ODMwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-11-25 11:52:50.625733-06
ck8g0uztva91xd79wexsrmf9xfv1bf1i	N2M1NTY4OTA5NTUyMTc3OGY0MjlkNjcyOGFkZjgyMzg1MGU0ODMwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-11-25 18:16:23.057881-06
94m8ji1ccs6ijk39tvk1g1ddji4u3874	N2M1NTY4OTA5NTUyMTc3OGY0MjlkNjcyOGFkZjgyMzg1MGU0ODMwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-11-27 07:27:18.038155-06
4lziu39xcbz0mvyg4vjcgg8aqrox7wx0	NWVmZGNkZjUyNmI3NzY5NjQzOGNmMzEzNTRiYzFiOTRlMDNjZmI5MTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6OH0=	2015-03-10 10:06:59.595702-05
f0jlyg1zb338oe2x941apwa2egam9iqp	NWVmZGNkZjUyNmI3NzY5NjQzOGNmMzEzNTRiYzFiOTRlMDNjZmI5MTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6OH0=	2015-03-17 07:39:39.103447-05
cdp49a8ckkiuzw800uvmnu7jleq8dgmk	NWVmZGNkZjUyNmI3NzY5NjQzOGNmMzEzNTRiYzFiOTRlMDNjZmI5MTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6OH0=	2015-03-17 08:46:41.684221-05
bww4mnnzxzt5hbinjnytobua9vlu8cif	NWVmZGNkZjUyNmI3NzY5NjQzOGNmMzEzNTRiYzFiOTRlMDNjZmI5MTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6OH0=	2015-03-24 08:35:58.101054-05
v0hq68gfkyee42hz3ye7pnwyl3079c4q	N2M1NTY4OTA5NTUyMTc3OGY0MjlkNjcyOGFkZjgyMzg1MGU0ODMwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2015-03-24 11:46:24.299111-05
bngtcyp9al88dxd8xjywi9j0av2caneo	NWVmZGNkZjUyNmI3NzY5NjQzOGNmMzEzNTRiYzFiOTRlMDNjZmI5MTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6OH0=	2015-04-06 10:45:28.178175-05
afa1z7vzdc13m3bdnderxpa9qps7uwsu	NWVmZGNkZjUyNmI3NzY5NjQzOGNmMzEzNTRiYzFiOTRlMDNjZmI5MTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6OH0=	2015-04-07 08:03:23.428576-05
dz50w3pmx9mpnolbm8upk5931a8troly	NWVmZGNkZjUyNmI3NzY5NjQzOGNmMzEzNTRiYzFiOTRlMDNjZmI5MTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6OH0=	2015-04-14 06:19:26.726042-05
4a1mls9g0ogtdejfucgihrvh76ta77ac	NWVmZGNkZjUyNmI3NzY5NjQzOGNmMzEzNTRiYzFiOTRlMDNjZmI5MTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6OH0=	2015-04-14 08:52:09.711471-05
0z255i2691a56d5jgd50acol2ogz6wj1	MzA4YmQ5YWI1OTMzZGIyMDQ0ZDcyYjBmM2Q2Y2I2ODg1ODE3ZDZmNzp7fQ==	2015-04-21 10:31:02.077162-05
ay1x5cdl8zbgu7mseme5t1tccpybcw22	NWVmZGNkZjUyNmI3NzY5NjQzOGNmMzEzNTRiYzFiOTRlMDNjZmI5MTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6OH0=	2015-04-28 07:52:40.408789-05
1k9v7esiauanxo36fmcyafczncdnmj4c	N2M1NTY4OTA5NTUyMTc3OGY0MjlkNjcyOGFkZjgyMzg1MGU0ODMwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-09-04 11:05:28.427122-05
wwdrusfrmelyt8hszfjlsdthscngg9h4	N2M1NTY4OTA5NTUyMTc3OGY0MjlkNjcyOGFkZjgyMzg1MGU0ODMwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-09-15 14:12:24.519201-05
29gy7ccvia7t0uitsd7neu92hhevb72w	N2M1NTY4OTA5NTUyMTc3OGY0MjlkNjcyOGFkZjgyMzg1MGU0ODMwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-09-04 22:36:55.0711-05
u26gw11lbyzg6yz3rao823aio269cvab	N2M1NTY4OTA5NTUyMTc3OGY0MjlkNjcyOGFkZjgyMzg1MGU0ODMwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-09-07 20:33:23.506842-05
ig3gna1b0q4hv4hmetyafny4etq4k1cq	N2M1NTY4OTA5NTUyMTc3OGY0MjlkNjcyOGFkZjgyMzg1MGU0ODMwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-09-09 18:40:56.890986-05
foymea8gylaxur4promsxhups59aqrvy	MzA4YmQ5YWI1OTMzZGIyMDQ0ZDcyYjBmM2Q2Y2I2ODg1ODE3ZDZmNzp7fQ==	2014-09-10 10:24:23.482672-05
29ya79b4grjor58jeh4gungnbv6xaxll	N2M1NTY4OTA5NTUyMTc3OGY0MjlkNjcyOGFkZjgyMzg1MGU0ODMwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-09-10 10:54:00.701841-05
mtwow5enomr5e7br42ngpxhpdui51e4k	NDVmYTdhMjU5MjgyZmRiYjBiY2FlMzA5MjlmZGNmN2FiNTYyMjQyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=	2014-09-10 11:09:57.639861-05
0hq22xvjazujkwqrlfl4j4afshsy4hle	MzA4YmQ5YWI1OTMzZGIyMDQ0ZDcyYjBmM2Q2Y2I2ODg1ODE3ZDZmNzp7fQ==	2014-09-15 14:38:28.54447-05
wx4rlx9yxmvx5ssq0do7vhe2kdjdurx0	N2M1NTY4OTA5NTUyMTc3OGY0MjlkNjcyOGFkZjgyMzg1MGU0ODMwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-09-12 09:14:58.030821-05
wwfiqt6bj18x0tsslie4tfxubwnrezb2	N2M1NTY4OTA5NTUyMTc3OGY0MjlkNjcyOGFkZjgyMzg1MGU0ODMwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-09-14 21:49:26.33916-05
9g3yeees47894032z7114f9hn2uqvugs	N2M1NTY4OTA5NTUyMTc3OGY0MjlkNjcyOGFkZjgyMzg1MGU0ODMwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-09-15 12:45:31.379693-05
b16fgvzgi9r5kf0fwg5oaj4aw935x3ks	N2M1NTY4OTA5NTUyMTc3OGY0MjlkNjcyOGFkZjgyMzg1MGU0ODMwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-09-16 08:17:41.651746-05
6wrgdiuoio9pwlr6o2pkj4748qrcksoa	N2M1NTY4OTA5NTUyMTc3OGY0MjlkNjcyOGFkZjgyMzg1MGU0ODMwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-09-16 19:35:21.323344-05
46eed5dduhwu7eocrf0a9qnfxyxb2idq	N2M1NTY4OTA5NTUyMTc3OGY0MjlkNjcyOGFkZjgyMzg1MGU0ODMwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-09-17 17:27:20.916752-05
lqvjt3argo9ile02h0bsztptopllg32h	MzA4YmQ5YWI1OTMzZGIyMDQ0ZDcyYjBmM2Q2Y2I2ODg1ODE3ZDZmNzp7fQ==	2014-09-17 19:30:31.02211-05
6ozn5jrjk6otuwu63cj0i9fwq0te5vbv	N2M1NTY4OTA5NTUyMTc3OGY0MjlkNjcyOGFkZjgyMzg1MGU0ODMwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-09-18 08:32:49.052973-05
dn0zpskjpq2qyctsstalaq4dopehcguk	MzA4YmQ5YWI1OTMzZGIyMDQ0ZDcyYjBmM2Q2Y2I2ODg1ODE3ZDZmNzp7fQ==	2014-09-18 10:30:03.823314-05
olgf6pcknfmjxh9205t8y6gfk0os3pzq	N2M1NTY4OTA5NTUyMTc3OGY0MjlkNjcyOGFkZjgyMzg1MGU0ODMwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-09-18 11:08:46.917731-05
1ykew4qopfsl9hxsty2gv40421adez99	N2M1NTY4OTA5NTUyMTc3OGY0MjlkNjcyOGFkZjgyMzg1MGU0ODMwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-09-19 15:53:45.965235-05
bla8duzfsu3yg6akz5bws6fsojn65gsl	N2M1NTY4OTA5NTUyMTc3OGY0MjlkNjcyOGFkZjgyMzg1MGU0ODMwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-09-24 16:56:49.880777-05
z4is8pbk56zj09i8yif1bwvwmt8nnd6l	NDVmYTdhMjU5MjgyZmRiYjBiY2FlMzA5MjlmZGNmN2FiNTYyMjQyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=	2014-09-24 22:17:40.256207-05
36whwwg0qxfn74iie2fkwgek2oau8pts	NDVmYTdhMjU5MjgyZmRiYjBiY2FlMzA5MjlmZGNmN2FiNTYyMjQyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=	2014-10-02 09:06:09.92534-05
dqyki4o8mn0h0vg2yafcbciudhanh20l	NDVmYTdhMjU5MjgyZmRiYjBiY2FlMzA5MjlmZGNmN2FiNTYyMjQyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=	2014-09-25 13:37:28.923438-05
zibp6a8jfrrytbgiwhf7l6th49a1mgdi	N2M1NTY4OTA5NTUyMTc3OGY0MjlkNjcyOGFkZjgyMzg1MGU0ODMwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-09-29 09:49:42.688271-05
i7vy4e5j0drrb52m0p9puy8dri7fdmig	N2M1NTY4OTA5NTUyMTc3OGY0MjlkNjcyOGFkZjgyMzg1MGU0ODMwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-10-02 09:43:36.859313-05
5vl5e6mtnautlxu1uwl3jgb4i4a8tcvn	N2M1NTY4OTA5NTUyMTc3OGY0MjlkNjcyOGFkZjgyMzg1MGU0ODMwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-10-06 14:53:11.744282-05
t99rgo6hcuf9ih2zj25eg0zrwttkjxeu	N2M1NTY4OTA5NTUyMTc3OGY0MjlkNjcyOGFkZjgyMzg1MGU0ODMwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-10-07 17:59:39.890655-05
1yd2m4fiegyzfdufqqw3lm3po7fumbc7	N2M1NTY4OTA5NTUyMTc3OGY0MjlkNjcyOGFkZjgyMzg1MGU0ODMwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-10-08 15:06:23.439198-05
z3qfll60sr9nq4ph1p9opgy78k80an96	N2M1NTY4OTA5NTUyMTc3OGY0MjlkNjcyOGFkZjgyMzg1MGU0ODMwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-10-10 17:08:41.771408-05
nxsfdqxy0rmathl52uyd3lcujvw3kqyy	N2M1NTY4OTA5NTUyMTc3OGY0MjlkNjcyOGFkZjgyMzg1MGU0ODMwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-10-10 10:31:36.417353-05
u5w4a6akx0xsv56obrzrylte3l55144i	N2M1NTY4OTA5NTUyMTc3OGY0MjlkNjcyOGFkZjgyMzg1MGU0ODMwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-10-14 10:33:34.857348-05
122peafj1tc39u99sbpsp5a3t4nawovc	N2M1NTY4OTA5NTUyMTc3OGY0MjlkNjcyOGFkZjgyMzg1MGU0ODMwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-10-15 09:25:47.676816-05
zhckxwcdiv5jxct9qoce2qlvubnnkdh5	N2M1NTY4OTA5NTUyMTc3OGY0MjlkNjcyOGFkZjgyMzg1MGU0ODMwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-10-21 17:04:07.270487-05
11v6xw74rh9jm3oax9bbj2tua0xhr1ek	MGQ5ZTU2ZGMzZDJmMGZjOTQyMTAwOTY2M2E1N2M1YzEwODFiN2NiNzp7Il9tZXNzYWdlcyI6IltbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJUaGUgUXVvdGUgXFxcIkFub255bW91c1xcXCIgd2FzIGFkZGVkIHN1Y2Nlc3NmdWxseS4gWW91IG1heSBhZGQgYW5vdGhlciBRdW90ZSBiZWxvdy5cIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwiVGhlIFF1b3RlIFxcXCJBbm9ueW1vdXNcXFwiIHdhcyBhZGRlZCBzdWNjZXNzZnVsbHkuIFlvdSBtYXkgYWRkIGFub3RoZXIgUXVvdGUgYmVsb3cuXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIlRoZSBRdW90ZSBcXFwiQW5vbnltb3VzXFxcIiB3YXMgYWRkZWQgc3VjY2Vzc2Z1bGx5LiBZb3UgbWF5IGFkZCBhbm90aGVyIFF1b3RlIGJlbG93LlwiXSxbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJUaGUgUXVvdGUgXFxcIkFub255bW91c1xcXCIgd2FzIGFkZGVkIHN1Y2Nlc3NmdWxseS4gWW91IG1heSBhZGQgYW5vdGhlciBRdW90ZSBiZWxvdy5cIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwiVGhlIFF1b3RlIFxcXCJBbm9ueW1vdXNcXFwiIHdhcyBhZGRlZCBzdWNjZXNzZnVsbHkuIFlvdSBtYXkgYWRkIGFub3RoZXIgUXVvdGUgYmVsb3cuXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIlRoZSBRdW90ZSBcXFwiQW5vbnltb3VzXFxcIiB3YXMgYWRkZWQgc3VjY2Vzc2Z1bGx5LiBZb3UgbWF5IGFkZCBhbm90aGVyIFF1b3RlIGJlbG93LlwiXSxbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJUaGUgUXVvdGUgXFxcIkFub255bW91c1xcXCIgd2FzIGFkZGVkIHN1Y2Nlc3NmdWxseS4gWW91IG1heSBhZGQgYW5vdGhlciBRdW90ZSBiZWxvdy5cIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwiVGhlIFF1b3RlIFxcXCJBbm9ueW1vdXNcXFwiIHdhcyBhZGRlZCBzdWNjZXNzZnVsbHkuIFlvdSBtYXkgYWRkIGFub3RoZXIgUXVvdGUgYmVsb3cuXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIlRoZSBRdW90ZSBcXFwiQW5vbnltb3VzXFxcIiB3YXMgYWRkZWQgc3VjY2Vzc2Z1bGx5LiBZb3UgbWF5IGFkZCBhbm90aGVyIFF1b3RlIGJlbG93LlwiXSxbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJUaGUgUXVvdGUgXFxcIkFub255bW91c1xcXCIgd2FzIGFkZGVkIHN1Y2Nlc3NmdWxseS4gWW91IG1heSBhZGQgYW5vdGhlciBRdW90ZSBiZWxvdy5cIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwiVGhlIFF1b3RlIFxcXCJBbm9ueW1vdXNcXFwiIHdhcyBhZGRlZCBzdWNjZXNzZnVsbHkuIFlvdSBtYXkgYWRkIGFub3RoZXIgUXVvdGUgYmVsb3cuXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIlRoZSBRdW90ZSBcXFwiQW5vbnltb3VzXFxcIiB3YXMgYWRkZWQgc3VjY2Vzc2Z1bGx5LiBZb3UgbWF5IGFkZCBhbm90aGVyIFF1b3RlIGJlbG93LlwiXSxbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJUaGUgUXVvdGUgXFxcIkFub255bW91c1xcXCIgd2FzIGFkZGVkIHN1Y2Nlc3NmdWxseS4gWW91IG1heSBhZGQgYW5vdGhlciBRdW90ZSBiZWxvdy5cIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwiVGhlIFF1b3RlIFxcXCJBbm9ueW1vdXNcXFwiIHdhcyBjaGFuZ2VkIHN1Y2Nlc3NmdWxseS4gWW91IG1heSBhZGQgYW5vdGhlciBRdW90ZSBiZWxvdy5cIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwiVGhlIFF1b3RlIFxcXCJBbm9ueW1vdXNcXFwiIHdhcyBhZGRlZCBzdWNjZXNzZnVsbHkuIFlvdSBtYXkgYWRkIGFub3RoZXIgUXVvdGUgYmVsb3cuXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIlRoZSBRdW90ZSBcXFwiQW5vbnltb3VzXFxcIiB3YXMgYWRkZWQgc3VjY2Vzc2Z1bGx5LiBZb3UgbWF5IGFkZCBhbm90aGVyIFF1b3RlIGJlbG93LlwiXSxbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJUaGUgUXVvdGUgXFxcIkFub255bW91c1xcXCIgd2FzIGFkZGVkIHN1Y2Nlc3NmdWxseS4gWW91IG1heSBhZGQgYW5vdGhlciBRdW90ZSBiZWxvdy5cIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwiVGhlIFF1b3RlIFxcXCJBbm9ueW1vdXNcXFwiIHdhcyBhZGRlZCBzdWNjZXNzZnVsbHkuXCJdXSIsIl9hdXRoX3VzZXJfaWQiOjgsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2015-02-05 11:13:52.370177-06
ejsdd4fxx04jywkbrp8s048bmf6704fa	NWVmZGNkZjUyNmI3NzY5NjQzOGNmMzEzNTRiYzFiOTRlMDNjZmI5MTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6OH0=	2015-05-05 08:07:03.534466-05
earikewgevdtwx44ju9ilmjcf6s3n7qs	NWVmZGNkZjUyNmI3NzY5NjQzOGNmMzEzNTRiYzFiOTRlMDNjZmI5MTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6OH0=	2015-05-05 09:24:00.912136-05
02myw0udgnubiowto2me50kr58ikuj3q	NWVmZGNkZjUyNmI3NzY5NjQzOGNmMzEzNTRiYzFiOTRlMDNjZmI5MTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6OH0=	2015-05-12 07:14:58.316304-05
63u413kkgrvpom93zbadcvewlte2ejoo	NWVmZGNkZjUyNmI3NzY5NjQzOGNmMzEzNTRiYzFiOTRlMDNjZmI5MTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6OH0=	2015-05-12 08:44:37.30277-05
9fw2gai2s5dyzwfz8wclhkgfaqzwisxi	NWVmZGNkZjUyNmI3NzY5NjQzOGNmMzEzNTRiYzFiOTRlMDNjZmI5MTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6OH0=	2015-06-17 09:45:44.106702-05
q8gpwi5tas5igp8himdy23x24m2brmk9	NWVmZGNkZjUyNmI3NzY5NjQzOGNmMzEzNTRiYzFiOTRlMDNjZmI5MTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6OH0=	2015-07-17 10:47:31.986155-05
ep9qlcftyh8z3hcdf9jbfeu62vbxzmi2	NWVmZGNkZjUyNmI3NzY5NjQzOGNmMzEzNTRiYzFiOTRlMDNjZmI5MTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6OH0=	2015-09-04 13:39:34.69884-05
cs321i23br55vsb89pdb3xzcllsy1rsb	NWVmZGNkZjUyNmI3NzY5NjQzOGNmMzEzNTRiYzFiOTRlMDNjZmI5MTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6OH0=	2015-09-22 09:16:29.568378-05
5zeh3mxa28nuezw8tm6llsroh7orfbze	NWVmZGNkZjUyNmI3NzY5NjQzOGNmMzEzNTRiYzFiOTRlMDNjZmI5MTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6OH0=	2015-10-13 13:39:38.886236-05
977bcgt8qfgp3ov1emdypk7yd5crhr0l	NWVmZGNkZjUyNmI3NzY5NjQzOGNmMzEzNTRiYzFiOTRlMDNjZmI5MTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6OH0=	2015-11-16 11:00:19.500665-06
vfnblk5z55zp90dpg1hqqmc91uxon6q3	NWVmZGNkZjUyNmI3NzY5NjQzOGNmMzEzNTRiYzFiOTRlMDNjZmI5MTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6OH0=	2015-12-29 12:18:29.912236-06
w5avw2kadfao8v5mt73xr18npp1hd6mp	NWVmZGNkZjUyNmI3NzY5NjQzOGNmMzEzNTRiYzFiOTRlMDNjZmI5MTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6OH0=	2016-03-15 18:00:10.141476-05
jz8f9w2bmguxjox95nh56utnfyrcvcsi	N2M1NTY4OTA5NTUyMTc3OGY0MjlkNjcyOGFkZjgyMzg1MGU0ODMwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2016-04-04 11:53:26.688399-05
swyu3szkygwkgvfgxwu8rznu93i7tvz8	NWVmZGNkZjUyNmI3NzY5NjQzOGNmMzEzNTRiYzFiOTRlMDNjZmI5MTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6OH0=	2016-04-22 21:09:42.097817-05
tom4bp6ygfpy2e8yrqgxqjwne1wnkzyv	NWVmZGNkZjUyNmI3NzY5NjQzOGNmMzEzNTRiYzFiOTRlMDNjZmI5MTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6OH0=	2016-05-04 18:46:13.190097-05
vbr6htsa41oeg5vygn0ql8n471t8ph6w	NWVmZGNkZjUyNmI3NzY5NjQzOGNmMzEzNTRiYzFiOTRlMDNjZmI5MTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6OH0=	2016-06-15 06:34:35.058749-05
7txe53gjf3bvincqftyh08522uuq7h43	N2M1NTY4OTA5NTUyMTc3OGY0MjlkNjcyOGFkZjgyMzg1MGU0ODMwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2016-06-16 14:57:35.211899-05
55m8ia3h70x1kch9ai47pv99hze6fco9	NWVmZGNkZjUyNmI3NzY5NjQzOGNmMzEzNTRiYzFiOTRlMDNjZmI5MTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6OH0=	2016-06-21 13:15:28.473208-05
a215b639fjojlxwmkmcj1ape7piwptpx	N2M1NTY4OTA5NTUyMTc3OGY0MjlkNjcyOGFkZjgyMzg1MGU0ODMwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2016-06-21 13:23:37.690593-05
ucu6awi3ejxsd4nfsdn29b7toxfzvr7f	N2M1NTY4OTA5NTUyMTc3OGY0MjlkNjcyOGFkZjgyMzg1MGU0ODMwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2016-08-26 16:19:52.200818-05
2ti8cvhdqvilhayd4wknzd0mat684spl	N2M1NTY4OTA5NTUyMTc3OGY0MjlkNjcyOGFkZjgyMzg1MGU0ODMwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2016-09-14 22:43:10.004947-05
6gz9khik49pnguojfn4taiagxst3ra1b	N2M1NTY4OTA5NTUyMTc3OGY0MjlkNjcyOGFkZjgyMzg1MGU0ODMwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2016-10-18 16:05:50.228647-05
2cekbzkfktrya8q8qal8k4js54uubk22	ZTBhMDhiYzc3MjdhYzExNTg0MGY2YjM5YzMxYzYxYTczZWJjYTdlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjRhM2I0MjU0YzVlODM3ODkyMDhhZTg3YmFiY2JkZDBhMWM0MjZiZGEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-12-28 09:58:43.154336-06
tzvtv63l5dxpa22dvbpsukhgft1k7btl	ZTBhMDhiYzc3MjdhYzExNTg0MGY2YjM5YzMxYzYxYTczZWJjYTdlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjRhM2I0MjU0YzVlODM3ODkyMDhhZTg3YmFiY2JkZDBhMWM0MjZiZGEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-12-31 22:24:30.143299-06
1xoyhl3i11qtvfnuc5gm8d486k32kv6h	ZTBhMDhiYzc3MjdhYzExNTg0MGY2YjM5YzMxYzYxYTczZWJjYTdlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjRhM2I0MjU0YzVlODM3ODkyMDhhZTg3YmFiY2JkZDBhMWM0MjZiZGEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-01-16 08:23:56.978818-06
15i2xocmo1tm0b5tjy32fxardnsu6f1x	ZTBhMDhiYzc3MjdhYzExNTg0MGY2YjM5YzMxYzYxYTczZWJjYTdlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjRhM2I0MjU0YzVlODM3ODkyMDhhZTg3YmFiY2JkZDBhMWM0MjZiZGEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-01-26 15:32:31.252458-06
g7semr1p9jvbsgq6jlz1wjeuqypnml5r	ZTBhMDhiYzc3MjdhYzExNTg0MGY2YjM5YzMxYzYxYTczZWJjYTdlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjRhM2I0MjU0YzVlODM3ODkyMDhhZTg3YmFiY2JkZDBhMWM0MjZiZGEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-02-17 08:06:35.840051-06
asgymbi590ccba8xntg3bvpeknt3g5gq	ZTBhMDhiYzc3MjdhYzExNTg0MGY2YjM5YzMxYzYxYTczZWJjYTdlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjRhM2I0MjU0YzVlODM3ODkyMDhhZTg3YmFiY2JkZDBhMWM0MjZiZGEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-05-02 10:12:24.73543-05
s4rhev3shdhyvenxbgo5cl9zzhsy49xl	ZTBhMDhiYzc3MjdhYzExNTg0MGY2YjM5YzMxYzYxYTczZWJjYTdlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjRhM2I0MjU0YzVlODM3ODkyMDhhZTg3YmFiY2JkZDBhMWM0MjZiZGEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-06-02 18:18:38.262752-05
xk40s5iml3580s8opocgzslhw1p6jr7v	MmUxMGU1YWFlM2FlNzJjZmNjY2JhNzVhYjJkZWIwMGMzMDgxYmI2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjEyZGRjOGY1NTllYWVjZDg5MTAxMzA2ZjNiNWRmZGYyOGYwMmFmMGUiLCJfYXV0aF91c2VyX2lkIjoiOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-06-10 10:32:59.9136-05
9fy7xvxoh2relkpv1oni6y5fig88h3fc	YTU3ZTM5Mzg4NmE3MzdhM2ZiZmY1NTM2ZjQ4NWNkYTBmZGI3ZGU1Nzp7Il9hdXRoX3VzZXJfaGFzaCI6IjEyZGRjOGY1NTllYWVjZDg5MTAxMzA2ZjNiNWRmZGYyOGYwMmFmMGUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI4In0=	2017-06-28 12:49:03.863318-05
ahubd6pkxtrihwd072t6bo1y7725cscs	ZTBhMDhiYzc3MjdhYzExNTg0MGY2YjM5YzMxYzYxYTczZWJjYTdlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjRhM2I0MjU0YzVlODM3ODkyMDhhZTg3YmFiY2JkZDBhMWM0MjZiZGEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-07-13 19:40:33.54093-05
k7a3nefogac7bwm50ptf6go60lgoxm05	ZTBhMDhiYzc3MjdhYzExNTg0MGY2YjM5YzMxYzYxYTczZWJjYTdlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjRhM2I0MjU0YzVlODM3ODkyMDhhZTg3YmFiY2JkZDBhMWM0MjZiZGEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-09-13 10:30:33.897062-05
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: django
--

COPY django_site (id, domain, name) FROM stdin;
1	jared-wallace.com	Jared Wallace's Webpage
\.


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('django_site_id_seq', 1, true);


--
-- Data for Name: labs_class_section; Type: TABLE DATA; Schema: public; Owner: django
--

COPY labs_class_section (id, day, "time", name, description, section_number, syllabus, room, style) FROM stdin;
3	Thursday	08:00:00	Embedded Computer Systems	A study of the architecture of embedded systems, micro-controllers, and their peripherals, as well as the languages, operating systems and special techniques required to program them.	1	labfiles/syllabus.pdf	Derrick 236	
4	Tuesday	11:00:00	Digital Logic	The course is an introduction to fundamental computer technologies, including Boolean logic design, logic circuits and devices, and basic computer hardware. Our lab will provide hands-on experience with electricity, combinational and sequential digital circuits, and computer hardware.\r\n\r\nI recommend downloading the Logisim software for use at home, if you wish to complete the labs early or get extra practice. It's very easy to use.	5	labfiles/syllabus_3.pdf	Derr 236	labfiles/IEEE_lab_report_sample.pdf
2	Tuesday	17:00:00	Foundations of Computer Science I	 Introductory course for computer science majors, minors and others desiring technical introduction to computer science. Contains overview of history and structure of the digital computer, including binary data representation. Problem solving, algorithm development, structured programming, good coding style, and control structures of C++ are emphasized.	18		Derrick 325	
1	Wednesday	17:00:00	Fundamentals of Computer Science I (Honors)	This class will cover the standard material of the Fundamentals of Computer Science course, but will go more in depth and will be much more challenging.	18	labfiles/syllabus_2.pdf	Derrick 236	labfiles/style.pdf
\.


--
-- Name: labs_class_section_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('labs_class_section_id_seq', 4, true);


--
-- Data for Name: labs_lab; Type: TABLE DATA; Schema: public; Owner: django
--

COPY labs_lab (id, number, title, description, labfile, class_section_id, visible, date, adminfile, solution_visible) FROM stdin;
24	13	Wrap up the Loose Ends	Finish the serial communication with assembly lab, or your project.		3	f	2014-12-04		f
1	0	Introduction to the Development Environment	Syllabus Review\r\nThe Code::Blocks IDE\r\nIntroduction to C++\r\nHello World\r\nProgram Structure\r\nData Types\r\nExpressions\r\nComputer Architecture	labfiles/lab0_2.zip	1	t	2014-08-27		f
5	1	Homemade Assembler, Part 1	Syntax Errors\r\nDebugging\r\nExpressions\r\nConsole I/O\r\nEvaluating Expressions\r\nOperators\r\nGit\r\n	labfiles/lab1_6.zip	1	t	2014-09-03	labfiles/assembler.cpp	t
11	7	Homemade Assembler, Part 4	File I/O\r\nIntroduction to functions	labfiles/lab7_1.zip	1	t	2014-10-15	labfiles/assembler_2.cpp	t
3	2	First Embedded Program	In this lab our goal is to understand the design of a sensor application and to begin to learn a component-based programming languages, to wit: nesC.	labfiles/Embedded_lab2.zip	3	t	2014-09-11	labfiles/lab2_solution.zip	t
2	1	Introduction to embedded systems programming	This lab is mainly going to be a chance to familiarize yourself with the way future labs will be conducted,\r\nas well as a chance to get used to the development environment. Obstensibly, the goals for this lab include:\r\nunderstanding the sensor development environment, learning to compile and install sensor applications, and understanding the functionality of an embedded system.	labfiles/Embedded_lab2_1.zip	3	t	2014-09-04		f
6	2	A Simple Calculator	Relational Operators: (<,>,<=,>=,==,!=)\r\nLogical Operators: (&&, ||, !, ^)\r\nif(){}\r\nif(){}else{}\r\n	labfiles/honors_lab2.zip	1	t	2014-09-10	labfiles/calculator.cpp	t
4	3	Radio Communication, Part 1	Today we get to play with some fun stuff, like wireless communication. We also get to practice learning to find, read and use API's (application programming interfaces).	labfiles/lab3_4.zip	3	t	2014-09-18	labfiles/lab3_part1_solution.zip	f
9	5	Homemade Assembler, Part 3	Midterm Week\r\nAn introduction to the wonderful world of Linux\r\nReview and extension of existing skills\r\nSomething to think about: How can a person calculate a weighted average without using decimal points?\r\n	labfiles/lab5_2.zip	1	t	2014-10-01	labfiles/solution.zip	t
7	3	Fun and Games	Quiz 1\r\nIntroduction to loops (while, for, do-while)	labfiles/lab3_1.zip	1	t	2014-09-17	labfiles/lab3_solution.zip	t
8	4	Homemade Assembler, Part 2	1-D Arrays\r\nAdvanced Loops\r\n	labfiles/lab4_1.zip	1	t	2014-09-24	labfiles/assembler_1.cpp	t
15	4	Radio Communication, Part 2	Today we'll finish up our work from the last lab on wireless communication and API's.	labfiles/lab3_5.zip	3	t	2014-09-25	labfiles/lab3_part2_solution.zip	f
16	5	Sensing Light, Part 1	Today we get to play around with the sensor board (finally). We'll be writing an app to detect the presence or lack of light.	labfiles/lab4_3.zip	3	t	2014-10-02	labfiles/lab4_part1_solution.zip	f
26	11	How are you flying?	We explore the magic that is Python	labfiles/lab11.zip	1	t	2014-11-12	labfiles/solution_1.zip	f
17	6	Sensing Light, Part 2	We'll be finishing up the previous lab on detecting light.	labfiles/lab4_4.zip	3	t	2014-10-09	labfiles/lab4_part2_solution.zip	f
19	8	Serial Communication, Part 2	We'll be finishing up our previous lab on interrupts and UART communication.	labfiles/lab5_4.zip	3	t	2014-10-23	labfiles/lab5_part2_solution.zip	f
10	6	Conway's Game of Life	Two-dimensional arrays	labfiles/lab6h.zip	1	t	2014-10-08	labfiles/gol_1.cpp	t
20	9	Project, Part 1	Today we'll be tackling a group project. All of y'all will need to work together and program accurately for this project to have a snowball's chance in hell of working properly ;)	labfiles/project_2.zip	3	t	2014-10-30	labfiles/project_part1__solution.zip	f
18	7	Serial Communication, Part 1	This is the first time we'll mess around with interrupts, but it won't be the last. It's crucial you have a firm grasp on these concepts as the final lab will cover the same ground (just in a different language).	labfiles/lab5_3.zip	3	t	2014-10-16	labfiles/lab5_part1_solution.zip	f
14	9	Play That Funky Music	Structs	labfiles/lab9_1.zip	1	t	2014-10-29		f
12	8	Homemade Assembler, Part 5	Functions\r\nFunction Overloading\r\nParameters: ByRef, ByVal\r\n	labfiles/lab8_1.zip	1	t	2014-10-22	labfiles/assembler_3.cpp	t
23	12	Serial Communication with Assembly, Part 2	We'll try to finish up our work in assembly language today.	labfiles/lab6_2.zip	3	t	2014-11-20	labfiles/lab6_part2_solution.zip	f
25	10	If you're happy and you know it...	We delve into set theory a bit as we explore searching and sorting	labfiles/lab10_new.zip	1	t	2014-11-05	labfiles/happy.cpp	f
21	10	Project, Part 2	Today we continue of work of building a sweet network of embedded controllers.	labfiles/project_3.zip	3	t	2014-11-06	labfiles/SensorC.nc	t
22	11	Serial Communication with Assembly, Part 1	Remember those sexy interrupts and UART communication from a few weeks ago? Remember how I told you to get a firm grasp on the material? Today you get to repeat the same lab, but in assembly language.	labfiles/lab6_1.zip	3	t	2014-11-13	labfiles/lab6_part1_solution.zip	f
27	12	Recursion	You must first understand recursion, in order to understand recursion.	labfiles/lab12.zip	1	t	2014-11-19	labfiles/solution_2.zip	t
30	3	Logic and Delay in Chips	We continue our work with real hardware.	labfiles/2014_Fall_Lab_3.pdf	4	t	2015-02-24	labfiles/2014_Spring_Lab_3_Solution.pdf	f
35	8	Finite State Machine Design – Mealy Machine	We start working with more complicated logic	labfiles/2014_Fall_Lab_8.pdf	4	t	2015-04-07	labfiles/2014_Spring_Lab_8_Solution.pdf	f
37	10	Sequential Logic Design	We put together all we have learned over the semester.	labfiles/2014_Fall_Lab_10.pdf	4	t	2015-04-21	labfiles/2014_Spring_Lab_10_Solution.pdf	f
34	7	Latches and Flip-Flips from NAND Gates	We start tackling basic memory chips.	labfiles/2014_Fall_Lab_7.pdf	4	t	2015-03-31	labfiles/2014_Spring_Lab_7_Solution.pdf	f
38	11	Busses and Memories	Our last lab, we look at how random access memory is built.	labfiles/2014_Fall_Lab_11.pdf	4	t	2015-04-28	labfiles/2014_Spring_Lab_11_Solution.pdf	f
33	6	Combinational Logic Function Design, Optimization and Implementation	We will build a functional 7 segment display.	labfiles/2014_Fall_Lab_6.pdf	4	t	2015-03-24	labfiles/2014_Spring_Lab_6_Solution.pdf	f
32	5	SOP/POS Equations and K-Maps	We work on using k-maps for circuit simplification and design.	labfiles/2014_Fall_Lab_5.pdf	4	t	2015-03-10	labfiles/2014_Spring_Lab_5_Solution.pdf	f
29	2	Logic Gates and Basic Chips	Today we'll be using some very basic chips, connected with the Elvis bread board.	labfiles/2014_Fall_Lab_2.pdf	4	t	2015-02-17	labfiles/2014_Spring_Lab_2_Solution.pdf	f
28	1	Introduction to the Elvis Board	Today we get familiar with the Elvis board.	labfiles/2014_Fall_Lab_1.pdf	4	t	2015-02-10	labfiles/2014_Spring_Lab_1_Solution.pdf	f
31	4	Introduction to DSCH	We start getting familiar with the simulation software we'll be using the rest of the semester.	labfiles/2014_Fall_Lab_4.pdf	4	t	2015-03-03	labfiles/2014_Spring_Lab_4_Solution.pdf	f
39	0	Introduction	We cover logistics and the development environment		2	t	2013-08-27		f
40	1	C++ basics	c++ program layout, literals and variables, common errors and debugging	labfiles/lab1_7.zip	2	t	2013-09-03		f
41	2	Console I/O	We'll cover input and output to our programs, as well as arithmetic and shorthand operators.	labfiles/lab2_1.pdf	2	t	2013-09-10		f
42	3	File I/O	We'll look at how to utilize files for input and output instead of the console.	labfiles/lab3_6.zip	2	t	2013-09-17		f
43	4	Conditional Statements	Today we will be talking about relational operators and conditional statements.	labfiles/lab4.pdf	2	t	2013-09-24	labfiles/key.txt	f
44	5	Logical Operators	Today we build on the conditionals that we dealt with last week by adding logical operators which\r\nallow us to link multiple relational expressions within a single else or else if.	labfiles/lab5.pdf	2	t	2013-10-01	labfiles/key	f
45	6	For Loops	Our first foray into control flow.	labfiles/lab6_3.zip	2	t	2013-10-08		f
46	7	(Do) While Loops	We finish our examination of loops	labfiles/lab6_19.zip	2	t	2013-10-15	labfiles/key.cpp	f
47	8	1-D arrays and Char arrays	1 dimensional arrays and character arrays (often called “C-strings”) are good examples of the\r\ndifferent types of array processing problems you will encounter.	labfiles/lab08.zip	2	t	2013-10-22	labfiles/key_1.cpp	f
48	9	Functions	Today we examine the power and utility of functional programming.	labfiles/lab9_2.zip	2	t	2013-10-29	labfiles/key_2.cpp	f
49	10	Functions (cont.)	We explore more complicated uses of functions.	labfiles/lab10_2.zip	2	t	2013-11-05	labfiles/key_3.cpp	f
50	11	Functions (cont.)	We learn how to pass arrays to functions, and the difference between pass by value and reference.	labfiles/lab11_1.zip	2	t	2013-11-12	labfiles/key_4.cpp	f
51	12	Structs	In our last regular lab of the year, we learn about structs.	labfiles/lab12_1.zip	2	t	2013-11-19		f
52	13	Final	It's been a wonderful semester, and I hate to see you go...	labfiles/final.pdf	2	t	2013-11-26		f
36	9	Finite State Machine Design – Moore Machine	We continue our study of state machines.	labfiles/2014_Fall_Lab_9.pdf	4	t	2015-04-14	labfiles/2014_Spring_Lab_9_Solution.pdf	f
\.


--
-- Name: labs_lab_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('labs_lab_id_seq', 52, true);


--
-- Data for Name: labs_quote; Type: TABLE DATA; Schema: public; Owner: django
--

COPY labs_quote (id, text, author) FROM stdin;
1	Software is like sex: it's better when it's free.	Linus Torvalds
2	Man is still the most extraordinary computer of all.	John Fitzgerald Kennedy
3	Computers are like Old Testament gods; lots of rules and no mercy.	Joseph Campbell
4	Never trust a computer you can't throw out a window.	Steve Wozniak
5	Imagine if every Thursday your shoes exploded if you tied them the usual way. This happens to us all the time with computers, and nobody thinks of complaining.	Jef Raskin
6	I am regularly asked what the average Internet user can do to ensure his security. My first answer is usually 'Nothing; you're screwed'.	Bruce Schneier
7	It's been my policy to view the Internet not as an 'information highway,' but as an electronic asylum filled with babbling loonies.	Mike Royko
8	Intelligence is the ability to avoid doing work, yet getting the work done.	Linus Torvalds
9	The Linux philosophy is 'Laugh in the face of danger'. Oops. Wrong One. 'Do it yourself'. Yes, that's it.	Linus Torvalds
10	I don't try to be a threat to Microsoft, mainly because I don't really see M$ as competition. Especially not Windows-the goals of Linux and Windows are simply so different.	Linus Torvalds
12	In God we trust–all others must submit an X.509 certificate.	Charles Forsythe
13	Failure is not an option -- it comes bundled with Windows.	Anonymous
14	To err is human... to really foul up requires the root password.	Anonymous
15	If at first you don't succeed; call it version 1.0	Anonymous
16	If Python is executable pseudocode, then perl is executable line noise.	Anonymous
17	Windows Vista: It's like upgrading from Bill Clinton to George W. Bush.	Anonymous
18	My software never has bugs. It just develops random features.	Anonymous
19	Programming is like sex, one mistake and you have to support it for the rest of your life.	Anonymous
20	Unix is user-friendly. It's just very selective about who its friends are.	Anonymous
21	Microsoft: "You've got questions. We've got dancing paperclips."	Anonymous
22	The Internet: where men are men, women are men, and children are FBI agents.	Anonymous
23	Any fool can use a computer. Many do.	Anonymous
24	A C program is like a fast dance on a newly waxed dance floor by people carrying razors.	Waldi Ravens
25	The use of COBOL cripples the mind; its teaching should therefore be regarded as a criminal offense.	E. W. Dijkstra
26	PHP is a minor evil perpetrated and created by incompetent amateurs, whereas Perl is a great and insidious evil, perpetrated by skilled but perverted professionals.	Jon Ribbens
27	Perl – The only language that looks the same before and after RSA encryption.	Keith Bostik
28	Always code as if the guy who ends up maintaining your code will be a violent psychopath who knows where you live.	Martin Golding
29	To iterate is human, to recurse divine.	L. Peter Deutsch
30	Don't sweat it -- it's not real life. It's only ones and zeroes. 	Gene Spafford
31	Real knowledge is to know the extent of one’s ignorance.	Confucius
32	Commenting your code is like cleaning your bathroom — you never want to do it, but it really does create a more pleasant experience for you and your guests.	Ryan Campbell
33	How rare it is that maintaining someone else’s code is akin to entering a beautifully designed building, which you admire as you walk around and plan how to add a wing or do some redecorating. More often, maintaining someone else’s code is like being thrown headlong into a big pile of slimy, smelly garbage.	Bill Venners
34	Program testing can be a very effective way to show the presence of bugs, but is hopelessly inadequate for showing their absence.	E. W. Dijkstra
35	Manually managing blocks of memory in C is like juggling bars of soap in a prison shower: It’s all fun and games until you forget about one of them.	Anonymous
36	Java is the most distressing thing to hit computing since MS-DOS.	Alan Kay
37	There’s no obfuscated Perl contest because it’s pointless.	Jeff Polk
38	UNIX is simple.  It just takes a genius to understand its simplicity.	Dennis Ritchie
39	I’m not one of those who think Bill Gates is the devil.  I simply suspect that if Microsoft ever met up with the devil, it wouldn’t need an interpreter.	Nicholas Petreley
40	Build a system that even a fool can use, and only a fool will want to use it.	Anonymous
41	If you're having trouble sounding condescendent, get a Unix user to show you how.	Scott Adams
42	Saying your OS is the best in the world 'cause more people use it is like saying McDonalds makes the best food in the world.	Anonymous
43	Windows 95 /n./ 32 bit extensions and a graphical shell for a 16 bit patch to an 8 bit operating system originally coded for a 4 bit microprocessor, written by a 2 bit company that can't stand 1 bit of competition.	Anonymous
44	I had a fortune cookie the other day and it said: 'Outlook not so good'. I said: 'Sure, but Microsoft ships it anyway'.	Anonymous
45	Letting XP run for more than a month is like re-using a condom 50 or 60 times. Theoretically it can work, but is sick and ill advised.	Anonymous
46	Remember, even paranoids have real enemies. 	Delmore Schwartz
47	 “unzip; strip; touch; finger; mount; fsck; more; yes; unmount; sleep”: my daily unix command list.	Anonymous
48	A computer lets you make more mistakes faster than any invention in human history – with the possible exceptions of handguns and tequila.	Mitch Ratcliffe
49	Relying on the Government to protect your privacy is like asking a peeping Tom to install your window blinds.	John Barlow
50	There are two major products that came out of Berkeley: LSD and UNIX. We don't believe this to be a coincidence.	Jeremy Anderson
51	The last good thing written in C++ was the Pachelbel Canon.	Jerry Olsen
52	I have not failed. I've just found 10,000 ways that won't work. 	Thomas Edison
53	A good programmer is someone who always looks both ways before crossing a one-way street.	Doug Linder
54	Macs are for those who don't want to know why their computer works.\r\nLinux is for those who want to know why their computer works.\r\nDOS is for those who want to know why their computer doesn't work.\r\nWindows is for those who don't want to know why their computer doesn't work.	Anonymous
55	This is LINUX land, in silent nights you can hear the Windows machines \r\n rebooting.	Anonymous
56	Linux is no OS. It's a core dump which boots by accident.	Anonymous
57	User, n.  The word computer professionals use when they mean "idiot.	Dave Barry
58	2 strings walk into a bar. The first string says to the bartender,\r\n"Bartender, I'll have a beer. u.5n$x5t?*&4ru!2[sACC~ErJ" The second string\r\nsays "Pardon my friend, he isn't NULL terminated."	Anonymous
59	In googlis non est, ergo non est.	Anonymous
60	Act in haste and repent at leisure; Code too soon and debug forever.	Raymond Kennington
61	Only two things are infinite: the universe and human stupidity and I'm not sure about the former.	Einstein
62	It's a hundred and six miles to Chicago, we've got a full tank of gas, half a pack of cigarettes, it's dark, and we're wearing sunglasses.\r\nHit it!	The Blues Brothers
63	gcc -O4 emails your code to Jeff Dean for a rewrite.	Anonymous
64	The rate at which Jeff Dean produces code jumped by a factor of 40  in late 2000 when he upgraded his keyboard to USB 2.0	Anonymous
65	All pointers point to Jeff Dean.	Anonymous
66	The speed of light in a vacuum used to be about 35 mph. Then Jeff Dean spent a weekend optimizing physics.	Anonymous
67	Jeff Dean was born on December 31, 1969 at 11:48 PM. It took him twelve minutes to implement his first time counter.	Anonymous
68	When Jeff Dean sends an ethernet frame there are no collisions because the competing frames retreat back up into the buffer memory on their source nic.	Anonymous
69	When Jeff Dean designs software, he first codes the binary and then writes the source as documentation.	Anonymous
70	Jeff Dean wrote an O(n^2) algorithm once. It was for the Traveling Salesman Problem.	Anonymous
71	Jeff Dean once implemented a web server in a single printf() call. Other engineers added thousands of lines of explanatory comments but still don't understand exactly how it works. Today that program is the front-end to Google Search.	Anonymous
72	When your code has undefined behavior, you get a seg fault and corrupted data. When Jeff Dean's code has undefined behavior, a unicorn rides in on a rainbow and gives everybody free ice cream.	Anonymous
73	When Jeff Dean fires up the profiler, loops unroll themselves in fear.	Anonymous
74	When Jeff Dean listens to mp3s, he just cats them to /dev/dsp and does the decoding in his head.	Anonymous
75	Jeff Dean once shifted a bit so hard, it ended up on another computer.	Anonymous
76	Jeff Dean puts his pants on one leg at a time, but if he had more legs, you would see that his approach is O(log n).	Anonymous
77	Knuth mailed a copy of TAOCP to Google. Jeff Dean autographed it and mailed it back.	Anonymous
78	The x86-64 spec includes several undocumented instructions marked 'private use'. They are actually for Jeff Dean's use.	Anonymous
79	Jeff Dean sorts his phone contacts by their vcard's md5 checksums	Anonymous
80	Two roads diverged in  a wood and Jeff Dean\r\nTook both of them in parallel\r\nAnd that has made all the difference	Anonymous
81	Documentation is like sex; when it's good, it's very good, and when it's bad, it's still better than nothing.	Anonymous
82	If it's your job to eat a frog, it's best to do it first thing in the morning. And If it's your job to eat two frogs, it's best to eat the biggest one first.	Mark Twain
83	Jeff Dean was forced to invent asynchronous APIs one day when he optimized a function so that it returned before it was invoked.	Anonymous
84	Jeff Dean proved that P=NP when he solved all NP problems in polynomial time on a whiteboard.	Anonymous
85	Jeff Dean's PIN is the last 4 digits of pi.	Anonymous
86	When Jeff gives a seminar at Stanford, it's so crowded Don Knuth has to sit on the floor.	Anonymous
87	Once, in early 2002, when the index servers went down, Jeff Dean answered user queries manually for two hours. Evals showed a quality improvement of 5 points.	Anonymous
88	Google Search was Jeff Dean's Noogler Project	Anonymous
89	Unsatisfied with constant time, Jeff Dean created the world's first O(1/n) algorithm.	Anonymous
90	Jeff Dean's resume lists the things he hasn't done; it's shorter that way.	Anonymous
91	When God said: "Let there be light!", Jeff Dean was there to do the code review.	Anonymous
92	Jeff Dean's IDE doesn't do code analysis, it does code appreciation.	Anonymous
93	Jeff Dean doesn't use ECC memory. He anticipates cosmic rays and uses them to improve performance.	Anonymous
94	Jeff Dean once failed a Turing test when he correctly identified the 203rd Fibonacci number in less than a second.	Anonymous
95	Jeff Dean invented Bigtable so that he would have a place to send his weekly snippets.	Anonymous
96	Jeff Dean can beat you at connect four. In three moves.	Anonymous
97	Jeff Dean took the bite out of Apple's logo.	Anonymous
98	Chuck Norris can kill you. Jeff Dean can kill -9 you.	Anonymous
99	Jeff Dean doesn't sleep, he just sends SIGSUSPEND to the universe.	Anonymous
100	Jeff Dean can recite 20,000 digits of pi in 5 hours. He doesn't remember them; he just recomputes them on the fly using only O(log n) space.	Anonymous
101	Jeff Dean remembers only one password. For each site, he concatenates it with the site name, computes its SHA-256 hash, and then types the result.	Anonymous
102	There is no 'Ctrl' key on Jeff Dean's keyboard. Jeff Dean is always in control.	Anonymous
103	Jeff Dean can get 1s out of /dev/zero.	Anonymous
104	Jeff Dean simply walks into Mordor.	Anonymous
105	Google once had to move out of a datacenter after Jeff Dean accidentally compressed the index so densely that a black hole was formed.	Anonymous
106	Jeff Dean invented MapReduce so he could sort his fan mail.	Anonymous
107	Chuck Norris is Jeff Dean's 20% project.	Anonymous
108	Jeff Dean's code is so fast the assembly code needs three HALT opcodes to stop it.	Anonymous
109	Vim's preferred editor is Jeff Dean.	Anonymous
111	Jeff Dean has gone to /dev/null and come back.	Anonymous
112	Jeff Dean eschews both Emacs and VI. He types his code into zcat, because it's faster that way.	Anonymous
113	One day Jeff Dean grabbed his Etch-a-Sketch instead of his laptop on his way out the door. On his way back home to get his real laptop, he programmed the Etch-a-Sketch to play Tetris.	Anonymous
\.


--
-- Name: labs_quote_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('labs_quote_id_seq', 113, true);


--
-- Data for Name: labs_section_link; Type: TABLE DATA; Schema: public; Owner: django
--

COPY labs_section_link (id, url, title, section_id) FROM stdin;
3	http://stackoverflow.com/	Stack Overflow	1
4	http://www.cplusplus.com/	Cplusplus	1
5	http://tinyos.stanford.edu/tinyos-wiki/index.php/TinyOS_Tutorials	TinyOS Tutorials	3
6	http://www.scribd.com/doc/7216829/IEEE-Format	IEEE Report Guide	3
7	http://learnpythonthehardway.org/book/index.html	Learn Python the Correct Way	1
8	http://stephensugden.com/crash_into_python/	I'm too Lazy to Learn Python the Correct Way	1
9	http://www.pythonchallenge.com/	This site is addictive. You've been warned.	1
10	http://sourceforge.net/projects/circuit/	Logisim (free software)	4
11			4
2	https://blog.udemy.com/git-tutorial-a-comprehensive-guide/	Git Tutorial (new and improved)	1
\.


--
-- Name: labs_section_link_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('labs_section_link_id_seq', 11, true);


--
-- Data for Name: my_calendar_entry; Type: TABLE DATA; Schema: public; Owner: django
--

COPY my_calendar_entry (id, title, snippet, body, created, date, creator_id, remind) FROM stdin;
4	School starts	Here comes the pain		2014-08-17 19:52:39-05	2014-08-25	\N	f
5	Census Day	Last day to drop with 100 percent refund		2014-08-17 19:54:00-05	2014-09-10	\N	f
6	Registration	Spring 2015 registration starts		2014-08-17 19:54:57-05	2014-10-05	\N	f
7	Last Drop	Last day to drop		2014-08-17 19:55:42-05	2014-10-23	\N	f
8	Thanksgiving	Gobble Gobble		2014-08-17 19:56:58-05	2014-11-26	\N	f
9	Thanksgiving	Gobble Gobble		2014-08-17 19:57:17-05	2014-11-27	\N	f
10	Thanksgiving	Gobble Gobble		2014-08-17 19:57:29-05	2014-11-28	\N	f
11	Last Day	Regular classes end		2014-08-17 19:58:18-05	2014-12-04	\N	f
12	Finals	Good luck!		2014-08-17 19:59:13-05	2014-12-08	\N	f
13	Finals	Good luck		2014-08-17 19:59:22-05	2014-12-09	\N	f
14	Finals	Good luck		2014-08-17 19:59:30-05	2014-12-10	\N	f
15	Finals	Good luck		2014-08-17 19:59:38-05	2014-12-11	\N	f
16	Finals	Good luck		2014-08-17 19:59:47-05	2014-12-12	\N	f
17	Labor Day	Classes do not meet	Have fun :)	2014-08-25 11:05:22.65878-05	2014-09-01	2	f
\.


--
-- Name: my_calendar_entry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('my_calendar_entry_id_seq', 17, true);


--
-- Data for Name: projects_project; Type: TABLE DATA; Schema: public; Owner: django
--

COPY projects_project (id, title, shortdescription, fulldescription, binaryfile, sourcefile, language, classification, created_date) FROM stdin;
1	St.Somewhere	Console based RPN calculator	St.Somewhere is a console based RPN calculator that allows on-the-fly conversion of the entire stack to different bases. Currently St. Somewhere supports hexadecimal, octal, decimal and binary. I'd like to refactor this a some point, but it's on the backburner.	projects/stSomewhere_1	projects/stSomewhere_1.zip	C++	personal	2012-12-10 23:00:00-06
2	Game of Life	Console based implementation of Conway's Game of Life	This program is an implementation of Conway's Game of Life, using a torodial array. The binary was compiled on 64 bit Linux, but includes instructions for porting to Windows. There are options to customize it, instructions are in the source code. I'd like to to turn this into a screensaver, but with colored pixels instead of stars.	projects/gol	projects/game_of_life.cpp	C++	school	2012-11-05 20:00:00-06
3	Deal or No Deal	Console based version of the classic game show	A decent way to pass the time. I wrote this during my freshman coding class. Written for 64 bit Linux, but ought to work for Windows.	projects/dond	projects/deal_or_no_deal.cpp	C++	school	2012-10-01 21:00:00-05
4	Custom Assembler	A crude assembler project	While in no way is this a true assembler, the functionality is similar. This has two parts. Each part is an implementation of an assembler for a basic (psuedo)assembly language. The first part reads in a single line at a time, executing each line in turn. The second part utilizes program memory and data memory in the form of two arrays, and reads in the entire program at once before executing. This was another fun project from school. The binary link actually holds the first part, the source link the second.	projects/assembler.zip	projects/assembler_1.zip	C++	school	2012-10-15 19:00:00-05
5	University Netboot	Our netboot solution for the labs at school	In order to meet the requirements of a stable, easy to maintain lab environment, I chose to implement an LTSP solution. I have created two LTSP servers, one based on Ubuntu 12.04 and the other on Ubuntu 14.04. Each server offers different images, including a base lab image, an ACM programming competition image, and an Embedded Systems lab image. The lab computers are served boot information from DNSmasq (we have no control over the university dns server) and chainload an ipxe image with an embedded script that directs the clients to our boot server. Our boot server runs a Python web script that generates the boot menu. The boot menu is generated for each client based on the mac address of the client. I maintain a MySQL database with certain information for each client, namely last known IP, default boot option and room number. For example, the only clients that get the Embedded Systems boot option are in room Derr 236. Furthermore, client computers that are not registered are not permitted to netboot. When such clients attempt to netboot, they are given a ticket number and an email address to contact. This ensures we have accurate records for each client. My co-worker Mason Egger wrote an admin web interface for the registration system in Perl.	projects/boot-server-webpages.zip	projects/boot_1.py	Python	work	2014-02-21 14:00:00-06
6	Personal Webpage	This webpage was designed and implemented by me.	In the late spring of 2014, I was tasked to assist my immediate supervisor in redesigning the Computer Science Department website. My supervisor chose to utilize the Django framework, as he was already conversant in Python. Personally, I'd never used a framework of any kind, and I knew nothing of Python. However, I quickly dove in and began learning by doing. After around a month and a half, I felt comfortable enough to tackle redesigning my own webpage. I chose to use Django as well, as that was what I was familiar with. I also chose to take advantage of Twitter's Bootstrap framework, since actual design is not my strongest suit. This website is, and will continue to be, a work in progress.			Python	personal	2014-05-25 17:00:58-05
8	Personal Server	A CentOS 7 based VM that hosts my webpage and mail server	My personal server is a CentOS 7 based VM hosted by Rackspace. The server hosts my website and functions as my mail server. The mail server is Postfix/Dovecot, with TLS encryption and SASL authentication. The server is protected by Advanced Policy Firewall, Fail2Ban and SELinux.			Linux	personal	2014-08-17 03:48:01-05
9	Inventory Management System	Class project to implement an inventory management program for a car dealership	The second project in my first Java class. This program was written with my partner, Mason Egger. The project currently has no GUI, though the instructor has hinted strongly that that might change.	projects/inventory.zip	projects/inventory_1.zip	Java	school	2014-09-25 09:25:58-05
10	Super Simple C Compiler	A functioning compiler targeting the 32 bit MIPS architecture	This was a semester long project my last semester. We completed the project in 4 phases: scanner, parser, semantic analyse and codegen. The compiler is written in C, and compiles a minimal subset of C called minC. The main features of minC include "while" as the loop construct, if/else/ifelse as conditional construct, single parameter functions and only integer data types. Arrays are not supported at this time. The assembly file produced will run on the Mars simulator.\r\n\r\nFuture plans include adding array support, arbitrary parameter support, a more sane register allocator, and a port to ARM assembly.\r\n\r\nSource code is available <a href=https://bitbucket.org/jared-wallace/sscc>here</a>.	projects/mcc_1		C	school	2015-05-09 08:36:09-05
7	University Webpage	I'm assisted in the redesign of our University webpage.	My former supervisor and I rebuiilt the Texas State Computer Science Department website from scratch. We used the Django and Bootstrap frameworks. I was responsible for implementing registration, password reset, profiles, employment and news (a posting app). I also selected and modified for Django the bootstrap template we used. Some of the code was re-purposed from existing apps, like Django-Profiles and Django-Registration, while other code was created from scratch. For the latest code, you'll need to email me, as the Git repository is private.\r\n<p>\r\n<b>The site is now live at <a href="http://cs.txstate.edu" >http://cs.txstate.edu</a></b>.\r\n</p>		projects/CS-Webpage_1.zip	Python	work	2014-04-07 13:00:00-05
12	Zlib Scripts	A collection of scripts for IBM Video MCU log handling	The IBM Sametime Video MCU writes its logs in raw zlib format, which is not readable on Linux distros. These tools exploit the fact that gzip format does not require a footer to be extractable by the gunzip tool, by prepending the gzip header to the raw zlib compressed file in question.\r\n<p>\r\nThese tools include ibmzgrep (basic search), zvim (for reading logs) and zextract(for extracting logs).\r\n</p>\r\n<p>\r\nThese tools can now be installed with the following steps:\r\n</p>\r\n<h4>Fedora:</h4>\r\n<ul>\r\n<li>sudo dnf copr enable jaredwallace/ztools</li>\r\n<li>sudo dnf install ztools</li>\r\n</ul>\r\n<h4>RHEL:</h4>\r\n<ul>\r\n<li>sudo yum copr enable jaredwallace/ztools</li>\r\n<li>sudo yum install ztools</li>\r\n</ul>	projects/ztools.tar		Bash	work	2016-08-12 16:32:36-05
11	Macintosh OSX WebPlayer plugin fix	This is a bash script a colleague and I wrote to fix a common issue with IBM's WebPlayer plugin on OSX	<p>This bash script is designed to fix OSX machines who have issues with IBM's webplayer plugin not being recognized in the browser. The script was conceived of by my colleague Justin Albano, and he also wrote the initial Bash script. I made some modifications to the script and wrote the test suite.</p>\r\n<p>\r\nIn OSX, there are two possible locations for a browser plugin to be installed.\r\n</p>\r\n<ul>\r\n<li>In the "root" level location, /Library/Internet Plug-Ins</li>\r\n<li>In the "user" level location, /Users/{username}/Library/Internet Plug-Ins</li>\r\n</ul>\r\n<p>\r\nSo far, L2 support has seen instances where the user level plugin folder was missing, or had been renamed to something incorrect, as well as instances where only having the plugin in the "root" level or "user" level was causing issues. This script attempts to leave the machine in the following state:</p>\r\n<ul>\r\n<li>"root" level plugin folder exists, and has the IBM Webplayer plugin "NPRTPluginLL.webplugin" present</li>\r\n<li>"user" level plugin folder exists, and has the IBM Webplayer plugin "NPRTPluginLL.webplugin" present</li>\r\n</ul>\r\n<p>\r\nThe script comes with a comprehensive set of unit tests, written in Python. This is still a work in progress, as there are a few remaining issues to fix.</p>\r\n<p>\r\nFor the latest code, please see the BitBucket repo at <a href="https://bitbucket.org/jared-wallace/osxwebplayerfix">this location.</a>\r\n</p>		projects/source.tar.gz	Bash, Python	work	2016-05-28 13:15:42-05
13	Orpie package for Fedora 24-26	Binary RPM package of Orpie for Fedora	My absolute favorite calculator is the console based Orpie. It's RPN, just like HP calculators. The last time it was packaged for Fedora was when Fedora 10 was released, and in order to make it easier to install (and to get some experience packaging) I decided to package this for the latest versions of Fedora.\r\n<p>\r\nThe process entailed searching out and applying a patch originally from Debian to work around a newer library that had removed a few functions, and properly listing the dependencies in the spec file. After that, it was just a matter of building on the appropriate architectures and making the package <a href="https://bugzilla.redhat.com/show_bug.cgi?id=1382152">review request.</a>\r\n</p>\r\n<p>\r\nThis package is now available in the Fedora stable repository for 24 and 25, and also available on Rawhide.\r\n</p>	projects/orpie-1.5.2-1.x86_64.rpm	projects/orpie.spec	Bash	personal	2016-10-13 15:37:56-05
14	TravisMcGee	A general purpose bot for IBM Workspace	<p>IBM workspace is a new tool from IBM, aimed at taking on Slack and Spark. I'm writing a general purpose bot mainly as a way to become familiar with the API, but also as an excuse to get programming again.</p>\r\n<p>Right now, Travis is configured through a config file, which allows extensive control over functionality. Commands include:\r\n<ul>\r\n<li>Writing "Travis, what's the latest xkcd" in the channel will provide you the link to the latest XKCD comic.</li>\r\n<li>You can ask Travis what the weather is like, using a zipcode or a city (Travis will do best guess on state if you pick city.\r\nex. "Travis, what's the weather like in Leander?" or "Travis, how's the weather in 90210?"\r\nYou can also specify a state, if you wish to help Travis select the correct location.\r\nex. "Travis, how's the weather in San Antonio, FL?"</li>\r\n<li>You can ask Travis to google things for you, and he will return the quantity of results specified in the config.\r\nex. "Travis, can you google 'jeff dean' please?" or "Travis, google awesome cat videos"</li></ul>\r\n</p>\r\n<p>You can optionally configure Travis to announce news headlines every so often (details on what news, how much, and how often are configured in the config file), and you can also have Travis monitor the conversation and pull relevant news items for subjects of interest. For example, if the topic of conversation is about IBM's Watson, Travis would pull any recent news about Watson.</p>\r\n<p>You can optionally configure Travis to listen to particular GitHub repositories, and announce new pushes or issue events (details are in the example config). For example, you can Travis announce new bugs for one repository, and all new issues for a different repository.</p>\r\n<p>Travis also listens for people talking negatively about him, and responds appropriately. The level of thin-skinnedness is adjustable.</p>\r\n<p>For a full list of planned functionality, see the plans.txt document in the repository. To see Travis in action, you'll need an IBMid and need to contact me for an invite into the channel where Travis hangs out.</p>\r\n<h3><a href="https://bitbucket.org/jared-wallace/travis">BitBucket repository</a></h3>			Python	personal	2016-12-17 22:26:24-06
16	IRC integration	IRC integration for Watson Workspace	Many scoff, but I still have a lot of love for IRC. Is this answering a question no one is asking? Maybe. But then there is this:\r\n<img src="https://imgs.xkcd.com/comics/team_chat.png"></img>		projects/jared-wallace-ircbot-4313b9197811.zip	Python	work	2017-05-27 10:33:13-05
15	Zendesk integration for Watson Workspace	An app to bring Zendesk functionality into Watson Workspace	<p>As we are leveraging Zendesk for our support of Watson Workspace, a colleague and I wrote an app to leverage Watson Workspace for quicker responses.</p>\r\n<p>The app announces new comments and tickets, and allows any user to query for open tickets and for all tickets assigned to themselves.</p>\r\n<p>The app is written in Node JS, and this is the first time I've programmed in Javascript, so be kind :) The source is available on Github <a href="https://github.com/jared-wallace/connect2luke"> here</a></p>		projects/connect2luke-master.zip	Javascript	work	2017-04-18 10:13:02-05
17	ww-box	Simple Box integration for Watson Workspace	<p>Full integration is coming down the pipe, so this is mainly just a stopgap to tide us over. This app does two things:<br>\r\n1) The included TamperMonkey script adds a UI element that allows you to upload docs to a common repository.<br>\r\n2) Anyone can then leverage Box's amazing search capabilities to discover relevant and helpful docs right from the Space.<br>\r\n</p>\r\n<p>\r\n*note* It is not required to install the TamperMonkey script in order to search and retrieve docs already stored.</p>		projects/jared-wallace-ww-box-bf430a3e53c8.zip	Node.js	work	2017-05-27 11:04:36-05
18	TravisMcGee Version 2.0	Travis is back, streamlined and this time in Node.js	<p>Based on observed usage of the original Travis, I've begun work on the second version. This time I'm using Node.js, since I've found it to be useful for the type of application I'm writing.</p>\r\n<p>Currently it's providing headlines every 3 hours, and breaking news as it occurs based on configured keywords. It leverages Node's "Cluster" to provide seamless and graceful restarts/reloads of the config. It also tracks previously posted news to avoid double-posting, one of the original Travis' shortcomings.</p>\r\n<p>This is still under development, with cognitive conversation analysis the next feature planned.</p>		projects/jared-wallace-travis-node-fde3585cb390.zip	Node.js	personal	2017-05-27 11:15:15-05
\.


--
-- Name: projects_project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('projects_project_id_seq', 18, true);


--
-- Data for Name: projects_screenshots; Type: TABLE DATA; Schema: public; Owner: django
--

COPY projects_screenshots (id, project_id, image) FROM stdin;
1	3	projects/Screenshot_from_2014-05-25_122417.png
2	3	projects/Screenshot_from_2014-05-25_122436.png
3	3	projects/Screenshot_from_2014-05-25_122451.png
4	2	projects/Screenshot_from_2014-05-25_130251.png
5	2	projects/Screenshot_from_2014-05-25_130248.png
6	2	projects/Screenshot_from_2014-05-25_130231.png
7	1	projects/Screenshot_from_2014-05-25_130356.png
8	1	projects/Screenshot_from_2014-05-25_130417.png
9	1	projects/Screenshot_from_2014-05-25_130420.png
11	7	projects/Screenshot_from_2014-05-25_131855.png
12	7	projects/Screenshot_-_06172014_-_021935_PM.png
13	10	projects/Screenshot_from_2015-05-09_084407.png
14	10	projects/Screenshot_from_2015-05-09_084418.png
15	10	projects/Screenshot_from_2015-05-09_084535.png
10	7	projects/Screenshot_from_2015-07-03_105909.png
16	14	projects/IMG_0306.PNG
17	16	projects/irc-bot.png
18	16	projects/Selection_001.png
19	16	projects/Selection_002.png
20	17	projects/Selection_004.png
21	17	projects/Selection_003.png
22	18	projects/Selection_005.png
\.


--
-- Name: projects_screenshots_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('projects_screenshots_id_seq', 22, true);


--
-- Data for Name: registration_registrationprofile; Type: TABLE DATA; Schema: public; Owner: django
--

COPY registration_registrationprofile (id, user_id, activation_key) FROM stdin;
2	7	ALREADY_ACTIVATED
\.


--
-- Name: registration_registrationprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('registration_registrationprofile_id_seq', 5, true);


--
-- Data for Name: south_migrationhistory; Type: TABLE DATA; Schema: public; Owner: django
--

COPY south_migrationhistory (id, app_name, migration, applied) FROM stdin;
1	projects	0001_initial	2014-05-25 04:25:17-05
2	projects	0002_auto__chg_field_project_classification	2014-05-25 04:28:18-05
3	projects	0003_auto__chg_field_project_sourcefile__chg_field_project_binaryfile	2014-05-25 15:11:55-05
4	projects	0004_auto__add_field_project_created_date	2014-05-25 17:00:58-05
5	projects	0005_auto__add_screenshots	2014-05-25 17:15:06-05
13	labs	0001_initial	2014-07-24 17:55:01-05
14	labs	0002_auto__add_field_class_section_syllabus	2014-07-25 15:54:03-05
15	accounts	0001_initial	2014-07-25 17:19:10-05
16	labs	0003_auto__add_field_class_section_room	2014-07-25 18:20:07-05
17	labs	0004_auto__add_field_lab_date	2014-07-25 18:25:18-05
18	labs	0005_auto__add_quote	2014-07-25 23:09:55-05
20	labs	0006_auto__add_field_lab_adminfile	2014-08-15 16:12:53-05
21	my_calendar	0001_initial	2014-08-17 19:38:04-05
22	labs	0007_auto__add_section_link	2014-08-18 17:01:03-05
23	labs	0008_auto__add_field_class_section_style	2014-08-27 12:04:00.275172-05
24	labs	0009_auto__add_field_lab_solution_visible	2014-09-04 10:17:20.540889-05
25	accounts	0002_auto__add_field_contact_information_github	2014-12-01 07:22:30.916686-06
26	accounts	0003_auto__add_field_contact_information_bitbucket	2015-07-03 11:33:07.344191-05
\.


--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('south_migrationhistory_id_seq', 26, true);


--
-- Name: accounts_contact_information_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY accounts_contact_information
    ADD CONSTRAINT accounts_contact_information_pkey PRIMARY KEY (id);


--
-- Name: accounts_days_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY accounts_days
    ADD CONSTRAINT accounts_days_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: captcha_captchastore_hashkey_key; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY captcha_captchastore
    ADD CONSTRAINT captcha_captchastore_hashkey_key UNIQUE (hashkey);


--
-- Name: captcha_captchastore_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY captcha_captchastore
    ADD CONSTRAINT captcha_captchastore_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_model_key; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_key UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: labs_class_section_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY labs_class_section
    ADD CONSTRAINT labs_class_section_pkey PRIMARY KEY (id);


--
-- Name: labs_lab_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY labs_lab
    ADD CONSTRAINT labs_lab_pkey PRIMARY KEY (id);


--
-- Name: labs_quote_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY labs_quote
    ADD CONSTRAINT labs_quote_pkey PRIMARY KEY (id);


--
-- Name: labs_section_link_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY labs_section_link
    ADD CONSTRAINT labs_section_link_pkey PRIMARY KEY (id);


--
-- Name: my_calendar_entry_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY my_calendar_entry
    ADD CONSTRAINT my_calendar_entry_pkey PRIMARY KEY (id);


--
-- Name: projects_project_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY projects_project
    ADD CONSTRAINT projects_project_pkey PRIMARY KEY (id);


--
-- Name: projects_screenshots_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY projects_screenshots
    ADD CONSTRAINT projects_screenshots_pkey PRIMARY KEY (id);


--
-- Name: registration_registrationprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY registration_registrationprofile
    ADD CONSTRAINT registration_registrationprofile_pkey PRIMARY KEY (id);


--
-- Name: registration_registrationprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY registration_registrationprofile
    ADD CONSTRAINT registration_registrationprofile_user_id_key UNIQUE (user_id);


--
-- Name: south_migrationhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY south_migrationhistory
    ADD CONSTRAINT south_migrationhistory_pkey PRIMARY KEY (id);


--
-- Name: labs_section_link_section_id_idx; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX labs_section_link_section_id_idx ON labs_section_link USING btree (section_id);


--
-- Name: my_calendar_entry_creator_id_idx; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX my_calendar_entry_creator_id_idx ON my_calendar_entry USING btree (creator_id);


--
-- Name: creator_id_refs_id_5eb9f6cb; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY my_calendar_entry
    ADD CONSTRAINT creator_id_refs_id_5eb9f6cb FOREIGN KEY (creator_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: section_id_refs_id_45d3863f; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY labs_section_link
    ADD CONSTRAINT section_id_refs_id_45d3863f FOREIGN KEY (section_id) REFERENCES labs_class_section(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

