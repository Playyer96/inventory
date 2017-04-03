--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

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
-- Name: inventory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE inventory (
    user_id integer NOT NULL,
    item_id integer NOT NULL,
    amount integer NOT NULL
);


ALTER TABLE inventory OWNER TO postgres;

--
-- Name: items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE items (
    id integer NOT NULL,
    name character varying(2044) NOT NULL,
    type character varying(2044) NOT NULL,
    cost integer DEFAULT 0 NOT NULL
);


ALTER TABLE items OWNER TO postgres;

--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "user" (
    gold character varying(2044) NOT NULL,
    id integer NOT NULL,
    name character varying(2044) DEFAULT 'x'::character varying NOT NULL
);


ALTER TABLE "user" OWNER TO postgres;

--
-- Data for Name: inventory; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO inventory VALUES (1, 2, 20);
INSERT INTO inventory VALUES (2, 2, 3);
INSERT INTO inventory VALUES (2, 1, 0);
INSERT INTO inventory VALUES (1, 1, 7);


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO items VALUES (1, 'sword', 'sword', 250);
INSERT INTO items VALUES (2, 'Axe', 'Axe', 400);


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "user" VALUES ('200', 1, 'jaramiYolo');
INSERT INTO "user" VALUES ('800', 2, 'boquetes');


--
-- Name: inventory inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY inventory
    ADD CONSTRAINT inventory_pkey PRIMARY KEY (user_id, item_id);


--
-- Name: items items_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY items
    ADD CONSTRAINT items_id_key UNIQUE (id);


--
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: user unique_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT unique_id UNIQUE (id);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: index_amount; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_amount ON inventory USING btree (amount);


--
-- Name: index_cost; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_cost ON items USING btree (cost);


--
-- Name: index_gold; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_gold ON "user" USING btree (gold);


--
-- Name: index_id1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_id1 ON items USING btree (id);


--
-- Name: index_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_name ON "user" USING btree (name);


--
-- Name: index_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_type ON items USING btree (name);


--
-- Name: index_type1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_type1 ON items USING btree (type);


--
-- Name: inventory_item_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX inventory_item_id_idx ON inventory USING btree (item_id);


--
-- Name: inventory_user_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX inventory_user_id_idx ON inventory USING btree (user_id);


--
-- Name: inventory lnk_items_inventory; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY inventory
    ADD CONSTRAINT lnk_items_inventory FOREIGN KEY (item_id) REFERENCES items(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: inventory lnk_user_inventory; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY inventory
    ADD CONSTRAINT lnk_user_inventory FOREIGN KEY (user_id) REFERENCES "user"(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

