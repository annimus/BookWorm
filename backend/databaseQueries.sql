DROP TABLE IF EXISTS genre;
CREATE TABLE genre(
	id IDENTITY,
	name VARCHAR(50),
	description VARCHAR(255),
	image_url VARCHAR(50),
	is_active boolean,
	
	CONSTRAINT pk_genre_id PRIMARY KEY (id)
);

INSERT INTO genre (name, description, image_url, is_active) VALUES ('Mythology', 'This is a Mythology genre', 'CAT_1.png', true);
INSERT INTO genre (name, description, image_url, is_active) VALUES ('Fantasy', 'This is a Fantasy genre', 'CAT_2.png', true);
INSERT INTO genre (name, description, image_url, is_active) VALUES ('Romance', 'This is a Romance genre', 'CAT_3.png', true);

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
	VALUES ('Admin', 'ADmin', 'ADMIN', true, '$2b$10$HDAdKby.Ay0LWR2zFddOX.OVkbjU4cImh2P/QQ2MFgR23wQg86cFW', 'admin@bookworm.com', '99999999');
	
INSERT INTO user_detail (first_name, last_name, role, enabled, password, email, contact_number)
	VALUES ('Ingram Content Group Inc.', '', 'SUPPLIER', true, '$2b$10$mTAp1YVYgECAUXqH5hqeyuW6PrywRbuWN0.CSkUSI4ADUChtVl7Fy', 'contact@ingram.com', '88888888');
	
INSERT INTO user_detail (first_name, last_name, role, enabled, password, email, contact_number)
	VALUES ('Independent Publishers Group', '', 'SUPPLIER', true, '$2b$10$mTAp1YVYgECAUXqH5hqeyuW6PrywRbuWN0.CSkUSI4ADUChtVl7Fy', 'contact@ipg.com', '77777777');
	
INSERT INTO user_detail (first_name, last_name, role, enabled, password, email, contact_number)
	VALUES ('User', 'User', 'USER', true, '$2b$10$ZIISA77JAMrVgdjQKoeotuV0Ohkfaa0lddNzAyDjAosqwc7xJBKJ.', 'user@bookworm.com', '77777777');
	
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
	
	CONSTRAINT pk_book_id PRIMARY KEY (id),
	CONSTRAINT fk_book_genre_id FOREIGN KEY (genre_id) REFERENCES genre (id),
	CONSTRAINT fk_book_supplier_id FOREIGN KEY (supplier_id) REFERENCES user_detail (id),
);

INSERT INTO book (code, name, publisher, author, description, unit_price, quantity, is_active, 
	genre_id, supplier_id, purchases, views, isbn)
	VALUES ('PAZASDASDFAZXX12', 'The Fellowship of The Ring', 'Mariner Books', 'J.R.R. Tolkien', 'Fellowship of The Ring, first book in the Lord of The Rings Trilogy',
		13.49, 1337, true, 2, 1, 0, 0, 0547928211);
		
INSERT INTO book (code, name, publisher, author, description, unit_price, quantity, is_active, 
	genre_id, supplier_id, purchases, views, isbn)
	VALUES ('PAZASDASDFAZXX13', 'Ready Player One: A Novel', 'Broadway Books', 'Ernest Cline', 'In the year 2045, reality is an ugly place. The only time teenage Wade Watts really feels alive is when he is jacked into the virtual utopia known as the OASIS',
		15.90, 1999, true, 3, 3, 0, 0, 0307887448);
		
INSERT INTO book (code, name, publisher, author, description, unit_price, quantity, is_active, 
	genre_id, supplier_id, purchases, views, isbn)
	VALUES ('PAZASDASDFAZXX14', 'Iron and Magic', 'NYLA', 'Ilona Andrews', 'Iron and Magic is first book in the Iron Covenant Series',
		6.89, 0, true, 3, 2, 0, 0, 0107897448);
		
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

INSERT INTO cart (user_id, grand_total, cart_lines) VALUES (4, 199, 2);