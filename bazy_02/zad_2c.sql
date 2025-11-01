SELECT
    publisher,
    count(*) AS number
FROM
    books
GROUP BY
    publisher;