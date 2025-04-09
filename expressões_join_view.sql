-- Questão 01. - Lista de Instrutores com Outer Join
SELECT i.ID, i.name, 
COUNT(t.course_id) AS number_of_sections
FROM instructor i
LEFT OUTER JOIN teaches t ON i.ID = t.ID
GROUP BY i.ID, i.name
ORDER BY i.ID;

-- Questão 02. - Lista de Instrutores sem Outer Join
SELECT i.ID, i.name,
(SELECT COUNT(*) FROM teaches t WHERE t.ID = i.ID) AS number_of_sections
FROM instructor i
ORDER BY i.ID;
-- Questão 03. - Lista dos Cursos na Primavera de 2010
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

