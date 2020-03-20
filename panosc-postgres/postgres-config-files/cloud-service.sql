--
-- PostgreSQL database dump
--

-- Dumped from database version 10.11 (Debian 10.11-1.pgdg90+1)
-- Dumped by pg_dump version 10.11 (Debian 10.11-1.pgdg90+1)

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
-- Name: cloud-service; Type: SCHEMA; Schema: -; Owner: cloud-service
--

CREATE SCHEMA "cloud-service";


ALTER SCHEMA "cloud-service" OWNER TO "cloud-service";

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: authorisation_token; Type: TABLE; Schema: cloud-service; Owner: cloud-service
--

CREATE TABLE "cloud-service".authorisation_token (
    id integer NOT NULL,
    token character varying(250) NOT NULL,
    created_at integer NOT NULL,
    instance_member_id integer NOT NULL
);


ALTER TABLE "cloud-service".authorisation_token OWNER TO "cloud-service";

--
-- Name: authorisation_token_id_seq; Type: SEQUENCE; Schema: cloud-service; Owner: cloud-service
--

CREATE SEQUENCE "cloud-service".authorisation_token_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "cloud-service".authorisation_token_id_seq OWNER TO "cloud-service";

--
-- Name: authorisation_token_id_seq; Type: SEQUENCE OWNED BY; Schema: cloud-service; Owner: cloud-service
--

ALTER SEQUENCE "cloud-service".authorisation_token_id_seq OWNED BY "cloud-service".authorisation_token.id;


--
-- Name: instance; Type: TABLE; Schema: cloud-service; Owner: cloud-service
--

CREATE TABLE "cloud-service".instance (
    id integer NOT NULL,
    cloud_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    deleted boolean DEFAULT false NOT NULL,
    plan_id integer NOT NULL
);


ALTER TABLE "cloud-service".instance OWNER TO "cloud-service";

--
-- Name: instance_id_seq; Type: SEQUENCE; Schema: cloud-service; Owner: cloud-service
--

CREATE SEQUENCE "cloud-service".instance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "cloud-service".instance_id_seq OWNER TO "cloud-service";

--
-- Name: instance_id_seq; Type: SEQUENCE OWNED BY; Schema: cloud-service; Owner: cloud-service
--

ALTER SEQUENCE "cloud-service".instance_id_seq OWNED BY "cloud-service".instance.id;


--
-- Name: instance_member; Type: TABLE; Schema: cloud-service; Owner: cloud-service
--

