create database db_experiments;
use db_experiments;


USE db_experiments;
GO

/*
Tengo una base de datos llamada db_experiments, crea en esta base de datos llamada tb_data_types, en la que crees un campo por cada uno de los tipos de datos que existen en sql server, pero pero cada campo crea dos una que sea not null y otro null, en cada campo pon comentarios de que tipo de datos se pueden guardar, por ejemplo en el tipo de dato int es -- -2,147,483,648 a 2,147,483,647
*/

CREATE TABLE tb_data_types
(
    /* ===============================
       NUMÉRICOS EXACTOS
       =============================== */

    -- BIT: 0, 1 o NULL (booleano)
    bit_not_null BIT NOT NULL,
    bit_null     BIT NULL,

    -- TINYINT: 0 a 255
    tinyint_not_null TINYINT NOT NULL,
    tinyint_null     TINYINT NULL,

    -- SMALLINT: -32,768 a 32,767
    smallint_not_null SMALLINT NOT NULL,
    smallint_null     SMALLINT NULL,

    -- INT: -2,147,483,648 a 2,147,483,647
    int_not_null INT NOT NULL,
    int_null     INT NULL,

    -- BIGINT: -9,223,372,036,854,775,808 a 9,223,372,036,854,775,807
    bigint_not_null BIGINT NOT NULL,
    bigint_null     BIGINT NULL,

    -- DECIMAL / NUMERIC: números exactos con decimales (precisión y escala)
    decimal_not_null DECIMAL(10,2) NOT NULL,
    decimal_null     DECIMAL(10,2) NULL,

    numeric_not_null NUMERIC(10,2) NOT NULL,
    numeric_null     NUMERIC(10,2) NULL,

    /* ===============================
       NUMÉRICOS APROXIMADOS
       =============================== */

    -- FLOAT: números aproximados (hasta 15 dígitos)
    float_not_null FLOAT NOT NULL,
    float_null     FLOAT NULL,

    -- REAL: números aproximados (hasta 7 dígitos)
    real_not_null REAL NOT NULL,
    real_null     REAL NULL,

    /* ===============================
       MONETARIOS
       =============================== */

    -- MONEY: valores monetarios (puede tener redondeos)
    money_not_null MONEY NOT NULL,
    money_null     MONEY NULL,

    -- SMALLMONEY: valores monetarios pequeños
    smallmoney_not_null SMALLMONEY NOT NULL,
    smallmoney_null     SMALLMONEY NULL,

    /* ===============================
       TEXTO NO UNICODE
       =============================== */

    -- CHAR: texto de longitud fija (hasta 8000)
    char_not_null CHAR(10) NOT NULL,
    char_null     CHAR(10) NULL,

    -- VARCHAR: texto de longitud variable (hasta 8000)
    varchar_not_null VARCHAR(100) NOT NULL,
    varchar_null     VARCHAR(100) NULL,

    -- VARCHAR(MAX): texto largo hasta 2 GB
    varchar_max_not_null VARCHAR(MAX) NOT NULL,
    varchar_max_null     VARCHAR(MAX) NULL,

    /* ===============================
       TEXTO UNICODE
       =============================== */

    -- NCHAR: texto Unicode de longitud fija
    nchar_not_null NCHAR(10) NOT NULL,
    nchar_null     NCHAR(10) NULL,

    -- NVARCHAR: texto Unicode de longitud variable
    nvarchar_not_null NVARCHAR(100) NOT NULL,
    nvarchar_null     NVARCHAR(100) NULL,

    -- NVARCHAR(MAX): texto Unicode largo hasta 2 GB
    nvarchar_max_not_null NVARCHAR(MAX) NOT NULL,
    nvarchar_max_null     NVARCHAR(MAX) NULL,

    /* ===============================
       FECHA Y HORA
       =============================== */

    -- DATE: solo fecha (YYYY-MM-DD)
    date_not_null DATE NOT NULL,
    date_null     DATE NULL,

    -- TIME: solo hora
    time_not_null TIME NOT NULL,
    time_null     TIME NULL,

    -- DATETIME: fecha y hora (precisión antigua)
    datetime_not_null DATETIME NOT NULL,
    datetime_null     DATETIME NULL,

    -- DATETIME2: fecha y hora (mayor precisión, recomendado)
    datetime2_not_null DATETIME2 NOT NULL,
    datetime2_null     DATETIME2 NULL,

    -- SMALLDATETIME: fecha y hora con menor rango
    smalldatetime_not_null SMALLDATETIME NOT NULL,
    smalldatetime_null     SMALLDATETIME NULL,

    -- DATETIMEOFFSET: fecha y hora con zona horaria
    datetimeoffset_not_null DATETIMEOFFSET NOT NULL,
    datetimeoffset_null     DATETIMEOFFSET NULL,

);
GO


