SELECT
    min(price) AS min_price,
    max(price) AS max_price,
    avg(price) AS avg_price
FROM
    books;