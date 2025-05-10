
-- El patrón es una secuencia de caracteres que se busca en la columna o expresión. Puede incluir los siguientes caracteres comodín válidos:

-- El comodín de porcentaje (%): cualquier cadena de cero o más caracteres
-- El comodín de guión bajo (_): cualquier carácter individual.
-- El comodín [lista de caracteres]: cualquier carácter individual dentro del conjunto especificado.
-- El [carácter-carácter]: cualquier carácter individual dentro del rango especificado.
-- El [^]: cualquier carácter que no esté dentro de una lista o un rango.

-- 1) Ejemplos de uso del operador LIKE con el comodín %
-- last_name que inicien con z
SELECT customer_id, first_name, last_name FROM sales.customers
WHERE last_name LIKE 'z%' ORDER BY first_name;
-- last_name que terminen con er
SELECT customer_id, first_name, last_name FROM sales.customers
WHERE last_name LIKE '%er' ORDER BY first_name;
-- last_name que inicien con t y terminen con s
SELECT customer_id, first_name, last_name FROM sales.customers
WHERE last_name LIKE 't%s' ORDER BY first_name;
-- 2) Ejemplo de uso del operador LIKE con el comodín _ (guión bajo)
-- last_name cuyo segundo caracter es u y el resto lo que sea
SELECT customer_id, first_name, last_name FROM sales.customers
WHERE last_name LIKE '_u%' ORDER BY first_name;
-- 3) Ejemplo de uso del operador LIKE con el comodín [lista de caracteres]
-- last_name que inicien con Y o Z
SELECT customer_id, first_name, last_name FROM sales.customers
WHERE last_name LIKE '[YZ]%' ORDER BY last_name;
-- 4) Ejemplo de uso del operador LIKE con el comodín [carácter-carácter]
-- last_name que inicien con A hasta E
SELECT customer_id, first_name, last_name FROM sales.customers
WHERE last_name LIKE '[A-E]%' ORDER BY first_name;
-- 5) Ejemplo de uso del operador LIKE con el comodín [^Lista de caracteres o rango]
-- last_name que no inicien con A hasta X
SELECT customer_id, first_name, last_name FROM sales.customers
WHERE last_name LIKE '[^A-X]%' ORDER BY last_name;
-- 6) Usando el ejemplo del operador NOT LIKE
-- first_name que no inicien con A
SELECT customer_id, first_name, last_name FROM sales.customers
WHERE first_name NOT LIKE 'A%' ORDER BY first_name;
-- 7) Ejemplo de uso del operador LIKE con ESCAPE
-- PENDIENTE: https://www.sqlservertutorial.net/sql-server-basics/sql-server-like/

-- Utilice el operador LIKE para comprobar si un valor coincide con un patrón especificado.
