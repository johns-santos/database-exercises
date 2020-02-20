
USE codeup_test_db;
#Albums released after 1991
DELETE FROM albums WHERE released > '1991';
SELECT * FROM albums WHERE released > '1991';

#Albums with the genre 'disco'
DELETE FROM albums WHERE genre = 'rock';
SELECT * FROM albums WHERE genre = 'rock';

#Albums by 'Whitney Houston' (...or maybe an artist of your choice)
DELETE FROM albums WHERE artist = 'Michael Jackson';
SELECT * FROM albums WHERE artist = 'Michael Jackson';

SELECT * FROM albums;

