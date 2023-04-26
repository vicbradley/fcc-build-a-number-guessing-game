--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: accounts; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.accounts (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.accounts OWNER TO freecodecamp;

--
-- Name: account_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.account_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_user_id_seq OWNER TO freecodecamp;

--
-- Name: account_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.account_user_id_seq OWNED BY public.accounts.user_id;


--
-- Name: accounts user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.accounts ALTER COLUMN user_id SET DEFAULT nextval('public.account_user_id_seq'::regclass);


--
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.accounts VALUES (1, '', 1, 5);
INSERT INTO public.accounts VALUES (4, 'user_1682520595648', 1, 86);
INSERT INTO public.accounts VALUES (5, 'user_1682520595647', 1, 52);
INSERT INTO public.accounts VALUES (6, 'user_1682520658730', 1, 48);
INSERT INTO public.accounts VALUES (7, 'user_1682520658729', 1, 99);
INSERT INTO public.accounts VALUES (8, 'wiwi', 1, 4);
INSERT INTO public.accounts VALUES (2, 'bradley', 4, 1);
INSERT INTO public.accounts VALUES (10, 'user_1682522921177', 2, 26);
INSERT INTO public.accounts VALUES (9, 'user_1682522921178', 5, 5);
INSERT INTO public.accounts VALUES (11, 'wikwok', 1, 1);
INSERT INTO public.accounts VALUES (13, 'user_1682523074113', 2, 28);
INSERT INTO public.accounts VALUES (12, 'user_1682523074114', 5, 26);
INSERT INTO public.accounts VALUES (14, 'john', 1, 3);
INSERT INTO public.accounts VALUES (16, 'user_1682523547896', 2, 93);
INSERT INTO public.accounts VALUES (15, 'user_1682523547897', 5, 21);
INSERT INTO public.accounts VALUES (18, 'user_1682523569434', 2, 8);
INSERT INTO public.accounts VALUES (17, 'user_1682523569435', 5, 14);
INSERT INTO public.accounts VALUES (20, 'user_1682523645324', 2, 28);
INSERT INTO public.accounts VALUES (19, 'user_1682523645325', 5, 17);
INSERT INTO public.accounts VALUES (22, 'user_1682523655267', 2, 51);
INSERT INTO public.accounts VALUES (21, 'user_1682523655268', 5, 10);
INSERT INTO public.accounts VALUES (24, 'user_1682523669987', 2, 20);
INSERT INTO public.accounts VALUES (23, 'user_1682523669988', 5, 7);
INSERT INTO public.accounts VALUES (3, 'sanjaya', 2, 2);
INSERT INTO public.accounts VALUES (26, 'user_1682523853342', 2, 86);
INSERT INTO public.accounts VALUES (25, 'user_1682523853343', 5, 15);
INSERT INTO public.accounts VALUES (28, 'user_1682524259287', 2, 27);
INSERT INTO public.accounts VALUES (27, 'user_1682524259288', 5, 10);


--
-- Name: account_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.account_user_id_seq', 28, true);


--
-- Name: accounts account_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT account_pkey PRIMARY KEY (user_id);


--
-- Name: accounts account_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT account_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--