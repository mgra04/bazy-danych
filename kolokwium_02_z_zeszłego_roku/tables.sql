DROP TABLE IF EXISTS Students,
Grades;

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    surname VARCHAR(50) NOT NULL
);

CREATE TABLE Grades (
    name VARCHAR(5) NOT NULL,
    grade DECIMAL(3, 1) NOT NULL,
    student_id INT NOT NULL,
    PRIMARY KEY (student_id, name),
    FOREIGN KEY (student_id) REFERENCES STUDENTS (student_id)
);

INSERT INTO
    Students (student_id, name, surname)
VALUES
    (12, 'Tomasz', 'Nowak'),
    (23, 'Andrzej', 'Kowalski'),
    (21, 'Irena', 'Nowak'),
    (22, 'Irena', 'Kowalska'),
    (56, 'Tomasz', 'Kowalski'),
    (97, 'Anna', 'Lipinska'),
    (90, 'Tomasz', 'Sikorski'),
    (66, 'Adam', 'Sroka'),
    (99, 'Julia', 'Nowicka');

INSERT INTO
    Grades (name, grade, student_id)
VALUES
    ('K1', 5, 12),
    ('K1', 5, 21),
    ('K1', 5, 23),
    ('K1', 4, 22),
    ('K1', 4, 56),
    ('K1', 3, 90),
    ('K1', 3, 97),
    ('K2', 4, 12),
    ('K2', 4, 23),
    ('K2', 3, 21),
    ('K2', 3, 22),
    ('K3', 4, 12),
    ('K3', 3, 23),
    ('K3', 5, 21),
    ('K3', 3, 99);
