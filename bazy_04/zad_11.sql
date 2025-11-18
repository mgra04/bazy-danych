/*
11. Podaj wszystkie możliwe pary imion męskich i żeńskich
Uwaga: załóż, że imię żeńskie w naszej tabeli to takie które kończy się na literę 'a',
Rozważ zastosowanie iloczynu kartezjańskiego.
*/
SELECT
    m.name AS male_name,
    f.name AS female_name
FROM
    Users m
    CROSS JOIN Users f
WHERE
    m.name NOT LIKE '%a'
    AND f.name LIKE '%a'
GROUP BY
    m.name,
    f.name;