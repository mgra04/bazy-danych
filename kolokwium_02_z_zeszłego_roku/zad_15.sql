/*
15. Wyświetl listę studentów, którzy uzyskali identyczne oceny na przynajmniej dwóch kolokwiach
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
            student_id,
            grade
        HAVING
            count(*) > 1
    );

-- Pomocnicze do wizaulizacji dlaczego tak
SELECT
    student_id,
    grade,
    count(*) AS ilosc_danych_ocen
FROM
    Grades
GROUP BY
    student_id,
    grade
ORDER BY
    student_id;