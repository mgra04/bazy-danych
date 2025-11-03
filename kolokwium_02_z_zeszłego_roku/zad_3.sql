/*
3. Wyświetl średnią ocenę dla każdego studenta, który napisał więcej niż dwa kolokwia.
Wynik powinien zawierać student_id, name, surname, i średnią ocenę.
Posortuj po średniej ocen rosnąco.
*/
-- Rozwiązanie 1:
SELECT
    student_id,
    name,
    surname,
    (
        SELECT
            avg(grade)
        FROM
            Grades
        WHERE
            Grades.student_id = Students.student_id
    ) AS avg_grade
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
            count(name) > 2
    )
ORDER BY
    avg_grade;

--Rozwiązanie 2:
SELECT
    s.student_id,
    s.name,
    s.surname,
    avg(g.grade) AS avg_grade
FROM
    Students s
    JOIN Grades g ON s.student_id = g.student_id
GROUP BY
    s.student_id,
    s.name,
    s.surname
HAVING
    count(s.name) > 2
ORDER BY
    avg_grade;
