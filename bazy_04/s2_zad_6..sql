DROP TABLE IF EXISTS Users,
Vendor,
Goods;

CREATE TABLE Users (
    name VARCHAR(20),
    surname VARCHAR(20),
    PESEL CHAR(11),
    born CHAR(10),
    user_id INT NOT NULL
);

CREATE TABLE Vendor (
    name VARCHAR(22),
    area VARCHAR(20),
    vendor_id INT NOT NULL
);

CREATE TABLE Goods (product VARCHAR(20), goods_id INT NOT NULL);

INSERT INTO
    Users (name, surname, PESEL, born, user_id)
VALUES
    (
        'Jan',
        'Kowalski',
        '75020201234',
        '02.02.1975',
        1000
    ),
    (
        'Jan',
        'Kowalski',
        '76030201034',
        '02.03.1976',
        1001
    ),
    (
        'Andrzej',
        'Nowak',
        '75020203434',
        '02.02.1975',
        1002
    ),
    (
        'Anna',
        'Kowalska',
        '79103001234',
        '30.10.1979',
        1003
    );

INSERT INTO
    Vendor (name, area, vendor_id)
VALUES
    ('Your Gorgeous Bathroom', 'bathroom', 3000),
    ('World of Satellites', 'TV SAT', 3001),
    ('Super Coffee', 'coffee makers', 3002),
    ('A.B.C.D.', 'hifi', 3003),
    ('Dry Hair', 'hair dryers', 3004);

INSERT INTO
    Goods (product, goods_id)
VALUES
    ('refrigerator', 2000),
    ('washing machine', 2001),
    ('hair dryer', 2002),
    ('TV', 2003),
    ('blue-ray player', 2004),
    ('satellite tuner', 2005);