--CREATE SCHEMA pm;
--GO

--CREATE TABLE pm.projects(
--    id INT PRIMARY KEY IDENTITY,
--    title VARCHAR(255) NOT NULL
--);

--CREATE TABLE pm.members(
--    id INT PRIMARY KEY IDENTITY,
--    name VARCHAR(120) NOT NULL,
--    project_id INT,
--    FOREIGN KEY (project_id) REFERENCES pm.projects(id)
--);

--INSERT INTO pm.projects(title)
--VALUES ('New CRM for Project Sales'), ('ERP Implementation'), ('Develop Mobile Sales Platform');

--INSERT INTO pm.members(name, project_id)
--VALUES ('John Doe', 1), ('Lily Bush', 1), ('Jane Doe', 2), ('Jack Daniel', null);

SELECT * FROM pm.projects;

SELECT * FROM pm.members;

-- FULL OUTER JOIN es una cláusula de la declaración SELECT. La cláusula FULL OUTER JOIN devuelve un conjunto de resultados que incluye filas de las tablas izquierda y derecha.

SELECT 
	m.name member, 
	p.title project
FROM 
	pm.projects p
FULL JOIN 
	pm.members m ON p.id = m.project_id;


SELECT 
	m.name member, 
	p.title project
FROM 
	pm.members m
FULL JOIN 
	pm.projects p ON p.id = m.project_id
WHERE
	m.id IS NULL 
	OR P.id IS NULL;
--
