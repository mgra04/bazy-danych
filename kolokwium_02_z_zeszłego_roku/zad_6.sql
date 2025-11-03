/*
6. Znajdź kolokwia, na których dominowała jedna ocena.
Dominującą oceną na kolokwium nazywamy ocenę, którą uzyskało co najmniej połowę uczestników danego kolokwium.
Wynik powinien zawierać nazwę kolokwium (quiz), dominującą ocenę (dominant_grade) oraz liczbę uczestników,
którzy uzyskali tę ocenę (count_dominant). Wynik należy posortować według nazwy kolokwium (quiz) i 
liczby uczestników (count_dominant) malejąco.

Uwaga:
To zadanie jest rozjebane bo w przypadku drugiego kolowkium (K2) wychodzi, że są 2 oceny dominujące,
a musimy podać te w których dominowała jedna ocena co dodatkowo komplikuje zadanie. Z drugiej strony
pod zadaniem dał tabelkę z prawidłową odpowiedzią (czy odpowiedziom? idk słaby z polskiego jestem)
w której K2 się powiela więc orzeszek odjebał z poleceniem do zadania...
*/
-- Rozwiązanie 1 (dla kolokwium drugiego wyświetla dwie dominujące oceny.
-- Niby tak jak w tabelce która pokazuje prawidłowy wynik, ale nie zgodnie z poleceniem)
SELECT
    g1.name AS quiz,
    g1.grade AS dominant_grade,
    count(*) AS count_dominant
FROM
    Grades g1
    JOIN (
        SELECT
            name,
            count(*) AS total_students
        FROM
            Grades
        GROUP BY
            name
    ) g2 ON g1.name = g2.name
GROUP BY
    g1.name,
    g1.grade,
    g2.total_students
HAVING
    count(*) >= ceiling(g2.total_students / 2.0) --w MySQL ceil zamiast ceiling
ORDER BY
    quiz ASC,
    count_dominant DESC;

-- Rozwiązanie 1`:
SELECT
    g.name AS quiz,
    g.grade AS dominant_grade,
    count(*) AS count_dominant
FROM
    Grades g
GROUP BY
    g.name,
    g.grade
HAVING
    count(*) >= (
        SELECT
            ceiling(count(*) / 2.0) --w MySQL ceil zamiast ceiling
        FROM
            Grades g2
        WHERE
            g2.name = g.name
    )
ORDER BY
    quiz ASC,
    count_dominant DESC;

-- Rozwiązanie 2 (pozbywamy się kolokwium w których jest więcej niż 1 dominująca ocena):
-- Tworzymy 3 tabele:
-- QuizTotals - nazwa kolokwia i ilość studentów która je pisała
-- GradeCounts - nazwa kolokwia, ocena, ilość studentów która uzyskała daną ocene i łączna ilość studentów z QuizTotals
-- Dominant - wybiera tylko te kolokwia z GradeCounts w których jest ocena/są oceny dominująca/e
WITH
    QuizTotals AS (
        SELECT
            name AS quiz,
            count(*) AS total_students
        FROM
            Grades
        GROUP BY
            name
    ),
    GradeCounts AS (
        SELECT
            g.name AS quiz,
            g.grade AS grade,
            count(*) AS grade_count,
            qt.total_students
        FROM
            Grades g
            JOIN QuizTotals qt ON g.name = qt.quiz
        GROUP BY
            g.name,
            g.grade,
            qt.total_students
    ),
    Dominant AS (
        SELECT
            *
        FROM
            GradeCounts
        WHERE
            grade_count >= ceiling(total_students / 2.0) --w MySQL ceil zamiast ceiling
    )
SELECT
    d.quiz,
    grade 'dominant_grade',
    grade_count 'count_dominant'
FROM
    Dominant d
    JOIN (
        SELECT
            quiz
        FROM
            Dominant
        GROUP BY
            quiz
        HAVING
            count(*) = 1
    ) d2 ON d.quiz = d2.quiz
ORDER BY
    d.quiz ASC,
    dominant_grade DESC;

-- Rozwiązanie 2' lub 3 (końcówka się różni, mniej wydajne)
WITH
    QuizTotals AS (
        SELECT
            name AS quiz,
            count(*) AS total_students
        FROM
            Grades
        GROUP BY
            name
    ),
    GradeCounts AS (
        SELECT
            g.name AS quiz,
            g.grade AS grade,
            count(*) AS grade_count,
            qt.total_students
        FROM
            Grades g
            JOIN QuizTotals qt ON g.name = qt.quiz
        GROUP BY
            g.name,
            g.grade,
            qt.total_students
    ),
    Dominant AS (
        SELECT
            *
        FROM
            GradeCounts
        WHERE
            grade_count >= ceiling(total_students / 2.0) --w MySQL ceil zamiast ceiling
    )
SELECT
    d.quiz,
    d.grade 'dominant_grade',
    d.grade_count 'count_dominant'
FROM
    Dominant d
GROUP BY
    d.quiz,
    d.grade,
    d.grade_count
HAVING
    (
        SELECT
            count(d2.grade)
        FROM
            Dominant d2
        WHERE
            d.quiz = d2.quiz
        GROUP BY
            d2.quiz
    ) = 1
ORDER BY
    d.quiz ASC,
    dominant_grade DESC;

-- Tutaj pokazane jak wygląda GradeCounts przez wyznaczeniem kolokwiów z dominującą oceną w tabeli dominant
WITH
    QuizTotals AS (
        SELECT
            name AS quiz,
            count(*) AS total_students
        FROM
            Grades
        GROUP BY
            name
    ),
    GradeCounts AS (
        SELECT
            g.name AS quiz,
            g.grade AS grade,
            count(*) AS grade_count,
            qt.total_students
        FROM
            Grades g
            JOIN QuizTotals qt ON g.name = qt.quiz
        GROUP BY
            g.name,
            g.grade,
            qt.total_students
    )
SELECT
    *
FROM
    GradeCounts;

-- Dla tych co nie zrobili sobie poradnika i nie testują w terminalu to tabela wygląda tak:
/*
quiz | grade | grade_count | total_students
------------------------------------------
K1   | 3.0     | 2           | 7
K1   | 4.0     | 2           | 7
K1   | 5.0     | 3           | 7
K2   | 3.0     | 2           | 4
K2   | 4.0     | 2           | 4
K3   | 3.0     | 2           | 4
K3   | 4.0     | 1           | 4
K3   | 5.0     | 1           | 4

Tutaj już widać, że w K1 nie ma dominującej oceny, w K2 są dwie, a w K3 jedna.
W tabeli Dominant bierzemy te wartości gdzie:
grade_count >= ceiling(total_students / 2.0)
Tyle, że problem jest taki, że K2 z oceną 3.0 i 4.0 przejdzie dalej dlatego
w końcowej części wybieramy sobie te atrybuty z tabeli Dominant które nas intersują
(quiz, grade, grade_count), dodajemy im aliasy które są w poleceniu (quiz, dominant_grade, count_dominant)
i warunek żeby odsiać kolokwia w których jest więcej niż jedna dominująca ocena 
(napisałem 2 przykłady jak można to zrobić)
*/
