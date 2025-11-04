/*
4.Policz liczbę studentów, którzy napisali wszystkie kolokwia, ale uzyskali średnią ocenę poniżej 5.
Wynik ma zawierać count_students.
*/
-- Rozwiązanie 1
SELECT
    count(*) AS count_students
FROM
    (
        SELECT
            student_id
        FROM
            Grades
        GROUP BY
            student_id
        HAVING
            count(DISTINCT name) = 3
            AND avg(grade) < 5
    ) AS temp;

-- Rozwiązanie 1' (nie wiemy, że różnych kolokwiów jest dokładnie 3)
SELECT
    count(*) AS count_students
FROM
    (
        SELECT
            student_id
        FROM
            Grades
        GROUP BY
            student_id
        HAVING
            count(DISTINCT name) = (
                SELECT
                    count(DISTINCT name)
                FROM
                    Grades
            )
            AND avg(grade) < 5
    ) AS temp;