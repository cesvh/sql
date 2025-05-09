--
SELECT city FROM sales.customers ORDER BY city;

-- Uso de SELECT DISTINCT con una columna
SELECT DISTINCT city FROM sales.customers ORDER BY city;

SELECT city, state FROM sales.customers ORDER BY city, state;

-- Uso de SELECT DISTINCT con múltiples columnas
SELECT DISTINCT city, state FROM sales.customers;

-- Uso de SELECT DISTINCT con NULL
SELECT DISTINCT phone FROM sales.customers ORDER BY phone;

-- DISTINCT vs. GROUP BY
SELECT city, state, zip_code FROM sales.customers GROUP BY city, state, zip_code ORDER BY city, state, zip_code;

--
SELECT DISTINCT city, state, zip_code FROM sales.customers;

-- Tanto la cláusula DISTINCT como la GROUP BY reducen la cantidad de filas devueltas en el conjunto de resultados al eliminar los duplicados.

-- Sin embargo, debe utilizar la cláusula GROUP BY cuando desee aplicar una "función de agregación" a una o más columnas.
