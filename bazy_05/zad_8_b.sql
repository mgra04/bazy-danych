/*
b) Wyświetl nazwę produktu oraz liczbę użytkowników posiadających ten produkt
(posortuj malejąco po liczbie użytkowników i rosnąco po nazwie produktu).
*/
SELECT
    g.product,
    count(*) as user_count
FROM
    Goods g
    JOIN UsersGoods ug ON g.goods_id = ug.goods_id
GROUP BY
    g.product
ORDER BY
    user_count DESC,
    g.product;
