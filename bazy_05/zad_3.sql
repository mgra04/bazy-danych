/*
3. Zapoznaj się z istotą indeksów w tym unikalnych indeksów oraz kluczy (UNIQUE KEY)
Kiedy stosujemy indeksy?
Indeksy stosujemy gdy:
- kolumna jest często używana w WHERE, JOIN, ORDER BY
- kolumna jest kluczem obcym

Indeks przyspiesza wyszukiwanie, ale spowalnia insert/update/delete.
Nie należy indeksować każdej kolumny — tylko te, po których często wyszukujemy.

=============================================
Czym jest klucz główny w stosunku do indeksu unikalnego?
PRIMARY KEY - unikalność, brak NULL, maks 1 w tabeli, identyfikator
UNIQUE - unikalność
*/
/*
Wprowadź do skryptu s3.sql odpowiednie zmiany:
a) polegające na uniemożliwieniu wprowadzenia osoby o takim samym numerze PESEL
do tabeli: User, a także nazw produktu: product do tabeli: Goods.
PESEL CHAR(11) UNIQUE NOT NULL
product VARCHAR(20) UNIQUE NOT NULL

=============================================

b) atrybuty: user_id, goods_id i vendor_id w tabelach: GoodsVendor i UserGoods
powinny być kluczami obcymi **) ***). Po zapoznaniu się z dokumentacją wprowadź
odpowiednie powiązania tabel: GoodsVendor z tabelami: Vendor i Goods, oraz UserGoods
z tabelami: User i Goods (nie używaj opcjonalnych klauzul dla powiązań, tj.: ON DELETE
i ON UPDATE).
GoodsVendor
FOREIGN KEY (goods_id) REFERENCES Goods (goods_id)
FOREIGN KEY (vendor_id) REFERENCES Vendor (vendor_id)
UsersGoods
FOREIGN KEY (user_id) REFERENCES Users (user_id)
FOREIGN KEY (goods_id) REFERENCES Goods (goods_id)

=============================================

c) polegające na uniemożliwieniu wprowadzenia duplikatów krotek do tabel:
GoodsVendor i UserGoods.
GoodsVendor
PRIMARY KEY (goods_id, vendor_id)
UsersGoods
PRIMARY KEY (user_id, goods_id)

=============================================

d) czy potrafisz wprowadzić takie zmiany aby wartości kluczy w tabelach: User, Vendor
i Goods zaczynały się jak dotychczas, tj. odpowiednio od wartości: 1000, 2000 i 3000?
mssql:
user_id INT IDENTITY(1000,1) PRIMARY KEY
goods_id INT IDENTITY(2000,1) PRIMARY KEY
vendor_id INT IDENTITY(3000,1) PRIMARY KEY
mysql:
CREATE TABLE Users (
user_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(20) NOT NULL,
surname VARCHAR(20) NOT NULL,
PESEL CHAR(11) NOT NULL UNIQUE,
born CHAR(10) NOT NULL
) AUTO_INCREMENT = 1000;
CREATE TABLE Vendor (
vendor_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(22) NOT NULL,
area VARCHAR(20) NOT NULL
) AUTO_INCREMENT = 2000;
CREATE TABLE Vendor (
vendor_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(22) NOT NULL,
area VARCHAR(20) NOT NULL
) AUTO_INCREMENT = 2000;
*/