-- La cláusula SELECT TOP permite limitar la cantidad de filas o el porcentaje de filas que se devuelven en un conjunto de resultados de una consulta.
-- SELECT TOP (expression) [PERCENT] [WITH TIES] FROM table_name ORDER BY column_name;
-- Después de la palabra clave TOP hay una expresión que especifica el número de filas que se devolverán. La expresión se evalúa como un valor flotante si se usa PERCENT; de lo contrario, se convierte en un valor BIGINT.
-- CON TIES le permite devolver filas adicionales con valores que coinciden con los de la última fila en el conjunto de resultados limitado. Tenga en cuenta que CON TIES puede provocar que se devuelvan más filas de las especificadas en la expresión.

SELECT product_name, list_price FROM production.products ORDER BY list_price DESC; --321 rows

SELECT TOP 10 product_name, list_price FROM production.products ORDER BY list_price DESC; --10 rows

SELECT TOP 1 PERCENT product_name, list_price FROM production.products ORDER BY list_price DESC; --3.21 => 4 rows

SELECT TOP 3 product_name, list_price FROM production.products ORDER BY list_price DESC; --3 rows

SELECT TOP 3 WITH TIES product_name, list_price FROM production.products ORDER BY list_price DESC; -- 6 rows

-- En este ejemplo, el tercer producto caro tiene un precio de lista de 6499,99. Debido a que la declaración usa TOP CON TIES, devuelve tres productos más cuyos precios de lista son los mismos que los del tercero.
