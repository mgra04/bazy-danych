-- idk czy o to chodziło...
SELECT
    publisher
FROM
    books
WHERE
    topic IN ('Java', 'Perl')
GROUP BY
    publisher
HAVING
    count(DISTINCT topic) = 2;