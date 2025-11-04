/*
5. Napisz polecenie wypisujące dane studenta i średnią ocenę
uzyskaną przez niego z obu kolokwiów. Wynik winien być posortowany
po liczbie kolokwiów napisanych przez daną osobę (malejąco),
średniej ocenie (malejąco), nazwisku i imieniu. Wygląd (w tym nazwy
kolumn) tak jak poniżej:
+---------+----------+----+------+
| name    | surname  | no | avg  |
+---------+----------+----+------+
| Irena   | Nowak    |  3 | 4.33 |
| Tomasz  | Nowak    |  3 | 4.33 |
| Andrzej | Kowalski |  3 | 4.00 |
| Irena   | Kowalska |  2 | 3.50 |
| Tomasz  | Kowalski |  1 | 4.00 |
| Anna    | Lipinska |  1 | 3.00 |
| Julia   | Nowicka  |  1 | 3.00 |
| Tomasz  | Sikorski |  1 | 3.00 |
+---------+----------+----+------+
*/
SELECT
    s.name,
    s.surname,
    count(*) AS no,
    avg(g.grade) AS avg
FROM
    Students s,
    Grades g
WHERE
    s.student_id = g.student_id
GROUP BY
    s.name,
    s.surname
ORDER BY
    no DESC,
    avg DESC,
    s.surname,
    s.name;