-- Rozwiązanie 1
SELECT
    publisher,
    topic
FROM
    books
GROUP BY
    publisher,
    topic;

-- Rozwiązanie 2
SELECT DISTINCT
    publisher,
    topic
FROM
    books;