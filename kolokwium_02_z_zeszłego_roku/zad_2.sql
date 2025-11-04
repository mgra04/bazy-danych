/*
2. Napisz polecenie wyświetlające liczbę osób piszących dane
kolokwium, tak jak poniżej:
+------+---------+ 
| quiz | numbers |
+------+---------+
| K1   |       7 |
| K2   |       4 |
| K3   |       4 |
+------+---------+
Wynik polecenia ma wyglądać dokładnie tak jak pokazano obok (atrybuty)
quiz, numbers i być posortowany po atrybucie: name
*/
SELECT
    name AS quiz,
    count(*) AS numbers
FROM
    Grades
GROUP BY
    name
ORDER BY
    name;