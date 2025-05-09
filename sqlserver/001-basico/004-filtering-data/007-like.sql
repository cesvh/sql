
-- El patrón es una secuencia de caracteres que se busca en la columna o expresión. Puede incluir los siguientes caracteres comodín válidos:

-- El comodín de porcentaje (%): cualquier cadena de cero o más caracteres
-- El comodín de guión bajo (_): cualquier carácter individual.
-- El comodín [lista de caracteres]: cualquier carácter individual dentro del conjunto especificado.
-- El [carácter-carácter]: cualquier carácter individual dentro del rango especificado.
-- El [^]: cualquier carácter que no esté dentro de una lista o un rango.

-- 1) Ejemplos de uso del operador LIKE con el comodín %
-- 2) Ejemplo de uso del operador LIKE con el comodín _ (guión bajo)
-- 3) Ejemplo de uso del operador LIKE con el comodín [lista de caracteres]
-- 4) Ejemplo de uso del operador LIKE con el comodín [carácter-carácter]
-- 5) Ejemplo de uso del operador LIKE con el comodín [^Lista de caracteres o rango]
-- 6) Usando el ejemplo del operador NOT LIKE
-- 7) Ejemplo de uso del operador LIKE con ESCAPE


-- Utilice el operador LIKE para comprobar si un valor coincide con un patrón especificado.
