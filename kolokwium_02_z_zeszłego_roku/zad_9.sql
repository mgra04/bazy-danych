/*
9. Wyświetl dane studentów, którzy uzyskali najwyższą ocenę z
każdego kolokwium. (dla każdego z kolokwiów osoba/y z najwyższą/ymi oceną/ami)
Podpowiedź: wskazane użycie iloczynu kartezjańskiego.
Należy posortować kolejno po quiz, surname i name
+---------+----------+------+-------+
| name    | surname  | quiz | grade |
+---------+----------+------+-------+
| Andrzej | Kowalski | K1   |   5.0 |
| Irena   | Nowak    | K1   |   5.0 |
| Tomasz  | Nowak    | K1   |   5.0 |
| Andrzej | Kowalski | K2   |   4.0 |
| Tomasz  | Nowak    | K2   |   4.0 |
| Irena   | Nowak    | K3   |   5.0 |
+---------+----------+------+-------+
*/
SELECT
    s.name,
    s.surname,
    g.name AS quiz,
    g.grade
FROM
    Students s,
    Grades g
WHERE
    s.student_id = g.student_id
    AND g.grade = (
        SELECT
            max(g2.grade)
        FROM
            Grades g2
        WHERE
            g2.name = g.name
    )
ORDER BY
    quiz,
    surname,
    name;