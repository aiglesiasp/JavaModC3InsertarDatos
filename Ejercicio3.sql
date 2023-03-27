CREATE DATABASE tarea14ejercicio9;
USE tarea14ejercicio9;

CREATE TABLE IF NOT EXISTS cientificos (
						dni VARCHAR(8),
						nom_apels VARCHAR(255) NOT NULL,
						PRIMARY KEY(dni)
						);
					
CREATE TABLE IF NOT EXISTS proyecto (
						id CHAR(4),
						nombre VARCHAR(255) NOT NULL,
						horas INT NOT NULL,
						PRIMARY KEY(id)
						);
						
CREATE TABLE IF NOT EXISTS asignado_a (
						cientifico VARCHAR(8),
						proyecto CHAR(4),
						PRIMARY KEY(cientifico, proyecto),
						FOREIGN KEY (cientifico) REFERENCES cientificos (dni)
						ON DELETE CASCADE ON UPDATE CASCADE,
						FOREIGN KEY (proyecto) REFERENCES proyecto (id)
						ON DELETE CASCADE ON UPDATE CASCADE
						);
						
					
INSERT INTO cientificos (dni, nom_apels) VALUES ('12345678', 'Juan Pérez');
INSERT INTO cientificos (dni, nom_apels) VALUES ('23456789', 'Ana García');
INSERT INTO cientificos (dni, nom_apels) VALUES ('34567890', 'Pedro González');
INSERT INTO cientificos (dni, nom_apels) VALUES ('45678901', 'María López');
INSERT INTO cientificos (dni, nom_apels) VALUES ('56789012', 'José Martínez');
INSERT INTO cientificos (dni, nom_apels) VALUES ('67890123', 'Elena Sánchez');
INSERT INTO cientificos (dni, nom_apels) VALUES ('78901234', 'Carlos Ruiz');
INSERT INTO cientificos (dni, nom_apels) VALUES ('89012345', 'Laura García');
INSERT INTO cientificos (dni, nom_apels) VALUES ('90123456', 'Manuel Pérez');
INSERT INTO cientificos (dni, nom_apels) VALUES ('01234567', 'Sara Rodríguez');


INSERT INTO proyecto (id, nombre, horas) VALUES ('P001', 'Proyecto 1', 100);
INSERT INTO proyecto (id, nombre, horas) VALUES ('P002', 'Proyecto 2', 200);
INSERT INTO proyecto (id, nombre, horas) VALUES ('P003', 'Proyecto 3', 150);
INSERT INTO proyecto (id, nombre, horas) VALUES ('P004', 'Proyecto 4', 300);
INSERT INTO proyecto (id, nombre, horas) VALUES ('P005', 'Proyecto 5', 250);
INSERT INTO proyecto (id, nombre, horas) VALUES ('P006', 'Proyecto 6', 175);
INSERT INTO proyecto (id, nombre, horas) VALUES ('P007', 'Proyecto 7', 80);
INSERT INTO proyecto (id, nombre, horas) VALUES ('P008', 'Proyecto 8', 120);
INSERT INTO proyecto (id, nombre, horas) VALUES ('P009', 'Proyecto 9', 90);
INSERT INTO proyecto (id, nombre, horas) VALUES ('P010', 'Proyecto 10', 400);


INSERT INTO asignado_a (cientifico, proyecto) VALUES ('12345678', 'P001');
INSERT INTO asignado_a (cientifico, proyecto) VALUES ('23456789', 'P002');
INSERT INTO asignado_a (cientifico, proyecto) VALUES ('34567890', 'P003');
INSERT INTO asignado_a (cientifico, proyecto) VALUES ('45678901', 'P004');
INSERT INTO asignado_a (cientifico, proyecto) VALUES ('56789012', 'P005');
INSERT INTO asignado_a (cientifico, proyecto) VALUES ('67890123', 'P006');
INSERT INTO asignado_a (cientifico, proyecto) VALUES ('78901234', 'P007');
INSERT INTO asignado_a (cientifico, proyecto) VALUES ('89012345', 'P008');
INSERT INTO asignado_a (cientifico, proyecto) VALUES ('90123456', 'P009');
INSERT INTO asignado_a (cientifico, proyecto) VALUES ('01234567', 'P010');

SHOW COLUMNS FROM cientificos;
SHOW COLUMNS FROM proyecto;
SHOW COLUMNS FROM asignado_a;