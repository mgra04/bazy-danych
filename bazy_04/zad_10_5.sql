/*
10.5. Wyświetl pełne dane użytkowników mających albo tv albo sprzęt satelitarny.
Użyj identyfikatora: goods_id (10.5.1) a następnie nazw: 'satellite tuner' i 'tv' (10.5.2).
*/
-- Rozwiązanie 1 z użyciem goods_id:
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
            goods_id IN (2003, 2005)
        GROUP BY
            user_id
        HAVING
            count(DISTINCT goods_id) = 1
    );

-- Rozwiązanie 1 z użyciem nazw: 'satellite tuner' i 'TV':
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
                    product IN ('satellite tuner', 'TV')
            )
        GROUP BY
            user_id
        HAVING
            count(DISTINCT goods_id) = 1
    );

-- Rozwiązanie 2 z użyciem goods_id:
SELECT
    u.*
FROM
    Users u
    JOIN UsersGoods ug ON u.user_id = ug.user_id
WHERE
    ug.goods_id IN (2003, 2005)
GROUP BY
    u.user_id,
    u.name,
    u.surname,
    u.PESEL,
    u.born
HAVING
    count(DISTINCT ug.goods_id) = 1;

-- Rozwiązanie 2 z użyciem nazw: 'satellite tuner' i 'TV':
SELECT
    u.*
FROM
    Users u
    JOIN UsersGoods ug ON u.user_id = ug.user_id
    JOIN Goods g ON ug.goods_id = g.goods_id
WHERE
    g.product IN ('TV', 'satellite tuner')
GROUP BY
    u.user_id,
    u.name,
    u.surname,
    u.PESEL,
    u.born
HAVING
    count(DISTINCT g.product) = 1;
