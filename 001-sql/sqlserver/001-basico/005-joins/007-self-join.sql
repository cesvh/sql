-- Un self join permite unir una tabla consigo misma. Facilita la consulta de datos jerárquicos o la comparación de filas dentro de la misma tabla.

-- Utiliza la cláusula de unión interna o izquierda. Dado que la consulta que utiliza la autounión hace referencia a la misma tabla, se utiliza el alias de tabla para asignar nombres diferentes a la misma tabla dentro de la consulta.

-- Tenga en cuenta que hacer referencia a la misma tabla más de una vez en una consulta sin utilizar alias de tabla generará un error.

-- Ejemplos de self join en SQL Server

/*
CREATE TABLE sales.staffs (
	staff_id INT IDENTITY (1, 1) PRIMARY KEY,
	first_name VARCHAR (50) NOT NULL,
	last_name VARCHAR (50) NOT NULL,
	email VARCHAR (255) NOT NULL UNIQUE,
	phone VARCHAR (25),
	active tinyint NOT NULL,
	store_id INT NOT NULL,
	manager_id INT,
	FOREIGN KEY (store_id) REFERENCES sales.stores (store_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (manager_id) REFERENCES sales.staffs (staff_id) ON DELETE NO ACTION ON UPDATE NO ACTION
);
*/

-- 1) Uso de self join para consultar datos jerárquicos

-- La tabla de personal almacena información del personal, como identificación, nombre, apellido y correo electrónico. También tiene una columna llamada manager_id que especifica el gerente directo.

-- Por ejemplo, Mireya reporta a Fabiola porque el valor en manager_id de Mireya es Fabiola.

select staff_id, first_name, manager_id from sales.staffs;

-- Fabiola no tiene gerente, por lo que la columna de identificación del gerente tiene un valor NULL.

-- Para obtener quién reporta a quién, utilice la unión propia como se muestra en la siguiente consulta:

/*
staff_id	first_name	manager_id
1	        Fabiola	        NULL
2	        Mireya	        1
3	        Genna	        2
4	        Virgie	        2
5	        Jannette	    1
6	        Marcelene	    5
7	        Venita	        5
8	        Kali	        1
9	        Layla	        7
10	        Bernardine	    7
*/

SELECT
    e.first_name + ' ' + e.last_name employee
    , m.first_name + ' ' + m.last_name manager
FROM 
	sales.staffs e
INNER JOIN 
	sales.staffs m ON m.staff_id = e.manager_id
ORDER BY 
	manager;

-- En este ejemplo, hicimos referencia a la tabla staffs dos veces: una como e para los empleados y las otras como m para los gerentes. El predicado de unión coincide con la relación entre empleado y gerente utilizando los valores en las columnas e.manager_id y m.staff_id.

-- La columna de empleados no incluye a Fabiola Jackson debido al efecto INNER JOIN. Si reemplaza la cláusula INNER JOIN por la cláusula LEFT JOIN, como se muestra en la siguiente consulta, obtendrá el conjunto de resultados que incluye a Fabiola Jackson en la columna de empleados:

SELECT
    e.first_name + ' ' + e.last_name employee
    , m.first_name + ' ' + m.last_name manager
FROM 
	sales.staffs e
LEFT JOIN 
	sales.staffs m ON m.staff_id = e.manager_id
ORDER BY 
	manager;

/*
employee	manager
Fabiola Jackson	NULL
Mireya Copeland	Fabiola Jackson
Jannette David	Fabiola Jackson
Kali Vargas	Fabiola Jackson
Marcelene Boyer	Jannette David
Venita Daniel	Jannette David
Genna Serrano	Mireya Copeland
Virgie Wiggins	Mireya Copeland
Layla Terrell	Venita Daniel
Bernardine Houston	Venita Daniel
*/

-- 2) Uso de self join para comparar filas dentro de la misma tabla

-- La tabla sales.customers almacena la información del cliente, incluido el nombre, apellido, teléfono, correo electrónico, calle, ciudad, estado y código postal.

--CREATE TABLE sales.customers (
--	customer_id INT IDENTITY (1, 1) PRIMARY KEY,
--	first_name VARCHAR (255) NOT NULL,
--	last_name VARCHAR (255) NOT NULL,
--	phone VARCHAR (25),
--	email VARCHAR (255) NOT NULL,
--	street VARCHAR (255),
--	city VARCHAR (50),
--	state VARCHAR (25),
--	zip_code VARCHAR (5)
--);

