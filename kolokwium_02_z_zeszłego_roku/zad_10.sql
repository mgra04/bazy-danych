/*
10. Znajdź studentów, którzy uzyskali różne oceny na przynajmniej dwóch kolokwiach.
*/
-- Rozwiązanie 1:
SELECT
    s.student_id,
    s.name,
    s.surname
FROM
    Students s
    LEFT JOIN Grades g ON g.student_id = s.student_id
GROUP BY
    s.student_id,
    s.name,
    s.surname
HAVING
    count(DISTINCT g.grade) >= 2;

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
            count(distinct grade) >= 2
    );