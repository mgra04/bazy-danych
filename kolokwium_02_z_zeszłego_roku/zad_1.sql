/*
1. Zastanów się jakim poleceniem można wyświetlić informację jak
poniżej w tabelce a pochodzącą
z tabel STUDENTS i GRADES zastosuj iloczyn kartezjański pamiętając,
że sens mają tylko te krotki dla których: STUDENTS.student_id =
GRADES.student_id

_Polecenie ma uwzględniać sortowanie aby wynik był dokładnie taki
jak poniżej (atrybuty) i posortowany kolejno po nazwisku, imieniu,
numerze kolokwium i ocenie:_
*/
SELECT
    s.name,
    s.surname,
    g.name,
    g.grade
FROM
    Students s,
    Grades g
WHERE
    s.student_id = g.student_id
ORDER BY
    s.surname,
    s.name,
    g.name,
    g.grade;

/*
+---------+----------+------+-------+
| name    | surname  | quiz | grade |
+---------+----------+------+-------+
| Irena   | Kowalska | K1   |   4.0 |
| Irena   | Kowalska | K2   |   3.0 |
| Andrzej | Kowalski | K1   |   5.0 |
| Andrzej | Kowalski | K2   |   4.0 |
| Andrzej | Kowalski | K3   |   3.0 |
| Tomasz  | Kowalski | K1   |   4.0 |
| Anna    | Lipinska | K1   |   3.0 |
| Irena   | Nowak    | K1   |   5.0 |
| Irena   | Nowak    | K2   |   3.0 |
| Irena   | Nowak    | K3   |   5.0 |
| Tomasz  | Nowak    | K1   |   5.0 |
| Tomasz  | Nowak    | K2   |   4.0 |
| Tomasz  | Nowak    | K3   |   4.0 |
| Julia   | Nowicka  | K3   |   3.0 |
| Tomasz  | Sikorski | K1   |   3.0 |
+---------+----------+------+-------+
*/