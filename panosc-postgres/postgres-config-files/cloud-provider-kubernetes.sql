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
-- Name: cloud-provider-kubernetes; Type: SCHEMA; Schema: -; Owner: cloud-provider-kubernetes
--

CREATE SCHEMA "cloud-provider-kubernetes";


ALTER SCHEMA "cloud-provider-kubernetes" OWNER TO "cloud-provider-kubernetes";

SET default_tablespace = '';

--
-- Name: flavour; Type: TABLE; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

CREATE TABLE "cloud-provider-kubernetes".flavour (
    id integer NOT NULL,
    name character varying(250) NOT NULL,
    description character varying(2500),
    cpu double precision NOT NULL,
    memory integer NOT NULL
);


ALTER TABLE "cloud-provider-kubernetes".flavour OWNER TO "cloud-provider-kubernetes";

--
-- Name: flavour_id_seq; Type: SEQUENCE; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

CREATE SEQUENCE "cloud-provider-kubernetes".flavour_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "cloud-provider-kubernetes".flavour_id_seq OWNER TO "cloud-provider-kubernetes";

--
-- Name: flavour_id_seq; Type: SEQUENCE OWNED BY; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER SEQUENCE "cloud-provider-kubernetes".flavour_id_seq OWNED BY "cloud-provider-kubernetes".flavour.id;


--
-- Name: image; Type: TABLE; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

CREATE TABLE "cloud-provider-kubernetes".image (
    id integer NOT NULL,
    name character varying(250) NOT NULL,
    repository character varying(250),
    path character varying(250) NOT NULL,
    environment_type character varying(100) NOT NULL,
    description character varying(2500),
    command character varying(2500),
    args character varying(2500),
    run_as_uid integer
);


ALTER TABLE "cloud-provider-kubernetes".image OWNER TO "cloud-provider-kubernetes";

--
-- Name: image_env_var; Type: TABLE; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

CREATE TABLE "cloud-provider-kubernetes".image_env_var (
    id integer NOT NULL,
    name character varying NOT NULL,
    value character varying NOT NULL,
    image_id integer
);


ALTER TABLE "cloud-provider-kubernetes".image_env_var OWNER TO "cloud-provider-kubernetes";

--
-- Name: image_env_var_id_seq; Type: SEQUENCE; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

CREATE SEQUENCE "cloud-provider-kubernetes".image_env_var_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "cloud-provider-kubernetes".image_env_var_id_seq OWNER TO "cloud-provider-kubernetes";

--
-- Name: image_env_var_id_seq; Type: SEQUENCE OWNED BY; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER SEQUENCE "cloud-provider-kubernetes".image_env_var_id_seq OWNED BY "cloud-provider-kubernetes".image_env_var.id;


--
-- Name: image_id_seq; Type: SEQUENCE; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

CREATE SEQUENCE "cloud-provider-kubernetes".image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "cloud-provider-kubernetes".image_id_seq OWNER TO "cloud-provider-kubernetes";

--
-- Name: image_id_seq; Type: SEQUENCE OWNED BY; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER SEQUENCE "cloud-provider-kubernetes".image_id_seq OWNED BY "cloud-provider-kubernetes".image.id;


--
-- Name: image_protocol; Type: TABLE; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

CREATE TABLE "cloud-provider-kubernetes".image_protocol (
    id integer NOT NULL,
    port integer,
    protocol_id integer NOT NULL,
    image_id integer NOT NULL
);


ALTER TABLE "cloud-provider-kubernetes".image_protocol OWNER TO "cloud-provider-kubernetes";

--
-- Name: image_protocol_id_seq; Type: SEQUENCE; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

CREATE SEQUENCE "cloud-provider-kubernetes".image_protocol_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "cloud-provider-kubernetes".image_protocol_id_seq OWNER TO "cloud-provider-kubernetes";

