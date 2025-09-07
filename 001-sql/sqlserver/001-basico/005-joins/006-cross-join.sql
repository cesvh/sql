-- Una unión cruzada le permite combinar filas de la primera tabla con cada fila de la segunda tabla. En otras palabras, devuelve el producto cartesiano de dos tablas.
SELECT product_id, product_name, store_id, store_name, 0 AS quantity
FROM production.products
CROSS JOIN sales.stores
ORDER BY product_name, store_id;
-- El conjunto de resultados se puede utilizar para el procedimiento de balance al cierre de fin de mes o de fin de año.
--
--
select * from sales.stores;
select * from production.products;
select * from sales.orders;
select * from sales.order_items;
--
-- Todos los productos en todas las tiendas
SELECT s.store_id, p.product_id
FROM sales.stores s
CROSS JOIN production.products p
ORDER BY product_id, store_id;
--
-- Todos los productos de todas las tiendas con ventas
SELECT s.store_id, p.product_id, SUM (quantity * i.list_price) sales
FROM sales.orders o
INNER JOIN sales.order_items i ON i.order_id = o.order_id
INNER JOIN sales.stores s ON s.store_id = o.store_id
INNER JOIN production.products p ON p.product_id = i.product_id
GROUP BY s.store_id, p.product_id 
--
--
--La siguiente declaración encuentra los productos que no tienen ventas en las tiendas:
SELECT s.store_id, p.product_id, ISNULL(sales, 0) sales
FROM sales.stores s
CROSS JOIN production.products p
LEFT JOIN (
	SELECT s.store_id, p.product_id, SUM (quantity * i.list_price) sales
    FROM sales.orders o
    INNER JOIN sales.order_items i ON i.order_id = o.order_id
    INNER JOIN sales.stores s ON s.store_id = o.store_id
    INNER JOIN production.products p ON p.product_id = i.product_id
    GROUP BY s.store_id, p.product_id 
) c ON c.store_id = s.store_id AND c.product_id = p.product_id
WHERE sales IS NULL
ORDER BY product_id, store_id;
--
--