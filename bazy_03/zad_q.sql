-- Q1
SELECT
    publisher,
    count(topic),
    avg(price),
    min(price),
    max(price),
    max(price) - min(price)
FROM
    books
GROUP BY
    publisher;

-- Q2
SELECT
    publisher,
    count(topic),
    round(avg(price), 2),
    min(price),
    max(price),
    round(max(price) - min(price), 2)
FROM
    books
GROUP BY
    publisher;

-- Q3
SELECT
    publisher,
    count(topic) AS topics,
    round(avg(price), 2) AS avg,
    min(price) AS min,
    max(price) AS max,
    round(max(price) - min(price), 2) AS range
FROM
    books
GROUP BY
    publisher;

-- Jakieś dodatkowe pierdoły do sprawdzenia
select
    topic,
    count(*)
from
    books
group by
    topic;

select
    topic kategoria,
    count(*) liczba
from
    books
group by
    topic;

select
    topic kategoria,
    count(*) 'liczba książek'
from
    books
group by
    topic;

-- select
--     topic kategoria,
--     count(*) 'liczba książek'
-- from
--     books
-- group by
--     kategoria;
--
-- select
--     topic 'kategoria',
--     count(*) 'liczba książek'
-- from
--     books
-- group by
--     kategoria;
--
-- select
--     topic 'kategoria',
--     count(*) 'liczba książek'
-- from
--     books
-- group by
--     'kategoria';
--
-- select
--     topic 'kategoria',
--     count(*) 'liczba książek'
-- from
--     books
-- group by
--     `kategoria`;