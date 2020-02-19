USE codeup_test_db;

SELECT * FROM albums WHERE record  = 'Pink Floyd';

SELECT released FROM albums WHERE record  = 'Sgt. Pepper\'s Lonely Hearts Club Band';

SELECT genre FROM albums WHERE record = 'Nevermind';

SELECT  record from albums where released = '199%';

select record from albums where total_certified_copies < '20.0';

select record from albums where genre = 'Rock';
