/*
14. Kolokwia, na których średnia ocen jest dokładnie równa 4.
*/
SELECT
    name
FROM
    Grades
GROUP BY
    name
HAVING
    avg(grade) = 4;