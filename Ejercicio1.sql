CREATE DATABASE tarea15ejercicio1;
USE tarea15ejercicio1;

CREATE TABLE IF NOT EXISTS despachos (
						numero INT,
						capacidad INT NOT NULL,
						PRIMARY KEY(numero)
						);
					
					
CREATE TABLE IF NOT EXISTS directores (
						dni VARCHAR(8),
						nom_apels VARCHAR(255) NOT NULL,
						dni_jefe VARCHAR(8),
						despacho INT,
						PRIMARY KEY(dni),
						FOREIGN KEY (despacho) REFERENCES despachos (numero)
						ON DELETE CASCADE ON UPDATE CASCADE,
						FOREIGN KEY (dni_jefe) REFERENCES directores (dni)
						ON DELETE CASCADE ON UPDATE CASCADE
						);
						
					
INSERT INTO despachos VALUES (1, 20);
INSERT INTO despachos VALUES (2, 25);
INSERT INTO despachos VALUES (3, 2);
INSERT INTO despachos VALUES (4, 5);
INSERT INTO despachos VALUES (5, 10);
INSERT INTO despachos VALUES (6, 15);
INSERT INTO despachos VALUES (7, 8);
INSERT INTO despachos VALUES (8, 50);
INSERT INTO despachos VALUES (9, 200);
INSERT INTO despachos VALUES (10, 100000);


INSERT INTO directores VALUES ("33344455", "Juan Antonio Rodriguez Parra", "33344455", 3);
INSERT INTO directores VALUES ("33344477", "Camila Garcia Perez", "33344455", 4);
INSERT INTO directores VALUES ("33344466", "Javier Perez", "33344455", 4);
INSERT INTO directores VALUES ("33344488", "Aitor Iglesias Pubill", "33344455", 4);
INSERT INTO directores VALUES ("33344499", "Francisco Parra", "33344455", 7);
INSERT INTO directores VALUES ("33344400", "Josep Maria Valles", "33344455", 7);
INSERT INTO directores VALUES ("33344411", "Gustavo Cruz", "33344455", 7);
INSERT INTO directores VALUES ("33344422", "Antonio Iglesias Espada", "33344455", 7);
INSERT INTO directores VALUES ("33344433", "Pablo Escobar Plata", "33344455", 7);
INSERT INTO directores VALUES ("33344444", "Pablo Escobar Plomo", "33344455", 7);