USE BikeStores;
go

--CREATE SCHEMA hr;
--GO

--CREATE TABLE hr.candidates(
--    id INT PRIMARY KEY IDENTITY,
--    fullname VARCHAR(100) NOT NULL
--);
--go

--CREATE TABLE hr.employees(
--    id INT PRIMARY KEY IDENTITY,
--    fullname VARCHAR(100) NOT NULL
--);
--go

--INSERT INTO hr.candidates(fullname) 
--VALUES ('John Doe'), ('Lily Bush'), ('Peter Drucker'), ('Jane Doe');
--INSERT INTO hr.employees(fullname) 
--VALUES ('John Doe'), ('Jane Doe'), ('Michael Scott'), ('Jack Sparrow');


select * from hr.candidates;
select * from hr.employees;


-- Produce un conjunto de datos que incluye filas de la tabla izquierda y filas coincidentes de la tabla derecha.
SELECT c.id candidate_id, c.fullname candidate_name, e.id employee_id, e.fullname employee_name
FROM hr.candidates c 
INNER JOIN hr.employees e ON e.fullname = c.fullname;


-- Selecciona datos de la tabla izquierda y las filas coincidentes de la tabla derecha. La unión izquierda devuelve todas las filas de la tabla izquierda y las filas coincidentes de la tabla derecha. Si una fila de la tabla izquierda no coincide con una fila de la tabla derecha, las columnas de la tabla derecha tendrán valores nulos.
SELECT c.id candidate_id, c.fullname candidate_name, e.id employee_id, e.fullname employee_name
FROM hr.candidates c 
LEFT JOIN hr.employees e ON e.fullname = c.fullname;


-- Para obtener las filas que están disponibles solo en la tabla izquierda pero no en la tabla derecha, agregue una cláusula WHERE a la consulta anterior:
SELECT c.id candidate_id, c.fullname candidate_name, e.id employee_id, e.fullname employee_name
FROM hr.candidates c 
LEFT JOIN hr.employees e ON e.fullname = c.fullname 
WHERE e.id IS NULL;


-- Devuelve un conjunto de resultados que contiene todas las filas de la tabla derecha y las filas coincidentes de la tabla izquierda. Si una fila de la tabla derecha no coincide con una fila de la tabla izquierda, todas las columnas de esta contendrán valores nulos.
SELECT c.id candidate_id, c.fullname candidate_name, e.id employee_id, e.fullname employee_name
FROM hr.candidates c 
RIGHT JOIN hr.employees e ON e.fullname = c.fullname;


-- De manera similar, puede obtener filas que están disponibles solo en la tabla correcta agregando una cláusula WHERE a la consulta anterior de la siguiente manera:
SELECT c.id candidate_id, c.fullname candidate_name, e.id employee_id, e.fullname employee_name
FROM hr.candidates c 
RIGHT JOIN hr.employees e ON e.fullname = c.fullname 
WHERE c.id IS NULL;


-- La unión externa completa o la unión completa devuelven un conjunto de resultados que contiene todas las filas de las tablas izquierda y derecha, con las filas coincidentes de ambos lados, si están disponibles. Si no hay coincidencia, el lado faltante tendrá valores nulos.
SELECT c.id candidate_id, c.fullname candidate_name, e.id employee_id, e.fullname employee_name
FROM hr.candidates c 
FULL JOIN hr.employees e ON e.fullname = c.fullname;


-- Para seleccionar filas que existen en la tabla izquierda o derecha, excluya las filas que sean comunes a ambas tablas agregando una cláusula WHERE como se muestra en la siguiente consulta:
SELECT c.id candidate_id, c.fullname candidate_name, e.id employee_id, e.fullname employee_name
FROM hr.candidates c 
FULL JOIN hr.employees e ON e.fullname = c.fullname 
WHERE c.id IS NULL OR e.id IS NULL;

go
