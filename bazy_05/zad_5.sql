-- 5. Spróbuj wykonać następujące polecenie:  delete from User where user_id=1000;
-- delete from Users
-- where
--     user_id = 1000;
/*
Błąd:
The DELETE statement conflicted with the REFERENCE constraint "FK__UsersGood__user___11158940". The conflict occurred 
in database "BookDB", table "dbo.UsersGoods", column 'user_id'. The statement has been terminated.

Dlaczego rekord nie może zostać usunięty?
Bo naruszyłoby to integralność referencyjną – klucz obcy w UsersGoods wymaga,aby każdy user_id wskazywał na 
istniejącego użytkownika.

Zaproponuj zmiany używając właściwej klauzuli ON DELETE
*/
DROP TABLE IF EXISTS UsersGoods
CREATE TABLE UsersGoods (
    user_id INT NOT NULL,
    goods_id INT NOT NULL,
    PRIMARY KEY (user_id, goods_id),
    FOREIGN KEY (user_id) REFERENCES Users (user_id) ON DELETE CASCADE,
    FOREIGN KEY (goods_id) REFERENCES Goods (goods_id) ON DELETE CASCADE
);

DELETE FROM Users
WHERE
    user_id = 1000;
