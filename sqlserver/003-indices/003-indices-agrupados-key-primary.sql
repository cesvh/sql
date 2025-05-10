-- Cuando se crea una tabla con una clave principal, SQL Server crea automáticamente un índice agrupado correspondiente que incluye columnas de clave principal.

-- Esta declaración crea una nueva tabla denominada production.part_prices con una clave principal que incluye dos columnas: part_id y valid_from.

CREATE TABLE production.part_prices(
    part_id int,
    valid_from date,
    price decimal(18,4) not null,
    PRIMARY KEY(part_id, valid_from)
);

-- Si agrega una restricción de clave principal a una tabla existente que ya tiene un índice agrupado, SQL Server aplicará la clave principal mediante un índice no agrupado:

ALTER TABLE production.parts ADD PRIMARY KEY(part_id);
