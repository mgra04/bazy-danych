-- Rozwiązanie 1
WITH
    PublisherBooks AS (
        SELECT
            publisher,
            count(*) AS publisher_books
        FROM
            books
        GROUP BY
            publisher
    )
SELECT
    publisher
FROM
    PublisherBooks
WHERE
    publisher_books > (
        SELECT
            AVG(publisher_books * 1.0)
        FROM
            PublisherBooks
    );

-- Rozwiązanie 2
SELECT
    publisher
FROM
    (
        SELECT
            publisher,
            COUNT(*) AS publisher_books
        FROM
            books
        GROUP BY
            publisher
    ) AS PublisherBooks
WHERE
    publisher_books > (
        SELECT
            AVG(publisher_books * 1.0)
        FROM
            (
                SELECT
                    publisher,
                    COUNT(*) AS publisher_books
                FROM
                    books
                GROUP BY
                    publisher
            ) AS AvgTable
    );