--
-- Name: image_protocol_id_seq; Type: SEQUENCE OWNED BY; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER SEQUENCE "cloud-provider-kubernetes".image_protocol_id_seq OWNED BY "cloud-provider-kubernetes".image_protocol.id;


--
-- Name: image_volume; Type: TABLE; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

CREATE TABLE "cloud-provider-kubernetes".image_volume (
    id integer NOT NULL,
    name character varying(250) NOT NULL,
    path character varying(250) NOT NULL,
    read_only boolean NOT NULL,
    image_id integer NOT NULL
);


ALTER TABLE "cloud-provider-kubernetes".image_volume OWNER TO "cloud-provider-kubernetes";

--
-- Name: image_volume_id_seq; Type: SEQUENCE; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

CREATE SEQUENCE "cloud-provider-kubernetes".image_volume_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "cloud-provider-kubernetes".image_volume_id_seq OWNER TO "cloud-provider-kubernetes";

--
-- Name: image_volume_id_seq; Type: SEQUENCE OWNED BY; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER SEQUENCE "cloud-provider-kubernetes".image_volume_id_seq OWNED BY "cloud-provider-kubernetes".image_volume.id;


--
-- Name: instance; Type: TABLE; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

CREATE TABLE "cloud-provider-kubernetes".instance (
    id integer NOT NULL,
    name character varying(250) NOT NULL,
    description character varying(2500),
    namespace character varying(250),
    hostname character varying(128),
    node_hostname character varying(128),
    compute_id character varying(50),
    status character varying(50) NOT NULL,
    status_message character varying(2500),
    current_cpu double precision,
    current_memory integer,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    deleted boolean DEFAULT false NOT NULL,
    flavour_id integer NOT NULL,
    image_id integer NOT NULL
);


ALTER TABLE "cloud-provider-kubernetes".instance OWNER TO "cloud-provider-kubernetes";

--
-- Name: instance_id_seq; Type: SEQUENCE; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

CREATE SEQUENCE "cloud-provider-kubernetes".instance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "cloud-provider-kubernetes".instance_id_seq OWNER TO "cloud-provider-kubernetes";

--
-- Name: instance_id_seq; Type: SEQUENCE OWNED BY; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER SEQUENCE "cloud-provider-kubernetes".instance_id_seq OWNED BY "cloud-provider-kubernetes".instance.id;


--
-- Name: instance_protocol; Type: TABLE; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

CREATE TABLE "cloud-provider-kubernetes".instance_protocol (
    id integer NOT NULL,
    name character varying(250) NOT NULL,
    port integer NOT NULL,
    instance_id integer NOT NULL
);


ALTER TABLE "cloud-provider-kubernetes".instance_protocol OWNER TO "cloud-provider-kubernetes";

--
-- Name: instance_protocol_id_seq; Type: SEQUENCE; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

CREATE SEQUENCE "cloud-provider-kubernetes".instance_protocol_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "cloud-provider-kubernetes".instance_protocol_id_seq OWNER TO "cloud-provider-kubernetes";

--
-- Name: instance_protocol_id_seq; Type: SEQUENCE OWNED BY; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER SEQUENCE "cloud-provider-kubernetes".instance_protocol_id_seq OWNED BY "cloud-provider-kubernetes".instance_protocol.id;


--
-- Name: instance_account; Type: TABLE; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

CREATE TABLE "cloud-provider-kubernetes".instance_account (
    id integer NOT NULL,
    user_id integer NOT NULL,
    username character varying(100) NOT NULL,
    gid integer NOT NULL,
    uid integer NOT NULL,
    home_path character varying(250) NOT NULL,
    email character varying(250),
    instance_id integer NOT NULL
);


ALTER TABLE "cloud-provider-kubernetes".instance_account OWNER TO "cloud-provider-kubernetes";

--
-- Name: instance_account_id_seq; Type: SEQUENCE; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

CREATE SEQUENCE "cloud-provider-kubernetes".instance_account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "cloud-provider-kubernetes".instance_account_id_seq OWNER TO "cloud-provider-kubernetes";

