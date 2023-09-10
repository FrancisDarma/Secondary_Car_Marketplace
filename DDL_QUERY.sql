SET timezone = 'Asia/Jakarta';

--------------------------------------------------------------------------------------
----------------------CITY------------------------------------------------------------
--------------------------------------------------------------------------------------
CREATE TABLE CITY
(
	city_id SERIAL PRIMARY KEY,
	city_name VARCHAR(255) NOT NULL,
	latitude FLOAT DEFAULT 0 NOT NULL,
	longitude FLOAT DEFAULT 0 NOT NULL
);

-----------ADJUSTMENT------------
ALTER TABLE CITY
DROP COLUMN IF EXISTS latitude;

ALTER TABLE CITY
DROP COLUMN IF EXISTS longitude;

ALTER TABLE CITY
DROP COLUMN IF EXISTS map_loc;
ALTER TABLE CITY
ADD COLUMN map_loc POINT DEFAULT POINT(0,0);

ALTER TABLE CITY 
ALTER COLUMN city_name SET NOT NULL,
ADD CONSTRAINT city_name_unique UNIQUE(city_name);

ALTER TABLE CITY
ADD CONSTRAINT unique_coordinate UNIQUE (latitude,longitude);

--------------------------------------------------------------------------------------
----------------------CAR------------------------------------------------------------
--------------------------------------------------------------------------------------

CREATE TABLE CAR
(
	product_id SERIAL PRIMARY KEY,
	brand VARCHAR(255) NOT NULL,
	model VARCHAR(255) NOT NULL,
	body_type VARCHAR(255) NOT NULL,
	car_type VARCHAR(255) NOT NULL,
	year_made INTEGER DEFAULT 0 NOT NULL,
	color VARCHAR(255) NOT NULL,
	miles FLOAT DEFAULT 0 NOT NULL,
	price FLOAT DEFAULT 0 NOT NULL
);

-----------ADJUSTMENT------------

ALTER TABLE CAR 
ALTER COLUMN color SET DEFAULT 'No Data';

ALTER TABLE CAR
DROP COLUMN car_type;

--------------------------------------------------------------------------------------
----------------------SELLER------------------------------------------------------------
--------------------------------------------------------------------------------------

CREATE TABLE SELLER
(
	seller_id SERIAL PRIMARY KEY,
	register_date TIMESTAMPTZ NOT NULL,
	seller_name VARCHAR(255) NOT NULL,
	seller_contact VARCHAR(15) NOT NULL,
	seller_email VARCHAR(255) DEFAULT 'No Description',
	city_id INTEGER NOT NULL,
	CONSTRAINT fk_city
		FOREIGN KEY(city_id)
		REFERENCES CITY(city_id)
);

-----------ADJUSTMENT------------
ALTER TABLE SELLER ADD CONSTRAINT seller_contact_unique UNIQUE (seller_contact);
ALTER TABLE SELLER ADD CONSTRAINT seller_email_unique UNIQUE (seller_email);

ALTER TABLE SELLER DROP CONSTRAINT fk_city;
ALTER TABLE SELLER ADD CONSTRAINT fk_city
	FOREIGN KEY(city_id)
	REFERENCES CITY(city_id)
	ON DELETE RESTRICT
	ON UPDATE RESTRICT;
	
ALTER TABLE SELLER 
ALTER COLUMN register_date SET DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE SELLER 
ALTER COLUMN seller_contact TYPE VARCHAR(255);
--------------------------------------------------------------------------------------
----------------------BUYER------------------------------------------------------------
--------------------------------------------------------------------------------------

CREATE TABLE BUYER
(
	buyer_id SERIAL PRIMARY KEY,
	registered_date TIMESTAMPTZ NOT NULL,
	buyer_name VARCHAR(255) NOT NULL,
	buyer_contact VARCHAR(15) NOT NULL,
	buyer_email VARCHAR(255) DEFAULT 'No Description',
	city_id INTEGER NOT NULL,
	CONSTRAINT fk_city
		FOREIGN KEY(city_id)
		REFERENCES CITY(city_id)
);

-----------ADJUSTMENT------------

ALTER TABLE BUYER ADD CONSTRAINT buyer_contact_unique UNIQUE (buyer_contact);
ALTER TABLE BUYER ADD CONSTRAINT buyer_email_unique UNIQUE (buyer_email);

