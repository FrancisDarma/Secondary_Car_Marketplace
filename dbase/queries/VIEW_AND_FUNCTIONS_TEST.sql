----CARS ABOVE 2015---------
SELECT * FROM cars_year_made_above_2015;

---INSERT NEGOTIATION--
SELECT add_bid(2, 101, 500000, TRUE);
SELECT * FROM NEGOTIATION;

---CHECK SELLER ------------
SELECT * FROM check_mobil_yang_dijual_seller('Tari')

----CHECK MOBIL TERMURAH-----
SELECT * FROM mobil_termurah('Yaris')

---CHECK MOBIL TERDEKAT----
SELECT * FROM mobil_terdekat(1371)

SELECT * FROM CITY;

SELECT B.city_id, X.map_loc FROM SELLER B LEFT JOIN CITY X on B.city_id=X.city_id;