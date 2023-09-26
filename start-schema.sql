CREATE TABLE bands (
  id INT NOT NULL IDENTITY,
  name VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE albums (
  id INT NOT NULL IDENTITY,
  name VARCHAR(255) NOT NULL,
  release_year INT,
  band_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (band_id) REFERENCES bands(id)
);