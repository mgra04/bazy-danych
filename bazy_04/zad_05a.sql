-- SET sql_mode = '';
/*
Polecenie to czyści (resetuje) tryb SQL, ustawiając go na pusty zestaw.
W praktyce oznacza to wyłączenie wszystkich specjalnych trybów, takich jak:

STRICT_TRANS_TABLES — rygorystyczne sprawdzanie poprawności danych

NO_ZERO_DATE — zakaz wstawiania dat z zerami

ONLY_FULL_GROUP_BY — wymaganie poprawnych kolumn w GROUP BY

ANSI_QUOTES — traktowanie " jako cudzysłowu identyfikatora

*/
--SET sql_notes=0;
/*
Wyłącza notyfikacje (NOTES) generowane przez MySQL.
To nie są ERRORS ani WARNINGS — tylko informacyjne komunikaty, np.:

„Records: 10 Duplicates: 0 Warnings: 1”

Komunikaty o automatycznym dodawaniu wartości domyślnych
*/