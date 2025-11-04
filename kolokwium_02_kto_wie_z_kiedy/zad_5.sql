/*
5. Wyświetl dane studentów, którzy uzyskali dokładnie dwie różne oceny.
Wynik ma zawierać student_id, name, i surname.
Posortuj według nazwiska i imienia.
*/
SELECT
    student_id,
    name,
    surname
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
            count(DISTINCT grade) = 2
    )
ORDER BY
    surname,
    name;