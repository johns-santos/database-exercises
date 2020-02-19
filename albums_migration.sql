CREATE DATABASE IF NOt EXISTS codeup_test_db;

USE codeup_test_db;

DROP TABLE IF EXISTS albums;

CREATE TABLE IF NOT EXISTS albums
(
    album_id               INT UNSIGNED NOT NULL AUTO_INCREMENT,
    artist                 VARCHAR(80)  DEFAULT 'NONE',
    record                 VARCHAR(80) NOT NULL,
    released               CHAR(4) NOT NULL,
    genre                  VARCHAR(40) NOT NULL,
    total_certified_copies DECIMAL(4, 1) NOT NULL,
    claimed_sales          FLOAT,
    refs                   VARCHAR(12) NOT NULL,
    PRIMARY KEY (album_id)
#         CONSTRAINT uc_album UNIQUE (artist, album)
);

INSERT INTO albums (artist, record, released,  genre, total_certified_copies, claimed_sales, refs)
VALUES ('Michael Jackson', 'Thriller', '1982', 'Pop', 47.3, 66, 4 );

SELECT * from albums;
