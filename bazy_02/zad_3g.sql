SELECT
    *
FROM
    books
WHERE
    topic = 'XML'
    AND title NOT LIKE '%XML%';