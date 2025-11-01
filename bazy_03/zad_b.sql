SELECT
    *
FROM
    books
WHERE
    price > (
        SELECT
            avg(price)
        FROM
            books
    );
