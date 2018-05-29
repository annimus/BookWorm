DROP TABLE IF EXISTS genre;
CREATE TABLE genre(
	id IDENTITY,
	name VARCHAR(50),
	description VARCHAR(255),
	is_active boolean,
	
	CONSTRAINT pk_genre_id PRIMARY KEY (id)
);

INSERT INTO genre (name, description, is_active) VALUES ('Mythology', 'This is a Mythology genre', true);
INSERT INTO genre (name, description, is_active) VALUES ('Fantasy', 'This is a Fantasy genre', true);
INSERT INTO genre (name, description, is_active) VALUES ('Romance', 'This is a Romance genre', true);

DROP TABLE IF EXISTS user_detail;
CREATE TABLE user_detail(
	id IDENTITY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	role VARCHAR(50),
	enabled BOOLEAN,
	password VARCHAR(60),
	email VARCHAR(100),
	contact_number VARCHAR(15),
	
	CONSTRAINT pk_user_id PRIMARY KEY(id)
);

INSERT INTO user_detail (first_name, last_name, role, enabled, password, email, contact_number)
	VALUES ('Admin', '', 'ADMIN', true, '$2a$10$/49njYY8gF5Y0Aop1h21yOfoOGge4KLLoVHMVcOO2zl6tqr299J6y', 'admin@bookworm.com', '99999999');
	
INSERT INTO user_detail (first_name, last_name, role, enabled, password, email, contact_number)
	VALUES ('Ingram Content Group Inc.', '', 'SUPPLIER', true, '$2b$10$mTAp1YVYgECAUXqH5hqeyuW6PrywRbuWN0.CSkUSI4ADUChtVl7Fy', 'contact@ingram.com', '88888888');
	
INSERT INTO user_detail (first_name, last_name, role, enabled, password, email, contact_number)
	VALUES ('Independent Publishers Group', '', 'SUPPLIER', true, '$2b$10$mTAp1YVYgECAUXqH5hqeyuW6PrywRbuWN0.CSkUSI4ADUChtVl7Fy', 'contact@ipg.com', '77777777');
	
INSERT INTO user_detail (first_name, last_name, role, enabled, password, email, contact_number)
	VALUES ('User', '', 'USER', true, '$2a$10$4i6FWwsgX2jNnoDxsDUH5.9g9P3UJwx1zlmWUTFWeOEwuER12xCMW', 'user@bookworm.com', '77 77777-7777');
	
DROP TABLE IF EXISTS book;
CREATE TABLE book(
	id IDENTITY,
	code VARCHAR(50),
	name VARCHAR(50),
	publisher VARCHAR(50),
	author VARCHAR(50),
	description VARCHAR(255),
	unit_price DECIMAL(10,2),
	quantity INT,
	is_active BOOLEAN,
	genre_id INT,
	supplier_id INT,
	purchases INT DEFAULT 0,
	views INT DEFAULT 0,
	isbn int,
	rating DECIMAL(10,1),
	rating_count INT,
	
	CONSTRAINT pk_book_id PRIMARY KEY (id),
	CONSTRAINT fk_book_genre_id FOREIGN KEY (genre_id) REFERENCES genre (id),
	CONSTRAINT fk_book_supplier_id FOREIGN KEY (supplier_id) REFERENCES user_detail (id),
);

INSERT INTO book (code, name, publisher, author, description, unit_price, quantity, is_active, 
	genre_id, supplier_id, purchases, views, isbn, rating, rating_count)
	VALUES ('PAZASDASDFAZXX12', 'The Fellowship of The Ring', 'Mariner Books', 'J.R.R. Tolkien', 'Fellowship of The Ring, first book in the Lord of The Rings Trilogy',
		13.49, 1337, true, 2, 1, 0, 0, 0547928211, 0.0, 0);
		
INSERT INTO book (code, name, publisher, author, description, unit_price, quantity, is_active, 
	genre_id, supplier_id, purchases, views, isbn, rating, rating_count)
	VALUES ('PAZASDASDFAZXX13', 'Ready Player One: A Novel', 'Broadway Books', 'Ernest Cline', 'In the year 2045, reality is an ugly place. The only time teenage Wade Watts really feels alive is when he is jacked into the virtual utopia known as the OASIS',
		15.90, 1999, true, 3, 3, 0, 0, 0307887448, 0.0, 0);
		
