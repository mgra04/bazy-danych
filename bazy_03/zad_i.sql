-- I1
SELECT
    publisher,
    count(*) as num_books
FROM
    books
GROUP BY
    publisher;

-- I2
SELECT
    avg(num_books * 1.0) AS avg_books
FROM
    (
        SELECT
            count(*) AS num_books
        FROM
            books
        GROUP BY
            publisher
    ) AS temp;

-- I2 drugie rozwiązanie
WITH
    PublisherBooks AS (
        SELECT
            count(*) AS num_books
        FROM
            books
        GROUP BY
            publisher
    )
SELECT
    avg(num_books * 1.0) AS avg_books
FROM
    PublisherBooks;