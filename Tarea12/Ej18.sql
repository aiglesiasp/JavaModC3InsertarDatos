CREATE DATABASE inmuebles;
USE inmuebles;

/*Creacion de tablas*/
/* TABLA PERSONAS */
CREATE TABLE IF NOT EXISTS personas (
						dni VARCHAR(8),
						telefono_fijo INT NULL,
						telefono_movil INT NOT NULL,
						nombre VARCHAR(255) NOT NULL,
						apellidos VARCHAR(255) NOT NULL,
						PRIMARY KEY(dni)
						);
/* TABLA CLIENTES */				
CREATE TABLE IF NOT EXISTS clientes (
						cod_cliente INT,
						dni VARCHAR(8) NOT NULL,
						PRIMARY KEY(cod_cliente),
						FOREIGN KEY (dni) REFERENCES personas (dni)
						ON DELETE CASCADE ON UPDATE CASCADE
						);
/* TABLA TRABAJADORES */				
CREATE TABLE IF NOT EXISTS trabajadores (
						cod_trabajador INT,
						dni VARCHAR(8) NOT NULL,
						PRIMARY KEY(cod_trabajador),
						FOREIGN KEY (dni) REFERENCES personas (dni)
						ON DELETE CASCADE ON UPDATE CASCADE
						);
/* TABLA INMUEBLES */			
CREATE TABLE IF NOT EXISTS inmuebles (
						cod_inmueble INT,
						metros INT NOT NULL,
						descripcion VARCHAR(255) NOT NULL,
						direccion VARCHAR(100) NOT NULL,
						PRIMARY KEY(cod_inmueble)
						);	
/* TABLA PISOS */
CREATE TABLE IF NOT EXISTS pisos (
						cod_piso INT,
						cod_inmueble INT NOT NULL,
						PRIMARY KEY(cod_piso),
						FOREIGN KEY (cod_inmueble) REFERENCES inmuebles (cod_inmueble)
						ON DELETE CASCADE ON UPDATE CASCADE
						);	
/* TABLA LOCALES */				
CREATE TABLE IF NOT EXISTS locales (
						cod_inmueble INT,
						utilidad VARCHAR(100) NOT NULL,
						servicio BOOL NOT NULL,
						PRIMARY KEY(cod_inmueble),
						FOREIGN KEY (cod_inmueble) REFERENCES inmuebles (cod_inmueble)
						ON DELETE CASCADE ON UPDATE CASCADE
						);	
/* TABLA GARAJES */			
CREATE TABLE IF NOT EXISTS garajes (
						cod_inmueble INT,
						n_garaje INT NOT NULL,
						planta INT NOT NULL,
						codigo_piso INT,
						PRIMARY KEY(cod_inmueble),
						FOREIGN KEY (cod_inmueble) REFERENCES inmuebles (cod_inmueble)
						ON DELETE CASCADE ON UPDATE CASCADE,
						FOREIGN KEY (codigo_piso) REFERENCES pisos (cod_piso)
						ON DELETE CASCADE ON UPDATE CASCADE
						);	
/* TABLA ALQUILERES */			
CREATE TABLE IF NOT EXISTS alquileres (
						codigo_alquiler INT,
						codigo_trabajador INT NOT NULL,
						codigo_cliente INT NOT NULL,
						codigo_inmueble INT NOT NULL,
						PRIMARY KEY(codigo_alquiler),
						FOREIGN KEY (codigo_trabajador) REFERENCES trabajadores (cod_trabajador)
						ON DELETE CASCADE ON UPDATE CASCADE,
						FOREIGN KEY (codigo_cliente) REFERENCES clientes (cod_cliente)
						ON DELETE CASCADE ON UPDATE CASCADE,
						FOREIGN KEY (codigo_inmueble) REFERENCES inmuebles (cod_inmueble)
						ON DELETE CASCADE ON UPDATE CASCADE
						);	
					
					
/* TABLA PAGOS */			
CREATE TABLE IF NOT EXISTS pagos (
						codigo_alquiler INT,
						año INT NOT NULL,
						mes VARCHAR(10) NOT NULL,
						valor INT NOT NULL,
						PRIMARY KEY(codigo_alquiler, año, mes),
						FOREIGN KEY (codigo_alquiler) REFERENCES alquileres (codigo_alquiler)
						ON DELETE CASCADE ON UPDATE CASCADE
					);					
					
/* TABLA COMPRAS */			
CREATE TABLE IF NOT EXISTS compras (
						codigo_compra INT,
						fecha DATE NOT NULL,
						valor INT NOT NULL,
						codigo_trabajador INT NOT NULL,
						codigo_cliente INT NOT NULL,
						codigo_inmueble INT NOT NULL,
						PRIMARY KEY(codigo_compra),
						FOREIGN KEY (codigo_trabajador) REFERENCES trabajadores (cod_trabajador)
						ON DELETE CASCADE ON UPDATE CASCADE,
						FOREIGN KEY (codigo_cliente) REFERENCES clientes (cod_cliente)
						ON DELETE CASCADE ON UPDATE CASCADE,
						FOREIGN KEY (codigo_inmueble) REFERENCES inmuebles (cod_inmueble)
						ON DELETE CASCADE ON UPDATE CASCADE
						);	
			
