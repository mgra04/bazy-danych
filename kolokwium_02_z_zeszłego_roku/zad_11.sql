/*
11. Jaka jest liczba unikalnych studentów, którzy we wszystkich
swoich wynikach kolokwiów nie mają oceny poniżej 4?

Podpowiedź: Czyli: Ilu studentów, gdzie każdy liczony jest tylko
jeden raz uzyskało wyłącznie oceny co najmniej 4 na wszystkich
kolokwiach?
Wynik jak poniżej

+------------------+
| Liczba Studentów |
+------------------+
|                2 |
+------------------+
*/
-- Rozwiązanie 1:
SELECT
    count(DISTINCT student_id) AS 'Liczba Studentów'
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
            min(grade) >= 4
    );

-- Rozwiązanie 2:
SELECT
    count(DISTINCT student_id) AS "Liczba Studentow"
FROM
    Grades
WHERE
    student_id NOT IN (
        SELECT
            student_id
        FROM
            Grades
        WHERE
            grade < 4
    );