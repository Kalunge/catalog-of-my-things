CREATE TABLE books(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(255),
  publisher VARCHAR(255),
  cover_state VARCHAR(255),
  publish_date  DATE,
  genre_id      INT,
  author_id     INT,
  label_id      INT,
  archived      BOOLEAN,
  PRIMARY KEY(id)
  FOREIGN KEY(genre_id) REFERENCES genre(id),
  FOREIGN KEY(author_id) REFERENCES author(id),
  FOREIGN KEY(label_id) REFERENCES label(id)
);

CREATE TABLE labels(
  id INT GENERATED ALWAYS AS IDENTITY,
  title VARCHAR(255),
  color VARCHAR(255),
  PRIMARY KEY(id)
);

