-- Rozwiązanie 1
SELECT
    *
FROM
    books
WHERE
    publisher IN (
        SELECT
            publisher
        FROM
            books
        GROUP BY
            publisher
        HAVING
            sum(
                CASE
                    WHEN topic = 'Java' THEN 1
                    ELSE 0
                END
            ) > 0
            AND sum(
                CASE
                    WHEN topic = 'Perl' THEN 1
                    ELSE 0
                END
            ) = 0
    )
ORDER BY
    topic;

-- Rozwiązanie 2
SELECT
    *
FROM
    books
WHERE
    publisher IN (
        SELECT
            publisher
        FROM
            books
        WHERE
            topic = 'Java'
            AND publisher NOT IN (
                SELECT
                    publisher
                FROM
                    books
                WHERE
                    topic = 'Perl'
                GROUP BY
                    publisher
            )
        GROUP BY
            publisher
    );
