-- A partir de l'exemple suivant, créez les déclencheurs suivants :

--     modif_reservation : interdire la modification des réservations (on autorise l'ajout et la suppression).

CREATE TRIGGER modif_reservation AFTER UPDATE ON reservation
    FOR EACH ROW
    BEGIN
       
            SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'Un problème est survenu. Les modifications !';
        END IF;
END;




--     insert_reservation : interdire l'ajout de réservation pour les hôtels possédant déjà 10 réservations.
CREATE TRIGGER insert_reservation AFTER INSERT ON reservation
    FOR EACH ROW
    BEGIN
       insert into reservation (cha_num,cli_num,res_dat_deb,res_dat_fin)
            SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'Un problème est survenu. Les modifications !';
        END IF;
END;
--     insert_reservation2 : interdire les réservations si le client possède déjà 3 réservations.
--     insert_chambre : lors d'une insertion, on calcule le total des capacités des chambres pour l'hôtel, si ce total est supérieur à 50, on interdit l'insertion de la chambre.
