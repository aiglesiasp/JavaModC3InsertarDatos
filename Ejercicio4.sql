CREATE DATABASE tarea15ejercicio4;
USE tarea15ejercicio4;

CREATE TABLE IF NOT EXISTS cajeros (
						codigo INT AUTO_INCREMENT,
						nom_apels VARCHAR(255) NOT NULL,
						PRIMARY KEY(codigo)
						);
					
CREATE TABLE IF NOT EXISTS productos (
						codigo INT AUTO_INCREMENT,
						nombre VARCHAR(100) NOT NULL,
						precio INT NOT NULL,
						PRIMARY KEY(codigo)
						);
					
CREATE TABLE IF NOT EXISTS maquinas_registradoras (
						codigo INT AUTO_INCREMENT,
						piso INT NOT NULL,
						PRIMARY KEY(codigo)
						);
					
					
CREATE TABLE IF NOT EXISTS venta (
						cajero INT,
						maquina INT,
						producto INT,
						PRIMARY KEY(cajero, maquina, producto),
						FOREIGN KEY (cajero) REFERENCES cajeros (codigo)
						ON DELETE CASCADE ON UPDATE CASCADE,
						FOREIGN KEY (maquina) REFERENCES maquinas_registradoras (codigo)
						ON DELETE CASCADE ON UPDATE CASCADE,
						FOREIGN KEY (producto) REFERENCES productos (codigo)
						ON DELETE CASCADE ON UPDATE CASCADE
						);
						

INSERT INTO cajeros(nom_apels) VALUES 	("Juan Antonio Rodriguez Parra"), 
										("Aitor Iglesias Pubill"), 
										("Camila Garcia Perez"), 
										("Javier Perez"), 
										("Francisco Parra"),
										("Josep Maria Valles"),
										("Gustavo Cruz"),
										("Antonio Iglesias Espada"),
										("Pablo Escobar Plata"),
										("Pablo Escobar Plomo");
									
INSERT INTO productos(nombre, precio) VALUES 	("Nevera", 700), 
										("Aire Acondicionad", 500), 
										("Lavadora", 800), 
										("PS5", 750), 
										("Sofa-Cama", 1200),
										("Canasta Basquet", 250),
										("Portatil", 900),
										("Coche",30000),
										("Bicicleta", 550),
										("Carro Compra", 150);
									
INSERT INTO maquinas_registradoras(piso) VALUES (1),(2),(0),(0),(1),(2),(1),(0),(2),(2);

INSERT INTO venta VALUES (1,2,1), (2,2,2),(3,2,3),(4,2,4),(5,2,5),(6,5,6),(7,5,7),(8,5,8),(9,5,9),(10,5,10);
