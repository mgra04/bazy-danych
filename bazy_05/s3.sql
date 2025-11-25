DROP TABLE IF EXISTS UsersGoods,
GoodsVendor,
Goods,
Vendor,
Users;

CREATE TABLE Users (
    user_id INT IDENTITY (1000, 1) PRIMARY KEY, -- tutaj dla mssql
    -- user_id INT AUTO_INCREMENT PRIMARY KEY, - tak musi być w mysql
    name VARCHAR(20) NOT NULL,
    surname VARCHAR(20) NOT NULL,
    PESEL CHAR(11) NOT NULL UNIQUE,
    born CHAR(10) NOT NULL
) -- AUTO_INCREMENT = 1000; - tak w mysql jak user_id ma zaczynać się od 1000
;

CREATE TABLE Vendor (
    vendor_id INT IDENTITY (2000, 1) PRIMARY KEY, -- mssql
    -- vendor_id INT AUTO_INCREMENT PRIMARY KEY, --mysql
    name VARCHAR(22) NOT NULL,
    area VARCHAR(20) NOT NULL
) -- AUTO_INCREMENT = 2000; - mysql
;

CREATE TABLE Goods (
    goods_id INT IDENTITY (3000, 1) PRIMARY KEY, --mssql
    -- goods_id INT AUTO_INCREMENT PRIMARY KEY, -- mysql
    product VARCHAR(20) NOT NULL UNIQUE
) -- AUTO_INCREMENT = 3000; - mysql
;

CREATE TABLE GoodsVendor (
    goods_id INT NOT NULL,
    vendor_id INT NOT NULL,
    PRIMARY KEY (goods_id, vendor_id),
    FOREIGN KEY (goods_id) REFERENCES Goods (goods_id),
    FOREIGN KEY (vendor_id) REFERENCES Vendor (vendor_id)
);

CREATE TABLE UsersGoods (
    user_id INT NOT NULL,
    goods_id INT NOT NULL,
    PRIMARY KEY (user_id, goods_id),
    FOREIGN KEY (user_id) REFERENCES Users (user_id),
    FOREIGN KEY (goods_id) REFERENCES Goods (goods_id)
);

INSERT INTO
    Users (name, surname, PESEL, born)
VALUES
    ('Jan', 'Kowalski', '75020201234', '02.02.1975'),
    ('Jan', 'Kowalski', '76030201034', '02.03.1976'),
    ('Andrzej', 'Nowak', '75020203434', '02.02.1975'),
    ('Anna', 'Kowalska', '79103001234', '30.10.1979');

INSERT INTO
    Vendor (name, area)
VALUES
    ('Your Gorgeous Bathroom', 'bathroom'),
    ('World of Satellites', 'TV SAT'),
    ('Super Coffee', 'coffee makers'),
    ('A.B.C.D.', 'hifi'),
    ('Dry Hair', 'hair dryers');

INSERT INTO
    Goods (product)
VALUES
    ('refrigerator'),
    ('washing machine'),
    ('hair dryer'),
    ('TV'),
    ('blue-ray player'),
    ('satellite tuner');

INSERT INTO
    GoodsVendor (vendor_id, goods_id)
SELECT
    v.vendor_id,
    g.goods_id
FROM
    Vendor v
    JOIN Goods g ON g.product = 'washing machine'
WHERE
    v.name = 'Your Gorgeous Bathroom';

INSERT INTO
    GoodsVendor (vendor_id, goods_id)
SELECT
    v.vendor_id,
    g.goods_id
FROM
    Vendor v
    JOIN Goods g ON g.product = 'hair dryer'
WHERE
    v.name = 'Your Gorgeous Bathroom';

INSERT INTO
    GoodsVendor (vendor_id, goods_id)
SELECT
    v.vendor_id,
    g.goods_id
FROM
    Vendor v
    JOIN Goods g ON g.product = 'satellite tuner'
WHERE
    v.name = 'World of Satellites';

INSERT INTO
    GoodsVendor (vendor_id, goods_id)
SELECT
    v.vendor_id,
    g.goods_id
FROM
    Vendor v
    JOIN Goods g ON g.product = 'TV'
WHERE
    v.name = 'A.B.C.D.';

INSERT INTO
    GoodsVendor (vendor_id, goods_id)
SELECT
    v.vendor_id,
    g.goods_id
FROM
    Vendor v
    JOIN Goods g ON g.product = 'blue-ray player'
WHERE
    v.name = 'A.B.C.D.';

INSERT INTO
    GoodsVendor (vendor_id, goods_id)
SELECT
    v.vendor_id,
    g.goods_id
FROM
    Vendor v
    JOIN Goods g ON g.product = 'satellite tuner'
WHERE
    v.name = 'A.B.C.D.';

INSERT INTO
    GoodsVendor (vendor_id, goods_id)
SELECT
    v.vendor_id,
    g.goods_id
FROM
    Vendor v
    JOIN Goods g ON g.product = 'hair dryer'
WHERE
    v.name = 'Dry Hair';

INSERT INTO
    UsersGoods (user_id, goods_id)
VALUES
    (1000, 3000),
    (1000, 3001),
    (1000, 3002),
    (1000, 3003),
    (1001, 3000),
    (1001, 3002),
    (1001, 3003),
    (1001, 3004),
    (1001, 3005),
    (1002, 3000),
    (1002, 3003),
    (1002, 3005),
    (1003, 3000),
    (1003, 3002),
    (1003, 3003);