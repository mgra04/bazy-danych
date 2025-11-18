DROP TABLE IF EXISTS UsersGoods;

CREATE TABLE UsersGoods (user_id INT NOT NULL, goods_id INT NOT NULL);

INSERT INTO
    UsersGoods (user_id, goods_id)
VALUES
    (1000, 2000),
    (1000, 2001),
    (1000, 2002),
    (1000, 2003),
    (1001, 2000),
    (1001, 2002),
    (1001, 2003),
    (1001, 2004),
    (1001, 2005),
    (1002, 2000),
    (1002, 2003),
    (1002, 2005),
    (1003, 2000),
    (1003, 2002),
    (1003, 2003);