--
-- Name: instance_account_id_seq; Type: SEQUENCE OWNED BY; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER SEQUENCE "cloud-provider-kubernetes".instance_account_id_seq OWNED BY "cloud-provider-kubernetes".instance_account.id;


--
-- Name: protocol; Type: TABLE; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

CREATE TABLE "cloud-provider-kubernetes".protocol (
    id integer NOT NULL,
    name character varying(250) NOT NULL,
    default_port integer NOT NULL
);


ALTER TABLE "cloud-provider-kubernetes".protocol OWNER TO "cloud-provider-kubernetes";

--
-- Name: protocol_id_seq; Type: SEQUENCE; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

CREATE SEQUENCE "cloud-provider-kubernetes".protocol_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "cloud-provider-kubernetes".protocol_id_seq OWNER TO "cloud-provider-kubernetes";

--
-- Name: protocol_id_seq; Type: SEQUENCE OWNED BY; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER SEQUENCE "cloud-provider-kubernetes".protocol_id_seq OWNED BY "cloud-provider-kubernetes".protocol.id;


--
-- Name: flavour id; Type: DEFAULT; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER TABLE ONLY "cloud-provider-kubernetes".flavour ALTER COLUMN id SET DEFAULT nextval('"cloud-provider-kubernetes".flavour_id_seq'::regclass);


--
-- Name: image id; Type: DEFAULT; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER TABLE ONLY "cloud-provider-kubernetes".image ALTER COLUMN id SET DEFAULT nextval('"cloud-provider-kubernetes".image_id_seq'::regclass);


--
-- Name: image_env_var id; Type: DEFAULT; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER TABLE ONLY "cloud-provider-kubernetes".image_env_var ALTER COLUMN id SET DEFAULT nextval('"cloud-provider-kubernetes".image_env_var_id_seq'::regclass);


--
-- Name: image_protocol id; Type: DEFAULT; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER TABLE ONLY "cloud-provider-kubernetes".image_protocol ALTER COLUMN id SET DEFAULT nextval('"cloud-provider-kubernetes".image_protocol_id_seq'::regclass);


--
-- Name: image_volume id; Type: DEFAULT; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER TABLE ONLY "cloud-provider-kubernetes".image_volume ALTER COLUMN id SET DEFAULT nextval('"cloud-provider-kubernetes".image_volume_id_seq'::regclass);


--
-- Name: instance id; Type: DEFAULT; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER TABLE ONLY "cloud-provider-kubernetes".instance ALTER COLUMN id SET DEFAULT nextval('"cloud-provider-kubernetes".instance_id_seq'::regclass);


--
-- Name: instance_protocol id; Type: DEFAULT; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER TABLE ONLY "cloud-provider-kubernetes".instance_protocol ALTER COLUMN id SET DEFAULT nextval('"cloud-provider-kubernetes".instance_protocol_id_seq'::regclass);


--
-- Name: instance_account id; Type: DEFAULT; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER TABLE ONLY "cloud-provider-kubernetes".instance_account ALTER COLUMN id SET DEFAULT nextval('"cloud-provider-kubernetes".instance_account_id_seq'::regclass);


--
-- Name: protocol id; Type: DEFAULT; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER TABLE ONLY "cloud-provider-kubernetes".protocol ALTER COLUMN id SET DEFAULT nextval('"cloud-provider-kubernetes".protocol_id_seq'::regclass);


--
-- Data for Name: flavour; Type: TABLE DATA; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

INSERT INTO "cloud-provider-kubernetes".flavour VALUES (1, 'small', '', 1, 1024);
INSERT INTO "cloud-provider-kubernetes".flavour VALUES (2, 'medium', '', 2, 4096);
INSERT INTO "cloud-provider-kubernetes".flavour VALUES (3, 'large', '', 8, 65536);


