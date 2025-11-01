-- Rozwiązanie 1
SELECT
    publisher
FROM
    books
GROUP BY
    publisher
HAVING
    count(DISTINCT topic) >= 2
    AND sum(
        CASE
            WHEN topic = 'Java' THEN 1
            ELSE 0
        END
    ) = 0;

-- Rozwiązanie 2
SELECT
    publisher
FROM
    books
WHERE
    publisher NOT IN (
        SELECT
            publisher
        FROM
            books
        WHERE
            topic = 'Java'
        GROUP BY
            publisher
    )
GROUP BY
    publisher
HAVING
    count(DISTINCT topic) >= 2;