-- Exercice 1

-- Sous PhpMyAdmin, après avoir sélectionné votre base Papyrus codez le script suivant et exécutez-le :

-- START TRANSACTION;

-- SELECT nomfou FROM fournis WHERE numfou=120;

-- UPDATE fournis  SET nomfou= 'GROSBRIGAND' WHERE numfou=120 

-- SELECT nomfou FROM fournis WHERE numfou=120 

--     Executez ces instructions ligne par ligne !

-- L'instruction START TRANSACTION est suivie d'une instruction UPDATE, mais aucune instruction COMMIT ou ROLLBACK correspondante n'est présente.

--     Que concluez-vous ?
Latransaction nest pas finie pour linstant rien nest effectif.

--     Les données sont-elles modifiables par d'autres utilisateurs (ouvrez une nouvelle fenêtre de requête pour interroger le fournisseur 120 par une instruction SELECT) ?
--     La transaction est-elle terminée ?non
--     Comment rendre la modification permanente ? ecrire commit
--     Comment annuler la transaction ?ecrire rollback

-- Codez les instructions nécessaires dans chaque cas pour vérifier vos réponses.  
START TRANSACTION;

SELECT nomfou FROM fournis WHERE numfou=120;

 UPDATE fournis  SET nomfou= 'GROSBRIGAND' WHERE numfou=120 

 SELECT nomfou FROM fournis WHERE numfou=120 
 commit;

START TRANSACTION;

SELECT nomfou FROM fournis WHERE numfou=120;

 UPDATE fournis  SET nomfou= 'GROSBRIGAND' WHERE numfou=120 

 SELECT nomfou FROM fournis WHERE numfou=120 
 ROLLBACK;
