DROP TABLE IF EXISTS genre;
CREATE TABLE genre(
	id IDENTITY,
	name VARCHAR(50),
	description VARCHAR(255),
	image_url VARCHAR(50),
	is_active boolean,
	
	CONSTRAINT pk_genre_id PRIMARY KEY (id)
);

INSERT INTO genre (name, description, image_url, is_active) VALUES ("Mythology", "This is a Mythology genre", "CAT_4.png", true);