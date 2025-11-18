/*
10.3. Wyświetl pełne dane użytkowników mających tv i sprzęt satelitarny.
Użyj identyfikatora: goods_id (10.3.1) a następnie nazw: 'satellite tuner' i 'TV' (10.3.2).
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
            count(DISTINCT goods_id) = 2
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
            count(DISTINCT goods_id) = 2
    );

-- Rozwiązanie 2 z użyciem goods_id:
SELECT DISTINCT
    u.*
FROM
    Users u
    JOIN UsersGoods ug1 ON u.user_id = ug1.user_id
    AND ug1.goods_id = 2003
    JOIN UsersGoods ug2 ON u.user_id = ug2.user_id
    AND ug2.goods_id = 2005;

-- Rozwiązanie 2 z użyciem nazw: 'satellite tuner' i 'TV':
SELECT DISTINCT
    u.*
FROM
    Users u
    JOIN UsersGoods ug1 ON u.user_id = ug1.user_id
    JOIN Goods g1 ON ug1.goods_id = g1.goods_id
    AND g1.product = 'TV'
    JOIN UsersGoods ug2 ON u.user_id = ug2.user_id
    JOIN Goods g2 ON ug2.goods_id = g2.goods_id
    AND g2.product = 'satellite tuner';