--
-- Name: flavour_id_seq; Type: SEQUENCE SET; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

SELECT pg_catalog.setval('"cloud-provider-kubernetes".flavour_id_seq', 3, true);


--
-- Data for Name: image; Type: TABLE DATA; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

INSERT INTO "cloud-provider-kubernetes".image VALUES (1, 'ubuntu-xrdp', NULL, 'danielguerra/ubuntu-xrdp', 'REMOTE_DESKTOP', 'Ubuntu with XRDP service', '', '', NULL);
INSERT INTO "cloud-provider-kubernetes".image VALUES (2, 'jupyter', NULL, 'jupyter/base-notebook', 'JUPYTER_NOTEBOOK', 'Jupyter base notebook', 'start.sh', 'jupyter,notebook,--NotebookApp.token=""', 0);



--
-- Data for Name: image_env_var; Type: TABLE DATA; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--


--
-- Name: image_env_var_id_seq; Type: SEQUENCE SET; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

SELECT pg_catalog.setval('"cloud-provider-kubernetes".image_env_var_id_seq', 1, false);


--
-- Name: image_id_seq; Type: SEQUENCE SET; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

SELECT pg_catalog.setval('"cloud-provider-kubernetes".image_id_seq', 2, false);


--
-- Data for Name: image_protocol; Type: TABLE DATA; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

INSERT INTO "cloud-provider-kubernetes".image_protocol VALUES (1, NULL, 2, 1);
INSERT INTO "cloud-provider-kubernetes".image_protocol VALUES (2, 8888, 4, 2);


--
-- Name: image_protocol_id_seq; Type: SEQUENCE SET; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

SELECT pg_catalog.setval('"cloud-provider-kubernetes".image_protocol_id_seq', 3, true);


--
-- Data for Name: image_volume; Type: TABLE DATA; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--


--
-- Name: image_volume_id_seq; Type: SEQUENCE SET; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

SELECT pg_catalog.setval('"cloud-provider-kubernetes".image_volume_id_seq', 1, false);



--
-- Data for Name: instance; Type: TABLE DATA; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--



--
-- Name: instance_id_seq; Type: SEQUENCE SET; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

SELECT pg_catalog.setval('"cloud-provider-kubernetes".instance_id_seq', 1, false);


--
-- Data for Name: instance_protocol; Type: TABLE DATA; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--


--
-- Name: instance_protocol_id_seq; Type: SEQUENCE SET; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

SELECT pg_catalog.setval('"cloud-provider-kubernetes".instance_protocol_id_seq', 1, false);

--
-- Data for Name: instance_account; Type: TABLE DATA; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--



--
-- Name: instance_account_id_seq; Type: SEQUENCE SET; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

SELECT pg_catalog.setval('"cloud-provider-kubernetes".instance_account_id_seq', 1, false);


--
-- Data for Name: protocol; Type: TABLE DATA; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

INSERT INTO "cloud-provider-kubernetes".protocol VALUES (1, 'SSH', 22);
INSERT INTO "cloud-provider-kubernetes".protocol VALUES (2, 'RDP', 3389);
INSERT INTO "cloud-provider-kubernetes".protocol VALUES (3, 'GUACD', 4822);
INSERT INTO "cloud-provider-kubernetes".protocol VALUES (4, 'HTTP', 80);
INSERT INTO "cloud-provider-kubernetes".protocol VALUES (5, 'HTTPS', 443);


--
-- Name: protocol_id_seq; Type: SEQUENCE SET; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

SELECT pg_catalog.setval('"cloud-provider-kubernetes".protocol_id_seq', 1, false);


--
-- Name: flavour PK_2707819d7402d07eccada91702c; Type: CONSTRAINT; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER TABLE ONLY "cloud-provider-kubernetes".flavour
    ADD CONSTRAINT "PK_2707819d7402d07eccada91702c" PRIMARY KEY (id);