/*
Muchas gracias, me ha sido de ayuda. Ahora ayúdame con lo siguiente: crea un script while, otro igual pero con el for, otro usando cte y otro usando cursores para crear ciclo para hacer inserts para agregar campos a la tabla siguiente:

Con esa misma tabla haz un while para insertar 1000 registros pero en los campos que son null, ponerle algunas veces valores y otras veces valores nulos y en el resto de datos que no not null igual que sean datos random.

Agrega a este ultimo while manera para poder medir el tiempo de ejecución.
*/
DECLARE 
    @i INT = 1,
    @startTime DATETIME2,
    @endTime DATETIME2,
    @durationMs BIGINT;

-- Hora de inicio
SET @startTime = SYSDATETIME();

WHILE @i <= 12000000
BEGIN
    INSERT INTO tb_data_types
    (
        bit_not_null, bit_null,
        tinyint_not_null, tinyint_null,
        smallint_not_null, smallint_null,
        int_not_null, int_null,
        bigint_not_null, bigint_null,
        decimal_not_null, decimal_null,
        numeric_not_null, numeric_null,
        float_not_null, float_null,
        real_not_null, real_null,
        money_not_null, money_null,
        smallmoney_not_null, smallmoney_null,
        char_not_null, char_null,
        varchar_not_null, varchar_null,
        varchar_max_not_null, varchar_max_null,
        nchar_not_null, nchar_null,
        nvarchar_not_null, nvarchar_null,
        nvarchar_max_not_null, nvarchar_max_null,
        date_not_null, date_null,
        time_not_null, time_null,
        datetime_not_null, datetime_null,
        datetime2_not_null, datetime2_null,
        smalldatetime_not_null, smalldatetime_null,
        datetimeoffset_not_null, datetimeoffset_null
    )
    VALUES
    (
        CAST(RAND(CHECKSUM(NEWID())) * 2 AS BIT),
        CASE WHEN RAND(CHECKSUM(NEWID())) > 0.5 THEN CAST(RAND(CHECKSUM(NEWID())) * 2 AS BIT) ELSE NULL END,

        CAST(RAND(CHECKSUM(NEWID())) * 255 AS TINYINT),
        CASE WHEN RAND(CHECKSUM(NEWID())) > 0.5 THEN CAST(RAND(CHECKSUM(NEWID())) * 255 AS TINYINT) ELSE NULL END,

        CAST(RAND(CHECKSUM(NEWID())) * 32767 AS SMALLINT),
        CASE WHEN RAND(CHECKSUM(NEWID())) > 0.5 THEN CAST(RAND(CHECKSUM(NEWID())) * 32767 AS SMALLINT) ELSE NULL END,

        CAST(RAND(CHECKSUM(NEWID())) * 1000000 AS INT),
        CASE WHEN RAND(CHECKSUM(NEWID())) > 0.5 THEN CAST(RAND(CHECKSUM(NEWID())) * 1000000 AS INT) ELSE NULL END,

        CAST(RAND(CHECKSUM(NEWID())) * 100000000 AS BIGINT),
        CASE WHEN RAND(CHECKSUM(NEWID())) > 0.5 THEN CAST(RAND(CHECKSUM(NEWID())) * 100000000 AS BIGINT) ELSE NULL END,

        CAST(RAND(CHECKSUM(NEWID())) * 10000 AS DECIMAL(10,2)),
        CASE WHEN RAND(CHECKSUM(NEWID())) > 0.5 THEN CAST(RAND(CHECKSUM(NEWID())) * 10000 AS DECIMAL(10,2)) ELSE NULL END,

        CAST(RAND(CHECKSUM(NEWID())) * 10000 AS NUMERIC(10,2)),
        CASE WHEN RAND(CHECKSUM(NEWID())) > 0.5 THEN CAST(RAND(CHECKSUM(NEWID())) * 10000 AS NUMERIC(10,2)) ELSE NULL END,

        RAND(CHECKSUM(NEWID())) * 1000,
        CASE WHEN RAND(CHECKSUM(NEWID())) > 0.5 THEN RAND(CHECKSUM(NEWID())) * 1000 ELSE NULL END,

        CAST(RAND(CHECKSUM(NEWID())) * 1000 AS REAL),
        CASE WHEN RAND(CHECKSUM(NEWID())) > 0.5 THEN CAST(RAND(CHECKSUM(NEWID())) * 1000 AS REAL) ELSE NULL END,

        CAST(RAND(CHECKSUM(NEWID())) * 5000 AS MONEY),
        CASE WHEN RAND(CHECKSUM(NEWID())) > 0.5 THEN CAST(RAND(CHECKSUM(NEWID())) * 5000 AS MONEY) ELSE NULL END,

        CAST(RAND(CHECKSUM(NEWID())) * 5000 AS SMALLMONEY),
        CASE WHEN RAND(CHECKSUM(NEWID())) > 0.5 THEN CAST(RAND(CHECKSUM(NEWID())) * 5000 AS SMALLMONEY) ELSE NULL END,

        'C' + RIGHT(CAST(@i AS VARCHAR(10)), 9),
        CASE WHEN RAND(CHECKSUM(NEWID())) > 0.5 THEN 'CHAR_NULL' ELSE NULL END,

        'VARCHAR_' + CAST(@i AS VARCHAR(10)),
        CASE WHEN RAND(CHECKSUM(NEWID())) > 0.5 THEN 'VARCHAR_NULL' ELSE NULL END,

        'Texto largo ' + CAST(@i AS VARCHAR(10)),
        CASE WHEN RAND(CHECKSUM(NEWID())) > 0.5 THEN 'Texto largo NULL' ELSE NULL END,

        N'NCHAR_' + RIGHT(CAST(@i AS NVARCHAR(10)), 4),
        CASE WHEN RAND(CHECKSUM(NEWID())) > 0.5 THEN N'NCHAR_NULL' ELSE NULL END,

        N'NVARCHAR_' + CAST(@i AS NVARCHAR(10)),
        CASE WHEN RAND(CHECKSUM(NEWID())) > 0.5 THEN N'NVARCHAR_NULL' ELSE NULL END,

        N'Texto Unicode ' + CAST(@i AS NVARCHAR(10)),
        CASE WHEN RAND(CHECKSUM(NEWID())) > 0.5 THEN N'Texto Unicode NULL' ELSE NULL END,

        DATEADD(DAY, -CAST(RAND(CHECKSUM(NEWID())) * 3650 AS INT), GETDATE()),
        CASE WHEN RAND(CHECKSUM(NEWID())) > 0.5 
             THEN DATEADD(DAY, -CAST(RAND(CHECKSUM(NEWID())) * 3650 AS INT), GETDATE()) 
             ELSE NULL END,

        CAST(GETDATE() AS TIME),
        CASE WHEN RAND(CHECKSUM(NEWID())) > 0.5 THEN CAST(GETDATE() AS TIME) ELSE NULL END,

        GETDATE(),
        CASE WHEN RAND(CHECKSUM(NEWID())) > 0.5 THEN GETDATE() ELSE NULL END,

        SYSDATETIME(),
        CASE WHEN RAND(CHECKSUM(NEWID())) > 0.5 THEN SYSDATETIME() ELSE NULL END,

        CAST(GETDATE() AS SMALLDATETIME),
        CASE WHEN RAND(CHECKSUM(NEWID())) > 0.5 THEN CAST(GETDATE() AS SMALLDATETIME) ELSE NULL END,

        SYSDATETIMEOFFSET(),
        CASE WHEN RAND(CHECKSUM(NEWID())) > 0.5 THEN SYSDATETIMEOFFSET() ELSE NULL END
    );

    SET @i += 1;
