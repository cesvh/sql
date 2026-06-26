
-- 
SELECT * FROM [BikeStores].[sales].[customers];

-- FROM -> SELECT
SELECT first_name, last_name FROM [BikeStores].[sales].[customers];
SELECT first_name, last_name, email FROM [BikeStores].[sales].[customers];

-- FROM -> WHERE -> SELECT
-- FILTRAR FILAS EN EL CONJUNTO DE RESULTADOS.
SELECT * FROM [BikeStores].[sales].[customers] WHERE state = 'CA';

-- FROM -> WHERE -> SELECT -> ORDER BY
-- ORDENAR FILAS EN EL CONJUNTO DE RESULTADOS POR UNA O MÁS COLUMNAS.
SELECT * FROM [BikeStores].[sales].[customers] WHERE state = 'CA' ORDER BY first_name;

-- FROM -> WHERE -> GROUP BY -> SELECT -> ORDER BY.
-- AGRUPAR FILAS EN GRUPOS.
SELECT city, COUNT (*) AS 'cantidad' FROM [BikeStores].[sales].[customers] WHERE state = 'CA' GROUP BY city ORDER BY city;

-- FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY
-- EL SELECT SE EVALÚA DESPUÉS DEL GRUPO BY Y HAVING, POR ESO PUEDES USAR ALIAS DEL SELECT EN EL ORDER BY, PERO NO EN EL WHERE.
SELECT city, COUNT (*) FROM [BikeStores].[sales].[customers] WHERE state = 'CA' GROUP BY city HAVING COUNT (*) > 10 ORDER BY city;
