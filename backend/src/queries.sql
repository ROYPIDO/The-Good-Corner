/*
A faire dans le fichiers queries.sql
Créer les tables pour Category et Tag
Obliger une annonce à avoir 1 et une seule Category
Une Category peut avoir plusieurs annonces
Une annonce peut avoir entre 0 et plusieurs tags
Un tag peut correspondre à plusieurs annonces
*/


DROP TABLE IF EXISTS Ad_Tag;
DROP TABLE IF EXISTS Ad;
DROP TABLE IF EXISTS Tag;
DROP TABLE IF EXISTS Category;

PRAGMA foreign_keys = ON;


CREATE TABLE Category (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(50) NOT NULL UNIQUE
);


INSERT INTO Category (name) VALUES
('Other'),
('Vehicule'),
('Hifi');


CREATE TABLE Tag (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(50) NOT NULL UNIQUE
);


INSERT INTO Tag (name) VALUES
('New'),
('Occasion');


CREATE TABLE Ad (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    description TEXT,
    owner TEXT NOT NULL,
    price INTEGER NOT NULL,
    createdAt DATE NOT NULL,
    picture TEXT,
    location TEXT NOT NULL,
    category_id INTEGER NOT NULL,
    FOREIGN KEY (category_id) REFERENCES Category(id) ON DELETE CASCADE
);

INSERT INTO ad (TITLE, DESCRIPTION, OWNER, PRICE, CREATEDAT, PICTURE, LOCATION, category_id) VALUES
    ('Vélo à vendre', 'Vélo en bon état, peu servi', 'john.doe@gmail.com', 150, '2024-03-19', NULL, 'Paris', 2),
    ('Voiture d''occasion', 'Voiture très bien entretenue', 'jane.smith@gmail.com', 5000, '2024-03-18', 'https://example.com/image1.jpg', 'Lyon', 2),
    ('Stylo plume', 'Stylo plume Parker, encre bleue', 'writer.seller@gmail.com', 15, '2024-09-01', NULL, 'Bordeaux', 1),
    ('Chaise pliante', 'Chaise pliante pratique pour camping', 'camping.seller@gmail.com', 30, '2024-09-01', NULL, 'Paris', 1),
    ('Lampe de chevet', 'Lampe LED moderne, plusieurs couleurs', 'home.seller@gmail.com', 35, '2024-09-01', NULL, 'Lyon', 3),
    ('Table en bois massif', 'Table en chêne, très solide', 'woodworker@gmail.com', 200, '2024-03-14', NULL, 'Bordeaux', 1),
    ('Smartphone Android', 'Samsung Galaxy S21, très bon état', 'phone.seller@gmail.com', 500, '2024-03-13', 'https://example.com/image3.jpg', 'Paris', 2),
    ('Montre connectée', 'Apple Watch Series 7, fonctionne parfaitement', 'watch.seller@gmail.com', 250, '2024-03-12', NULL, 'Lyon', 3),
    ('Console de jeux', 'PlayStation 5, avec deux manettes', 'gamer@gmail.com', 450, '2024-03-11', 'https://example.com/image4.jpg', 'Bordeaux', 2),
    ('Paquet de stylos', 'Lot de 10 stylos Bic', 'office.seller@gmail.com', 5, '2024-02-10', NULL, 'Paris', 1),
    ('Câble USB-C', 'Chargeur rapide USB-C 2m', 'tech.seller@gmail.com', 12, '2024-02-15', NULL, 'Lyon', 1),
    ('Sac à dos', 'Sac à dos 20L, idéal pour la randonnée', 'sport.seller@gmail.com', 35, '2024-02-20', NULL, 'Bordeaux', 1),
    ('Aspirateur robot', 'Roomba i7, fonctionne très bien', 'clean.seller@gmail.com', 300, '2024-03-08', NULL, 'Bordeaux', 3),
    ('Machine à café', 'Nespresso Vertuo, avec capsules offertes', 'coffee.seller@gmail.com', 120, '2024-03-06', NULL, 'Lyon', 3),
    ('VTT tout terrain', 'Vélo de montagne avec suspensions', 'bike.seller@gmail.com', 400, '2024-03-05', NULL, 'Bordeaux', 2),
    ('Clé USB 64Go', 'Clé USB Kingston 64Go neuve', 'data.seller@gmail.com', 20, '2024-09-02', NULL, 'Paris', 1),
    ('Cahier de notes', 'Cahier A4 200 pages, lignage classique', 'student.seller@gmail.com', 10, '2024-09-03', NULL, 'Lyon', 1),
    ('Tapis de course', 'Tapis pliable, idéal pour la maison', 'fitness.seller@gmail.com', 600, '2024-03-01', NULL, 'Paris', 3),
    ('Barbecue à gaz', 'Barbecue Weber, idéal pour l''été', 'bbq.seller@gmail.com', 250, '2024-02-28', 'https://example.com/image7.jpg', 'Lyon', 2),
    ('Trousse scolaire', 'Trousse avec 5 stylos et règle', 'school.seller@gmail.com', 8, '2024-09-02', NULL, 'Bordeaux', 1);


CREATE TABLE Ad_Tag (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    ad_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
    FOREIGN KEY (ad_id) REFERENCES Ad(id) ON DELETE CASCADE,
    FOREIGN KEY (tag_id) REFERENCES Tag(id) ON DELETE CASCADE
);


INSERT INTO Ad_Tag (ad_id, tag_id) VALUES
(1, 1),
(2, 2),
(3, 1),
(4, 2),
(5, 1),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 1),
(11, 2),
(12, 1),
(13, 2),
(14, 2),
(15, 1),
(16, 2),
(17, 1),
(18, 2),
(19, 2),
(20, 1);

-- SELECT Ad.id, Ad.title, COALESCE(Tag.name, 'Aucun tag') AS tag_name
-- FROM Ad
-- LEFT JOIN Ad_Tag ON Ad.id = Ad_Tag.ad_id
-- LEFT JOIN Tag ON Ad_Tag.tag_id = Tag.id;


-- SELECT AD.id, AD.title, Tag.name AS tag_name
-- FROM AD
-- INNER JOIN Ad_Tag ON AD.id = Ad_Tag.ad_id
-- INNER JOIN Tag ON Ad_Tag.tag_id = Tag.id;

-- SELECT AD.id, AD.title, Tag.name AS tag_name
-- FROM AD
-- INNER JOIN Ad_Tag ON AD.id = Ad_Tag.ad_id
-- INNER JOIN Tag ON Ad_Tag.tag_id = Tag.id;

-- select * from ad_tag;

-- select * from ad join category on ad.id = category.id;

-- select price from ad;

-- Select price from ad right join category on category_id = ad.id;
