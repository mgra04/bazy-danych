DROP TABLE IF EXISTS GoodsVendor;

CREATE TABLE GoodsVendor (goods_id INT NOT NULL, vendor_id INT NOT NULL);

-- poniżej rozwiązanie zadania 8
INSERT INTO
    GoodsVendor (vendor_id, goods_id)
VALUES
    (
        (
            SELECT
                vendor_id
            FROM
                Vendor
            WHERE
                name = 'Your Gorgeous Bathroom'
        ),
        (
            SELECT
                goods_id
            FROM
                Goods
            WHERE
                product = 'washing machine'
        )
    ),
    (
        (
            SELECT
                vendor_id
            FROM
                Vendor
            WHERE
                name = 'Your Gorgeous Bathroom'
        ),
        (
            SELECT
                goods_id
            FROM
                Goods
            WHERE
                product = 'hair dryer'
        )
    ),
    (
        (
            SELECT
                vendor_id
            FROM
                Vendor
            WHERE
                name = 'World of Satellites'
        ),
        (
            SELECT
                goods_id
            FROM
                Goods
            WHERE
                product = 'satellite tuner'
        )
    ),
    (
        (
            SELECT
                vendor_id
            FROM
                Vendor
            WHERE
                name = 'A.B.C.D.'
        ),
        (
            SELECT
                goods_id
            FROM
                Goods
            WHERE
                product = 'TV'
        )
    ),
    (
        (
            SELECT
                vendor_id
            FROM
                Vendor
            WHERE
                name = 'A.B.C.D.'
        ),
        (
            SELECT
                goods_id
            FROM
                Goods
            WHERE
                product = 'blue-ray player'
        )
    ),
    (
        (
            SELECT
                vendor_id
            FROM
                Vendor
            WHERE
                name = 'A.B.C.D.'
        ),
        (
            SELECT
                goods_id
            FROM
                Goods
            WHERE
                product = 'satellite tuner'
        )
    ),
    (
        (
            SELECT
                vendor_id
            FROM
                Vendor
            WHERE
                name = 'Dry Hair'
        ),
        (
            SELECT
                goods_id
            FROM
                Goods
            WHERE
                product = 'hair dryer'
        )
    );