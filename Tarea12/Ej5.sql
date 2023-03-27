CREATE DATABASE IF NOT EXISTS ejercicio5;
USE ejercicio5;

CREATE TABLE IF NOT EXISTS almacen (
    numero INT PRIMARY KEY,
    descripcion VARCHAR(255) NOT NULL,
    direccion VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS estanteria (
    id INT PRIMARY KEY,
    almacen_numero INT NOT NULL,
    FOREIGN KEY (almacen_numero) REFERENCES almacen(numero)
);

CREATE TABLE IF NOT EXISTS pieza (
    tipo INT NOT NULL,
    modelo INT NOT NULL,
    descripcion VARCHAR(255),
    precio_venta DECIMAL(10, 2) NOT NULL,
    pieza_compuesta_tipo INT,
    pieza_compuesta_modelo INT,
    estanteria_id INT NOT NULL,
    PRIMARY KEY (tipo, modelo),
    FOREIGN KEY (pieza_compuesta_tipo, pieza_compuesta_modelo) REFERENCES pieza(tipo, modelo),
    FOREIGN KEY (estanteria_id) REFERENCES estanteria(id)
);

/* INSERT TO ALMACEN */
INSERT INTO almacen VALUES (100, 'Almacen 1', 'Nombre de calle 1, Reus, Tarragona');
INSERT INTO almacen VALUES (101, 'Almacen 2', 'Nombre de calle 2, Reus, Tarragona');
INSERT INTO almacen VALUES (102, 'Almacen 3', 'Nombre de calle 3, Reus, Tarragona');
INSERT INTO almacen VALUES (103, 'Almacen 4', 'Nombre de calle 4, Reus, Tarragona');
INSERT INTO almacen VALUES (104, 'Almacen 5', 'Nombre de calle 5, Reus, Tarragona');

/* INSERT TO ESTANTERIA */
INSERT INTO estanteria VALUES (500, 100);
INSERT INTO estanteria VALUES (501, 100);
INSERT INTO estanteria VALUES (502, 100);
INSERT INTO estanteria VALUES (503, 100);
INSERT INTO estanteria VALUES (504, 101);
INSERT INTO estanteria VALUES (505, 101);
INSERT INTO estanteria VALUES (506, 101);
INSERT INTO estanteria VALUES (507, 101);
INSERT INTO estanteria VALUES (508, 101);
INSERT INTO estanteria VALUES (509, 101);

/* INSERT TO PIEZA (SIMPLE) */
INSERT INTO pieza(tipo, modelo, descripcion, precio_venta, estanteria_id) VALUES (1, 1, 'Pieza simple', 5.50, 500);

/* INSERT TO PIEZA (COMPUESTA) */
INSERT INTO pieza VALUES (2, 2, 'Pieza compuesta', 10.0, 1, 1, 500);

/* UPDATE PIEZA */
UPDATE pieza SET precio_venta=50.0 WHERE tipo=2 AND modelo=2;

/* DELETE */
DELETE FROM estanteria WHERE id=503;











