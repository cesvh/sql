SELECT product_id, product_name, list_price FROM production.products
WHERE list_price BETWEEN 149.99 AND 199.99 ORDER BY list_price;

SELECT order_id, customer_id, order_date, order_status FROM sales.orders
WHERE order_date BETWEEN '20170115' AND '20170117' ORDER BY order_date; -- Formato: YYYYMMDD

-- Utilice el operador BETWEEN para seleccionar filas que tengan valores entre dos valores especificados, incluyendo los valores especificados.

-- Utilice el operador NOT BETWEEN para seleccionar filas que tengan valores fuera de un rango especificado.
