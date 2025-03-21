/*
A faire dans le fichiers queries.sql
Créer les tables pour Category et Tag
Obliger une annonce à avoir 1 et une seule Category
Une Category peut avoir plusieurs annonces
Une annonce peut avoir entre 0 et plusieurs tags
Un tag peut correspondre à plusieurs annonces
*/

-- Suppression des tables existantes
DROP TABLE IF EXISTS Ad_Tag;
DROP TABLE IF EXISTS AD;
DROP TABLE IF EXISTS Tag;
DROP TABLE IF EXISTS Category;

PRAGMA foreign_keys = ON;

-- Création de la table Category
CREATE TABLE Category (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(50) NOT NULL UNIQUE
);

-- Insertion des catégories
INSERT INTO Category (name) VALUES
('Other'),
('Vehicule'),
('Hifi');

-- Création de la table Tag
CREATE TABLE Tag (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(50) NOT NULL UNIQUE
);

-- Insertion des tags
INSERT INTO Tag (name) VALUES
('New'),
('Occasion');

-- Création de la table AD (annonces)
CREATE TABLE AD (
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

-- Insertion des annonces avec catégorie obligatoire
INSERT INTO AD (title, description, owner, price, createdAt, picture, location, category_id) VALUES
    ('Vélo à vendre', 'Vélo en bon état, peu servi', 'john.doe@gmail.com', 150, '2024-03-19', NULL, 'Paris', 2),
    ('Voiture d''occasion', 'Voiture très bien entretenue', 'jane.smith@gmail.com', 5000, '2024-03-18', 'https://example.com/image1.jpg', 'Lyon', 2),
    ('Stylo plume', 'Stylo plume Parker, encre bleue', 'writer.seller@gmail.com', 15, '2024-09-01', NULL, 'Bordeaux', 1),
    ('Chaise pliante', 'Chaise pliante pratique pour camping', 'camping.seller@gmail.com', 30, '2024-09-01', NULL, 'Paris', 1),
    ('Lampe de chevet', 'Lampe LED moderne, plusieurs couleurs', 'home.seller@gmail.com', 35, '2024-09-01', NULL, 'Lyon', 3);

-- Création de la table de liaison Ad_Tag
CREATE TABLE Ad_Tag (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    ad_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
    FOREIGN KEY (ad_id) REFERENCES AD(id) ON DELETE CASCADE,
    FOREIGN KEY (tag_id) REFERENCES Tag(id) ON DELETE CASCADE
);

-- ajout de tags aux annonces
INSERT INTO Ad_Tag (ad_id, tag_id) VALUES
(1, 1), -- Vélo à vendre - "New"
(2, 2), -- Voiture d'occasion - "Occasion"
(3, 1), -- Stylo plume - "New"
(4, 2), -- Chaise pliante - "Occasion"
(5, 1); -- Lampe de chevet - "New"

SELECT AD.id, AD.title, COALESCE(Tag.name, 'Aucun tag') AS tag_name
FROM AD
LEFT JOIN Ad_Tag ON AD.id = Ad_Tag.ad_id
LEFT JOIN Tag ON Ad_Tag.tag_id = Tag.id;


SELECT AD.id, AD.title, Tag.name AS tag_name
FROM AD
INNER JOIN Ad_Tag ON AD.id = Ad_Tag.ad_id
INNER JOIN Tag ON Ad_Tag.tag_id = Tag.id;

SELECT AD.id, AD.title, Tag.name AS tag_name
FROM AD
INNER JOIN Ad_Tag ON AD.id = Ad_Tag.ad_id
INNER JOIN Tag ON Ad_Tag.tag_id = Tag.id;

select * from ad_tag;

select * from ad join category on ad.id = category.id;

select price from ad;

Select price from ad right join category on category_id = ad.id;
