
--Cláusula HAVING de SQL Server

--La cláusula HAVING se utiliza a menudo con GROUP BY para filtrar grupos según una lista específica de condiciones.
--La cláusula GROUP BY resume las filas en grupos y HAVING aplica una o más condiciones a estos grupos. Solo los grupos que cumplen las condiciones evaluadas TRUE se incluyen en el resultado. En otras palabras, se excluyen los grupos para los que la condición se evalúa como  FALSE o UNKNOWN.
--Dado que SQL Server procesa HAVING después de GROUP BY, no se puede hacer referencia a la función de agregado especificada en la lista de selección mediante el alias de columna.

SELECT
    customer_id,
    YEAR (order_date) as 'year',
    COUNT (order_id) as 'order_count'
FROM
    sales.orders
GROUP BY
    customer_id,
    YEAR (order_date)
HAVING
    COUNT (order_id) >= 2
ORDER BY
    customer_id;
--
--
SELECT
    order_id,
    SUM (
        quantity * list_price * (1 - discount)
    ) net_value
FROM
    sales.order_items
GROUP BY
    order_id
HAVING
    SUM (
        quantity * list_price * (1 - discount)
    ) > 20000
ORDER BY
    net_value;
--
--
--select * from sales.order_items where order_id = 973;
/*
2*2899.99*(1 - 0.10)=5219.982
2*2499.99*(1 - 0.10)=4499.982
2*5299.99*(1 - 0.05)=10069.981
1* 416.99*(1 - 0.07)=387.8007

=5219.982+4499.982+10069.981+387.8007=20177.7457
*/
--
--
SELECT
    category_id,
    MAX (list_price) max_list_price,
    MIN (list_price) min_list_price
FROM
    production.products
GROUP BY
    category_id
HAVING
    MAX (list_price) > 4000 OR MIN (list_price) < 500;
--
--
--select * from production.products;
--
--
SELECT
    category_id,
    AVG (list_price) avg_list_price
FROM
    production.products
GROUP BY
    category_id
HAVING
    AVG (list_price) BETWEEN 500 AND 1000;
--Utilice la HAVINGcláusula de SQL Server para filtrar grupos en función de las condiciones especificadas.