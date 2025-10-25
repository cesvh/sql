--La cláusula RIGHT JOIN comienza a seleccionar datos de la tabla derecha y a compararlos con las filas de la tabla izquierda. RIGHT JOIN devuelve un conjunto de resultados que incluye todas las filas de la tabla derecha, independientemente de si tienen filas coincidentes de la tabla izquierda.
--Si una fila de la tabla derecha no tiene ninguna fila coincidente de la tabla izquierda, la columna de la tabla izquierda en el conjunto de resultados tendrá valores nulos.

SELECT 
	product_name, order_id
FROM 
	sales.order_items o
RIGHT JOIN 
	production.products p ON o.product_id = p.product_id
ORDER BY 
	order_id;


SELECT 
	product_name, order_id
FROM 
	sales.order_items o
RIGHT JOIN 
	production.products p ON o.product_id = p.product_id 
WHERE 
	order_id IS NULL
ORDER BY 
	product_name;

