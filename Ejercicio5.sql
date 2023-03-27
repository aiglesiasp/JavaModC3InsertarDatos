CREATE DATABASE IF NOT EXISTS ejercicio_5;
USE ejercicio_5;

CREATE TABLE IF NOT EXISTS facultad (
    codigo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
    );
    
CREATE TABLE IF NOT EXISTS investigadores (
    dni VARCHAR(8) PRIMARY KEY,
    nomApels VARCHAR(255) NOT NULL,
    facultad INT,
    FOREIGN KEY (facultad) REFERENCES facultad(codigo)
    ON DELETE CASCADE ON UPDATE CASCADE
	);
    
CREATE TABLE IF NOT EXISTS equipos (
    numserie CHAR(4) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    facultad INT,
    FOREIGN KEY (facultad) REFERENCES facultad(codigo)
    ON DELETE CASCADE ON UPDATE CASCADE
    );

CREATE TABLE IF NOT EXISTS reserva (
    dni VARCHAR(8),
    numserie CHAR(4),
    comienzo DATETIME NOT NULL,
    fin DATETIME,
    PRIMARY KEY (dni, numserie),
    FOREIGN KEY (dni) REFERENCES investigadores(dni)
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (numserie) REFERENCES equipos(numserie)
    ON DELETE CASCADE ON UPDATE CASCADE
    );

/* INSERT INTO facultad */
INSERT INTO facultad(facultad.nombre) VALUES ('FACULTAD 1');
INSERT INTO facultad(facultad.nombre) VALUES ('FACULTAD 2');
INSERT INTO facultad(facultad.nombre) VALUES ('FACULTAD 3');
INSERT INTO facultad(facultad.nombre) VALUES ('FACULTAD 4');
INSERT INTO facultad(facultad.nombre) VALUES ('FACULTAD 5');

/* INSERT INTO investigadores */
INSERT INTO investigadores VALUES ('00000001', 'Investigador 1', 1);
INSERT INTO investigadores VALUES ('00000002', 'Investigador 2', 1);
INSERT INTO investigadores VALUES ('00000003', 'Investigador 3', 2);
INSERT INTO investigadores VALUES ('00000004', 'Investigador 4', 2);
INSERT INTO investigadores VALUES ('00000005', 'Investigador 5', 3);

/* INSERT INTO equios */
INSERT INTO equipos VALUES ('01', 'equipo 1', 1);
INSERT INTO equipos VALUES ('02', 'equipo 2', 2);
INSERT INTO equipos VALUES ('03', 'equipo 3', 3);
INSERT INTO equipos VALUES ('04', 'equipo 4', 4);
INSERT INTO equipos VALUES ('05', 'equipo 5', 5);

/* INSERT INTO reserva */
INSERT INTO reserva VALUES ('00000002', '01', '2023-03-27 14:15:37.000000', '2023-03-17 14:15:37');