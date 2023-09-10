
---CREATE VIEW PRODUK DIATAS 2015-----
CREATE VIEW cars_year_made_above_2015
AS 
SELECT * FROM CAR
WHERE year_made > 2015;


--CREATE FUNCTION INPUT BID----
CREATE OR REPLACE FUNCTION add_bid(
    adv_id_param INTEGER,
    buyer_id_param INTEGER,
    bid_price_param INTEGER,
    nego_bid_param BOOLEAN
) RETURNS TABLE
(
	bid_id INTEGER,
	bid_date TIMESTAMPTZ,
	adv_id INTEGER,
	buyer_id INTEGER,
	bid_price FLOAT,
	nego_bid BOOLEAN
)
AS 
$$
BEGIN
    INSERT INTO NEGOTIATION (adv_id, buyer_id, bid_price, nego_bid)
    VALUES (adv_id_param, buyer_id_param, bid_price_param, nego_bid_param)
	RETURNING * INTO bid_id, bid_date, adv_id, buyer_id, bid_price, nego_bid;
	
	RETURN NEXT;

END;
$$ 
LANGUAGE plpgsql;


---CREATE LIHAT SEMUA MOBIL DIJUAL-----
DROP VIEW IF EXISTS all_advertised_cars;
CREATE VIEW all_advertised_cars
	AS 
	SELECT 
		B.product_id AS product_id,
		B.seller_id AS seller_id,
		D.brand AS brand,
		D.model AS model,
		D.year_made AS year_made,
		D.price AS price,
		B.adv_date AS adv_date,
		B.city_id AS city_id,
		X.city_name AS city_name,
		X.map_loc AS map_loc
	FROM ADVERTISEMENT B
	LEFT JOIN
	CAR D
	ON B.product_id = D.product_id
	LEFT JOIN
	CITY X
	ON B.city_id = X.city_id
	ORDER BY B.adv_date DESC;
	
	SELECT * FROM all_advertised_cars

--CREATE FUNCTION MOBIL DIJUAL OLEH <NAMA CUSTOMER>----
CREATE OR REPLACE FUNCTION check_mobil_yang_dijual_seller
(
nama_seller VARCHAR
) RETURNS TABLE 
(
	product_id INT,
    seller_id INT,
	seller_name VARCHAR,
    brand VARCHAR,
    model VARCHAR,
    year_made INT,
    price FLOAT,
    adv_date TIMESTAMPTZ,
	city_id INT
) 

AS 
$$
BEGIN
	RETURN QUERY
	SELECT 
		DISTINCT B_product_id AS product_id,
		B_seller_id AS seller_id,
		D.seller_name AS seller_name,
		D_brand AS brand,
		D_model AS model,
		D_year_made AS year_made,
		D_price AS price,
		B_adv_date AS adv_date,
		B_city_id AS city_id
	FROM all_advertised_cars B
	LEFT JOIN
	SELLER D
	ON B.B_seller_id = D.seller_id
	WHERE D.seller_name LIKE '%' || nama_seller || '%'
	ORDER BY B_adv_date DESC;
END;
$$ 
LANGUAGE plpgsql;


SELECT * FROM CAR;

--CREATE FUNCTION MOBIL TERMURAH FILTER BY <NAMA MOBIL>----
CREATE OR REPLACE FUNCTION mobil_termurah
(
param_model VARCHAR
) RETURNS TABLE 
(
	filter_product_id INT,
    filter_brand VARCHAR,
    filter_model VARCHAR,
	filter_body_type VARCHAR,
    filter_year_made INT,
    filter_price FLOAT
) 

AS 
$$
BEGIN
	RETURN QUERY
	SELECT 
		DISTINCT product_id AS filter_product_id,
		brand AS filter_brand,
		model AS filter_model,
		body_type AS filter_body_type,
		year_made AS filter_year_made,
		price AS filter_price
	FROM CAR
	WHERE model LIKE '%' || param_model || '%'
	ORDER BY price ASC;
END;
$$ 
LANGUAGE plpgsql;

-----CREATE FUNCTION HAVERSINE DISTANCE---
CREATE FUNCTION haversine_distance(
point1 POINT, point2 POINT
)

RETURNS FLOAT AS

$$
DECLARE
	lon1 FLOAT := radians(point1[0]);
	lat1 FLOAT := radians(point1[1]);
	lon2 FLOAT := radians(point2[0]);
	lat2 FLOAT := radians(point2[1]);
	
	dlon FLOAT := lon2-lon1;
	dlat FLOAT := lat2-lat1;
	a FLOAT;
	c FLOAT;
	r FLOAT := 6371;
	jarak FLOAT;
BEGIN
	---haversine formula---
	a := sin(dlat/2)^2 + cos(lat1) * cos(lat2) * sin(dlon/2)^2;
	c := 2 * asin(sqrt(a));
	jarak := r * c;
	RETURN jarak;
END;
$$
LANGUAGE plpgsql;

----MEMBANDINGKAN 2 TITIK----
CREATE OR REPLACE FUNCTION public.hashpoint(point) RETURNS integer
   LANGUAGE sql IMMUTABLE
   AS 'SELECT hashfloat8($1[0]) # hashfloat8($1[1])';
   
CREATE OPERATOR CLASS public.point_hash_ops DEFAULT FOR TYPE point USING hash AS
   OPERATOR 1 ~=(point,point),
   FUNCTION 1 public.hashpoint(point);
   
---- MENCARI MOBIL TERDEKAT DENGAN KOTA---
DROP FUNCTION mobil_terdekat

CREATE FUNCTION mobil_terdekat(
city_id_param INT
)
RETURNS TABLE 
(
	product_id INT,
    brand VARCHAR,
    model VARCHAR,
    year_made INT,
    price FLOAT,
    adv_date TIMESTAMPTZ,
	city_id INT,
	distance FLOAT
) 

AS 
$$
BEGIN
	RETURN QUERY
	
	SELECT 
		B.product_id AS product_id,
		B.brand AS brand,
		B.model AS model,
		B.year_made AS year_made,
		B.price AS price,
		B.adv_date AS adv_date,
		B.city_id AS city_id,
		B.city_name AS city_name,
    	haversine_distance((B.map_loc),(C.map_loc)) AS distance
	FROM all_advertised_cars B
	LEFT JOIN
	(SELECT map_loc FROM CITY WHERE CITY.city_id = city_id_param) AS C(map_loc) ON B.city_id = city_id_param
	GROUP BY 
		B.product_id,
		B.brand,
		B.model,
		B.year_made,
		B.price,
		B.adv_date,
		B.city_id,
		B.city_name,
		B.map_loc,
		C.map_loc
    HAVING distance = 0.0
	ORDER BY B.adv_date DESC;
END;
$$ 
LANGUAGE plpgsql;





