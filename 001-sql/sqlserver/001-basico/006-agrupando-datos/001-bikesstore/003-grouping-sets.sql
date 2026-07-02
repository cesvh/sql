
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

SELECT * FROM sales.sales_summary;--41

--
--

--
SELECT * FROM sales.sales_summary ORDER BY brand, category, model_year;--41
--
SELECT brand, category, SUM (sales) sales
FROM sales.sales_summary
GROUP BY brand, category
ORDER BY brand, category;--23
--
SELECT brand, SUM (sales) sales
FROM sales.sales_summary
GROUP BY brand
ORDER BY brand;--9
--
SELECT SUM (sales) sales
FROM sales.sales_summary;--1
--
--
--
SELECT '1-brand-category-sales' as TIPO, brand, category, SUM (sales) sales FROM sales.sales_summary GROUP BY brand, category UNION ALL--23
SELECT '2-brand-sales' as TIPO, brand, NULL, SUM (sales) sales FROM sales.sales_summary GROUP BY brand UNION ALL--9
SELECT '3-category-sales' as TIPO, NULL, category, SUM (sales) sales FROM sales.sales_summary GROUP BY category UNION ALL--7
SELECT '4-sales' as TIPO, NULL, NULL, SUM (sales) FROM sales.sales_summary ORDER BY TIPO;--1--40
/*
TIPO	brand	category	sales
1-brand-category-sales	Electra	Children Bicycles	207606.0000
1-brand-category-sales	Electra	Comfort Bicycles	271542.0000
1-brand-category-sales	Electra	Cruisers Bicycles	694909.0000
1-brand-category-sales	Electra	Electric Bikes	31264.0000
1-brand-category-sales	Haro	Children Bicycles	29240.0000
1-brand-category-sales	Haro	Mountain Bikes	156145.0000
1-brand-category-sales	Heller	Mountain Bikes	171459.0000
1-brand-category-sales	Pure Cycles	Cruisers Bicycles	149476.0000
1-brand-category-sales	Ritchey	Mountain Bikes	78899.0000
1-brand-category-sales	Strider	Children Bicycles	4320.0000
1-brand-category-sales	Sun Bicycles	Children Bicycles	2328.0000
1-brand-category-sales	Sun Bicycles	Comfort Bicycles	122478.0000
1-brand-category-sales	Sun Bicycles	Cruisers Bicycles	150647.0000
1-brand-category-sales	Sun Bicycles	Electric Bikes	47049.0000
1-brand-category-sales	Sun Bicycles	Mountain Bikes	19492.0000
1-brand-category-sales	Surly	Cyclocross Bicycles	439644.0000
1-brand-category-sales	Surly	Mountain Bikes	441383.0000
1-brand-category-sales	Surly	Road Bikes	68478.0000
1-brand-category-sales	Trek	Children Bicycles	48695.0000
1-brand-category-sales	Trek	Cyclocross Bicycles	271367.0000
1-brand-category-sales	Trek	Electric Bikes	838372.0000
1-brand-category-sales	Trek	Mountain Bikes	1847700.0000
1-brand-category-sales	Trek	Road Bikes	1596620.0000
2-brand-sales	Electra	NULL	1205321.0000
2-brand-sales	Haro	NULL	185385.0000
2-brand-sales	Heller	NULL	171459.0000
2-brand-sales	Pure Cycles	NULL	149476.0000
2-brand-sales	Ritchey	NULL	78899.0000
2-brand-sales	Strider	NULL	4320.0000
2-brand-sales	Sun Bicycles	NULL	341994.0000
2-brand-sales	Surly	NULL	949505.0000
2-brand-sales	Trek	NULL	4602754.0000
3-category-sales	NULL	Children Bicycles	292189.0000
3-category-sales	NULL	Comfort Bicycles	394020.0000
3-category-sales	NULL	Cruisers Bicycles	995032.0000
3-category-sales	NULL	Cyclocross Bicycles	711011.0000
3-category-sales	NULL	Electric Bikes	916685.0000
3-category-sales	NULL	Mountain Bikes	2715078.0000
3-category-sales	NULL	Road Bikes	1665098.0000
4-sales	NULL	NULL	7689113.0000
*/
--
--
--
SELECT brand, category, SUM (sales) sales
FROM sales.sales_summary
GROUP BY
	GROUPING SETS (
		(brand, category),
		(brand),
		(category),
		()
	)
