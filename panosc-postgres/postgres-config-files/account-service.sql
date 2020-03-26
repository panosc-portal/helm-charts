--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.15
-- Dumped by pg_dump version 12.1

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
-- Name: account-service; Type: SCHEMA; Schema: -; Owner: account-service
--

CREATE SCHEMA "account-service";


ALTER SCHEMA "account-service" OWNER TO "account-service";

SET default_tablespace = '';

--
-- Name: account; Type: TABLE; Schema: account-service; Owner: account-service
--

CREATE TABLE "account-service".account (
    id integer NOT NULL,
    user_id integer NOT NULL,
    username character varying(250) NOT NULL,
    uid integer NOT NULL,
    gid integer NOT NULL,
    email character varying(250),
    home_path character varying(250) NOT NULL,
    active boolean DEFAULT true NOT NULL,
    created_at date DEFAULT now() NOT NULL
);


ALTER TABLE "account-service".account OWNER TO "account-service";

--
-- Name: account_id_seq; Type: SEQUENCE; Schema: account-service; Owner: account-service
--

CREATE SEQUENCE "account-service".account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "account-service".account_id_seq OWNER TO "account-service";

--
-- Name: account_id_seq; Type: SEQUENCE OWNED BY; Schema: account-service; Owner: account-service
--

ALTER SEQUENCE "account-service".account_id_seq OWNED BY "account-service".account.id;


--
-- Name: account_role; Type: TABLE; Schema: account-service; Owner: account-service
--

CREATE TABLE "account-service".account_role (
    account_id integer NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE "account-service".account_role OWNER TO "account-service";

--
-- Name: role; Type: TABLE; Schema: account-service; Owner: account-service
--

CREATE TABLE "account-service".role (
    id integer NOT NULL,
    name character varying(250) NOT NULL,
    description character varying(1000)
);


ALTER TABLE "account-service".role OWNER TO "account-service";

--
-- Name: role_id_seq; Type: SEQUENCE; Schema: account-service; Owner: account-service
--

CREATE SEQUENCE "account-service".role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "account-service".role_id_seq OWNER TO "account-service";

--
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: account-service; Owner: account-service
--

ALTER SEQUENCE "account-service".role_id_seq OWNED BY "account-service".role.id;

--
-- Name: account id; Type: DEFAULT; Schema: account-service; Owner: account-service
--

ALTER TABLE ONLY "account-service".account ALTER COLUMN id SET DEFAULT nextval('"account-service".account_id_seq'::regclass);

--
-- Name: role id; Type: DEFAULT; Schema: account-service; Owner: account-service
--

ALTER TABLE ONLY "account-service".role ALTER COLUMN id SET DEFAULT nextval('"account-service".role_id_seq'::regclass);


--
-- Data for Name: account; Type: TABLE DATA; Schema: account-service; Owner: account-service
--


--
-- Data for Name: account_role; Type: TABLE DATA; Schema: account-service; Owner: account-service
--


--
-- Data for Name: role; Type: TABLE DATA; Schema: account-service; Owner: account-service
--

INSERT INTO "account-service".role VALUES (1, 'user', '');
INSERT INTO "account-service".role VALUES (2, 'admin', '');


--
-- Name: account_id_seq; Type: SEQUENCE SET; Schema: account-service; Owner: account-service
--

SELECT pg_catalog.setval('"account-service".account_id_seq', 0, true);


--
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: account-service; Owner: account-service
--

SELECT pg_catalog.setval('"account-service".role_id_seq', 2, true);


--
-- Name: account_role PK_59aa678e50e88a461987e52acce; Type: CONSTRAINT; Schema: account-service; Owner: account-service
--

ALTER TABLE ONLY "account-service".account_role
    ADD CONSTRAINT "PK_59aa678e50e88a461987e52acce" PRIMARY KEY (account_id, role_id);


--
-- Name: account PK_83ab389cdef429254ad6046b623; Type: CONSTRAINT; Schema: account-service; Owner: account-service
--

ALTER TABLE ONLY "account-service".account
    ADD CONSTRAINT "PK_83ab389cdef429254ad6046b623" PRIMARY KEY (id);


--
-- Name: role PK_ab31107618a5851a9ba60716059; Type: CONSTRAINT; Schema: account-service; Owner: account-service
--

ALTER TABLE ONLY "account-service".role
    ADD CONSTRAINT "PK_ab31107618a5851a9ba60716059" PRIMARY KEY (id);


--
-- Name: IDX_8ff425f40bf1416d8a3d61feb9; Type: INDEX; Schema: account-service; Owner: account-service
--

CREATE INDEX "IDX_8ff425f40bf1416d8a3d61feb9" ON "account-service".account_role USING btree (role_id);


--
-- Name: IDX_a3ca7f291909d4428205da5656; Type: INDEX; Schema: account-service; Owner: account-service
--

CREATE INDEX "IDX_a3ca7f291909d4428205da5656" ON "account-service".account_role USING btree (account_id);


--
-- Name: account_role FK_8ff425f40bf1416d8a3d61feb94; Type: FK CONSTRAINT; Schema: account-service; Owner: account-service
--

ALTER TABLE ONLY "account-service".account_role
    ADD CONSTRAINT "FK_8ff425f40bf1416d8a3d61feb94" FOREIGN KEY (role_id) REFERENCES "account-service".role(id) ON DELETE CASCADE;


--
-- Name: account_role FK_a3ca7f291909d4428205da56566; Type: FK CONSTRAINT; Schema: account-service; Owner: account-service
--

ALTER TABLE ONLY "account-service".account_role
    ADD CONSTRAINT "FK_a3ca7f291909d4428205da56566" FOREIGN KEY (account_id) REFERENCES "account-service".account(id) ON DELETE CASCADE;

--
-- PostgreSQL database dump complete
--