/* INSERTAR  VALORES EN LA TABLA PERSONAS */
INSERT INTO personas VALUES ('11111111', 931111111, 111111111, 'Juan' ,  'Juan1 Juan2'), 
							('22222222', 932222222, 222222222, 'Antonio' ,  'Antonio1 Antonio2'),
							('33333333', 933333333, 333333333, 'Miguel' ,  'Miguel1 Miguel2'),
							('44444444', 934444444, 444444444, 'Martin' ,  'Martin1 Martin2'),
							('55555555', 935555555, 555555555, 'Alex',  'Alex1 Alex2'),
							('66666666', 936666666, 666666666, 'Ivan' ,  'Ivan1 Ivan2'),
							('77777777', 937777777, 777777777, 'Pablo' ,  'Pablo1 Pablo2'),
							('88888888', 938888888, 888888888, 'Roger' ,  'Roger1 Roger2'),
							('99999999', 939999999, 999999999, 'Aitor' ,  'Aitor1 Aitor2'),
							('00000000', 930000000, 000000000, 'Manuel' ,  'Manuel1 Manuel2');
						
/* INSERTAR  VALORES EN LA TABLA CLIENTES */						
INSERT INTO clientes VALUES (1001, '11111111'), 
							(1002, '22222222'),
							(1003, '33333333'),
							(1004, '44444444'),
							(1005, '55555555');
						
/* INSERTAR  VALORES EN LA TABLA TRABAJADORES */					
INSERT INTO trabajadores VALUES (2001, '66666666'),
								(2002, '77777777'),
								(2003, '88888888'),
								(2004, '99999999'),
								(2005, '00000000');
	
/* INSERTAR  VALORES EN LA TABLA INMUEBLES */
INSERT INTO inmuebles VALUES (5001, 150, 'Piso centrico en Madrid', 'Calle de las Flores, 25, 3-1'), 
							(5002, 300, 'Duplex centrico en Madrid', 'Calle de las Flores, 25, 5-1'),
							(5003, 1500, 'Local en Igualada', 'Calle Bellprat, 3'),
							(5004, 200, 'Piso centrico en Barcelona', 'Avenida Diagonal, 225, 8-4'),
							(5005, 80, 'Garaje en Barcelona', 'Calle Militar, 17, 5-2'),
							(5006, 125, 'Piso centrico en Madrid', 'Calle de las Flores, 25, 3-1'),
							(5007, 250, 'Piso centrico en Madrid', 'Calle de las Rosas, 125, 3-1'),
							(5008, 500, 'Piso centrico en Barcelona', 'Calle de las Margaritas, 47, 3-1'),
							(5009, 3000, 'Local en Borreda', 'Calle Central, 100'),
							(5010, 100, 'Piso centrico en Tarragona', 'Calle Goya, 3, 1-2');
				
INSERT INTO pisos VALUES 	(9001, 5001), 
							(9002, 5002),
							(9003, 5004),
							(9004, 5006),
							(9005, 5007),
							(9006, 5008),
							(9007, 5010);
							
INSERT INTO locales VALUES 	(5003, 'Preparado para Restaurante', true), 
							(5009, 'Preparado para Juegos', true);




INSERT INTO garajes VALUES (5005, 4, 2, 9006);	

INSERT INTO alquileres VALUES 	(27001, 2001, 1001, 5001), 
								(27002, 2002, 1002, 5002),
								(27003, 2003, 1003, 5003),
								(27004, 2003, 1004, 5004),
								(27005, 2003, 1005, 5005);
							
INSERT INTO pagos VALUES 	(27001, 2023, 'Enero', 550),
							(27001, 2023, 'Febrero', 550),
							(27001, 2023, 'Marzo', 550),
							(27002, 2023, 'Enero', 1550),
							(27002, 2023, 'Febrero', 1550),
							(27002, 2023, 'Marzo', 1550),
							(27003, 2023, 'Enero', 750),
							(27003, 2023, 'Febrero', 750),
							(27003, 2023, 'Marzo', 750),
							(27004, 2023, 'Enero', 350),
							(27004, 2023, 'Febrero', 350),
							(27004, 2023, 'Marzo', 350),
							(27005, 2023, 'Enero', 850),
							(27005, 2023, 'Febrero', 850),
							(27005, 2023, 'Marzo', 850);
							
INSERT INTO compras VALUES 	(57001, '2023-01-25', 150000,  2001, 1001, 5006), 
							(57002, '2023-02-10', 135000, 2002, 1002, 5007),
							(57003, '2021-10-15', 250000, 2003, 1003, 5008),
							(57004, '2018-11-14', 265000, 2005, 1004, 5009),
							(57005, '2028-11-15', 175000, 2004, 1005, 5010);
							
					
