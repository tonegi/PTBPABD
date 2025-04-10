-- Questão 01. - Lista de instrutores com Outer Join
SELECT i.ID, i.name, 
COUNT(t.course_id) AS number_of_sections
FROM instructor i
LEFT OUTER JOIN teaches t ON i.ID = t.ID
GROUP BY i.ID, i.name
ORDER BY i.ID;

-- Questão 02. - Lista de instrutores sem Outer Join
SELECT i.ID, i.name,
(SELECT COUNT(*) FROM teaches t WHERE t.ID = i.ID) AS number_of_sections
FROM instructor i
ORDER BY i.ID;

-- Questão 03. - Lista dos cursos na primavera de 2010
SELECT s.course_id, s.sec_id, i.ID, s.semester, s.year,
COALESCE(i.name, '-') AS name
FROM section s
LEFT JOIN teaches t 
ON s.course_id = t.course_id 
AND s.sec_id = t.sec_id 
AND s.semester = t.semester 
AND s.year = t.year
LEFT JOIN instructor i 
ON t.ID = i.ID
WHERE s.semester = 'Spring' AND s.year = 2010
ORDER BY s.course_id, s.sec_id;

-- Questão 04. - Lista de pontos totais por curso
SELECT s.ID, s.name, c.title, c.dept_name, t.grade, c.credits,
    CASE t.grade
        WHEN 'A+' THEN 4.0 
        WHEN 'A'  THEN 3.7
        WHEN 'A-' THEN 3.4
        WHEN 'B+' THEN 3.1
        WHEN 'B'  THEN 2.7
        WHEN 'B-' THEN 2.3
        WHEN 'C+' THEN 2.0
        WHEN 'C'  THEN 1.7
        WHEN 'C-' THEN 1.3
        WHEN 'D'  THEN 1.0
        WHEN 'F'  THEN 0.0
        ELSE NULL
    END AS points,
    (CASE t.grade
        WHEN 'A+' THEN 4.0
        WHEN 'A'  THEN 3.7
        WHEN 'A-' THEN 3.4
        WHEN 'B+' THEN 3.1
        WHEN 'B'  THEN 2.7
        WHEN 'B-' THEN 2.3
        WHEN 'C+' THEN 2.0
        WHEN 'C'  THEN 1.7
        WHEN 'C-' THEN 1.3
        WHEN 'D'  THEN 1.0
        WHEN 'F'  THEN 0.0
        ELSE NULL
END * c.credits) AS pontos_totais FROM student s
JOIN takes t ON s.ID = t.ID
JOIN course c ON t.course_id = c.course_id

-- Questão 05. - Criação da View com base no exercício anterior
CREATE VIEW coeficiente_rendimento AS 
SELECT s.ID, s.name, c.title, c.dept_name, t.grade, c.credits,
    CASE t.grade
        WHEN 'A+' THEN 4.0 
        WHEN 'A'  THEN 3.7
        WHEN 'A-' THEN 3.4
        WHEN 'B+' THEN 3.1
        WHEN 'B'  THEN 2.7
        WHEN 'B-' THEN 2.3
        WHEN 'C+' THEN 2.0
        WHEN 'C'  THEN 1.7
        WHEN 'C-' THEN 1.3
        WHEN 'D'  THEN 1.0
        WHEN 'F'  THEN 0.0
        ELSE NULL
    END AS points,
    (CASE t.grade
        WHEN 'A+' THEN 4.0
        WHEN 'A'  THEN 3.7
        WHEN 'A-' THEN 3.4
        WHEN 'B+' THEN 3.1
        WHEN 'B'  THEN 2.7
        WHEN 'B-' THEN 2.3
        WHEN 'C+' THEN 2.0
        WHEN 'C'  THEN 1.7
        WHEN 'C-' THEN 1.3
        WHEN 'D'  THEN 1.0
        WHEN 'F'  THEN 0.0
        ELSE NULL
END * c.credits) AS pontos_totais FROM student s
JOIN takes t ON s.ID = t.ID
JOIN course c ON t.course_id = c.course_id
