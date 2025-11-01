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
            count(DISTINCT topic) > 1
    )
ORDER BY
    topic;
