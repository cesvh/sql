SELECT * FROM sales.customers ORDER BY first_name;

SELECT * FROM sales.customers ORDER BY first_name DESC;

SELECT * FROM sales.customers ORDER BY city, first_name;

SELECT * FROM sales.customers ORDER BY city DESC, first_name ASC;

SELECT * FROM sales.customers ORDER BY state;

SELECT * FROM sales.customers ORDER BY LEN(first_name) DESC;

SELECT * FROM sales.customers ORDER BY 2, 3;
