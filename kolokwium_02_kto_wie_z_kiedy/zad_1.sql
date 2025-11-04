/*
1.Wyświetl dane studentów, którzy pisali wszystkie dostępne kolokwia.
Wynik ma zawierać student_id, name, i surname.
Posortuj według nazwiska i imienia.
*/
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
            count(DISTINCT name) = 3
    )
ORDER BY
    surname,
    name;

-- Pomocnicze do wizaulizacji dlaczego tak (name w Grades to K1, K2 lub K3)
SELECT
    student_id,
    count(DISTINCT name) AS liczba_kolokwiów
FROM
    Grades
GROUP BY
    student_id
ORDER BY
    liczba_kolokwiów DESC;