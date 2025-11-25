/*
2. Przypomnij sobie stosowanie polecenia CREATE TABLE i następnie utwórz nowy skrypt
s3.sql którego działanie będzie identyczne jak s2.sql, jednak:
a) należy wprowadzić automatyczn inkrementacja wartości atrybutów: user_id, goods_id
i vendor_id oraz usunąć ręczne ich wprowadzanie ze wszystkich zapytań.
b) atrybuty te odpowiednio w tabelach: User, Vendor i Goods będą kluczem głównym,
*/
DROP TABLE IF EXISTS UsersGoods,
GoodsVendor,
Goods,
Vendor,
Users;

CREATE TABLE Users (
    user_id INT IDENTITY (1, 1) PRIMARY KEY, -- tutaj dla mssql
    -- user_id INT AUTO_INCREMENT PRIMARY KEY, - tak musi być w mysql
    name VARCHAR(20) NOT NULL,
    surname VARCHAR(20) NOT NULL,
    PESEL CHAR(11) NOT NULL UNIQUE,
    born CHAR(10) NOT NULL
);

CREATE TABLE Vendor (
    vendor_id INT IDENTITY (1, 1) PRIMARY KEY, -- mssql
    -- vendor_id INT AUTO_INCREMENT PRIMARY KEY, --mysql
    name VARCHAR(22) NOT NULL,
    area VARCHAR(20) NOT NULL
);

CREATE TABLE Goods (
    goods_id INT IDENTITY (1, 1) PRIMARY KEY, --mssql
    -- goods_id INT AUTO_INCREMENT PRIMARY KEY, -- mysql
    product VARCHAR(20) NOT NULL UNIQUE
);

-- Wstawianie bez podawania id:
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

/*
W przypadku wypełniania treścią tabeli: UserGoods (por. z Z4) w miejsce wartości kluczy
użyj odpowiednio numeru PESEL zamiast user_id i product zamiast goods_id.

Po wprowadzeniu modyfikacji wykonaj skrypt i zapoznaj się z zawartością 
wszystkich pięciu tabel. Zwróć uwagę na warunkowe usuwanie tabeli oraz 
zapoznaj się z poleceniem tworzącym tabelę warunkowo.
*/
CREATE TABLE GoodsVendor (
    goods_id INT NOT NULL,
    vendor_id INT NOT NULL,
    PRIMARY KEY (goods_id, vendor_id),
    FOREIGN KEY (goods_id) REFERENCES Goods (goods_id),
    FOREIGN KEY (vendor_id) REFERENCES Vendor (vendor_id)
);

CREATE TABLE UsersGoods (
    PESEL CHAR(11) NOT NULL,
    product VARCHAR(20) NOT NULL,
    FOREIGN KEY (PESEL) REFERENCES Users (PESEL),
    FOREIGN KEY (product) REFERENCES Goods (product)
);

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
    UsersGoods (PESEL, product)
VALUES
    ('75020201234', 'refrigerator'),
    ('75020201234', 'washing machine'),
    ('75020201234', 'hair dryer'),
    ('75020201234', 'TV'),
    ('76030201034', 'refrigerator'),
    ('76030201034', 'hair dryer'),
    ('76030201034', 'TV'),
    ('76030201034', 'blue-ray player'),
    ('76030201034', 'satellite tuner'),
    ('75020203434', 'refrigerator'),
    ('75020203434', 'TV'),
    ('75020203434', 'satellite tuner'),
    ('79103001234', 'refrigerator'),
    ('79103001234', 'hair dryer'),
    ('79103001234', 'TV');