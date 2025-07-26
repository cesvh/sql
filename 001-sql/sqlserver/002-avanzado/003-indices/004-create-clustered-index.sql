--
CREATE TABLE production.parts(
    part_id   INT NOT NULL,
    part_name VARCHAR(100)
);

SELECT part_id, part_name FROM production.parts;

INSERT INTO production.parts(part_id, part_name) VALUES (1,'Frame'), (2,'Head Tube'), (3,'Handlebar Grip'), (4,'Shock Absorber'), (5,'Fork');

SELECT part_id, part_name FROM production.parts WHERE part_id = 5; -- Seleccionar este query y teclear CTRL + L

-- Cuando una tabla no tiene una clave principal, lo cual es muy raro, puede utilizar la declaración CREATE CLUSTERED INDEX para agregarle un índice agrupado.

-- La siguiente declaración crea un índice agrupado para la tabla production.parts:

CREATE CLUSTERED INDEX ix_parts_id ON production.parts(part_id);

-- Al ejecutar la siguiente instrucción, SQL Server recorre el índice (búsqueda de índice agrupado) para localizar las filas, lo que es más rápido que escanear toda la tabla.

SELECT part_id, part_name FROM production.parts WHERE part_id = 5;

-- Un índice agrupado organiza físicamente los datos de una tabla según la clave del índice.
-- Al crear una tabla con una clave principal, SQL Server crea automáticamente un índice agrupado basado en las columnas de clave principal.
-- Una tabla tiene solo un índice agrupado.
-- Utilice la instrucción CREATE CLUSTERED INDEX para crear un nuevo índice agrupado para una tabla.
