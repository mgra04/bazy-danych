SELECT
    publisher,
    count(*) AS num_books
FROM
    books
GROUP BY
    publisher
HAVING
    count(*) > 1;