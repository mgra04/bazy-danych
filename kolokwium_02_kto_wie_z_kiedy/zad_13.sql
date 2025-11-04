/*
13. Wyświetl listę studentów, którzy pisali dokładnie dwa kolokwia i uzyskali różne oceny
*/
SELECT
    *
FROM
    Students
WHERE
    student_id IN (
        SELECT
            student_id
        FROM
            Grades
        GROUP BY
            student_id
        HAVING
            count(*) = 2
            AND count(DISTINCT grade) = 2
    );