-- Questão 01.
CREATE PROCEDURE student_grade_points
    @input_grade VARCHAR(2)
AS
BEGIN
    SELECT 
        s.name AS student_name,
        s.dept_name AS student_dept,
        c.title AS course_title,
        c.dept_name AS course_dept,
        t.semester,
        t.year,
        t.grade AS grade_alpha,
        
        CASE t.grade
            WHEN 'A+' THEN 10.0
            WHEN 'A'  THEN 10.0
            WHEN 'A-' THEN 9.0
            WHEN 'B+' THEN 8.5
            WHEN 'B'  THEN 8.0
            WHEN 'B-' THEN 7.0
            WHEN 'C+' THEN 6.5
            WHEN 'C'  THEN 6.0
            WHEN 'C-' THEN 5.0
            WHEN 'D+' THEN 4.0
            WHEN 'D'  THEN 3.0
            WHEN 'F'  THEN 0.0
            ELSE NULL
        END AS grade_numeric_10
    FROM student s
    JOIN takes t ON s.ID = t.ID
    JOIN course c ON t.course_id = c.course_id
    WHERE t.grade = @input_grade;
END;

-- Questão 02.
CREATE FUNCTION dbo.return_instructor_location (
    @instructor_name VARCHAR(100)
)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        i.name AS instructor_name,
        c.title AS course_title,
        t.semester,
        t.year,
        s.building,
        s.room_number
    FROM instructor i
    JOIN teaches t ON i.ID = t.ID
    JOIN course c ON t.course_id = c.course_id
    JOIN section s ON 
        t.course_id = s.course_id AND
        t.sec_id = s.sec_id AND
        t.semester = s.semester AND
        t.year = s.year
    WHERE i.name = @instructor_name
);
