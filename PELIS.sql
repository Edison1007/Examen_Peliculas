DROP DATABASE IF EXISTS videoclub;
CREATE DATABASE IF NOT EXISTS videoclub;

USE videoclub;
CREATE TABLE peliculas(
    cod_pelicula INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100),
    genero VARCHAR(100),
    pais VARCHAR(100),
    anyo INT
);

CREATE TABLE personas(
    cod_persona INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    apellidos VARCHAR(150),
    pais VARCHAR(100)
);

CREATE TABLE actuan(
    cod_pelicula INT,
    cod_persona INT,
    PRIMARY KEY (cod_pelicula, cod_persona),
    FOREIGN KEY (cod_pelicula) REFERENCES peliculas(cod_pelicula) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (cod_persona)  REFERENCES personas(cod_persona) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE usuarios(
    id INT PRIMARY KEY AUTO_INCREMENT,
    usuario VARCHAR(20) UNIQUE,
    pass VARCHAR(50)
);


-- Muestra de películas
INSERT INTO peliculas(titulo, genero, pais, anyo) VALUES ('Der Baader Meinhof Komplex', 'histórica', 'Alemania', 2008);
INSERT INTO peliculas(titulo, genero, pais, anyo) VALUES ('V for Vendetta', 'Acción', 'Estados Unidos', 2006);

-- Muestra de personas
INSERT INTO personas(nombre, apellidos, pais) VALUES ('Hugo', 'Wallace Weaving', 'Inglaterra');
INSERT INTO personas(nombre, apellidos, pais) VALUES ('Johanna', 'Wokalek', 'Alemania');
INSERT INTO personas(nombre, apellidos, pais) VALUES ('John', 'Hurt', 'Inglaterra');
INSERT INTO personas(nombre, apellidos, pais) VALUES ('Moritz', 'Bleibtreu', 'Alemania');
INSERT INTO personas(nombre, apellidos, pais) VALUES ('Natalie', 'Portman', 'Israel');
INSERT INTO personas(nombre, apellidos, pais) VALUES ('Stephen', 'Rea', 'Irlanda');

-- Muestra de relaciones entre películas y personas
INSERT INTO actuan(cod_pelicula, cod_persona) VALUES (1, 2);
INSERT INTO actuan(cod_pelicula, cod_persona) VALUES (1, 4);
INSERT INTO actuan(cod_pelicula, cod_persona) VALUES (2, 1);
INSERT INTO actuan(cod_pelicula, cod_persona) VALUES (2, 3);
INSERT INTO actuan(cod_pelicula, cod_persona) VALUES (2, 5);
INSERT INTO actuan(cod_pelicula, cod_persona) VALUES (2, 6);

-- Usuario sin contraseña para realizar pruebas
INSERT INTO usuarios VALUES (1, '', '');