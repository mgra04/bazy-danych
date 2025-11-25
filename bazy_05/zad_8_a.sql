/*
a) Wyświetl imiona, nazwiska, PESEL, oraz nazwy produktów posiadanych przez każdego
z użytkowników (posortuj kolejno po nazwisku, imieniu, PESELU i nazwie produktu).
Do doprecyzowania JOIN <=> INNER JOIN
*/
SELECT
    u.name,
    u.surname,
    u.PESEL,
    g.product
FROM
    Users u
    JOIN UsersGoods ug on u.user_id = ug.user_id
    JOIN Goods g ON ug.goods_id = g.goods_id
ORDER BY
    u.surname,
    u.name,
    u.PESEL,
    g.product;

-- Tabela po złączeniu:
SELECT
    *
FROM
    Users u
    JOIN UsersGoods ug on u.user_id = ug.user_id
    JOIN Goods g ON ug.goods_id = g.goods_id;