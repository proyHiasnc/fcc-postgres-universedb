--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(255) NOT NULL,
    abbreviation character varying(10) NOT NULL,
    location text,
    no_of_stars integer
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
    name character varying(255) NOT NULL,
    galaxy_type character varying(100) NOT NULL,
    diameter_light_years numeric,
    has_supermassive_black_hole boolean NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    description text
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
    name character varying(255) NOT NULL,
    planet_id integer NOT NULL,
    diameter_km integer NOT NULL,
    orbital_period_days numeric,
    is_spherical boolean NOT NULL,
    has_atmosphere boolean NOT NULL,
    description text
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
    name character varying(255) NOT NULL,
    star_id integer NOT NULL,
    planet_type character varying(100) NOT NULL,
    has_life boolean NOT NULL,
    has_atmosphere boolean NOT NULL,
    diameter_km integer,
    orbital_period_days numeric,
    description text
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
    name character varying(255) NOT NULL,
    galaxy_id integer NOT NULL,
    star_type character varying(100) NOT NULL,
    temperature_kelvin integer,
    is_spherical boolean NOT NULL,
    mass_relative_to_sun numeric,
    description text
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

INSERT INTO public.constellation VALUES (1, 'Orion', 'Ori', 'Cellestial-Equator', 7);
INSERT INTO public.constellation VALUES (2, 'Leo', 'Leo', 'Cellestial-Equator', 5);
INSERT INTO public.constellation VALUES (3, 'Crux', 'Cru', 'Southern Hemisphere', 5);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 100000, true, 13600, 'Our home galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 220000, true, 10000, 'Nearest spiral galaxy to Milky Way');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 60000, true, 3000, 'Third-largest galaxy in Local Group');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 76000, true, 4000, 'Classic spiral galaxy with companion');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Spiral', 50000, true, 13200, 'Edge-on spiral with bright nucleus');
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 'Elliptical', 60000, true, 13000, 'Radio galaxy with dust lane');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 3474, 27.3, true, false, 'Earth''s only natural satellite');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22, 0.32, false, false, 'Inner moon of Mars');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12, 1.26, false, false, 'Outer moon of Mars');
INSERT INTO public.moon VALUES (4, 'Io', 5, 3643, 1.77, true, false, 'Most volcanically active body');
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3122, 3.55, true, false, 'Potential subsurface ocean');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 5268, 7.15, true, false, 'Largest moon in solar system');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4821, 16.69, true, false, 'Most heavily cratered object');
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 167, 0.5, false, false, 'Red-colored inner moon');
INSERT INTO public.moon VALUES (9, 'Himalia', 5, 170, 250.6, false, false, 'Largest irregular moon');
INSERT INTO public.moon VALUES (10, 'Mimas', 6, 396, 0.94, true, false, 'Death Star moon');
INSERT INTO public.moon VALUES (11, 'Enceladus', 6, 504, 1.37, true, false, 'Geysers of water ice');
INSERT INTO public.moon VALUES (12, 'Tethys', 6, 1062, 1.89, true, false, 'Large icy moon');
INSERT INTO public.moon VALUES (13, 'Dione', 6, 1123, 2.74, true, false, 'Cryovolcanic features');
INSERT INTO public.moon VALUES (14, 'Rhea', 6, 1527, 4.52, true, false, 'Second largest moon of Saturn');
INSERT INTO public.moon VALUES (15, 'Titan', 6, 5150, 15.95, true, true, 'Only moon with thick atmosphere');
INSERT INTO public.moon VALUES (16, 'Iapetus', 6, 1470, 79.3, true, false, 'Two-toned moon');
INSERT INTO public.moon VALUES (17, 'Phoebe', 6, 213, 550.5, false, false, 'Irregular retrograde moon');
INSERT INTO public.moon VALUES (18, 'Miranda', 7, 472, 1.41, true, false, 'Geologically diverse');
INSERT INTO public.moon VALUES (19, 'Ariel', 7, 1158, 2.52, true, false, 'Brightest moon of Uranus');
INSERT INTO public.moon VALUES (20, 'Umbriel', 7, 1169, 4.14, true, false, 'Darkest moon');
INSERT INTO public.moon VALUES (21, 'Titania', 7, 1578, 8.71, true, false, 'Largest moon of Uranus');
INSERT INTO public.moon VALUES (22, 'Oberon', 7, 1523, 13.46, true, false, 'Most heavily cratered');
INSERT INTO public.moon VALUES (23, 'Puck', 7, 162, 0.76, true, false, 'Inner moon');
INSERT INTO public.moon VALUES (24, 'Triton', 8, 2707, 5.88, true, true, 'Largest moon of Neptune, retrograde orbit');
INSERT INTO public.moon VALUES (25, 'Nereid', 8, 340, 360.1, false, false, 'Highly eccentric orbit');
INSERT INTO public.moon VALUES (26, 'Charon', 9, 1212, 6.39, true, false, 'Largest moon of Pluto');
INSERT INTO public.moon VALUES (27, 'Nix', 9, 49, 24.85, false, false, 'Small moon of Pluto');
INSERT INTO public.moon VALUES (28, 'Hydra', 9, 51, 38.2, false, false, 'Outer moon of Pluto');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', false, false, 4879, 88.0, 'Smallest planet');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', false, true, 12104, 224.7, 'Hottest planet');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', true, true, 12756, 365.2, 'Our home planet');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', false, true, 6779, 687.0, 'Red planet');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas Giant', false, true, 139822, 4331, 'Largest planet');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas Giant', false, true, 116464, 10747, 'Ringed planet');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice Giant', false, true, 50724, 30589, 'Sideways planet');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice Giant', false, true, 49244, 59800, 'Windiest planet');
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 6, 'Terrestrial', false, true, 14000, 11.2, 'Exoplanet in habitable zone');
INSERT INTO public.planet VALUES (10, 'Kepler-22b', 2, 'Super-Earth', true, true, 30000, 290.0, 'First confirmed exoplanet in habitable zone');
INSERT INTO public.planet VALUES (11, 'HD 209458 b', 3, 'Hot Jupiter', false, true, 160000, 3.5, 'First exoplanet with detected atmosphere');
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1d', 4, 'Terrestrial', false, true, 9700, 4.05, 'Potentially habitable exoplanet');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G-type Main Sequence', 5778, true, 1.0, 'Our home star');
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'A-type Main Sequence', 9940, true, 2.02, 'Brightest star in night sky');
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 1, 'G-type Main Sequence', 5790, true, 1.1, 'Closest G-type star to Sun');
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 'Red Supergiant', 3500, true, 11.6, 'Red supergiant in Orion');
INSERT INTO public.star VALUES (5, 'Vega', 1, 'A-type Main Sequence', 9602, true, 2.1, 'Fifth brightest star');
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 1, 'Red Dwarf', 3042, true, 0.12, 'Closest star to Sun');


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 28, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

