/*
10.6. Wyświetl pełne dane użytkowników mających tv lecz nie mających zmywarki.
Użyj identyfikatora: goods_id (10.6.1) a następnie nazw:'washing machine' i 'tv'  (10.6.2).
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
            goods_id = 2003
    )
    AND user_id NOT IN (
        SELECT
            user_id
        FROM
            UsersGoods
        WHERE
            goods_id = 2001
    );

-- Rozwiązanie 1 z użyciem nazw:'washing machine' i 'tv':
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
                    product = 'tv'
            )
    )
    AND user_id NOT IN (
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
                    product = 'washing machine'
            )
    );

-- Rozwiązanie 2 z użyciem goods_id:
SELECT
    u.*
FROM
    Users u
    JOIN UsersGoods ug_tv ON u.user_id = ug_tv.user_id
    AND ug_tv.goods_id = 2003
WHERE
    NOT EXISTS (
        SELECT
            1
        FROM
            UsersGoods ug_wm
        WHERE
            ug_wm.user_id = u.user_id
            AND ug_wm.goods_id = 2001
    );

-- Rozwiązanie 2 z użyciem nazw:'washing machine' i 'tv':
SELECT
    u.*
FROM
    Users u
    JOIN UsersGoods ug_tv ON u.user_id = ug_tv.user_id
    JOIN Goods g_tv ON ug_tv.goods_id = g_tv.goods_id
    AND g_tv.product = 'TV'
WHERE
    NOT EXISTS (
        SELECT
            1
        FROM
            UsersGoods ug_wm
            JOIN Goods g_wm ON ug_wm.goods_id = g_wm.goods_id
        WHERE
            ug_wm.user_id = u.user_id
            AND g_wm.product = 'washing machine'
    );