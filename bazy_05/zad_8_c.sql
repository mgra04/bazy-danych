/*
c) Wyświetl informację ile różnych rodzajów produktów produkuje każdy z producentów
(posortuj malejąco po liczbie produktów i rosnąco po nazwie producenta).
*/
SELECT
    v.name,
    count(*) AS product_count
FROM
    Vendor v
    JOIN GoodsVendor gv on v.vendor_id = gv.vendor_id
GROUP BY
    v.name
ORDER BY
    product_count DESC,
    v.name;