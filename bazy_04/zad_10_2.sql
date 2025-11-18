/*
10.2. Wyświetl pełne dane użytkowników nie mających lodówek.
Użyj stosownego identyfikatora: goods_id (10.2.1), a następnie nazwy: 'refrigerator' (10.2.2).
*/
--Z użyciem goods_id:
SELECT
    *
FROM
    Users
WHERE
    user_id NOT IN (
        SELECT
            user_id
        FROM
            UsersGoods
        WHERE
            goods_id = 2000
    );

--Z użyciem nazwy: 'refrigerator'
SELECT
    *
FROM
    Users
WHERE
    user_id NOT IN (
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
                    product = 'refrigerator'
            )
    );