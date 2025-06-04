CREATE TRIGGER dbo.trigger_prevent_assignment_teaches
ON teaches
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN (
            SELECT ID, year, COUNT(*) AS total
            FROM teaches
            GROUP BY ID, year
        ) t ON i.ID = t.ID AND i.year = t.year
        WHERE t.total >= 2
    )
    BEGIN
        RAISERROR('Instrutor já possui 2 ou mais aulas atribuídas neste ano.', 16, 1);
        RETURN;
    END;
    INSERT INTO teaches (ID, course_id, sec_id, semester, year)
    SELECT ID, course_id, sec_id, semester, year
    FROM inserted;
END;
