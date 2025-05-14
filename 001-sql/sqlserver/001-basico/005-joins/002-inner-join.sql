SELECT product_name, list_price, category_id
FROM production.products ORDER BY product_name DESC;

SELECT product_name, category_name, list_price
FROM production.products p INNER JOIN production.categories c ON c.category_id = p.category_id ORDER BY product_name DESC;

--SELECT select_list FROM T1 INNER JOIN T2 ON join_predicate;
-- Primero, especifique la tabla principal (T1) en la cláusula FROM
-- En segundo lugar, especifique la segunda tabla en la cláusula INNER JOIN (T2) y un predicado de unión. Solo las filas que hacen que el predicado de unión se evalúe como VERDADERO se incluyen en el conjunto de resultados.
-- Tenga en cuenta que la palabra clave INNER es opcional.

SELECT product_name, category_name, brand_name, list_price
FROM production.products p
INNER JOIN production.categories c ON c.category_id = p.category_id
INNER JOIN production.brands b ON b.brand_id = p.brand_id
ORDER BY product_name DESC;
