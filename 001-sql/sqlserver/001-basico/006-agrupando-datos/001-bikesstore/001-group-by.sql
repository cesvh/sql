
-- La cláusula GROUP BY permite organizar las filas de una consulta en grupos. Los grupos se determinan según las columnas que se especifiquen en la cláusula GROUP BY.

select * from sales.orders;--1615


SELECT customer_id , YEAR (order_date) order_year
FROM sales.orders
WHERE customer_id IN (1, 2)
ORDER BY customer_id;--6
/*
customer_id	order_year
1	2016
1	2018
1	2018
2	2017
2	2017
2	2018
*/



-- En este ejemplo, recuperamos el ID del cliente y el año del pedido de los clientes con ID de cliente 1 y 2.

SELECT customer_id, YEAR (order_date) order_year
FROM sales.orders
WHERE customer_id IN (1, 2)
GROUP BY customer_id, YEAR (order_date)
ORDER BY customer_id;--4
/*
customer_id	order_year
1	2016
1	2018
2	2017
2	2018
*/



-- La cláusula GROUP BY organizó las primeras tres filas en dos grupos y las siguientes tres filas en los otros dos grupos con las combinaciones únicas de identificación del cliente y año del pedido.

-- Se comporta igual distinct
SELECT DISTINCT customer_id, YEAR (order_date) order_year
FROM sales.orders
WHERE customer_id IN (1, 2)
ORDER BY customer_id;

/*
customer_id	order_year
1	2016
1	2018
2	2017
2	2018
*/



-- La cláusula GROUP BY y funciones de agregación de SQL Server

-- Una función de agregación realiza un cálculo en un grupo y devuelve un valor único por grupo. Por ejemplo, COUNT()devuelve el número de filas de cada grupo. Otras funciones de agregación comunes son SUM(), AVG()(promedio), MIN()(mínimo) y MAX()(máximo).
-- GROUP BY organiza las filas en grupos y una función agregada devuelve el resumen (recuento, mínimo, máximo, promedio, suma, etc.) para cada grupo.

-- Por ejemplo, la siguiente consulta devuelve el número de pedidos realizados por el cliente por año:

SELECT customer_id, YEAR (order_date) order_year, COUNT (order_id) order_placed
FROM sales.orders
WHERE customer_id IN (1, 2)
GROUP BY customer_id, YEAR (order_date)
ORDER BY customer_id; 
/*
customer_id	order_year	order_placed
1	2016	1
1	2018	2
2	2017	2
2	2018	1
*/



-- Más ejemplos de cláusulas GROUP BY

-- 1) Ejemplo de uso de la cláusula GROUP BY con la función COUNT()

SELECT city, COUNT (customer_id) customer_count
FROM sales.customers
GROUP BY city
ORDER BY city;



-- En este ejemplo, la cláusula GROUP BY agrupa a los clientes por ciudad y la COUNT() función devuelve el número de clientes en cada ciudad.

SELECT city, state, COUNT (customer_id) customer_count
FROM sales.customers
GROUP BY state, city
ORDER BY city, state;



-- 2) Ejemplo de uso de la cláusula GROUP BY con las funciones MIN y MAX

-- La siguiente declaración devuelve los precios de lista mínimos y máximos de todos los productos con el modelo 2018 por marca:

SELECT * FROM production.products;--321
/*
product_id	product_name	brand_id	category_id	model_year	list_price
1	Trek 820 - 2016	9	6	2016	379.99
*/

SELECT * FROM production.brands;--9
/*
brand_id	brand_name
1	Electra
*/

SELECT BR.brand_name, MIN(PR.list_price) min_price, MAX(PR.list_price) max_price
FROM production.products AS PR
INNER JOIN production.brands AS BR ON PR.brand_id = BR.brand_id
WHERE PR.model_year = 2018
GROUP BY BR.brand_name
ORDER BY BR.brand_name;
/*
brand_name	min_price	max_price
Electra	269.99	2999.99
Heller	2599.00	2599.00
Strider	89.99	289.99
Surly	469.99	2499.99
Trek	159.99	11999.99
*/



-- 3) Ejemplo de uso de la cláusula GROUP BY con la función AVG()

