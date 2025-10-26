-- La cláusula GROUP BY permite organizar las filas de una consulta en grupos. Los grupos se determinan según las columnas que se especifiquen en la cláusula GROUP BY.

select * from sales.orders;


SELECT 
	customer_id , YEAR (order_date) order_year
FROM 
	sales.orders
WHERE 
	customer_id IN (1, 2)
ORDER BY 
	customer_id;

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

SELECT
    customer_id, YEAR (order_date) order_year
FROM
    sales.orders
WHERE
    customer_id IN (1, 2)
GROUP BY
    customer_id
	, YEAR (order_date)
ORDER BY
    customer_id;

/*
customer_id	order_year
1	2016
1	2018
2	2017
2	2018
*/



-- La cláusula GROUP BY organizó las primeras tres filas en dos grupos y las siguientes tres filas en los otros dos grupos con las combinaciones únicas de identificación del cliente y año del pedido.

-- Se comporta igual distinct

SELECT 
	DISTINCT customer_id, YEAR (order_date) order_year
FROM
    sales.orders
WHERE
    customer_id IN (1, 2)
ORDER BY 
	customer_id;

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

SELECT
    customer_id, YEAR (order_date) order_year, COUNT (order_id) order_placed
FROM
    sales.orders
WHERE
    customer_id IN (1, 2)
GROUP BY
    customer_id, YEAR (order_date)
ORDER BY
    customer_id; 

/*
customer_id	order_year	order_placed
1	2016	1
1	2018	2
2	2017	2
2	2018	1
*/



-- Más ejemplos de cláusulas GROUP BY

-- 1) Ejemplo de uso de la cláusula GROUP BY con la función COUNT()

SELECT
    city, COUNT (customer_id) customer_count
FROM
    sales.customers
GROUP BY
    city
ORDER BY
    city;



-- En este ejemplo, la cláusula GROUP BY agrupa a los clientes por ciudad y la COUNT() función devuelve el número de clientes en cada ciudad.

SELECT
    city, state, COUNT (customer_id) customer_count
FROM
    sales.customers
GROUP BY
    state, city
ORDER BY
    city, state;



-- 2) Ejemplo de uso de la cláusula GROUP BY con las funciones MIN y MAX

-- La siguiente declaración devuelve los precios de lista mínimos y máximos de todos los productos con el modelo 2018 por marca:

SELECT
    brand_name, MIN (list_price) min_price, MAX (list_price) max_price
FROM
    production.products p
INNER JOIN 
	production.brands b ON b.brand_id = p.brand_id
WHERE
    model_year = 2018
GROUP BY
    brand_name
ORDER BY
    brand_name;



-- 3) Ejemplo de uso de la cláusula GROUP BY con la función AVG()

-- La siguiente declaración utiliza la AVG() función para devolver el precio de lista promedio por marca para todos los productos con el año modelo 2018:

SELECT
    brand_name, AVG (list_price) avg_price
FROM
    production.products p
INNER JOIN 
	production.brands b ON b.brand_id = p.brand_id
WHERE
    model_year = 2018
GROUP BY
    brand_name
ORDER BY
    brand_name;

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

SELECT
    order_id
	, SUM (
        quantity * list_price * (1 - discount)
    ) net_value
FROM
    sales.order_items
GROUP BY
    order_id;



-- 5) Ejemplo de uso de la cláusula GROUP BY con la función STRING_AGG() para agrupar miembros de un proyecto al proyecto

select 
	pr.title Proyecto
	, STRING_AGG(me.name, ', ') 
	/*inicio: opcional*/ within group (order by me.name desc) /*fin: opcional*/ Personas
	, STRING_AGG(me.id, ',') Claves
from 
	pm.projects pr
inner join 
	pm.members me on pr.id = me.project_id
group by
	pr.title
;
