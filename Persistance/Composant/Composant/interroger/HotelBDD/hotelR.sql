/*1 - Afficher la liste des hôtels. Le résultat doit faire apparaître le nom de l’hôtel et la ville
 */
SELECT
    hot_nom,
    hot_ville
FROM
    hotel;

/*2 - Afficher la ville de résidence de Mr White Le résultat doit faire apparaître le nom, le prénom, et l'adresse du client
 */
SELECT
    cli_nom,
    cli_prenom,
    cli_adresse,
    cli_ville
FROM
    client;

/* 3 - Afficher la liste des stations dont l’altitude < 1000 Le résultat doit faire apparaître le nom de la station et l' altitude 
 */
select
    sta_nom,
    sta_altitude
FROM
    station
WHERE
    sta_altitude < 1000;

/* 4 - Afficher la liste des chambres ayant une capacité > 1 Le résultat doit faire apparaître le numéro de la chambre ainsi que la capacité 
 */
SELECT
    cha_numero,
    cha_capacite
FROM
    chambre
WHERE
    cha_capacite > 1;

/* 5 - Afficher les clients n ’ habitant pas à Londre Le résultat doit faire apparaître le nom du client et la ville 
 */
SELECT
    cli_nom,
    cli_ville
FROM
    client
WHERE
    cli_ville NOT LIKE "Londre";

/* 6 - Afficher la liste des hôtels située sur la ville de Bretou et possédant une catégorie > 3 Le résultat doit faire apparaître le nom de l 'hôtel, ville et la catégorie
 
 Lot 2 */
SELECT
    hot_nom,
    hot_ville,
    hot_categorie
FROM
    hotel
WHERE
    hot_ville = "Bretou"
    AND hot_categorie > 3;

/* 7 - Afficher la liste des hôtels avec leur station Le résultat doit faire apparaître le nom de la station, le nom de l’hôtel, la catégorie, la ville)
 */
SELECT
    sta_id,
    hot_nom,
    hot_categorie,
    hot_ville
FROM
    hotel
    JOIN station ON station.sta_id = hotel.hot_sta_id;

/* 8 - Afficher la liste des chambres et leur hôtel Le résultat doit faire apparaître le nom de l’hôtel, la catégorie, la ville, le numéro de la chambre)
 */
SELECT
    hot_nom,
    hot_categorie,
    hot_ville,
    cha_numero
FROM
    hotel
    JOIN chambre ON chambre.cha_hot_id = hotel.hot_id;

/* 9 - Afficher la liste des chambres de plus d' une place dans des hôtels situés sur la ville de Bretou Le résultat doit faire apparaître le nom de l ’ hôtel,
 la catégorie,
 la ville,
 le numéro de la chambre et sa capacité
 ) 
 */
SELECT
    hot_nom,
    hot_categorie,
    hot_ville,
    cha_numero,
    cha_capacite
FROM
    hotel
    JOIN chambre ON chambre.cha_hot_id = hotel.hot_id;

/* 10 - Afficher la liste des réservations avec le nom des clients Le résultat doit faire apparaître le nom du client,
 le nom de l ’ hôtel,
 la date de réservation  */
SELECT
    cli_nom,
    hot_nom,
    res_date
FROM
    hotel
    JOIN chambre ON hotel.hot_id = chambre.cha_hot_id;

JOIN reservation ON reservation.res_cha_id = chambre.cha_id
JOIN client ON client.cli_id = reservation.res_cli_id;

/* 11 - Afficher la liste des chambres avec le nom de l ’ hôtel et le nom de la station Le résultat doit faire apparaître le nom de la station,
 le nom de l ’ hôtel,
 le numéro de la chambre et sa capacité
 ) 
 */
SELECT
    hot_nom,
    sta_nom,
    cha_nom,
    cha_capacite
FROM
    station
    JOIN hotel ON station.sta_id = hotel.hot_sta_id
    JOIN chambre ON hotel.hot_id = chambre.cha_hot_id
    JOIN reservation ON reservation.res_cha_id = chambre.cha_id
    JOIN client ON client.cli_id = reservation.res_cli_id;

/* 12 - Afficher les réservations avec le nom du client et le nom de l ’ hôtel Le résultat doit faire apparaître le nom du client,
 le nom de l ’ hôtel,
 la date de début du séjour et la durée du séjour   */
SELECT
    cli_nom,
    hot_nom,
    res_date_debut,
    (res_date_fin - res_date_debut)
FROM
    hotel
    JOIN chambre ON hotel.hot_id = chambre.cha_hot_id
    JOIN reservation ON reservation.res_cha_id = chambre.cha_id
    JOIN client ON client.cli_id = reservation.res_cli_id;

/* 13 - Compter le nombre d ’ hôtel par station */
SELECT
    COUNT(hot_id),
    sta_id
FROM
    station
    JOIN hotel ON station.sta_id = hotel.hot_sta_id
GROUP BY
    sta_id;

/* 14 - Compter le nombre de chambre par station */
SELECT
    count(cha_id),
    sta_id
FROM
    station
    JOIN hotel ON station.sta_id = hotel.hot_sta_id
    JOIN chambre ON hotel.hot_id = chambre.cha_hot_id
GROUP BY
    sta_id;

/*   15 - Compter le nombre de chambre par station ayant une capacité > 1 */
SELECT
    count(cha_id),
    cha_capacite,
    sta_id
FROM
    station
    JOIN hotel ON station.sta_id = hotel.hot_sta_id
    JOIN chambre ON hotel.hot_id = chambre.cha_hot_id
WHERE
    cha_capacite > 1
GROUP BY
    sta_id;

/*16 - Afficher la liste des hôtels pour lesquels Mr Squire a effectué une réservation*/
SELECT
    hot_nom,
    cli_nom,
    res_id
FROM
    hotel
    JOIN chambre ON hotel.hot_id = chambre.cha_hot_id
    JOIN reservation ON reservation.res_cha_id = chambre.cha_id
    JOIN client ON client.cli_id = reservation.res_cli_id
WHERE
    cli_nom = "Squire";

/*17 - Afficher la durée moyenne des réservations par station*/
SELECT
    AVG(res_date_fin - res_date_debut),
    sta_id
FROM
    station
    JOIN hotel ON station.sta_id = hotel.hot_sta_id
    JOIN chambre ON hotel.hot_id = chambre.cha_hot_id
    JOIN reservation ON reservation.res_cha_id = chambre.cha_id
GROUP BY
    sta_id;