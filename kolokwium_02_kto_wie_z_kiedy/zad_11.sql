/*
11. Jaka jest liczba unikalnych studentów, którzy we wszystkich swoich wynikach kolokwiów nie mają oceny poniżej 4?
Podpowiedź: Czyli: Ilu studentów, gdzie każdy liczony jest tylko jeden raz uzyskało wyłącznie oceny co najmniej 4 na wszystkich kolokwiach?
*/
SELECT
    count(*) AS 'Liczba Studentów'
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