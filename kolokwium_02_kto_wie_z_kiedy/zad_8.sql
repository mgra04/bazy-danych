/*
8. Wyświetl średnią ocenę dla każdego kolokwium, na którym liczba uczestników wynosiła dokładnie 4.
Wynik ma zawierać quiz i średnią ocenę.
*/
SELECT
    name AS quiz,
    avg(grade) AS avg_grade
FROM
    Grades
GROUP BY
    name
HAVING
    count(*) = 4;