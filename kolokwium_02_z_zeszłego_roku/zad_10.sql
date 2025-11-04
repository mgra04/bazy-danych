/*
10. Znajdź studentów, którzy uzyskali różne oceny na przynajmniej
dwóch kolokwiach.
Wynik jak poniżej:
+------------+---------+----------+
| student_id | name    | surname  |
+------------+---------+----------+
|         12 | Tomasz  | Nowak    |
|         21 | Irena   | Nowak    |
|         22 | Irena   | Kowalska |
|         23 | Andrzej | Kowalski |
+------------+---------+----------+
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
        GROUP BY
            student_id
        HAVING
            count(DISTINCT grade) >= 2
    );

-- Rozwiązanie 2:
SELECT DISTINCT
    s.student_id,
    s.name,
    s.surname
FROM
    Students s
WHERE
    (
        SELECT
            count(DISTINCT grade)
        FROM
            Grades g
        WHERE
            g.student_id = s.student_id
    ) >= 2;