SELECT
    publisher
FROM
    books
GROUP BY
    publisher
HAVING
    count(DISTINCT topic) > 1;