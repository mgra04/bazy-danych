SELECT
    publisher,
    topic,
    count(*) AS number
FROM
    books
GROUP BY
    publisher,
    topic
ORDER BY
    publisher,
    topic;