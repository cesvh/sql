CREATE TABLE production.parts(
    part_id   INT NOT NULL,
    part_name VARCHAR(100)
);

INSERT INTO production.parts(part_id, part_name) VALUES (1,'Frame'), (2,'Head Tube'), (3,'Handlebar Grip'), (4,'Shock Absorber'), (5,'Fork');

-- La tabla production.parts no tiene clave principal. Por lo tanto, SQL Server almacena sus filas en una estructura desordenada denominada heap.

-- Cuando se consultan datos de la tabla production.parts, el optimizador de consultas debe escanear toda la tabla para buscar.

SELECT part_id, part_name FROM production.parts WHERE part_id = 5; -- Seleccionar este query y teclear CTRL + L

-- Un índice agrupado almacena filas de datos en una estructura ordenada según sus valores clave. Cada tabla tiene un solo índice agrupado, ya que las filas de datos solo se pueden ordenar en un orden. Una tabla con un índice agrupado se denomina tabla agrupada.

-- Un índice agrupado organiza los datos utilizando una estructura especial llamada B-tree (o árbol balanceado) que permite realizar búsquedas, inserciones, actualizaciones y eliminaciones en tiempo amortizado logarítmico.

-- En esta estructura, el nodo superior del árbol B se denomina nodo raíz. Los nodos del nivel inferior se denominan nodos hoja "leaf nodes". Los niveles de índice entre los nodos raíz y hoja se conocen como niveles intermedios.

-- En el árbol B, el nodo raíz y los nodos de nivel intermedio contienen páginas de índice que contienen las filas de índice. Los nodos hoja contienen las páginas de datos de la tabla subyacente. Las páginas de cada nivel del índice están enlazadas mediante otra estructura denominada lista doblemente enlazada.
