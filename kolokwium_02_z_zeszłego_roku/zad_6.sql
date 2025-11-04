/*
6. Wyświetl listę osób które pisały tylko jedno kolokwium. Wynik
tak jak poniżej:

+------------+--------+----------+
| student_id | name   | surname  |
+------------+--------+----------+
|         56 | Tomasz | Kowalski |
|         90 | Tomasz | Sikorski |
|         97 | Anna   | Lipinska |
|         99 | Julia  | Nowicka  |
+------------+--------+----------+
*/
-- Rozwiązanie 1:
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
            count(*) = 1
    );

-- Rozwiązanie 2:
SELECT
    s.student_id,
    s.name,
    s.surname
FROM
    Students s,
    Grades g
WHERE
    s.student_id = g.student_id
GROUP BY
    s.student_id,
    s.name,
    s.surname
HAVING
    count(*) = 1;