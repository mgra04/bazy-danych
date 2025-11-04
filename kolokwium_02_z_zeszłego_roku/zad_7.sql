/*
7. Utwórz zapytanie które w efekcie zwróci taki wynik jak poniżej,
tj. złożenie wszystkich imion oraz tylko tych nazwisk które nie
zawierają końcowek "cki", "cka", "ski", "ska" (wymagane użycie
stosownego wzorca). Nie sortuj.
Podpowiedź: przydatny będzie iloczyn kartezjański. 

+---------+---------+
| name    | surname |
+---------+---------+
| Tomasz  | Nowak   |
| Irena   | Nowak   |
| Andrzej | Nowak   |
| Adam    | Nowak   |
| Anna    | Nowak   |
| Julia   | Nowak   |
| Tomasz  | Sroka   |
| Irena   | Sroka   |
| Andrzej | Sroka   |
| Adam    | Sroka   |
| Anna    | Sroka   |
| Julia   | Sroka   |
+---------+---------+
*/
-- Rozwiązanie 1:
SELECT DISTINCT
    s1.name,
    s2.surname
FROM
    Students s1,
    Students s2
WHERE
    s2.surname NOT LIKE '%cki'
    AND s2.surname NOT LIKE '%cka'
    AND s2.surname NOT LIKE '%ski'
    AND s2.surname NOT LIKE '%ska';

-- Rozwiązanie 2: (działa w MySQL)
-- SELECT
--     s1.name,
--     s2.surname
-- FROM
--     Students s1,
--     Students s2
-- WHERE
--     s2.surname NOT REGEXP 'cki$|cka$|ski$|ska$';