CREATE TABLE "cloud-service".instance_member (
    id integer NOT NULL,
    instance_id integer,
    role character varying(50) NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE "cloud-service".instance_member OWNER TO "cloud-service";

--
-- Name: instance_member_id_seq; Type: SEQUENCE; Schema: cloud-service; Owner: cloud-service
--

CREATE SEQUENCE "cloud-service".instance_member_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "cloud-service".instance_member_id_seq OWNER TO "cloud-service";

--
-- Name: instance_member_id_seq; Type: SEQUENCE OWNED BY; Schema: cloud-service; Owner: cloud-service
--

ALTER SEQUENCE "cloud-service".instance_member_id_seq OWNED BY "cloud-service".instance_member.id;


--
-- Name: plan; Type: TABLE; Schema: cloud-service; Owner: cloud-service
--

CREATE TABLE "cloud-service".plan (
    id integer NOT NULL,
    name character varying(250) NOT NULL,
    description character varying(2500),
    cloud_image_id integer NOT NULL,
    cloud_flavour_id integer NOT NULL,
    provider_id integer NOT NULL
);


ALTER TABLE "cloud-service".plan OWNER TO "cloud-service";

--
-- Name: plan_id_seq; Type: SEQUENCE; Schema: cloud-service; Owner: cloud-service
--

CREATE SEQUENCE "cloud-service".plan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "cloud-service".plan_id_seq OWNER TO "cloud-service";

--
-- Name: plan_id_seq; Type: SEQUENCE OWNED BY; Schema: cloud-service; Owner: cloud-service
--

ALTER SEQUENCE "cloud-service".plan_id_seq OWNED BY "cloud-service".plan.id;


--
-- Name: provider; Type: TABLE; Schema: cloud-service; Owner: cloud-service
--

CREATE TABLE "cloud-service".provider (
    id integer NOT NULL,
    name character varying(250) NOT NULL,
    description character varying(2500),
    url character varying(250) NOT NULL
);


ALTER TABLE "cloud-service".provider OWNER TO "cloud-service";

--
-- Name: provider_id_seq; Type: SEQUENCE; Schema: cloud-service; Owner: cloud-service
--

CREATE SEQUENCE "cloud-service".provider_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "cloud-service".provider_id_seq OWNER TO "cloud-service";

--
-- Name: provider_id_seq; Type: SEQUENCE OWNED BY; Schema: cloud-service; Owner: cloud-service
--

ALTER SEQUENCE "cloud-service".provider_id_seq OWNED BY "cloud-service".provider.id;


--
-- Name: users; Type: TABLE; Schema: cloud-service; Owner: cloud-service
--

CREATE TABLE "cloud-service".users (
    id integer NOT NULL,
    email character varying(100)
);


ALTER TABLE "cloud-service".users OWNER TO "cloud-service";

--
-- Name: authorisation_token id; Type: DEFAULT; Schema: cloud-service; Owner: cloud-service
--

ALTER TABLE ONLY "cloud-service".authorisation_token ALTER COLUMN id SET DEFAULT nextval('"cloud-service".authorisation_token_id_seq'::regclass);


--
-- Name: instance id; Type: DEFAULT; Schema: cloud-service; Owner: cloud-service
--

ALTER TABLE ONLY "cloud-service".instance ALTER COLUMN id SET DEFAULT nextval('"cloud-service".instance_id_seq'::regclass);


--
-- Name: instance_member id; Type: DEFAULT; Schema: cloud-service; Owner: cloud-service
--

ALTER TABLE ONLY "cloud-service".instance_member ALTER COLUMN id SET DEFAULT nextval('"cloud-service".instance_member_id_seq'::regclass);


--
-- Name: plan id; Type: DEFAULT; Schema: cloud-service; Owner: cloud-service
--

ALTER TABLE ONLY "cloud-service".plan ALTER COLUMN id SET DEFAULT nextval('"cloud-service".plan_id_seq'::regclass);


--
-- Name: provider id; Type: DEFAULT; Schema: cloud-service; Owner: cloud-service
--

ALTER TABLE ONLY "cloud-service".provider ALTER COLUMN id SET DEFAULT nextval('"cloud-service".provider_id_seq'::regclass);


--
-- Data for Name: authorisation_token; Type: TABLE DATA; Schema: cloud-service; Owner: cloud-service
--



--
-- Data for Name: instance; Type: TABLE DATA; Schema: cloud-service; Owner: cloud-service
--



--
-- Data for Name: instance_member; Type: TABLE DATA; Schema: cloud-service; Owner: cloud-service
--



--
-- Data for Name: plan; Type: TABLE DATA; Schema: cloud-service; Owner: cloud-service
--

INSERT INTO "cloud-service".plan VALUES (1, 'jupyter_small', '', 2, 1, 1);
INSERT INTO "cloud-service".plan VALUES (2, 'jupyter_medium', '', 2, 2, 1);
INSERT INTO "cloud-service".plan VALUES (3, 'remote_desktop_small', '', 1, 1, 1);
INSERT INTO "cloud-service".plan VALUES (4, 'remote_desktop_large', '', 1, 3, 1);


--
-- Data for Name: provider; Type: TABLE DATA; Schema: cloud-service; Owner: cloud-service
--

INSERT INTO "cloud-service".provider VALUES (1, 'localhost-k8s', 'Localhost Kubernetes', 'http://cloud-provider-kubernetes:3000/api/v1');


--
-- Data for Name: users; Type: TABLE DATA; Schema: cloud-service; Owner: cloud-service
--



--
-- Name: authorisation_token_id_seq; Type: SEQUENCE SET; Schema: cloud-service; Owner: cloud-service
--

SELECT pg_catalog.setval('"cloud-service".authorisation_token_id_seq', 1, false);


--
-- Name: instance_id_seq; Type: SEQUENCE SET; Schema: cloud-service; Owner: cloud-service
--

SELECT pg_catalog.setval('"cloud-service".instance_id_seq', 7, true);


--
-- Name: instance_member_id_seq; Type: SEQUENCE SET; Schema: cloud-service; Owner: cloud-service
--

SELECT pg_catalog.setval('"cloud-service".instance_member_id_seq', 7, true);


--
-- Name: plan_id_seq; Type: SEQUENCE SET; Schema: cloud-service; Owner: cloud-service
--

SELECT pg_catalog.setval('"cloud-service".plan_id_seq', 5, true);


--
-- Name: provider_id_seq; Type: SEQUENCE SET; Schema: cloud-service; Owner: cloud-service
--

SELECT pg_catalog.setval('"cloud-service".provider_id_seq', 1, true);


--
-- Name: authorisation_token PK_23a9e97752e45c87602f69378e5; Type: CONSTRAINT; Schema: cloud-service; Owner: cloud-service
--

ALTER TABLE ONLY "cloud-service".authorisation_token
    ADD CONSTRAINT "PK_23a9e97752e45c87602f69378e5" PRIMARY KEY (id);


--
-- Name: users PK_587312b69b524fd20cc33aaf3ab; Type: CONSTRAINT; Schema: cloud-service; Owner: cloud-service
--

ALTER TABLE ONLY "cloud-service".users
    ADD CONSTRAINT "PK_587312b69b524fd20cc33aaf3ab" PRIMARY KEY (id);


--
-- Name: provider PK_981be756072d2e9ae13713bd247; Type: CONSTRAINT; Schema: cloud-service; Owner: cloud-service
--

ALTER TABLE ONLY "cloud-service".provider
    ADD CONSTRAINT "PK_981be756072d2e9ae13713bd247" PRIMARY KEY (id);


--
-- Name: instance_member PK_9af3c1ea3169b0128eb1018d832; Type: CONSTRAINT; Schema: cloud-service; Owner: cloud-service
--

ALTER TABLE ONLY "cloud-service".instance_member
    ADD CONSTRAINT "PK_9af3c1ea3169b0128eb1018d832" PRIMARY KEY (id);


--
-- Name: plan PK_acf93e28ad69f0f721fba06619e; Type: CONSTRAINT; Schema: cloud-service; Owner: cloud-service
--

ALTER TABLE ONLY "cloud-service".plan
    ADD CONSTRAINT "PK_acf93e28ad69f0f721fba06619e" PRIMARY KEY (id);


--
-- Name: instance PK_bb35432a0aefbb26b8afae160f9; Type: CONSTRAINT; Schema: cloud-service; Owner: cloud-service
--

ALTER TABLE ONLY "cloud-service".instance
    ADD CONSTRAINT "PK_bb35432a0aefbb26b8afae160f9" PRIMARY KEY (id);


--
-- Name: authorisation_token UQ_3e12d5664abaf82825ac6db098a; Type: CONSTRAINT; Schema: cloud-service; Owner: cloud-service
--

ALTER TABLE ONLY "cloud-service".authorisation_token
    ADD CONSTRAINT "UQ_3e12d5664abaf82825ac6db098a" UNIQUE (token);


--
-- Name: instance_member_role_index; Type: INDEX; Schema: cloud-service; Owner: cloud-service
--

CREATE INDEX instance_member_role_index ON "cloud-service".instance_member USING btree (role);


--
-- Name: plan_name_index; Type: INDEX; Schema: cloud-service; Owner: cloud-service
--

CREATE INDEX plan_name_index ON "cloud-service".plan USING btree (name);


--
-- Name: provider_name_index; Type: INDEX; Schema: cloud-service; Owner: cloud-service
--

CREATE INDEX provider_name_index ON "cloud-service".provider USING btree (name);


--
-- Name: instance_member FK_48a8af0d0e4201d3e4bb3cb3a8b; Type: FK CONSTRAINT; Schema: cloud-service; Owner: cloud-service
--

ALTER TABLE ONLY "cloud-service".instance_member
    ADD CONSTRAINT "FK_48a8af0d0e4201d3e4bb3cb3a8b" FOREIGN KEY (instance_id) REFERENCES "cloud-service".instance(id) ON DELETE CASCADE;


--
-- Name: instance FK_4fef471546a083f2498bd2a37e4; Type: FK CONSTRAINT; Schema: cloud-service; Owner: cloud-service
--

ALTER TABLE ONLY "cloud-service".instance
    ADD CONSTRAINT "FK_4fef471546a083f2498bd2a37e4" FOREIGN KEY (plan_id) REFERENCES "cloud-service".plan(id);


--
-- Name: instance_member FK_5d2ed289a3e0d7b6e92266bf608; Type: FK CONSTRAINT; Schema: cloud-service; Owner: cloud-service
--

ALTER TABLE ONLY "cloud-service".instance_member
    ADD CONSTRAINT "FK_5d2ed289a3e0d7b6e92266bf608" FOREIGN KEY (user_id) REFERENCES "cloud-service".users(id);


--
-- Name: plan FK_7f92bec582d88a0e50eaaa6287c; Type: FK CONSTRAINT; Schema: cloud-service; Owner: cloud-service
--

ALTER TABLE ONLY "cloud-service".plan
    ADD CONSTRAINT "FK_7f92bec582d88a0e50eaaa6287c" FOREIGN KEY (provider_id) REFERENCES "cloud-service".provider(id);


--
-- Name: authorisation_token FK_e13178fdd3c1ea8ea0525339fbd; Type: FK CONSTRAINT; Schema: cloud-service; Owner: cloud-service
--

ALTER TABLE ONLY "cloud-service".authorisation_token
    ADD CONSTRAINT "FK_e13178fdd3c1ea8ea0525339fbd" FOREIGN KEY (instance_member_id) REFERENCES "cloud-service".instance_member(id);


--
-- PostgreSQL database dump complete
--

