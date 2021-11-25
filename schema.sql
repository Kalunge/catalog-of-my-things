CREATE DATABASE 'catalog';

CREATE TABLE item(
  id INT GENERATED ALWAYS AS IDENTITY,
  genre_id INT,
  author_id INT,
  label_id  INT,
  source_id INT,
  publish_date DATE,
  archived BOOLEAN,
  PRIMARY KEY(id),
  FOREIGN KEY (genre_id) REFERENCES genres (id),
  FOREIGN KEY (author_id) REFERENCES authors (id),
  FOREIGN KEY (source_id) REFERENCES sources (id),
  FOREIGN KEY (label_id) REFERENCES labels (id)
);

CREATE TABLE sources(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(255)
  PRIMARY KEY(id)
);

CREATE TABLE movies(
  id INT,
  silet BOOLEAN,
  FOREIGN KEY(id) REFERENCES item(id)
);

CREATE TABLE books(
  id INT GENERATED ALWAYS AS IDENTITY,
  publisher VARCHAR(255),
  cover_state VARCHAR(255),
  FOREIGN KEY(id) REFERENCES item(id)
);

CREATE TABLE labels(
  id INT GENERATED ALWAYS AS IDENTITY,
  title VARCHAR(255),
  color VARCHAR(255),
  PRIMARY KEY(id)
);

CREATE TABLE author(
  id INT GENERATED ALWAYS AS IDENTITY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  PRIMARY KEY(id)
);

CREATE TABLE games(
  id INT GENERATED ALWAYS AS IDENTITY,
  multiplayer BOOLEAN,
  last_played_at DATE,
  FOREIGN KEY(id) REFERENCES item(id)
);

CREATE TABLE music_albums(
  id INT GENERATED ALWAYS AS IDENTITY,
  on_spotify BOOLEAN,
  FOREIGN KEY(id) REFERENCES item(id)
);

CREATE TABLE genres(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(255)
  PRIMARY KEY(id)
);


