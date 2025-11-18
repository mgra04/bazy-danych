/*
10.1. Wyświetl pełne dane użytkowników mających suszarki.
Użyj stosownego identyfikatora: goods_id (10.1.1), a następnie nazwy: 'hair dryer' (10.1.2).
*/
-- Rozwiązanie 1 z użyciem goods_id
SELECT
    *
FROM
    Users
WHERE
    user_id IN (
        SELECT
            user_id
        FROM
            UsersGoods
        WHERE
            goods_id = 2002
    );

-- Rozwiązanie 1 z użyciem nazwy: 'hair dryer'
SELECT
    *
FROM
    Users
WHERE
    user_id IN (
        SELECT
            user_id
        FROM
            UsersGoods
        WHERE
            goods_id IN (
                SELECT
                    goods_id
                FROM
                    Goods
                WHERE
                    product = 'hair dryer'
            )
    );

-- Rozwiązanie 2 z użyciem goods_id
SELECT DISTINCT
    u.*
FROM
    Users u
    JOIN UsersGoods ug ON u.user_id = ug.user_id
    AND ug.goods_id = 2002;

-- Rozwiązanie 2 z użyciem nazwy: 'hair dryer'
SELECT DISTINCT
    u.*
FROM
    Users u
    JOIN UsersGoods ug ON u.user_id = ug.user_id
    JOIN Goods g ON ug.goods_id = g.goods_id
WHERE
    g.product = 'hair dryer';