--
-- Name: image_env_var PK_28a088ed8e1eae08eae69c3006c; Type: CONSTRAINT; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER TABLE ONLY "cloud-provider-kubernetes".image_env_var
    ADD CONSTRAINT "PK_28a088ed8e1eae08eae69c3006c" PRIMARY KEY (id);


--
-- Name: protocol PK_44ad5733ecf7f5732524522ab3c; Type: CONSTRAINT; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER TABLE ONLY "cloud-provider-kubernetes".protocol
    ADD CONSTRAINT "PK_44ad5733ecf7f5732524522ab3c" PRIMARY KEY (id);


--
-- Name: image_protocol PK_62e78960688cea03db46e5ab264; Type: CONSTRAINT; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER TABLE ONLY "cloud-provider-kubernetes".image_protocol
    ADD CONSTRAINT "PK_62e78960688cea03db46e5ab264" PRIMARY KEY (id);


--
-- Name: instance_protocol PK_7285dea25a9537c1c32f7f88d39; Type: CONSTRAINT; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER TABLE ONLY "cloud-provider-kubernetes".instance_protocol
    ADD CONSTRAINT "PK_7285dea25a9537c1c32f7f88d39" PRIMARY KEY (id);


--
-- Name: image_volume PK_814d3959b94a1ae8664566e48d1; Type: CONSTRAINT; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER TABLE ONLY "cloud-provider-kubernetes".image_volume
    ADD CONSTRAINT "PK_814d3959b94a1ae8664566e48d1" PRIMARY KEY (id);


--
-- Name: instance PK_8cff4325f4a6c836ad46f419905; Type: CONSTRAINT; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER TABLE ONLY "cloud-provider-kubernetes".instance
    ADD CONSTRAINT "PK_8cff4325f4a6c836ad46f419905" PRIMARY KEY (id);


--
-- Name: instance_account PK_b98c818e5d353b1f74e25852040; Type: CONSTRAINT; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER TABLE ONLY "cloud-provider-kubernetes".instance_account
    ADD CONSTRAINT "PK_b98c818e5d353b1f74e25852040" PRIMARY KEY (id);


--
-- Name: image PK_daa5818049630b57ff41c777a37; Type: CONSTRAINT; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER TABLE ONLY "cloud-provider-kubernetes".image
    ADD CONSTRAINT "PK_daa5818049630b57ff41c777a37" PRIMARY KEY (id);


--
-- Name: instance_account REL_dfdbe0ee490b28ea703e935f4c; Type: CONSTRAINT; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER TABLE ONLY "cloud-provider-kubernetes".instance_account
    ADD CONSTRAINT "REL_dfdbe0ee490b28ea703e935f4c" UNIQUE (instance_id);


--
-- Name: image_volume UQ_40aaac1a6a02785079044f9180a; Type: CONSTRAINT; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER TABLE ONLY "cloud-provider-kubernetes".image_volume
    ADD CONSTRAINT "UQ_40aaac1a6a02785079044f9180a" UNIQUE (name);


--
-- Name: flavour_name_index; Type: INDEX; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

CREATE INDEX flavour_name_index ON "cloud-provider-kubernetes".flavour USING btree (name);


--
-- Name: image_environment_type_index; Type: INDEX; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

CREATE INDEX image_environment_type_index ON "cloud-provider-kubernetes".image USING btree (environment_type);


--
-- Name: image_name_index; Type: INDEX; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

CREATE INDEX image_name_index ON "cloud-provider-kubernetes".image USING btree (name);


--
-- Name: image_path_index; Type: INDEX; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

CREATE INDEX image_path_index ON "cloud-provider-kubernetes".image USING btree (path);


--
-- Name: image_repository_index; Type: INDEX; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

CREATE INDEX image_repository_index ON "cloud-provider-kubernetes".image USING btree (repository);


--
-- Name: instance_name_index; Type: INDEX; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

CREATE INDEX instance_name_index ON "cloud-provider-kubernetes".instance USING btree (name);