select * from sales.customers;

-- La siguiente declaración utiliza la self join para encontrar los clientes ubicados en la misma ciudad.

select 
	c1.city city, c1.customer_id customer_1_id, c1.first_name + ' ' + c1.last_name customer_1
	, c2.customer_id customer_2_id, c2.first_name + ' ' + c2.last_name customer_2
from 
	sales.customers c1
-- La siguiente condición garantiza que la declaración no compare al mismo cliente:
inner join 
	sales.customers c2 on c1.customer_id > c2.customer_id and c1.city = c2.city
order by
	city
	, customer_1
	, customer_2 ;

/*
city	customer_1_id	customer_1	customer_2_id	customer_2
Albany	1114	Douglass Blankenship	345	Mi Gray
Albany	1114	Douglass Blankenship	210	Priscilla Wilkins
Albany	345	Mi Gray	210	Priscilla Wilkins
Amarillo	730	Andria Rivers	602	Delaine Estes
Amarillo	730	Andria Rivers	599	Jonell Rivas
Amarillo	730	Andria Rivers	198	Luis Tyler
Amarillo	730	Andria Rivers	482	Narcisa Knapp
Amarillo	602	Delaine Estes	599	Jonell Rivas
Amarillo	602	Delaine Estes	198	Luis Tyler
Amarillo	602	Delaine Estes	482	Narcisa Knapp
Amarillo	599	Jonell Rivas	198	Luis Tyler
Amarillo	599	Jonell Rivas	482	Narcisa Knapp
Amarillo	482	Narcisa Knapp	198	Luis Tyler
*/

-- Tenga en cuenta que si cambia el operador mayor que ( > ) por el operador distinto de (<>), obtendrá más filas: INNER JOIN sales.customers c2 ON c1.customer_id <> c2.customer_id

-- Veamos la diferencia entre > y <> en la cláusula ON limitándonos a una ciudad para facilitar la comparación.

-- La siguiente consulta devuelve los clientes ubicados en Albany:

SELECT 
   customer_id, first_name + ' ' + last_name customer_1, city
FROM 
	sales.customers
WHERE 
	city = 'Albany'
ORDER BY 
	customer_1;

/*
customer_id	customer_1	city
1114	Douglass Blankenship	Albany
345	Mi Gray	Albany
210	Priscilla Wilkins	Albany
*/

-- Esta consulta utiliza el operador (>) en la cláusula ON:

SELECT
    c1.city, c1.customer_id customer_1_id, c1.first_name + ' ' + c1.last_name customer_1
	, c2.customer_id customer_2_id, c2.first_name + ' ' + c2.last_name customer_2
FROM 
	sales.customers c1
INNER JOIN 
	sales.customers c2 ON c1.customer_id > c2.customer_id AND c1.city = c2.city
WHERE 
	c1.city = 'Albany'
ORDER BY 
	c1.city, customer_1, customer_2;

/*
city	customer_1_id	customer_1	customer_2_id	customer_2
Albany	1114	Douglass Blankenship	345	Mi Gray
Albany	1114	Douglass Blankenship	210	Priscilla Wilkins
Albany	345	Mi Gray	210	Priscilla Wilkins
*/

-- Esta consulta utiliza el operador (<>) en la cláusula ON:

SELECT
    c1.city, c1.customer_id customer_1_id, c1.first_name + ' ' + c1.last_name customer_1
	, c2.customer_id customer_2_id, c2.first_name + ' ' + c2.last_name customer_2
FROM 
	sales.customers c1
INNER JOIN 
	sales.customers c2 ON c1.customer_id <> c2.customer_id AND c1.city = c2.city
WHERE 
	c1.city = 'Albany'
ORDER BY 
	c1.city, customer_1, customer_2;

/*
city	customer_1_id	customer_1	customer_2_id	customer_2
Albany	1114	Douglass Blankenship	345	Mi Gray
Albany	1114	Douglass Blankenship	210	Priscilla Wilkins
Albany	345	Mi Gray	1114	Douglass Blankenship
Albany	345	Mi Gray	210	Priscilla Wilkins
Albany	210	Priscilla Wilkins	1114	Douglass Blankenship
Albany	210	Priscilla Wilkins	345	Mi Gray
*/