ORDER BY brand, category;--40
/*
brand	category	sales
NULL	NULL	7689113.0000
NULL	Children Bicycles	292189.0000
NULL	Comfort Bicycles	394020.0000
NULL	Cruisers Bicycles	995032.0000
NULL	Cyclocross Bicycles	711011.0000
NULL	Electric Bikes	916685.0000
NULL	Mountain Bikes	2715078.0000
NULL	Road Bikes	1665098.0000
Electra	NULL	1205321.0000
Electra	Children Bicycles	207606.0000
Electra	Comfort Bicycles	271542.0000
Electra	Cruisers Bicycles	694909.0000
Electra	Electric Bikes	31264.0000
Haro	NULL	185385.0000
Haro	Children Bicycles	29240.0000
Haro	Mountain Bikes	156145.0000
Heller	NULL	171459.0000
Heller	Mountain Bikes	171459.0000
Pure Cycles	NULL	149476.0000
Pure Cycles	Cruisers Bicycles	149476.0000
Ritchey	NULL	78899.0000
Ritchey	Mountain Bikes	78899.0000
Strider	NULL	4320.0000
Strider	Children Bicycles	4320.0000
Sun Bicycles	NULL	341994.0000
Sun Bicycles	Children Bicycles	2328.0000
Sun Bicycles	Comfort Bicycles	122478.0000
Sun Bicycles	Cruisers Bicycles	150647.0000
Sun Bicycles	Electric Bikes	47049.0000
Sun Bicycles	Mountain Bikes	19492.0000
Surly	NULL	949505.0000
Surly	Cyclocross Bicycles	439644.0000
Surly	Mountain Bikes	441383.0000
Surly	Road Bikes	68478.0000
Trek	NULL	4602754.0000
Trek	Children Bicycles	48695.0000
Trek	Cyclocross Bicycles	271367.0000
Trek	Electric Bikes	838372.0000
Trek	Mountain Bikes	1847700.0000
Trek	Road Bikes	1596620.0000
*/
--
--
SELECT GROUPING(brand) grouping_brand, GROUPING(category) grouping_category, brand, category, SUM (sales) sales
FROM sales.sales_summary
GROUP BY
    GROUPING SETS (
        (brand, category),
        (brand),
        (category),
        ()
    )
ORDER BY brand, category;
--
--
/*
0	La columna participa en el GROUP BY de esa fila.
1	La columna no participa en el GROUP BY; el NULL fue generado por SQL Server.
*/
--
--
/*
grouping_brand	grouping_category	brand	category	sales
1	1	NULL	NULL	7689113.0000
1	0	NULL	Children Bicycles	292189.0000
1	0	NULL	Comfort Bicycles	394020.0000
1	0	NULL	Cruisers Bicycles	995032.0000
1	0	NULL	Cyclocross Bicycles	711011.0000
1	0	NULL	Electric Bikes	916685.0000
1	0	NULL	Mountain Bikes	2715078.0000
1	0	NULL	Road Bikes	1665098.0000
0	1	Electra	NULL	1205321.0000
0	0	Electra	Children Bicycles	207606.0000
0	0	Electra	Comfort Bicycles	271542.0000
0	0	Electra	Cruisers Bicycles	694909.0000
0	0	Electra	Electric Bikes	31264.0000
0	1	Haro	NULL	185385.0000
0	0	Haro	Children Bicycles	29240.0000
0	0	Haro	Mountain Bikes	156145.0000
0	1	Heller	NULL	171459.0000
0	0	Heller	Mountain Bikes	171459.0000
0	1	Pure Cycles	NULL	149476.0000
0	0	Pure Cycles	Cruisers Bicycles	149476.0000
0	1	Ritchey	NULL	78899.0000
0	0	Ritchey	Mountain Bikes	78899.0000
0	1	Strider	NULL	4320.0000
0	0	Strider	Children Bicycles	4320.0000
0	1	Sun Bicycles	NULL	341994.0000
0	0	Sun Bicycles	Children Bicycles	2328.0000
0	0	Sun Bicycles	Comfort Bicycles	122478.0000
0	0	Sun Bicycles	Cruisers Bicycles	150647.0000
0	0	Sun Bicycles	Electric Bikes	47049.0000
0	0	Sun Bicycles	Mountain Bikes	19492.0000
0	1	Surly	NULL	949505.0000
0	0	Surly	Cyclocross Bicycles	439644.0000
0	0	Surly	Mountain Bikes	441383.0000
0	0	Surly	Road Bikes	68478.0000
0	1	Trek	NULL	4602754.0000
0	0	Trek	Children Bicycles	48695.0000
0	0	Trek	Cyclocross Bicycles	271367.0000
0	0	Trek	Electric Bikes	838372.0000
0	0	Trek	Mountain Bikes	1847700.0000
0	0	Trek	Road Bikes	1596620.0000
*/
