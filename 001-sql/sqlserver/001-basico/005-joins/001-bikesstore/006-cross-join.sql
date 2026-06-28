-- Una unión cruzada le permite combinar filas de la primera tabla con cada fila de la segunda tabla. En otras palabras, devuelve el producto cartesiano de dos tablas.

SELECT 
	product_id, product_name, store_id, store_name, 0 AS quantity
FROM 
	production.products
CROSS JOIN 
	sales.stores
ORDER BY 
	product_name, store_id;


-- El conjunto de resultados se puede utilizar para el procedimiento de balance al cierre de fin de mes o de fin de año.

select * from sales.stores;--3
select * from production.products;--321
select * from sales.orders;--1615
select * from sales.order_items;--4722


-- Cada uno de los productos en cada una de las tiendas

SELECT 
	s.store_id, p.product_id
FROM 
	sales.stores s
CROSS JOIN 
	production.products p -- 3 * 321 = 963
ORDER BY 
	product_id, store_id;


-- Todos los productos en todas las tiendas con ventas

SELECT 
	s.store_id
	, p.product_id, SUM (quantity * i.list_price) sales
FROM 
	sales.orders o
INNER JOIN 
	sales.order_items i ON i.order_id = o.order_id
INNER JOIN 
	sales.stores s ON s.store_id = o.store_id
INNER JOIN 
	production.products p ON p.product_id = i.product_id
GROUP BY 
	s.store_id, p.product_id -- 668: store_id, product_id, sales


--La siguiente declaración encuentra los productos que no tienen ventas en las tiendas:
--Unimos cada uno de los productos con todas las tiendas con 
SELECT 
	s.store_id
	, p.product_id, ISNULL(c.sales, 0) c_sales
FROM 
	sales.stores s
CROSS JOIN 
	production.products p -- 963
LEFT JOIN (
	SELECT 
		s.store_id, p.product_id, SUM (quantity * i.list_price) sales
    FROM 
		sales.orders o
    INNER JOIN 
		sales.order_items i ON i.order_id = o.order_id
    INNER JOIN 
		sales.stores s ON s.store_id = o.store_id
    INNER JOIN 
		production.products p ON p.product_id = i.product_id
    GROUP BY 
		s.store_id, p.product_id -- 668: store_id, product_id, sales
) c ON c.store_id = s.store_id AND c.product_id = p.product_id
WHERE 
	c.sales IS NULL
ORDER BY 
	product_id, store_id;
