-- h1
SELECT
    topic,
    count(*) AS num_books
FROM
    books
GROUP BY
    topic;

-- h2
SELECT
    avg(num_books * 1.0) AS avg_books
FROM
    (
        SELECT
            count(*) AS num_books
        FROM
            books
        GROUP BY
            topic
    ) AS temp;

-- h2 drugie rozwiązanie
WITH
    BooksPerTopic AS (
        SELECT
            count(*) AS num_books
        FROM
            books
        GROUP BY
            topic
    )
SELECT
    avg(num_books * 1.0)
FROM
    BooksPerTopic;