-- La siguiente declaración utiliza la AVG() función para devolver el precio de lista promedio por marca para todos los productos con el año modelo 2018:

SELECT brand_name, AVG (list_price) avg_price
FROM production.products p
INNER JOIN production.brands b ON b.brand_id = p.brand_id
WHERE model_year = 2018
GROUP BY brand_name
ORDER BY brand_name;

-- 4) Ejemplo de uso de la cláusula GROUP BY con la función SUM

/*
CREATE TABLE sales.order_items (
	order_id INT,
	item_id INT,
	product_id INT NOT NULL,
	quantity INT NOT NULL,
	list_price DECIMAL (10, 2) NOT NULL,
	discount DECIMAL (4, 2) NOT NULL DEFAULT 0,
	PRIMARY KEY (order_id, item_id),
	FOREIGN KEY (order_id) REFERENCES sales.orders (order_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (product_id) REFERENCES production.products (product_id) ON DELETE CASCADE ON UPDATE CASCADE
);
*/

-- La siguiente consulta utiliza la SUM()función para obtener el valor neto de cada pedido:

SELECT * FROM sales.order_items;
/*
order_id	item_id	product_id	quantity	list_price	discount
1	1	20	1	599.99	0.20
1	2	8	2	1799.99	0.07
1	3	10	2	1549.00	0.05
1	4	16	2	599.99	0.05
1	5	4	1	2899.99	0.20
*/

SELECT 
	OI.order_id
	, OI.quantity * OI.list_price AS 'costo'
	, OI.quantity * OI.list_price * (1 - OI.discount) AS 'costo_desc'
FROM sales.order_items AS OI;

/*
order_id	costo	costo
1	599.99	479.9920
1	3599.98	3347.9814
1	3098.00	2943.1000
1	1199.98	1139.9810
1	2899.99	2319.9920
*/

SELECT 
	OI.order_id
	, SUM(
		OI.quantity * OI.list_price
	) AS 'costo'
	, SUM(
		OI.quantity * OI.list_price * (1 - OI.discount)
	) AS 'costo_dec'
FROM sales.order_items AS OI
GROUP BY OI.order_id;
/*
order_id	costo	costo_dec
1	11397.94	10231.0464
*/



-- 5) Ejemplo de uso de la cláusula GROUP BY con la función STRING_AGG() para agrupar miembros de un proyecto al proyecto

SELECT * FROM pm.projects;
/*
id	title
1	New CRM for Project Sales
2	ERP Implementation
3	Develop Mobile Sales Platform
*/
SELECT * FROM pm.members;
/*
id	name	project_id
1	John Doe	1
2	Lily Bush	1
3	Jane Doe	2
4	Jack Daniel	NULL
*/

SELECT 
	PR.title AS 'Proyecto'
	/* STRING_AGG(VALOR A UNIR, SEPARADOR) */
	/* WITHIN GROUP significa: "Antes de concatenar, ordena los registros de este grupo." */
	, STRING_AGG(me.name, ', ') WITHIN GROUP (
			ORDER BY me.name DESC
		) AS Personas /* ORDENA POR name DE FORMA DESCENDENTE */
	, STRING_AGG(me.id, ',') Claves
FROM pm.projects PR
INNER JOIN pm.members ME ON PR.id = me.project_id
GROUP BY pr.title;
/*
Proyecto	Personas	Claves
ERP Implementation	Jane Doe	3
New CRM for Project Sales	Lily Bush, John Doe	2,1
*/

/*
Es equivalente a hacer:
	'Juan'
	+ ', '
	+ 'Pedro'
	+ ', '
	+ 'Ana'

*/
/*
Equivalencia conceptual
	Puedes pensar en STRING_AGG como una combinación de tres operaciones:
		GROUP BY
			  ↓
		ORDER BY (dentro de cada grupo)
			  ↓
		CONCATENAR LOS VALORES

	Es decir, WITHIN GROUP no agrega datos; simplemente define el orden en que STRING_AGG tomará los valores antes de unirlos. Sin esa cláusula, el orden de los elementos concatenados no está garantizado.

*/
