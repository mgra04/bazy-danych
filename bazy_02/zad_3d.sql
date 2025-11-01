-- Rozwiązanie 1
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
    ) = 0;

-- Rozwiązanie 2
SELECT
    publisher
FROM
    books
WHERE
    topic = 'Java'
    and publisher NOT IN (
        SELECT
            publisher
        FROM
            books
        WHERE
            topic = 'Perl'
    )
GROUP BY
    publisher;