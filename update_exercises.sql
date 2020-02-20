# Write SELECT statements to output each of the following with a caption:
#
#     All albums in your table.
#     All albums released before 1980
#     All albums by Michael Jackson

USE codeup_test_db;

#All albums in your table.
SELECT * from albums;
#All albums released before 1980
SELECT * FROM albums where released < '1980';
#All albums released after 1991;
SELECT  * from albums where released > '1991';
#All albums by Michael Jackson
SELECT records FROM albums WHERE artist = 'Michael Jackson';
SELECT * FROM albums where genre = 'disco';

#Make all the albums 10 times more popular (sales * 10)
UPDATE albums SET total_certified_copies = (total_certified_copies* 10);
SELECT total_certified_copies FROM albums;

#Move all the albums before 1980 back to the 1800s.
UPDATE albums SET released = (released - 100) where released  BETWEEN 1980 and 1989;
SELECT  * from albums WHERE released BETWEEN 1980 and 1989;

#Change 'Michael Jackson' to 'Peter Jackson'
UPDATE albums SET artist = 'Peter Jackson' WHERE artist = 'Michael Jackson';
select * from albums where artist = 'Peter Jackson';
