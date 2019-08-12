CREATE DATABASE goodfoodhunting;

CREATE TABLE dishes (
  id SERIAL PRIMARY KEY,
  title VARCHAR(300),
  image_url TEXT,
  category_id INTEGER,
  user_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP 
);

CREATE TABLE categories (
  id SERIAL PRIMARY KEY,
  name VARCHAR(200)
);

CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  body TEXT,
  dish_id INTEGER
);

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email VARCHAR(300),
  password_digest VARCHAR(400)
);

ALTER TABLE dishes ADD COLUMN user_id INTEGER;
ALTER TABLE comments ADD COLUMN user_id INTEGER;

INSERT INTO dishes (title, image_url) VALUES ('pudding', 'https://spicysouthernkitchen.com/wp-content/uploads/Rice-Pudding-2.jpg');

INSERT INTO dishes (title, image_url) VALUES ('cake', 'https://www.cheesecake.com.au/media/catalog/product/cache/c687aa7517cf01e65c009f6943c2b1e9/w/e/web_400_scr_chocmint_1.png');

insert into comments (body, dish_id) values ('yucky', 2);
