SELECT
    publisher
FROM
    books
WHERE
    topic IN ('Java', 'Perl')
GROUP BY
    publisher;
