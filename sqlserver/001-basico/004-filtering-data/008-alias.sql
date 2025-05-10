SELECT first_name + ' ' + last_name FROM sales.customers ORDER BY first_name;

SELECT first_name + ' ' + last_name AS full_name FROM sales.customers ORDER BY first_name;

SELECT first_name + ' ' + last_name AS 'Full Name' FROM sales.customers ORDER BY first_name;

SELECT category_name 'Product Category' FROM production.categories ORDER BY category_name;

SELECT category_name 'Product Category' FROM production.categories ORDER BY 'Product Category';

SELECT sales.customers.customer_id, first_name, last_name, order_id FROM sales.customers
INNER JOIN sales.orders ON sales.orders.customer_id = sales.customers.customer_id;

SELECT c.customer_id, first_name, last_name, order_id FROM sales.customers c
INNER JOIN sales.orders o ON o.customer_id = c.customer_id;

-- Un alias de columna es un nombre temporal asignado a una columna o expresión en el conjunto de resultados de una consulta.
-- Utilice un alias de columna para cambiar el nombre de la salida de una columna o una expresión para que tenga más significado.
-- Un alias de tabla es una abreviatura o nombre temporal asignado a una tabla en una consulta
-- Utilice alias de tabla al unir varias tablas o al hacer referencia a la misma tabla más de una vez en una consulta.
