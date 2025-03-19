DROP TABLE IF EXISTS AD;

CREATE TABLE AD (
    ID INTEGER PRIMARY KEY,
    TITLE TEXT,
    DESCRIPTION TEXT,
    OWNER TEXT,
    PRICE INTEGER,
    CREATEDAT DATE,
    PICTURE TEXT,
    LOCATION TEXT);

INSERT INTO AD ( TITLE, DESCRIPTION,OWNER,PRICE,CREATEDAT,PICTURE,LOCATION) VALUES
    ('Vélo à vendre', 'Vélo en bon état, peu servi', 'john.doe@gmail.com', 150, '2024-03-19', NULL, 'Paris'),
    ('Voiture d''occasion', 'Voiture très bien entretenue', 'jane.smith@gmail.com', 5000, '2024-03-18', 'https://example.com/image1.jpg', 'Lyon'),
    ('Stylo plume', 'Stylo plume Parker, encre bleue', 'writer.seller@gmail.com', 15, '2024-09-01', NULL, 'Bordeaux'),
    ('Chaise pliante', 'Chaise pliante pratique pour camping', 'camping.seller@gmail.com', 30, '2024-09-01', NULL, 'Paris'),
    ('Lampe de chevet', 'Lampe LED moderne, plusieurs couleurs', 'home.seller@gmail.com', 35, '2024-09-01', NULL, 'Lyon'),
    ('Table en bois massif', 'Table en chêne, très solide', 'woodworker@gmail.com', 200, '2024-03-14', NULL, 'Bordeaux'),
    ('Smartphone Android', 'Samsung Galaxy S21, très bon état', 'phone.seller@gmail.com', 500, '2024-03-13', 'https://example.com/image3.jpg', 'Paris'),
    ('Montre connectée', 'Apple Watch Series 7, fonctionne parfaitement', 'watch.seller@gmail.com', 250, '2024-03-12', NULL, 'Lyon'),
    ('Console de jeux', 'PlayStation 5, avec deux manettes', 'gamer@gmail.com', 450, '2024-03-11', 'https://example.com/image4.jpg', 'Bordeaux'),
    ('Paquet de stylos', 'Lot de 10 stylos Bic', 'office.seller@gmail.com', 5, '2024-02-10', NULL, 'Paris'),
    ('Câble USB-C', 'Chargeur rapide USB-C 2m', 'tech.seller@gmail.com', 12, '2024-02-15', NULL, 'Lyon'),
    ('Sac à dos', 'Sac à dos 20L, idéal pour la randonnée', 'sport.seller@gmail.com', 35, '2024-02-20', NULL, 'Bordeaux'),
    ('Aspirateur robot', 'Roomba i7, fonctionne très bien', 'clean.seller@gmail.com', 300, '2024-03-08', NULL, 'Bordeaux'),
    ('Machine à café', 'Nespresso Vertuo, avec capsules offertes', 'coffee.seller@gmail.com', 120, '2024-03-06', NULL, 'Lyon'),
    ('VTT tout terrain', 'Vélo de montagne avec suspensions', 'bike.seller@gmail.com', 400, '2024-03-05', NULL, 'Bordeaux'),
    ('Clé USB 64Go', 'Clé USB Kingston 64Go neuve', 'data.seller@gmail.com', 20, '2024-09-02', NULL, 'Paris'),
    ('Cahier de notes', 'Cahier A4 200 pages, lignage classique', 'student.seller@gmail.com', 10, '2024-09-03', NULL, 'Lyon'),
    ('Tapis de course', 'Tapis pliable, idéal pour la maison', 'fitness.seller@gmail.com', 600, '2024-03-01', NULL, 'Paris'),
    ('Barbecue à gaz', 'Barbecue Weber, idéal pour l''été', 'bbq.seller@gmail.com', 250, '2024-02-28', 'https://example.com/image7.jpg', 'Lyon'),
    ('Trousse scolaire', 'Trousse avec 5 stylos et règle', 'school.seller@gmail.com', 8, '2024-09-02', NULL, 'Bordeaux');

    -- SELECT * FROM AD;
    -- SELECT * FROM AD WHERE VILLE="Bordeaux";
    -- DELETE FROM AD WHERE PRIX > 40;
    -- UPDATE AD SET PRIX=0 WHERE DATE="2024-09-01";
    -- SELECT * FROM AD;
    -- SELECT AVG(PRIX) FROM AD WHERE VILLE="Paris";
    -- SELECT VILLE, AVG(PRIX) FROM AD GROUP BY VILLE;