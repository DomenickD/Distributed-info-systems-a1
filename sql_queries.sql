-- Top 10 items by profit margin (%) using catalog prices
SELECT
  i.item_no        AS item_id,
  i.description    AS item_name,
  i.selling_price  AS price,
  i.purchase_price AS cost,
  ROUND(
    CASE
      WHEN i.selling_price IS NULL OR i.selling_price = 0 THEN NULL
      ELSE ((i.selling_price - i.purchase_price) / i.selling_price) * 100
    END
  , 2)             AS profit_margin_pct
FROM inventory AS i
WHERE i.selling_price IS NOT NULL
  AND i.purchase_price IS NOT NULL
ORDER BY (profit_margin_pct IS NULL), profit_margin_pct DESC
LIMIT 10;

-- Top 10 items by profit margin (%) using average observed sales price
WITH sales_avg AS (
  SELECT
    iso.item_no                      AS item_no,
    AVG(CAST(iso.price AS REAL))     AS avg_sale_price
  FROM items_on_sales_orders AS iso
  WHERE iso.price IS NOT NULL
  GROUP BY iso.item_no
)
SELECT
  i.item_no            AS item_id,
  i.description        AS item_name,
  s.avg_sale_price     AS price,
  i.purchase_price     AS cost,
  ROUND(
    CASE
      WHEN s.avg_sale_price IS NULL OR s.avg_sale_price = 0 THEN NULL
      ELSE ((s.avg_sale_price - i.purchase_price) / s.avg_sale_price) * 100
    END
  , 2)                 AS profit_margin_pct
FROM inventory AS i
JOIN sales_avg AS s
  ON s.item_no = i.item_no
WHERE i.purchase_price IS NOT NULL
ORDER BY (profit_margin_pct IS NULL), profit_margin_pct DESC
LIMIT 10;
