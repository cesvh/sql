
/*
GROUPING SETS permite obtener varios GROUP BY diferentes en una sola consulta.

Ventajas de GROUPING SETS
Es mucho más legible que varios UNION ALL.
Centraliza toda la lógica en una sola consulta.
SQL Server puede optimizar la ejecución mejor que si escribes varias consultas independientes.


Conclusión

GROUPING SETS es una forma elegante de reemplazar múltiples consultas con GROUP BY unidas mediante UNION ALL. En una sola consulta puedes obtener distintos niveles de agregación (detalle, subtotales y total general), con un código más limpio, más fácil de mantener y, por lo general, más eficiente.
*/

SELECT
    b.brand_name AS brand,
    c.category_name AS category,
    p.model_year,
    round(
        SUM (
            quantity * i.list_price * (1 - discount)
        ), 0
    ) sales --INTO sales.sales_summary -- ***1
FROM
    sales.order_items i
INNER JOIN production.products p ON p.product_id = i.product_id
INNER JOIN production.brands b ON b.brand_id = p.brand_id
INNER JOIN production.categories c ON c.category_id = p.category_id
GROUP BY
    b.brand_name,
    c.category_name,
    p.model_year
ORDER BY
    b.brand_name,
    c.category_name,
    p.model_year;
    /*

    ***1:

    SELECT INTO FROM:

    Tabla permanente que queda almacenada en la base de datos.
    Realiza dos operaciones automáticamente:

    Crea una nueva tabla llamada sales.sales_summary.
    Inserta en esa tabla todas las filas devueltas por el SELECT.

    Es conceptualmente equivalente a escribir:

    CREATE TABLE sales.sales_summary
    (
        brand       VARCHAR(...),
        category    VARCHAR(...),
        model_year  INT,
        sales       DECIMAL(...)
    );

    INSERT INTO sales.sales_summary
    SELECT ...

    La diferencia es que con SELECT INTO SQL Server infiere automáticamente los tipos de datos de las columnas del SELECT.

    SELECT INTO FROM: solo sirve para crear una tabla nueva, no para insertar datos en una existente.

    Si la tabla ya existe

    Entonces debes usar:

    INSERT INTO sales.sales_summary
    (
        brand,
        category,
        model_year,
        sales
    )
    SELECT
        ...

    En este caso:

    No se crea la tabla.
    Solo se agregan registros.
    */

SELECT * FROM sales.sales_summary;

--
--

--
SELECT * FROM sales.sales_summary ORDER BY brand, category, model_year;
--
SELECT
    brand,
    category,
    SUM (sales) sales
FROM
    sales.sales_summary
GROUP BY
    brand,
    category
ORDER BY
    brand,
    category;
--
SELECT
    brand,
    SUM (sales) sales
FROM
    sales.sales_summary
GROUP BY
    brand
ORDER BY
    brand;
--
SELECT
    SUM (sales) sales
FROM
    sales.sales_summary;
--
SELECT
    brand,
    category,
    SUM (sales) sales
FROM
    sales.sales_summary
GROUP BY
    brand,
    category
UNION ALL
SELECT
    brand,
    NULL,
    SUM (sales) sales
FROM
    sales.sales_summary
GROUP BY
    brand
UNION ALL
SELECT
    NULL,
    category,
    SUM (sales) sales
FROM
    sales.sales_summary
GROUP BY
    category
UNION ALL
SELECT
    NULL,
    NULL,
    SUM (sales)
FROM
    sales.sales_summary
ORDER BY brand, category;
--
SELECT
	brand,
	category,
	SUM (sales) sales
FROM
	sales.sales_summary
GROUP BY
	GROUPING SETS (
		(brand, category),
		(brand),
		(category),
		()
	)
ORDER BY
	brand,
	category;
--
--
SELECT
    GROUPING(brand) grouping_brand,
    GROUPING(category) grouping_category,
    brand,
    category,
    SUM (sales) sales
FROM
    sales.sales_summary
GROUP BY
    GROUPING SETS (
        (brand, category),
        (brand),
        (category),
        ()
    )
ORDER BY
    brand,
    category;