END;

-- Hora de fin
SET @endTime = SYSDATETIME();

-- Duración en milisegundos
SET @durationMs = DATEDIFF(MILLISECOND, @startTime, @endTime);

-- Resultado
SELECT
    @i          AS Registros,
    @startTime  AS StartTime,
    @endTime    AS EndTime,
    @durationMs AS DurationMilliseconds,
    (@durationMs / 1000.0) AS DurationSeconds;

/*
SELECT * FROM [db_experiments].[dbo].[tb_data_types];
-- 12000000 
-- 

-- truncate table tb_data_types;
-- Registros	StartTime	EndTime	DurationMilliseconds	DurationSeconds
-- 12000001	2026-02-01 16:29:28.7399320	2026-02-01 17:52:04.0070372	4955268	4955.268000
-- 01:22:35 Horas
*/

SELECT TOP (10000) --[bit_not_null]
      --,[bit_null]
      --[tinyint_not_null]
      --,[tinyint_null]
      --,[smallint_not_null]
      --,[smallint_null]
      [int_not_null]
      --,[int_null]
      --,[bigint_not_null]
      --,[bigint_null]
      ,[decimal_not_null]
      --,[decimal_null]
      ,[numeric_not_null]
      --,[numeric_null]
      ,[float_not_null]
      --,[float_null]
      ,[real_not_null]
      --,[real_null]
      ,[money_not_null]
      --,[money_null]
      --,[smallmoney_not_null]
      --,[smallmoney_null]
      ,[char_not_null]
      --,[char_null]
      ,[varchar_not_null]
      --,[varchar_null]
      --,[varchar_max_not_null]
      ----,[varchar_max_null]
      --,[nchar_not_null]
      ----,[nchar_null]
      --,[nvarchar_not_null]
      ----,[nvarchar_null]
      --,[nvarchar_max_not_null]
      ----,[nvarchar_max_null]
      --,[date_not_null]
      ----,[date_null]
      --,[time_not_null]
      ----,[time_null]
      --,[datetime_not_null]
      ----,[datetime_null]
      --,[datetime2_not_null]
      ----,[datetime2_null]
      --,[smalldatetime_not_null]
      ----,[smalldatetime_null]
      --,[datetimeoffset_not_null]
      --,[datetimeoffset_null]
  FROM [db_experiments].[dbo].[tb_data_types]
