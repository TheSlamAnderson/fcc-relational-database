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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(50) NOT NULL,
    name_origin text,
    has_messier_objects boolean NOT NULL
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    messier_number integer,
    ngc_number integer,
    type character varying(50) NOT NULL,
    constellation_id integer NOT NULL
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
    name character varying(50) NOT NULL,
    designation character varying(50),
    orbital_period numeric,
    planet_id integer NOT NULL
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
    name character varying(50) NOT NULL,
    designation character varying(50),
    classification character varying(50),
    orbital_period numeric NOT NULL,
    has_life boolean NOT NULL,
    star_id integer NOT NULL
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
    name character varying(50) NOT NULL,
    flamsteed_number character varying(50),
    bayer_designation character varying(50),
    class character varying(50) NOT NULL,
    galaxy_id integer NOT NULL
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Andromeda', 'It is named for Andromeda, daughter of Cassiopeia, in the Greek myth, who was chained to a rock to be eaten by the sea monster Cetus.', true);
INSERT INTO public.constellation VALUES (2, 'Aquila', 'Its name is Latin for "eagle" and it represents the bird that carried Zeus/Jupiter''s thunderbolts in Greek-Roman mythology.', false);
INSERT INTO public.constellation VALUES (3, 'Cancer', 'Its name is Latin for crab and it is commonly represented as one.', true);
INSERT INTO public.constellation VALUES (4, 'Canes Venatici', 'Its name is Latin for "hunting dogs", and the constellation is often depicted in illustrations as representing the dogs of Boötes the Herdsman, a neighboring constellation.', true);
INSERT INTO public.constellation VALUES (5, 'Canis Major', 'Its name is Latin for "greater dog" in contrast to Canis Minor, the "lesser dog"; both figures are commonly represented as following the constellation of Orion the hunter through the sky.', true);
INSERT INTO public.constellation VALUES (6, 'Sagittarius', 'Its name is Latin for "archer". Sagittarius is commonly represented as a centaur pulling back a bow', true);
INSERT INTO public.constellation VALUES (7, 'Ophiuchus', 'Its name comes from the Ancient Greek ὀφιοῦχος (ophioûkhos), meaning "serpent-bearer", and it is commonly represented as a man grasping a snake.', true);
INSERT INTO public.constellation VALUES (8, 'Pegasus', 'It is named after the winged horse Pegasus in Greek mythology.', true);
INSERT INTO public.constellation VALUES (9, 'Piscis Austrinus', 'The name is Latin for "the southern fish", in contrast with the larger constellation Pisces, which represents a pair of fish.', false);
INSERT INTO public.constellation VALUES (10, 'Taurus', 'The name is Latin for "the Bull." Its importance to the agricultural calendar influenced various bull figures in the mythologies of Ancient Sumer, Akkad, Assyria, Babylon, Egypt, Greece, and Rome.', true);
INSERT INTO public.constellation VALUES (11, 'Ursa Major', 'Its Latin name means "greater (or larger) bear," referring to and contrasting it with nearby Ursa Minor, the lesser bear.', true);
INSERT INTO public.constellation VALUES (12, 'Virgo', 'Its name is Latin for maiden.', true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 31, 224, 'Spiral', 1);
INSERT INTO public.galaxy VALUES (2, 'Cigar', 82, 3034, 'Irregular', 11);
INSERT INTO public.galaxy VALUES (3, 'Milky Way', NULL, NULL, 'Spiral', 6);
INSERT INTO public.galaxy VALUES (4, 'Pinwheel', 101, 5457, 'Spiral', 11);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 104, 4594, 'Spiral', 12);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 51, 5194, 'Spiral', 4);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'Earth I', 27.4, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Mars I', 0.3188, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Mars II', 1.25, 4);
INSERT INTO public.moon VALUES (4, 'Io', 'Jupiter I', 1.769, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'Jupiter II', 3.5417, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Jupiter III', 7.154, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Jupiter IV', 16.689, 5);
INSERT INTO public.moon VALUES (8, 'Mimas', 'Saturn I', 0.9417, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'Saturn II', 1.37, 6);
INSERT INTO public.moon VALUES (10, 'Tethys', 'Saturn III', 1.8875, 6);
INSERT INTO public.moon VALUES (11, 'Dione', 'Saturn IV', 2.7368, 6);
INSERT INTO public.moon VALUES (12, 'Rhea', 'Saturn V', 4.518, 6);
INSERT INTO public.moon VALUES (13, 'Titan', 'Saturn VI', 15.945, 6);
INSERT INTO public.moon VALUES (14, 'Hyperion', 'Saturn VII', 21.2764, 6);
INSERT INTO public.moon VALUES (15, 'Iapetus', 'Saturn VIII', 79.3215, 6);
INSERT INTO public.moon VALUES (16, 'Ariel', 'Uranus I', 2.520, 7);
INSERT INTO public.moon VALUES (17, 'Umbriel', 'Uranus II', 4.144, 7);
INSERT INTO public.moon VALUES (18, 'Titania', 'Uranus III', 8.706, 7);
INSERT INTO public.moon VALUES (19, 'Oberon', 'Uranus IV', 13.463, 7);
INSERT INTO public.moon VALUES (20, 'Miranda', 'Uranus V', 1.4135, 7);
INSERT INTO public.moon VALUES (21, 'Triton', 'Neptune I', 5.8769, 8);
INSERT INTO public.moon VALUES (22, 'Nereid', 'Neptune II', 360.11, 8);
INSERT INTO public.moon VALUES (23, 'Neso', 'Neptune XIII', 9740.499, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', NULL, 'Terrestrial', 88, false, 8);
INSERT INTO public.planet VALUES (2, 'Venus', NULL, 'Terrestrial', 224.70, false, 8);
INSERT INTO public.planet VALUES (3, 'Earth', NULL, 'Terrestrial', 365.26, true, 8);
INSERT INTO public.planet VALUES (4, 'Mars', NULL, 'Terrestrial', 687, false, 8);
INSERT INTO public.planet VALUES (5, 'Jupiter', NULL, 'Gas Giant', 4335.517, false, 8);
INSERT INTO public.planet VALUES (6, 'Saturn', NULL, 'Gas Giant', 10767.57, false, 8);
INSERT INTO public.planet VALUES (7, 'Uranus', NULL, 'Ice Giant', 30706.57, false, 8);
INSERT INTO public.planet VALUES (8, 'Neptune', NULL, 'Ice Giant', 60229.72, false, 8);
INSERT INTO public.planet VALUES (9, 'Dimidium', '51 Pegasi b', 'Gas Giant', 4.23, false, 5);
INSERT INTO public.planet VALUES (10, 'Galileo', '55 Cancri b', 'Gas Giant', 14.67, false, 3);
INSERT INTO public.planet VALUES (11, 'Fortitudo', '59 Aquilae b', 'Gas Giant', 136.7916, false, 6);
INSERT INTO public.planet VALUES (12, 'Amateru', '74 Tauri b', 'Gas Giant', 595, false, 1);
INSERT INTO public.planet VALUES (13, 'Janssen', '55 Cancri e', 'Super Earth', 0.7368, false, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Ain', '74 Tauri', 'Epsilon Tauri', 'K0III', 3);
INSERT INTO public.star VALUES (2, 'Altair', '53 Aquilae', 'Alpha Aquilae', 'A7V', 3);
INSERT INTO public.star VALUES (3, 'Copernicus', '55 Cancri', 'Rho1 Cancri', 'K0IV–V', 3);
INSERT INTO public.star VALUES (4, 'Fomalhaut', '24 Piscis Austrini', 'Alpha Piscis Austrini', 'A3V', 3);
INSERT INTO public.star VALUES (5, 'Helvetios', '51 Pegasi', NULL, 'G5V', 3);
INSERT INTO public.star VALUES (6, 'Libertas', '59 Aquilae', 'Xi Aquilae', 'G9.5 IIIb', 3);
INSERT INTO public.star VALUES (7, 'Sirius', '9 Canis Majoris', 'Alpha Canis Majoris', 'A1V', 3);
INSERT INTO public.star VALUES (8, 'Sol', NULL, NULL, 'G2V', 3);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 12, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: galaxy fk_constellation; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT fk_constellation FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--
