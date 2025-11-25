/*
d) Wyświetl imiona, nazwiska, PESEL, oraz liczbę produktów posiadanych przez każdego
z użytkowników (posortuj po liczbie produktów malejąco, a następnie rosnąco
po nazwisku, imieniu i PESELu).
*/
SELECT
    u.name,
    u.surname,
    u.PESEL,
    count(*) AS product_count
FROM
    Users u
    JOIN UsersGoods ug on u.user_id = ug.user_id
GROUP BY
    u.name,
    u.surname,
    u.PESEL
ORDER BY
    product_count DESC,
    u.surname,
    u.name,
    u.PESEL;