COPY city(city_id,city_name,map_loc)
FROM 'D:\pacmann\ERD_project\dbase\master_data_files\city_compiled.csv'
DELIMITER ','
CSV
HEADER;

SELECT * FROM CITY;

COPY CAR(product_id,brand,model,body_type,year_made,price)
FROM 'D:\pacmann\ERD_project\dbase\master_data_files\car_product.csv'
DELIMITER ';'
CSV
HEADER;

SELECT * FROM CAR;

SELECT * FROM SELLER;
SELECT * FROM BUYER;