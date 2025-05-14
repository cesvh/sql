-- Para cada fila de la tabla T1, la consulta la compara con todas las filas de la tabla T2. Si un par de filas hace que el predicado de unión se evalúe como VERDADERO, los valores de columna de estas filas se combinarán para formar una nueva fila que se incluirá en el conjunto de resultados.
-- Si una fila de la tabla izquierda (T1) no tiene ninguna fila coincidente de la tabla T2, la consulta combina los valores de columna de la fila de la tabla izquierda con NULL para cada valor de columna de la tabla derecha.
-- En resumen, la cláusula LEFT JOIN devuelve todas las filas de la tabla izquierda (T1) y las filas coincidentes o valores NULL de la tabla derecha (T2).

SELECT product_name, order_id FROM production.products p
LEFT JOIN sales.order_items o ON o.product_id = p.product_id ORDER BY order_id;

SELECT product_name, order_id FROM production.products p
LEFT JOIN sales.order_items o ON o.product_id = p.product_id WHERE order_id IS NULL;

SELECT p.product_name, o.order_id, i.item_id, o.order_date
FROM production.products p
LEFT JOIN sales.order_items i ON i.product_id = p.product_id
LEFT JOIN sales.orders o ON o.order_id = i.order_id
ORDER BY order_id;

SELECT product_name, order_id FROM production.products p
LEFT JOIN sales.order_items o ON o.product_id = p.product_id
WHERE order_id = 100 ORDER BY order_id;
