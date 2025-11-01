DROP TABLE IF EXISTS Users,
Goods,
Vendor;

-- Tabela User
CREATE TABLE Users (
    name VARCHAR(20),
    surname VARCHAR(20),
    PESEL VARCHAR(20),
    born VARCHAR(20),
    user_id INT NOT NULL
);

-- Tabela Goods
CREATE TABLE Goods (product VARCHAR(20), goods_id INT NOT NULL);

-- Tabela Vendor
CREATE TABLE Vendor (
    name VARCHAR(20),
    area VARCHAR(20),
    vendor_id INT NOT NULL
);