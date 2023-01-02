CREATE DATABASE universe;

CREATE TABLE constellation (constellation_id SERIAL PRIMARY KEY, name VARCHAR (50) UNIQUE NOT NULL, name_origin TEXT, has_messier_objects BOOLEAN NOT NULL);
CREATE TABLE galaxy (galaxy_id SERIAL PRIMARY KEY, name VARCHAR (50) UNIQUE NOT NULL, messier_number INT, ngc_number INT, type VARCHAR (50) NOT NULL, constellation_id INT NOT NULL, CONSTRAINT fk_constellation FOREIGN KEY(constellation_id) REFERENCES constellation(constellation_id));
CREATE TABLE star (star_id SERIAL PRIMARY KEY, name VARCHAR (50) UNIQUE NOT NULL, flamsteed_number VARCHAR (50), bayer_designation VARCHAR (50), class VARCHAR (50) NOT NULL, galaxy_id INT NOT NULL, CONSTRAINT fk_galaxy FOREIGN KEY(galaxy_id) REFERENCES galaxy(galaxy_id));
CREATE TABLE planet (planet_id SERIAL PRIMARY KEY, name VARCHAR (50) UNIQUE NOT NULL, designation VARCHAR (50), classification VARCHAR (50), orbital_period NUMERIC NOT NULL, has_life BOOLEAN NOT NULL, star_id INT NOT NULL, CONSTRAINT fk_star FOREIGN KEY(star_id) REFERENCES star(star_id));
CREATE TABLE moon (moon_id SERIAL PRIMARY KEY, name VARCHAR (50) UNIQUE NOT NULL, designation VARCHAR (50), orbital_period NUMERIC, planet_id INT NOT NULL, CONSTRAINT fk_planet FOREIGN KEY(planet_id) REFERENCES planet(planet_id));

INSERT INTO constellation(name, name_origin, has_messier_objects) VALUES
('Andromeda', 'It is named for Andromeda, daughter of Cassiopeia, in the Greek myth, who was chained to a rock to be eaten by the sea monster Cetus.', true),
('Aquila', 'Its name is Latin for "eagle" and it represents the bird that carried Zeus/Jupiter''s thunderbolts in Greek-Roman mythology.', false),
('Cancer', 'Its name is Latin for crab and it is commonly represented as one.', true),
('Canes Venatici', 'Its name is Latin for "hunting dogs", and the constellation is often depicted in illustrations as representing the dogs of Boötes the Herdsman, a neighboring constellation.', true),
('Canis Major', 'Its name is Latin for "greater dog" in contrast to Canis Minor, the "lesser dog"; both figures are commonly represented as following the constellation of Orion the hunter through the sky.', true),
('Sagittarius', 'Its name is Latin for "archer". Sagittarius is commonly represented as a centaur pulling back a bow', true),
('Ophiuchus', 'Its name comes from the Ancient Greek ὀφιοῦχος (ophioûkhos), meaning "serpent-bearer", and it is commonly represented as a man grasping a snake.', true),
('Pegasus', 'It is named after the winged horse Pegasus in Greek mythology.', true),
('Piscis Austrinus', 'The name is Latin for "the southern fish", in contrast with the larger constellation Pisces, which represents a pair of fish.', false),
('Taurus', 'The name is Latin for "the Bull." Its importance to the agricultural calendar influenced various bull figures in the mythologies of Ancient Sumer, Akkad, Assyria, Babylon, Egypt, Greece, and Rome.', true),
('Ursa Major', 'Its Latin name means "greater (or larger) bear," referring to and contrasting it with nearby Ursa Minor, the lesser bear.', true),
('Virgo', 'Its name is Latin for maiden.', true);

INSERT INTO galaxy (name, messier_number, ngc_number, type, constellation_id)
VALUES
('Andromeda', 31, 224, 'Spiral', 1),
('Cigar', 82, 3034, 'Irregular', 11),
('Milky Way', NULL, NULL, 'Spiral', 6),
('Pinwheel', 101, 5457, 'Spiral', 11),
('Sombrero', 104, 4594, 'Spiral', 12),
('Whirlpool', 51, 5194, 'Spiral', 4);

INSERT INTO star (name, flamsteed_number, bayer_designation, class, galaxy_id)
VALUES
('Ain', '74 Tauri', 'Epsilon Tauri', 'K0III', 3),
('Altair', '53 Aquilae', 'Alpha Aquilae', 'A7V', 3),
('Copernicus', '55 Cancri', 'Rho1 Cancri', 'K0IV–V', 3),
('Fomalhaut', '24 Piscis Austrini', 'Alpha Piscis Austrini', 'A3V', 3),
('Helvetios', '51 Pegasi', NULL, 'G5V', 3),
('Libertas', '59 Aquilae', 'Xi Aquilae', 'G9.5 IIIb', 3),
('Sirius', '9 Canis Majoris', 'Alpha Canis Majoris', 'A1V', 3),
('Sol', NULL, NULL, 'G2V', 3);

INSERT INTO planet(name, designation, classification, orbital_period, has_life, star_id)
VALUES
('Mercury', NULL, 'Terrestrial', 88, false, 8),
('Venus', NULL, 'Terrestrial', 224.70, false, 8),
('Earth', NULL, 'Terrestrial', 365.26, true, 8),
('Mars', NULL, 'Terrestrial', 687, false, 8),
('Jupiter', NULL, 'Gas Giant', 4335.517, false, 8),
('Saturn', NULL, 'Gas Giant', 10767.57, false, 8),
('Uranus', NULL, 'Ice Giant', 30706.57, false, 8),
('Neptune', NULL, 'Ice Giant', 60229.72, false, 8),
('Dimidium', '51 Pegasi b', 'Gas Giant', 4.23, false, 5),
('Galileo', '55 Cancri b', 'Gas Giant', 14.67, false, 3),
('Fortitudo', '59 Aquilae b', 'Gas Giant', 136.7916, false, 6),
('Amateru', '74 Tauri b', 'Gas Giant', 595, false, 1),
('Janssen', '55 Cancri e', 'Super Earth', 0.7368, false, 3);

INSERT INTO moon(name, designation, orbital_period, planet_id)
VALUES
('Luna', 'Earth I', 27.4, 3),
('Phobos', 'Mars I', 0.3188, 4),
('Deimos', 'Mars II', 1.25, 4),
('Io', 'Jupiter I', 1.769, 5),
('Europa', 'Jupiter II', 3.5417, 5),
('Ganymede', 'Jupiter III', 7.154, 5),
('Callisto', 'Jupiter IV', 16.689, 5),
('Mimas', 'Saturn I', 0.9417, 6),
('Enceladus', 'Saturn II', 1.37, 6),
('Tethys', 'Saturn III', 1.8875, 6),
('Dione', 'Saturn IV', 2.7368, 6),
('Rhea', 'Saturn V', 4.518, 6),
('Titan', 'Saturn VI', 15.945, 6),
('Hyperion', 'Saturn VII', 21.2764, 6),
('Iapetus', 'Saturn VIII', 79.3215, 6),
('Ariel', 'Uranus I', 2.520, 7),
('Umbriel', 'Uranus II', 4.144, 7),
('Titania', 'Uranus III', 8.706, 7),
('Oberon', 'Uranus IV', 13.463, 7),
('Miranda', 'Uranus V', 1.4135, 7),
('Triton', 'Neptune I', 5.8769, 8),
('Nereid', 'Neptune II', 360.11, 8),
('Neso', 'Neptune XIII', 9740.499, 8);
