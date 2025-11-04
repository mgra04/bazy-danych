/*
14. Znajdź studentów którzy uzyskali wszystkie możliwe oceny
*/
-- Rozwiązanie 1 (wiemy, że są trzy różne oceny: 3, 4, 5)
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
            count(distinct grade) = 3
    );

-- Rozwiązanie 1' (wiemy, że są trzy różne oceny: 3, 4, 5 i wystarczy wyświetlić tylko student_id)
SELECT
    student_id
FROM
    Grades
GROUP BY
    student_id
HAVING
    count(DISTINCT grade) = 3;

-- Rozwiązanie 2 (nie wiemy ile jest różnych ocen)
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
            count(distinct grade) = (
                SELECT
                    count(DISTINCT grade)
                FROM
                    Grades
            )
    );

-- Rozwiązanie 2' (nie wiemy ile jest różnych ocen i wystarczy wyświetlić tylko student_id)
SELECT
    student_id
FROM
    Grades
GROUP BY
    student_id
HAVING
    count(DISTINCT grade) = (
        SELECT
            count(DISTINCT grade)
        FROM
            Grades
    );