/*
6. Zastanów się jakie klauzule powinny być zastosowane dla wszystkich kluczy obcych.
Wszystkie klucze obce → CASCADE / CASCADE bo
- UsersGoods i GoodsVendor to tabele pomocnicze, które nie mają sensu bez rekordów nadrzędnych
- Zapobiega to dangling references
- Upraszcza logikę aplikacji i nie wymaga ręcznego kasowania powiązań
*/