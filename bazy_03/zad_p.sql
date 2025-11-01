-- P
SELECT
    publisher,
    topic,
    avg(price) AS avg_price,
    min(price) AS min_price,
    max(price) AS max_price
FROM
    books
GROUP BY
    publisher,
    topic;

-- P'
SELECT
    publisher,
    topic,
    round(avg(price), 2) AS avg_price,
    min(price) AS min_price,
    max(price) AS max_price
FROM
    books
GROUP BY
    publisher,
    topic;