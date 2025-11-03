/*
2. Znajdź studentów, którzy uzyskali najwyższą ocenę na co najmniej jednym kolokwium.
Wyświetl student_id, name, surname i grade.
*/
-- Rozwiązanie 1:
SELECT
    student_id,
    name,
    surname,
    (
        SELECT
            max(grade)
        FROM
            Grades
        WHERE
            Grades.student_id = Students.student_id
    ) AS max_grade
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
        HAVING
            count(name) >= 1
    );

-- Rozwiązanie 1' (nie wiemy jaka ocena jest najwyższa):
SELECT
    student_id,
    name,
    surname,
    (
        SELECT
            max(grade)
        FROM
            Grades
        WHERE
            Grades.student_id = Students.student_id
    ) AS max_grade
FROM
    Students
WHERE
    student_id IN (
        SELECT
            student_id
        FROM
            Grades
        WHERE
            grade = (
                SELECT
                    max(grade)
                FROM
                    Grades
            )
        GROUP BY
            student_id
        HAVING
            count(name) >= 1
    );

-- Rozwiązanie 2:
SELECT DISTINCT
    s.student_id,
    s.name,
    s.surname,
    g.grade
FROM
    Students s
    JOIN Grades g ON s.student_id = g.student_id
WHERE
    g.grade = (
        SELECT
            max(grade)
        FROM
            Grades
    );