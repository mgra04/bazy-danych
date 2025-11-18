/*
10.8. Czy jest firma która nie jest przypisana do produktów?
*/
-- Rozwiązanie 1:
SELECT
    *
FROM
    Vendor
WHERE
    vendor_id NOT IN (
        SELECT
            vendor_id
        FROM
            GoodsVendor
    );

-- Rozwiązanie 2:
SELECT
    v.*
FROM
    Vendor v
    LEFT JOIN GoodsVendor gv ON v.vendor_id = gv.vendor_id
WHERE
    gv.vendor_id IS NULL;

-- Rozwiązanie 3:
SELECT
    v.*
FROM
    Vendor v
WHERE
    NOT EXISTS (
        SELECT
            1
        FROM
            GoodsVendor gv
        WHERE
            gv.vendor_id = v.vendor_id
    );