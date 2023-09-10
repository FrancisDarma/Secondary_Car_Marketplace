---POPULARITAS MOBIL----
SELECT 
		C.model AS model,
		count(B.product_id) AS car_numbers,
		count(A.bid_id) AS bid_numbers
	FROM 
	NEGOTIATION A LEFT JOIN ADVERTISEMENT B 
	ON A.adv_id=B.adv_id 
	LEFT JOIN CAR C 
	ON B.product_id=C.product_id
	GROUP BY
		C.model
	ORDER BY bid_numbers DESC;
	
	
--MEMBANDINGKAN HARGA MOBIL DENGAN RATA-RATA HARGA KOTA--	
SELECT 
	city_name,
	brand,
	model,
	year_made,
	price,
	AVG(price) OVER (PARTITION BY city_name) AS avg_city 
FROM ADVERTISEMENT A
LEFT JOIN
CAR B
ON A.product_id = B.product_id
LEFT JOIN
CITY C
ON A.city_id = C.city_id

---MELIHAT PENAWARAN BERIKUTNYA---

SELECT 
  model,
  buyer_id,
  MAX(CASE WHEN rn = 1 THEN bid_date END) AS first_bid_date,
  MAX(CASE WHEN rn = 1 THEN bid_price END) AS first_bid_price,
  MAX(CASE WHEN rn = 2 THEN bid_date END) AS second_bid_date,
  MAX(CASE WHEN rn = 2 THEN bid_price END) AS second_bid_price,
  MAX(CASE WHEN rn = 3 THEN bid_date END) AS third_bid_date,
  MAX(CASE WHEN rn = 3 THEN bid_price END) AS third_bid_price
FROM (
  SELECT 
    model,
    buyer_id,
    bid_date,
    bid_price,
    ROW_NUMBER() OVER (PARTITION BY model, buyer_id ORDER BY bid_date) AS rn
	FROM NEGOTIATION A
	LEFT JOIN
	ADVERTISEMENT B
	ON A.adv_id = B.adv_id
	LEFT JOIN
	CAR C
	ON B.product_id = C.product_id
) AS row_index
GROUP BY 
  model, 
  buyer_id
  

---MELIHAT DIFFERENCE BERIKUTNYA---  

WITH ModelAvg AS (
  SELECT
    model,
    AVG(price) AS avg_price
  FROM
    CAR
  GROUP BY
    model
),
BidAvg AS (
  SELECT
    model,
    AVG(bid_price) AS avg_bid_6month
	FROM 
	NEGOTIATION A
	LEFT JOIN
	ADVERTISEMENT B
	ON A.adv_id = B.adv_id
	LEFT JOIN
	CAR C
	ON B.product_id = C.product_id
  WHERE
    bid_date >= CURRENT_DATE - INTERVAL '6 months'
  GROUP BY
    model
)
SELECT
  M.model,
  M.avg_price,
  B.avg_bid_6month,
  M.avg_price - B.avg_bid_6month AS difference,
  ((M.avg_price - B.avg_bid_6month) / NULLIF(M.avg_price, 0)) * 100 AS difference_percent
FROM
  ModelAvg M
LEFT JOIN
  BidAvg B ON M.model = B.model;
  
 ----------RATA-RATA HARGA 6 BULAN TERAKHIR ----
 
WITH avg_prices AS (
  SELECT
    brand,
    model,
    AVG(price) AS avg_price
  FROM
    ADVERTISEMENT B
    LEFT JOIN
    CAR C
    ON B.product_id = C.product_id
  WHERE
    adv_date BETWEEN NOW() - INTERVAL '6 months' AND NOW()
  GROUP BY
    brand,
    model
)
SELECT
  brand,
  model,
  avg_price AS m_min_6,
  LAG(avg_price, 1) OVER w AS m_min_5,
  LAG(avg_price, 2) OVER w AS m_min_4,
  LAG(avg_price, 3) OVER w AS m_min_3,
  LAG(avg_price, 4) OVER w AS m_min_2,
  LAG(avg_price, 5) OVER w AS m_min_1
FROM
  avg_prices
WINDOW w AS (
  PARTITION BY 
    brand,
    model
  ORDER BY 
    brand,
    model
)
ORDER BY
  brand,
  model;








