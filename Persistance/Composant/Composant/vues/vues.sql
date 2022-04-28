CREATE VIEW nom_de_la_vue
AS
SELECT * FROM nom_table
WHERE...

/*hotel*/
CREATE VIEW hotel_station
AS
SELECT * FROM nom_table
WHERE...


    -- Afficher la liste des hôtels avec leur station
    CREATE VIEW V_hotel_station
AS
SELECT Hotel.sta_num,sta_nom,hot_num,hot_nom FROM Station join Hotel on Station.sta_num=Hotel.sta_num;

    -- Afficher la liste des chambres et leur hôtel
    CREATE VIEW V_hotel_chambre
AS
SELECT Hotel.hot_num,cha_num FROM Hotel 
JOIN Chambre ON Chambre.hot_num = Hotel.hot_num ;

    -- Afficher la liste des réservations avec le nom des clients
CREATE VIEW v_client_reservations
AS
SELECT  res_date,cha_num,client.cli_num,cli_nom FROM Reservation JOIN Client ON Client.cli_num = Reservation.cli_num;



    -- Afficher la liste des chambres avec le nom de l’hôtel et le nom de la station

    CREATE VIEW V_chambre_hotel_station
SELECT cha_num,hot_nom,sta_nom 
FROM Chambre 
JOIN Hotel ON Hotel.hot_num = Chambre.hot_num
JOIN Station ON Station.sta_num = Hotel.sta_num;

    -- Afficher les réservations avec le nom du client et le nom de l’hôtel
CREATE V_reservation_client_hotel
AS
SELECT res_date,cli_nom,hot_nom FROM Reservation JOIN Client ON Client.cli_num = Reservation.cli_num JOIN chambre ON<blabla> JOIN hotel on <blabla>;


/*papyrus*/
-- v_GlobalCde correspondant à la requête : A partir de la table Ligcom, afficher par code produit, 
-- la somme des quantités commandées et le prix total correspondant : on nommera la colonne correspondant à la somme des quantités commandées,
--  QteTot et le prix total, PrixTot. 

    CREATE VIEW v_GlobalCde
AS
SELECT CODART,SUM(QTECDE) AS "QTETOT",(SUM(QTECDE)*PRIUNI) AS "PRIXTOT" FROM ligcom GROUP BY CODART;

--     v_VentesI100 correspondant à la requête : Afficher les ventes dont le code produit est le I100 (affichage de toutes les colonnes de la table Vente).
CREATE VIEW v_VentesI100
AS
SELECT * FROM ventes
WHERE CODART = "I100";

--     A partir de la vue précédente, créez v_VentesI100Grobrigan remontant toutes les ventes concernant le produit I100 et le fournisseur 00120.

CREATE VIEW v_VentesI100Grobrigan
AS
SELECT * FROM ventes
WHERE CODART = "I100" AND NUMFOU=00120;
