-- Uso de la cláusula WHERE con un operador de igualdad simple
SELECT product_id, product_name, category_id, model_year, list_price FROM production.products
WHERE category_id = 1 ORDER BY list_price DESC;

-- Uso de la cláusula WHERE con el operador AND
SELECT product_id, product_name, category_id, model_year, list_price FROM production.products
WHERE category_id = 1 AND model_year = 2018 ORDER BY list_price DESC;

-- Usar WHERE para filtrar filas usando un operador de comparación
SELECT product_id, product_name, category_id, model_year, list_price  FROM production.products
WHERE list_price > 300 AND model_year = 2018 ORDER BY list_price DESC;

-- Usar la cláusula WHERE para filtrar filas que cumplan cualquiera de dos condiciones
SELECT product_id, product_name, category_id, model_year, list_price FROM production.products
WHERE list_price > 3000 OR model_year = 2018 ORDER BY list_price DESC;

-- Uso de la cláusula WHERE para filtrar filas con un valor entre dos valores
SELECT product_id, product_name, category_id, model_year, list_price FROM production.products
WHERE list_price BETWEEN 1899.00 AND 1999.99 ORDER BY list_price DESC;

-- Uso de la cláusula WHERE para filtrar filas que tienen un valor en una lista de valores
SELECT product_id, product_name, category_id, model_year, list_price FROM production.products
WHERE list_price IN (299.99, 369.99, 489.99) ORDER BY list_price DESC;

-- Encontrar filas cuyos valores contienen una cadena
SELECT product_id, product_name, category_id, model_year, list_price FROM production.products
WHERE product_name LIKE '%Cruiser%' ORDER BY list_price;

-- Utilice la cláusula WHERE de SQL Server para filtrar filas según una o más condiciones.
