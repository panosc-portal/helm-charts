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

SET default_tablespace = '';

--
-- Name: instance_session; Type: TABLE; Schema: desktop-service; Owner: desktop-service
--

CREATE TABLE "desktop-service".instance_session (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    client_count bigint NOT NULL,
    connection_id character varying(150) NOT NULL,
    instance_id bigint NOT NULL,
    last_seen_at timestamp without time zone NOT NULL
);


ALTER TABLE "desktop-service".instance_session OWNER TO "desktop-service";

--
-- Data for Name: instance_session; Type: TABLE DATA; Schema: desktop-service; Owner: desktop-service
--



--
-- Name: instance_session instance_session_pkey; Type: CONSTRAINT; Schema: desktop-service; Owner: desktop-service
--

ALTER TABLE ONLY "desktop-service".instance_session
    ADD CONSTRAINT instance_session_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

