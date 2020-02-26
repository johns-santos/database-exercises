USE adlister_db;

CREATE TABLE user(
                     id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                     name VARCHAR (100) NOT NULL,
                     email VARCHAR(100) NOT NULL,
                     password VARCHAR(100) NOT NULL,
                     phone BIGINT(10) NOT NULL,
                     PRIMARY KEY (id)
);
CREATE TABLE categories(
                           id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                           name VARCHAR(100) NOT NULL,
                           PRIMARY KEY (id)
);
CREATE TABLE ads(
                    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                    user_id INT UNSIGNED DEFAULT NULL,
                    title VARCHAR(100) NOT NULL,
                    description VARCHAR(100) NOT NULL,
                    price INT UNSIGNED NOT NULL,
                    PRIMARY KEY (id),
                    FOREIGN KEY (user_id)
                        REFERENCES user (id)
);
CREATE TABLE ads_categories(
                               ads_id INT UNSIGNED DEFAULT NULL,
                               categories_id INT UNSIGNED DEFAULT NULL,
                               FOREIGN KEY (ads_id)
                                   REFERENCES ads(id),
                               FOREIGN KEY (categories_id)
                                   REFERENCES categories(id)
);

INSERT INTO user (name, email, password, phone) VALUES
('bob', 'bob@example.com', 12333, 2783338846),
('joe', 'joe@example.com', 22223, 9933376455),
('sally', 'sally@example.com', 322322, 8884449933),
('adam', 'adam@example.com', 332233444, 8883339922),
('jane', 'jane@example.com', 44456, 4447773399),
('mike', 'mike@example.com', 76543, 7464758488),
('tom', 'tom@example.com',	244444, 1231233333),
('mark', 'mark@example.com',	244, 7897895674),
('travis', 'travis@example.com',	2234, 2342344444),
('wil',	'wil@example.com', 2344, 5587463555);

INSERT INTO ads (user_id, title, description, price) VALUES
(1,'New Sandals', 'STEVE MADDEN SIZE 6 BLACK SANDAL', 23423),
(1,'BABY STROLLER','baby trend tandem sit-in-stand double stroller', 2342),
(4, 'Stove for sale', 'Stove electric appliance', 456),
(5, 'Queen size mattress', 'QUEEN SIZE MATTRESS AND BOX SPRING', 6867),
(4, 'CAR FOR SALE', '2014 ford escape titanium-SUV', 3339),
(5, 'CAR FOR SALE', '2017 Ford crown victoria lx sport', 98765),
(9, ' CAR FOR SALE','2015 DODGE DART SXT', 35467);

INSERT INTO categories(name) VALUES
('community'),
('services'),
('discussion forums'),
('housing'),
('for sale'),
('jobs'),
('gigs');

INSERT INTO ads_categories (ads_id, categories_id) VALUES
(1, 2),
(1, 3),
(2, 5),
(2, 4),
(2, 3),
(3, 1),
(4, 6),
(5, 3),
(6, 2),
(7, 5),
(7, 4),
(7, 7);
--shows the email address of the user for the give post
SELECT email, name
FROM user
WHERE id IN (
    SELECT user_id
    FROM ads
    WHERE title = 'BABY STROLLER'
);
-- shows the category for a given ad
SELECT name
FROM categories
WHERE id IN (
    SELECT ads_id
    FROM ads_categories
    WHERE ads_id = (
        select id
        from ads
        where title = 'New Sandals'
    )
);
-- shows all ads that are in the given category
SELECT title
FROM ads
WHERE id IN (
    SELECT ads_id
    FROM ads_categories
    WHERE categories_id = (
        select id
        from categories
        where name = 'for sale'
    )
);
-- show all ads posted by a given user
SELECT title
FROM ads
WHERE user_id IN (
    SELECT id
    FROM user
    WHERE name = 'bob'
);

-- -- -- For a given ad, what is the email address of the user that created it?
-- SELECT u.email, a.title
-- FROM adlister.user as u
-- JOIN adlister.ads as a
-- ON u.id = a.user_id
-- WHERE u.id = a.user_id;
--
-- -- -- For a given ad, what category, or categories, does it belong to?
-- SELECT a.title, c.name
-- FROM adlister.ads as a
-- JOIN adlister.ads_categories as ac
-- ON a.id = ac.ads_id
-- JOIN adlister.categories as c
-- ON c.id = ac.categories_id;
-- -- WHERE a.id = c.ads_id
--
-- -- -- For a given category, show all the ads that are in that category.
-- SELECT a.title, c.name
-- FROM adlister.categories as c
-- JOIN adlister.ads_categories as ac
-- ON c.id = ac.categories_id
-- JOIN adlister.ads as a
-- ON a.id = ac.ads_id
-- WHERE c.name = 'for sale';
--
-- -- -- For a given user, show all the ads they have posted.
--
-- SELECT a.title, u.name
-- FROM adlister.user as u
-- JOIN adlister.ads as a
-- ON u.id = a.user_id
-- WHERE u.name = 'bob' OR u.name = 'adam';