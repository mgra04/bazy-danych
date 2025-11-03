/*
12. Jaka jest liczba unikalnych studentów, którzy w swoich wynikach kolokwiów uzyskali ocenę nie niższą niż 4?
Podpowiedź: Czyli: Ilu studentów, gdzie każdy liczony jest tylko jeden raz uzyskało przynajmniej raz ocenę co najmniej 4 na kolokwium?
*/
--Rozwiązanie 1:
SELECT
    count(DISTINCT student_id) AS 'Liczba Studentów'
FROM
    Grades
WHERE
    grade >= 4;

--Rozwiązanie 2:
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
        WHERE
            grade >= 4
        GROUP BY
            student_id
    );