--
-- Name: instance_protocol_name_index; Type: INDEX; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

CREATE INDEX instance_protocol_name_index ON "cloud-provider-kubernetes".instance_protocol USING btree (name);


--
-- Name: instance_account_user_id_index; Type: INDEX; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

CREATE INDEX instance_account_user_id_index ON "cloud-provider-kubernetes".instance_account USING btree (user_id);


--
-- Name: instance_account_username_index; Type: INDEX; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

CREATE INDEX instance_account_username_index ON "cloud-provider-kubernetes".instance_account USING btree (username);


--
-- Name: protocol_name_index; Type: INDEX; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

CREATE INDEX protocol_name_index ON "cloud-provider-kubernetes".protocol USING btree (name);


--
-- Name: instance_protocol FK_014509892cee68b2e680a6caf76; Type: FK CONSTRAINT; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER TABLE ONLY "cloud-provider-kubernetes".instance_protocol
    ADD CONSTRAINT "FK_014509892cee68b2e680a6caf76" FOREIGN KEY (instance_id) REFERENCES "cloud-provider-kubernetes".instance(id) ON DELETE CASCADE;


--
-- Name: instance FK_1e3f6ef448cb253b7faf926b869; Type: FK CONSTRAINT; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER TABLE ONLY "cloud-provider-kubernetes".instance
    ADD CONSTRAINT "FK_1e3f6ef448cb253b7faf926b869" FOREIGN KEY (flavour_id) REFERENCES "cloud-provider-kubernetes".flavour(id);


--
-- Name: image_volume FK_630ceeaf26a95d57ff43fa137a2; Type: FK CONSTRAINT; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER TABLE ONLY "cloud-provider-kubernetes".image_volume
    ADD CONSTRAINT "FK_630ceeaf26a95d57ff43fa137a2" FOREIGN KEY (image_id) REFERENCES "cloud-provider-kubernetes".image(id) ON DELETE CASCADE;


--
-- Name: image_env_var FK_6f08d773921c438982299935027; Type: FK CONSTRAINT; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER TABLE ONLY "cloud-provider-kubernetes".image_env_var
    ADD CONSTRAINT "FK_6f08d773921c438982299935027" FOREIGN KEY (image_id) REFERENCES "cloud-provider-kubernetes".image(id) ON DELETE CASCADE;


--
-- Name: instance FK_6f37801185555ca52910a09d070; Type: FK CONSTRAINT; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER TABLE ONLY "cloud-provider-kubernetes".instance
    ADD CONSTRAINT "FK_6f37801185555ca52910a09d070" FOREIGN KEY (image_id) REFERENCES "cloud-provider-kubernetes".image(id) ON DELETE CASCADE;


--
-- Name: instance_account FK_dfdbe0ee490b28ea703e935f4c5; Type: FK CONSTRAINT; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER TABLE ONLY "cloud-provider-kubernetes".instance_account
    ADD CONSTRAINT "FK_dfdbe0ee490b28ea703e935f4c5" FOREIGN KEY (instance_id) REFERENCES "cloud-provider-kubernetes".instance(id) ON DELETE CASCADE;



--
-- Name: image_protocol FK_9d519964ecffc311fde1a3ca2d8; Type: FK CONSTRAINT; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER TABLE ONLY "cloud-provider-kubernetes".image_protocol
    ADD CONSTRAINT "FK_9d519964ecffc311fde1a3ca2d8" FOREIGN KEY (protocol_id) REFERENCES "cloud-provider-kubernetes".protocol(id);


--
-- Name: image_protocol FK_be13232870f5bf9e712f2f0deb8; Type: FK CONSTRAINT; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER TABLE ONLY "cloud-provider-kubernetes".image_protocol
    ADD CONSTRAINT "FK_be13232870f5bf9e712f2f0deb8" FOREIGN KEY (image_id) REFERENCES "cloud-provider-kubernetes".image(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