INSERT INTO book (code, name, publisher, author, description, unit_price, quantity, is_active, 
	genre_id, supplier_id, purchases, views, isbn, rating, rating_count)
	VALUES ('PAZASDASDFAZXX14', 'Iron and Magic', 'NYLA', 'Ilona Andrews', 'Iron and Magic is first book in the Iron Covenant Series',
		6.89, 0, true, 3, 2, 0, 0, 0107897448, 0.0, 0);
		
DROP TABLE IF EXISTS address;
CREATE TABLE address (
	id IDENTITY,
	user_id int,
	address_line_one VARCHAR(100),
	address_line_two VARCHAR(100),
	city VARCHAR(20),
	state VARCHAR(20),
	country VARCHAR(20),
	postal_code VARCHAR(10),
	is_billing BOOLEAN,
	is_shipping BOOLEAN,
	
	CONSTRAINT fk_address_user_id FOREIGN KEY (user_id ) REFERENCES user_detail (id),
	CONSTRAINT pk_address_id PRIMARY KEY (id)
);

INSERT INTO address( user_id, address_line_one, address_line_two, city, state, country, postal_code, is_billing, is_shipping) 
VALUES (2, '102 Sabarmati Society, Mahatma Gandhi Road', 'Near Salt Lake, Gandhi Nagar', 'Ahmedabad', 'Gujarat', 'India', '111111', true, false );

DROP TABLE IF EXISTS cart;
CREATE TABLE cart (
	id IDENTITY,
	user_id int,
	grand_total DECIMAL(10,2),
	cart_lines int,
	
	CONSTRAINT fk_cart_user_id FOREIGN KEY (user_id ) REFERENCES user_detail (id),
	CONSTRAINT pk_cart_id PRIMARY KEY (id)
);

INSERT INTO cart (user_id, grand_total, cart_lines) VALUES (4, 0.0, 0);

DROP TABLE IF EXISTS cart_line;
CREATE TABLE cart_line (
	id IDENTITY,
	cart_id int,
	total DECIMAL(10,2),
	book_id int,
	book_count int,
	buying_price DECIMAL(10,2),
	is_available boolean,
	
	CONSTRAINT fk_cartline_cart_id FOREIGN KEY (cart_id) REFERENCES cart (id),
	CONSTRAINT fk_cartline_book_id FOREIGN KEY (book_id) REFERENCES book (id),
	CONSTRAINT pk_cartline_id PRIMARY KEY (id)
);

DROP TABLE IF EXISTS book_review;
CREATE TABLE book_review (
	id IDENTITY,
	book_id int,
	user_name VARCHAR(100),
	description VARCHAR(255),
	rating DECIMAL(10,1),
	review_date TIMESTAMP,
	
	CONSTRAINT fk_review_book_id FOREIGN KEY (book_id) REFERENCES book (id),
	CONSTRAINT pk_book_review_id PRIMARY KEY (id)
);

DROP TABLE IF EXISTS user_order;
CREATE TABLE user_order (
	id IDENTITY,
	user_id int,
	grand_total DECIMAL(10,2),
	shipping_address_id int,
	billing_address_id int,
	condition VARCHAR(50),
	order_date DATE,
	
	CONSTRAINT fk_order_user_id FOREIGN KEY (user_id) REFERENCES user_detail (id),
	CONSTRAINT fk_shipping_address_id FOREIGN KEY (shipping_address_id) REFERENCES address (id),
	CONSTRAINT fk_billing_address_id FOREIGN KEY (billing_address_id) REFERENCES address (id),
	CONSTRAINT pk_user_order_id PRIMARY KEY (id)
);

DROP TABLE IF EXISTS order_item;
CREATE TABLE order_item (
	id IDENTITY,
	order_id int,
	book_id int,
	book_count int,
	buying_price DECIMAL(10,2),
	total DECIMAL(10,2),
	
	CONSTRAINT fk_order_item_order_id FOREIGN KEY (order_id) REFERENCES user_order (id),
	CONSTRAINT fk_order_item_book_id FOREIGN KEY (book_id) REFERENCES book (id),
	CONSTRAINT pk_order_item_id PRIMARY KEY (id)
);