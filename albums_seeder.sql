CREATE DATABASE IF NOt EXISTS codeup_test_db;

USE codeup_test_db;

INSERT INTO albums (artist, record, released,  genre, total_certified_copies, claimed_sales, refs)
VALUES ('Michael Jackson', 'Thriller', '1982', 'Pop', 47.3, 66, 4 ),
       ('Led Zeppelin','Led Zeppelin IV','1971','rock', 29.0,35, 0),
       ('Michael Jackson','Bad','1987','Pop', 22.2,35,51),
       ('Alanis Morissette','Jagged Little Pill','1995','Alternative', 24.4,33,54),
       ('Michael Jackson','Dangerous','1991','R&B' ,17.3,32,57),
       ('Celine Dion','Falling into You','1996','Pop', 20.2,32,59),
       ('Eagles', 'Hotel California','1976','Soft rock',31.5,32,60),
       ('The Beatles','Sgt. Pepper\'s Lonely Hearts Club','1967','Band', 18.2,32,61),
       ('Various artists','Dirty Dancing','1987','Pop rock',17.9,32,62),
       ('Adele','21','2011','Pop',25.3,31,77),
       ('Celine Dion','Let\'s Talk About Love','1997','Pop',19.3,31,80),
       ('The Beatles','1','2000','Rock',23.4,31,83),
       ('ABBA Gold:','Greatest Hits','1992','Pop' ,23.0,30,87),
       ('The Beatles','Abbey Road','1969','Rock',14.4,30,88),
       ('Bruce Springsteen','Born in the U.S.A.','1984','Heartland', 19.6,30,89),
       ('Dire Straits','Brothers in Arms','1985','Roots', 17.7,30,90),
       ('James Horner','Titanic: Music from  the Motion Picture','1997','Film score',18.1,30,94),
       ('Metallica', 'Metallica','1991','Heavy metal',25.2,31,95),
       ('Nirvana','Nevermind','1991', 'rock',16.7,30,96),
       ('Pink Floyd','The Wall','1979','rock',18.7,30,98),
       ('Santana','Supernatural','1999','Latin',20.5,30,99),
       ('Madonna','The Immaculate Collection','1990','Pop',19.4,30,102),
       ('Guns N Roses', 'Appetite for Destruction','1987','Hard rock',21.9,30,103);