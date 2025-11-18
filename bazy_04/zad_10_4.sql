/*
10.4. Wyświetl pełne dane użytkowników mających tv lub sprzęt satelitarny.
Użyj identyfikatora: goods_id (10.4.1) a następnie nazw: 'satellite tuner' i 'tv' (10.4.2).
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
    );

-- Rozwiązanie 2 z użyciem goods_id:
SELECT DISTINCT
    u.*
FROM
    Users u
    JOIN UsersGoods ug ON u.user_id = ug.user_id
WHERE
    ug.goods_id IN (2003, 2005);

-- Rozwiązanie 2 z użyciem nazw: 'satellite tuner' i 'TV':
SELECT DISTINCT
    u.*
FROM
    Users u
    JOIN UsersGoods ug ON u.user_id = ug.user_id
    JOIN Goods g ON ug.goods_id = g.goods_id
WHERE
    g.product IN ('TV', 'satellite tuner');
