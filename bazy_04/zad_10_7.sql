/*
10.7. Wyświetl pełne dane użytkowników mających najwięcej sprzętów domowych.
*/
-- Rozwiązanie 1:
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
        GROUP BY
            user_id
        HAVING
            count(*) = (
                SELECT
                    max(num_products)
                FROM
                    (
                        SELECT
                            count(*) AS num_products
                        FROM
                            UsersGoods
                        GROUP BY
                            user_id
                    ) AS temp
            )
    );

-- Rozwiązanie 2:
WITH
    NumProducts AS (
        SELECT
            user_id,
            count(*) AS num_products
        FROM
            UsersGoods
        GROUP BY
            user_id
    ),
    MaxCount AS (
        SELECT
            max(num_products) AS max_count
        FROM
            NumProducts
    )
SELECT
    u.*
FROM
    Users u
    JOIN NumProducts np ON u.user_id = np.user_id
    JOIN MaxCount mc ON np.num_products = mc.max_count;