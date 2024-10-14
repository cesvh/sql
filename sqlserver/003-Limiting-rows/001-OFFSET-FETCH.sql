-- ORDER BY column_list [ASC |DESC]
-- OFFSET offset_row_count {ROW | ROWS}
-- FETCH {FIRST | NEXT} fetch_row_count {ROW | ROWS} ONLY
-- La cláusula OFFSET especifica la cantidad de filas que se deben omitir antes de comenzar a devolver filas de la consulta. offset_row_count puede ser una constante, variable o parámetro que sea mayor o igual a cero.

-- La cláusula FETCH especifica la cantidad de filas que se deben devolver después de que se haya procesado la cláusula OFFSET. offset_row_count puede ser una constante, variable o escalar que sea mayor o igual a uno.

-- La cláusula OFFSET es obligatoria, mientras que la cláusula FETCH es opcional. Además, FIRST y NEXT son sinónimos, por lo que puede utilizarlos indistintamente. De manera similar, puede utilizar FIRST y NEXT

-- --------------------------------------------------------------
-- --------------------------------------------------------------
-- --------------------------------------------------------------

-- La siguiente consulta utiliza una instrucción SELECT para recuperar todas las filas de la tabla de productos y las ordena por precios de lista y nombres:
SELECT product_id, product_name, list_price FROM production.products ORDER BY list_price, product_name;

-- Para omitir los primeros 10 productos y devolver el resto, utilice la cláusula OFFSET como se muestra en la siguiente declaración:
SELECT product_id, product_name, list_price FROM production.products ORDER BY list_price, product_name OFFSET 10 ROWS;

-- Para omitir los primeros 10 productos y seleccionar los siguientes 10 productos, utilice las cláusulas OFFSET y FETCH de la siguiente manera:
SELECT product_id, product_name, list_price FROM production.products ORDER BY list_price, product_name OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY;

-- Usar la cláusula OFFSET FETCH para obtener las N filas superiores
-- El siguiente ejemplo utiliza la cláusula OFFSET FETCH para recuperar los 10 productos más caros de la tabla de productos:
SELECT product_id, product_name, list_price FROM production.products ORDER BY list_price DESC, product_name OFFSET 0 ROWS FETCH FIRST 10 ROWS ONLY;
