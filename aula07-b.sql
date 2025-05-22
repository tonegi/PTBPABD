ALTER PROCEDURE dbo.salaryHistogram
    @num_intervals INT
AS
BEGIN
    DECLARE 
        @min_salary FLOAT,
        @max_salary FLOAT,
        @range FLOAT,
        @i INT = 0,
        @interval_min FLOAT,
        @interval_max FLOAT;

    SELECT 
        @min_salary = MIN(salary),
        @max_salary = MAX(salary)
    FROM instructor;

    IF @num_intervals <= 0 OR @min_salary = @max_salary
    BEGIN
        RAISERROR('Número de intervalos inválido', 16, 1);
        RETURN;
    END;

    SET @range = (@max_salary - @min_salary) / @num_intervals;

    CREATE TABLE #histogram (
        valorMinimo FLOAT,
        valorMaximo FLOAT,
        total INT
    );

    WHILE @i < @num_intervals
    BEGIN
        SET @interval_min = @min_salary + @i * @range;
        SET @interval_max = @min_salary + (@i + 1) * @range;

        INSERT INTO #histogram (valorMinimo, valorMaximo, total)
        SELECT 
            @interval_min,
            @interval_max,
            COUNT(*)
        FROM instructor
        WHERE salary >= @interval_min 
          AND (
                salary < @interval_max OR 
                (@i = @num_intervals - 1 AND salary <= @interval_max)
              );

        SET @i = @i + 1;
    END;

    SELECT 
        FORMAT(valorMinimo, 'N0') AS valorMinimo,
        FORMAT(valorMaximo, 'N0') AS valorMaximo,
        total
    FROM #histogram;

    DROP TABLE #histogram;
END;
