DROP TABLE IF EXISTS GoodsVendor,
UsersGoods;

CREATE TABLE GoodsVendor (goods_id INT NOT NULL, vendor_id INT NOT NULL);

CREATE TABLE UsersGoods (user_id INT NOT NULL, goods_id INT NOT NULL);