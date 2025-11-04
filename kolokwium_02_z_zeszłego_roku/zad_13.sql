/*
13. Kolokwia, gdzie maksymalna ocena była równa 5 i średnia ocen była wyższa niż 4.
*/
SELECT
    name
FROM
    Grades
GROUP BY
    name
HAVING
    avg(grade) > 4
    AND max(grade) = 5;