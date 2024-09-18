--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer,
    tail_length integer NOT NULL,
    is_periodic boolean NOT NULL
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    size_in_light_years integer NOT NULL,
    has_black_hole boolean NOT NULL,
    description text,
    distance_from_earth numeric(12,2)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer,
    diameter integer NOT NULL,
    orbit_distance numeric(10,2) NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer,
    diameter integer NOT NULL,
    has_life boolean NOT NULL,
    surface_temperature numeric(7,2)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer,
    mass integer NOT NULL,
    is_sun boolean NOT NULL,
    spectral_type text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halleys Comet', 1, 24000, true);
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 1, 40000, false);
INSERT INTO public.comet VALUES (3, 'Swift-Tuttle', 1, 26000, true);
INSERT INTO public.comet VALUES (4, 'Proxima Centauri Comet 1', 2, 30000, false);
INSERT INTO public.comet VALUES (5, 'Alpha Centauri A Comet 1', 3, 35000, true);
INSERT INTO public.comet VALUES (6, 'Sirius Comet 1', 4, 50000, false);
INSERT INTO public.comet VALUES (7, 'Sirius Comet 2', 4, 35000, true);
INSERT INTO public.comet VALUES (8, 'Betelgeuse Comet 1', 5, 40000, false);
INSERT INTO public.comet VALUES (9, 'Betelgeuse Comet 2', 5, 27000, true);
INSERT INTO public.comet VALUES (10, 'Kepler Comet 1', 6, 33000, false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, true, 'The galaxy that contains our solar system.', 0.00);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 220000, true, 'The closest spiral galaxy to the Milky Way.', 2537000.00);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 60000, false, 'A small spiral galaxy.', 3000000.00);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 14000, true, 'A satellite galaxy of the Milky Way.', 163000.00);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 7000, false, 'A small irregular galaxy.', 200000.00);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool Galaxy', 76000, true, 'A classic spiral galaxy.', 31000000.00);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 3474, 384400.00);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 22, 9376.00);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 12, 23458.00);
INSERT INTO public.moon VALUES (4, 'Io', 3, 3643, 421700.00);
INSERT INTO public.moon VALUES (5, 'Europa', 3, 3122, 671100.00);
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, 5262, 1070400.00);
INSERT INTO public.moon VALUES (7, 'Callisto', 3, 4820, 1882700.00);
INSERT INTO public.moon VALUES (8, 'Proxima Centauri Moon 1', 4, 500, 120000.00);
INSERT INTO public.moon VALUES (9, 'Alpha Centauri Bb Moon 1', 5, 1500, 80000.00);
INSERT INTO public.moon VALUES (10, 'Kepler-22b Moon 1', 6, 300, 200000.00);
INSERT INTO public.moon VALUES (11, 'Vega 1 Moon 1', 7, 700, 70000.00);
INSERT INTO public.moon VALUES (12, 'Vega 2 Moon 1', 8, 350, 15000.00);
INSERT INTO public.moon VALUES (13, 'Vega 3 Moon 1', 9, 450, 20000.00);
INSERT INTO public.moon VALUES (14, 'Betelgeuse 1 Moon 1', 10, 1200, 100000.00);
INSERT INTO public.moon VALUES (15, 'Sirius A Moon 1', 11, 1100, 85000.00);
INSERT INTO public.moon VALUES (16, 'Sirius B Moon 1', 12, 900, 120000.00);
INSERT INTO public.moon VALUES (17, 'Sirius A Moon 2', 11, 800, 150000.00);
INSERT INTO public.moon VALUES (18, 'Sirius B Moon 2', 12, 700, 180000.00);
INSERT INTO public.moon VALUES (19, 'Jupiter Moon 1', 3, 1600, 420000.00);
INSERT INTO public.moon VALUES (20, 'Jupiter Moon 2', 3, 1450, 620000.00);
INSERT INTO public.moon VALUES (21, 'Kepler-22b Moon 2', 6, 280, 65000.00);
INSERT INTO public.moon VALUES (22, 'Kepler-22b Moon 3', 6, 500, 70000.00);
INSERT INTO public.moon VALUES (23, 'Exoplanet X Moon 1', 13, 600, 90000.00);
INSERT INTO public.moon VALUES (24, 'Exoplanet X Moon 2', 13, 700, 95000.00);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 12742, true, 288.00);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 6779, false, 210.00);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 139820, false, 165.00);
INSERT INTO public.planet VALUES (4, 'Proxima b', 2, 6800, false, 300.00);
INSERT INTO public.planet VALUES (5, 'Alpha Centauri Bb', 3, 12200, false, 220.00);
INSERT INTO public.planet VALUES (6, 'Kepler-22b', 4, 24000, false, 255.00);
INSERT INTO public.planet VALUES (7, 'Vega 1', 6, 11800, false, 290.00);
INSERT INTO public.planet VALUES (8, 'Vega 2', 6, 4900, false, 275.00);
INSERT INTO public.planet VALUES (9, 'Vega 3', 6, 1000, false, 250.00);
INSERT INTO public.planet VALUES (10, 'Betelgeuse 1', 5, 140000, false, 350.00);
INSERT INTO public.planet VALUES (11, 'Sirius A', 4, 38000, false, 275.00);
INSERT INTO public.planet VALUES (12, 'Sirius B', 4, 49000, false, 280.00);
INSERT INTO public.planet VALUES (13, 'Exoplanet X', 1, 11200, false, 300.00);
INSERT INTO public.planet VALUES (14, 'Exoplanet Y', 1, 8400, true, 290.00);
INSERT INTO public.planet VALUES (15, 'Exoplanet Z', 1, 9500, false, 310.00);
INSERT INTO public.planet VALUES (16, 'Proxima c', 2, 13000, false, 290.00);
INSERT INTO public.planet VALUES (17, 'Alpha Centauri C', 3, 11500, false, 280.00);
INSERT INTO public.planet VALUES (18, 'Kepler-22c', 4, 22000, false, 275.00);
INSERT INTO public.planet VALUES (19, 'Vega 4', 6, 10500, false, 285.00);
INSERT INTO public.planet VALUES (20, 'Betelgeuse 2', 5, 14500, false, 320.00);
INSERT INTO public.planet VALUES (21, 'Sirius C', 4, 37000, false, 265.00);
INSERT INTO public.planet VALUES (22, 'Sirius D', 4, 48000, false, 285.00);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1989000, true, 'G-type');
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 2, 123, false, 'M-type');
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 2, 123500, false, 'G-type');
INSERT INTO public.star VALUES (4, 'Sirius', 1, 2550000, false, 'A-type');
INSERT INTO public.star VALUES (5, 'Betelgeuse', 1, 1400000, false, 'M-type');
INSERT INTO public.star VALUES (6, 'Vega', 1, 2115000, false, 'A-type');


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 10, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 22, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: comet comet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON DELETE CASCADE;


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON DELETE CASCADE;


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON DELETE CASCADE;


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

