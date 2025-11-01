-- Podpowiedż do zadania którą orzeszek wrzucił
SELECT
    publisher,
    count(DISTINCT topic) AS distinct_topic,
    count(topic) AS topic
FROM
    books
GROUP BY
    publisher;

-- L
SELECT
    publisher
FROM
    books
GROUP BY
    publisher
HAVING
    count(DISTINCT topic) >= 2;