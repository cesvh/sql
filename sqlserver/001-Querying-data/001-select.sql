-- FROM -> SELECT
SELECT first_name, last_name FROM sales.customers;

SELECT first_name, last_name, email FROM sales.customers;

SELECT * FROM sales.customers;

-- FROM -> WHERE -> SELECT
SELECT * FROM sales.customers WHERE state = 'CA';

-- FROM -> WHERE -> SELECT -> ORDER BY
SELECT * FROM sales.customers WHERE state = 'CA' ORDER BY first_name;

SELECT city, COUNT (*) AS 'cantidad' FROM sales.customers WHERE state = 'CA' GROUP BY city ORDER BY city;

-- FROM -> WHERE -> GROUP BY -> SELECT ->ORDER BY.
SELECT city, COUNT (*) FROM sales.customers WHERE state = 'CA' GROUP BY city HAVING COUNT (*) > 10 ORDER BY city;
