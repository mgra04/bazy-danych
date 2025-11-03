/*
9. Znajdź studentów, którzy pisali mniej niż dwa kolokwia.
Wyświetl student_id, name, i surname.
Posortuj według nazwiska i imienia.
*/
SELECT
    s.student_id,
    s.name,
    s.surname
FROM
    Students s
    LEFT JOIN Grades g ON s.student_id = g.student_id
GROUP BY
    s.student_id,
    s.name,
    s.surname
HAVING
    count(g.name) < 2
ORDER BY
    s.surname,
    s.name;
