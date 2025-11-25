/*
TABAELE DO WIZUALIZACJI
CREATE TABLE Vendor (
name VARCHAR(20),
area VARCHAR(20),
vendor_id INT NOT NULL
);

CREATE TABLE GoodsVendor (
goods_id INT NOT NULL,
vendor_id INT NOT NULL
);
=========================================
a) Sprawdź zawartość tabel: Vendor oraz GoodsVendor czy zawartość jest właściwa?
Tabela Vendor:
- Brak primary key - vendor_id powinno być kluczem głównym, bez tego baza nie zapewnia unikalności
- vendor_id nie jest auto_increment - wymóg ręcznego podawania id
- varchar(20) zbyt "małe" - nazwa 'Your Gorgeous Bathroom' ma 22 znaki
=========================================
Tabela GoodsVendor:
- Brak kluczy obcych - goods_id → Goods(goods_id), vendor_id → Vendor(vendor_id)
- Brak primary key - Dla relacji wiele-do-wielu powinien być klucz złożony (goods_id, vendor_id).
- Brak indeksów
=========================================
Czy w trakcie wykonywania skryptu pojawiły się błędy lub ostrzeżenia?
-- Warning: Data truncated for column 'name' at row 1
-- Powód: VARCHAR(20) jest za małe.
=========================================
Czy coś się zmieni, jeśli usuniemy NOT NULL z vendor_id w GoodsVendor?
-- wstawienie rekordu z vendor_id = NULL będzie dozwolone
-- tabela GoodsVendor może mieć "puste" powiązania
-- relacja wiele-do-wielu traci sens: NULL oznacza brak producenta

b) zaproponuj jakie zmiany powinno się wprowadzić aby skrypt działał właściwie
w szczególności aby pola były wypełniane prawidłowo oraz dziedziny były
odpowiednie z uwagi na charakter wprowadzanego tekstu.
*/
CREATE TABLE Vendor (
    vendor_id INT PRIMARY KEY,
    name VARCHAR(22) NOT NULL,
    area VARCHAR(20) NOT NULL
);

CREATE TABLE GoodsVendor (
    goods_id INT NOT NULL,
    vendor_id INT NOT NULL,
    PRIMARY KEY (goods_id, vendor_id),
    FOREIGN KEY (vendor_id) REFERENCES Vendor (vendor_id),
    FOREIGN KEY (goods_id) REFERENCES Goods (goods_id)
);