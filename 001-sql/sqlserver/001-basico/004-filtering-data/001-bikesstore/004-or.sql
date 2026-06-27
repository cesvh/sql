
SELECT product_name, list_price FROM production.products WHERE list_price < 200 OR list_price > 6000 ORDER BY list_price;

SELECT product_name, brand_id FROM production.products WHERE brand_id = 1 OR brand_id = 2 OR brand_id = 4 ORDER BY brand_id DESC;

SELECT product_name, brand_id FROM production.products WHERE brand_id IN (1, 2, 3) ORDER BY brand_id DESC;

SELECT product_name, brand_id, list_price FROM production.products
WHERE brand_id = 1 OR brand_id = 2 AND list_price > 500 ORDER BY brand_id DESC, list_price;

SELECT product_name, brand_id, list_price FROM production.products
WHERE (brand_id = 1 OR brand_id = 2) AND list_price > 500 ORDER BY brand_id;

-- De forma predeterminada, SQL Server evalúa los operadores OR después de los operadores AND dentro de la misma expresión. Sin embargo, puede usar paréntesis () para cambiar el orden de evaluación.