ALTER TABLE BUYER DROP CONSTRAINT fk_city;
ALTER TABLE BUYER ADD CONSTRAINT fk_city
	FOREIGN KEY(city_id)
	REFERENCES CITY(city_id)
	ON DELETE RESTRICT
	ON UPDATE RESTRICT;
	
ALTER TABLE BUYER
ALTER COLUMN registered_date SET DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE BUYER
ALTER COLUMN buyer_contact TYPE VARCHAR(255);
--------------------------------------------------------------------------------------
----------------------ADVERTISEMENT------------------------------------------------------------
--------------------------------------------------------------------------------------

CREATE TABLE ADVERTISEMENT
(
	adv_id SERIAL PRIMARY KEY,
	adv_date TIMESTAMPTZ NOT NULL,
	adv_title VARCHAR(255) NOT NULL,
	seller_id INTEGER NOT NULL,
	product_id INTEGER NOT NULL,
	city_id INTEGER NOT NULL,
	allow_bid BOOLEAN DEFAULT FALSE NOT NULL,
	CONSTRAINT fk_seller_id
		FOREIGN KEY(seller_id)
		REFERENCES SELLER(seller_id),
	CONSTRAINT fk_product_id
		FOREIGN KEY(product_id)
		REFERENCES CAR(product_id),
	CONSTRAINT city_id
		FOREIGN KEY(city_id)
		REFERENCES CITY(city_id)
);


-----------ADJUSTMENT------------

ALTER TABLE ADVERTISEMENT ADD CONSTRAINT adv_title_unique UNIQUE (adv_title);

ALTER TABLE ADVERTISEMENT DROP CONSTRAINT fk_seller_id;
ALTER TABLE ADVERTISEMENT ADD CONSTRAINT fk_seller_id
	FOREIGN KEY(seller_id)
	REFERENCES SELLER(seller_id)
	ON DELETE RESTRICT
	ON UPDATE RESTRICT;

ALTER TABLE ADVERTISEMENT DROP CONSTRAINT fk_product_id;
ALTER TABLE ADVERTISEMENT ADD CONSTRAINT fk_product_id
	FOREIGN KEY(product_id)
	REFERENCES CAR(product_id)
	ON DELETE RESTRICT
	ON UPDATE RESTRICT;
	
ALTER TABLE ADVERTISEMENT DROP CONSTRAINT city_id;
ALTER TABLE ADVERTISEMENT ADD CONSTRAINT city_id
	FOREIGN KEY(city_id)
	REFERENCES CITY(city_id)
	ON DELETE RESTRICT
	ON UPDATE RESTRICT;
	
ALTER TABLE ADVERTISEMENT
ALTER COLUMN adv_date SET DEFAULT CURRENT_TIMESTAMP;

--------------------------------------------------------------------------------------
----------------------NEGOTIATION------------------------------------------------------------
--------------------------------------------------------------------------------------

CREATE TABLE NEGOTIATION
(
	bid_id SERIAL PRIMARY KEY,
	bid_date TIMESTAMPTZ NOT NULL,
	adv_id INTEGER NOT NULL,
	buyer_id INTEGER NOT NULL,
	bid_price FLOAT DEFAULT 0,
	nego_bid BOOLEAN DEFAULT NULL,
	CONSTRAINT fk_adv_id
		FOREIGN KEY(adv_id)
		REFERENCES ADVERTISEMENT(adv_id),
	CONSTRAINT fk_buyer_id
		FOREIGN KEY(buyer_id)
		REFERENCES BUYER(buyer_id)
);

-----------ADJUSTMENT------------
ALTER TABLE NEGOTIATION DROP CONSTRAINT fk_adv_id;
ALTER TABLE NEGOTIATION ADD CONSTRAINT fk_adv_id
	FOREIGN KEY(adv_id)
	REFERENCES ADVERTISEMENT(adv_id)
	ON DELETE RESTRICT
	ON UPDATE RESTRICT;

ALTER TABLE NEGOTIATION DROP CONSTRAINT fk_buyer_id;
ALTER TABLE NEGOTIATION ADD CONSTRAINT fk_buyer_id
	FOREIGN KEY(buyer_id)
	REFERENCES BUYER(buyer_id)
	ON DELETE RESTRICT
	ON UPDATE RESTRICT;

ALTER TABLE NEGOTIATION
ALTER COLUMN bid_date SET DEFAULT CURRENT_TIMESTAMP;





