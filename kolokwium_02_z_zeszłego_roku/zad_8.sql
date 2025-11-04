/*
8. Utwórz bardzo podobne zapytanie jak w poprzednim punkcie lecz tym
razem wynik powinien wyglądać jak poniżej.  
+---------+---------+--------+
| name    | surname | gender |
+---------+---------+--------+
| Anna    | Nowak   | F      |
| Irena   | Nowak   | F      |
| Julia   | Nowak   | F      |
| Anna    | Sroka   | F      |
| Irena   | Sroka   | F      |
| Julia   | Sroka   | F      |
| Adam    | Nowak   | M      |
| Andrzej | Nowak   | M      |
| Tomasz  | Nowak   | M      |
| Adam    | Sroka   | M      |
| Andrzej | Sroka   | M      |
| Tomasz  | Sroka   | M      |
+---------+---------+--------+
Podpowiedź: wskazane użycie iloczynu kartezjańskiego i unii. Do tego należy
posortować kolejno po gender, surname i name
*/
SELECT DISTINCT
    s1.name,
    s2.surname,
    CASE
        WHEN s1.name LIKE '%a' THEN 'F'
        ELSE 'M'
    END AS gender
FROM
    Students s1,
    Students s2
WHERE
    s2.surname NOT LIKE '%cki'
    AND s2.surname NOT LIKE '%cka'
    AND s2.surname NOT LIKE '%ski'
    AND s2.surname NOT LIKE '%ska'
ORDER BY
    gender,
    s2.surname,
    s1.name;