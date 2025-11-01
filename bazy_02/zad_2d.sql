SELECT
    topic,
    count(*) AS number
FROM
    books
GROUP BY
    topic;