CREATE TRIGGER dbo.lost_credits
ON takes
AFTER DELETE
AS
BEGIN
    UPDATE s
    SET s.tot_cred = s.tot_cred - ISNULL(c.credits, 0)
    FROM student s
    JOIN deleted d ON s.ID = d.ID
    JOIN course c ON d.course_id = c.course_id;
END;
