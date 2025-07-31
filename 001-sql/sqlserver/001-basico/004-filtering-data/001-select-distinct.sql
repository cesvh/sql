-- Todos los campos
SELECT * FROM sales.customers;
--customer_id	first_name	last_name	phone	email	street	city	state	zip_code

--
SELECT city FROM sales.customers ORDER BY city;

-- Uso de SELECT DISTINCT con una columna
-- Todo campo que está después de order by debe estar en el distinct
SELECT DISTINCT state FROM sales.customers ORDER BY state;

-- Uso de SELECT DISTINCT con múltiples columnas
SELECT DISTINCT state, city FROM sales.customers;

-- Uso de SELECT DISTINCT con NULL
SELECT DISTINCT phone FROM sales.customers ORDER BY phone;

-- DISTINCT vs. GROUP BY
SELECT city, state, zip_code FROM sales.customers GROUP BY city, state, zip_code ORDER BY state, city, zip_code;
--
SELECT DISTINCT city, state, zip_code FROM sales.customers;

-- Tanto la cláusula DISTINCT como la GROUP BY reducen la cantidad de filas devueltas en el conjunto de resultados al eliminar los duplicados.
-- Sin embargo, debe utilizar la cláusula GROUP BY cuando desee aplicar una "función de agregación" a una o más columnas.
