/*
4. Wyświetl listę osób które w ogóle nie pisały żadnego kolokwium.
*/
SELECT
    *
FROM
    Students
WHERE
    student_id NOT IN (
        SELECT
            student_id
        FROM
            Grades
    );

/*
+------------+------+---------+
| student_id | name | surname |
+------------+------+---------+
|         66 | Adam | Sroka   |
+------------+------+---------+
*/