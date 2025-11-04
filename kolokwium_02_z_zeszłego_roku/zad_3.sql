/*
3. Napisz polecenie wypisujące średnią ocenę z każdego kolokwium
posortowaną po tej średniej (rosnąco):
Wynik polecenia ma wyglądać dokładnie tak jak pokazano obok.
+------+---------+
| quiz | average |
+------+---------+
| K2   | 3.50000 |
| K3   | 3.75000 |
| K1   | 4.14286 |
+------+---------+
*/
SELECT
    name AS quiz,
    avg(grade) AS average
FROM
    Grades
GROUP BY
    name
ORDER BY
    average;