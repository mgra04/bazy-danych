/*
Znajdź studentów, którzy uzyskali co najmniej jedną ocenę równą 5.
Wyświetl student_id, name, i surname.
Posortuj według nazwiska i imienia.
*/
-- Rozwiązanie 1:
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
        WHERE
            grade = 5
        GROUP BY
            student_id
    )
ORDER BY
    surname,
    name;

-- Rozwiązanie 2:
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
            max(grade) = 5
    )
ORDER BY
    surname,
    name;