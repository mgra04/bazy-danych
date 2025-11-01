-- O1
SELECT
    publisher,
    topic,
    count(*) AS number
FROM
    books
GROUP BY
    publisher,
    topic;

-- O
SELECT
    publisher
FROM
    books
WHERE
    topic IN ('Java', 'Perl')
GROUP BY
    publisher
HAVING
    count(DISTINCT topic) = 1
    AND count(*) < 3;