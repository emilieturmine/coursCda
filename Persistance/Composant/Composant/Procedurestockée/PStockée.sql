

-- Exercice 1 : création d'une procédure stockée sans paramètre

--     Créez la procédure stockée Lst_fournis correspondant à la requête n°2 afficher le code des fournisseurs pour lesquels une commande a été passée.
--     Exécutez la pour vérifier qu’elle fonctionne conformément à votre attente.
--     Exécutez la commande SQL suivante pour obtenir des informations sur cette procédure stockée :

-- SHOW CREATE PROCEDURE nom_procedure;


DELIMITER |

CREATE PROCEDURE P_Lst_fournis()
BEGIN
   SELECT NUMFOU FROM entcom WHERE NUMCOM IS NOT NULL;
END |

DELIMITER ;


-- Exercice 2 : création d'une procédure stockée avec un paramètre en entrée

-- Créer la procédure stockée Lst_Commandes, qui liste les commandes ayant un libellé particulier dans le champ obscom (cette requête sera construite à partir de la requête n°11).

DELIMITER |

CREATE PROCEDURE P_Lst_Commandes(IN commentaire varchar(255))
BEGIN
   SELECT entcom.NUMCOM,fournis.NOMFOU,produit.LIBART,(QTECDE*PRIUNI) 
   FROM fournis JOIN entcom ON fournis.NUMFOU=entcom.NUMFOU 
   JOIN ligcom ON ligcom.NUMCOM=entcom.NUMCOM 
   JOIN produit ON ligcom.CODART=produit.CODART 
   WHERE OBSCOM = commentaire;

END |

DELIMITER ;




-- Exercice 3 : création d'une procédure stockée avec plusieurs paramètres

-- Créer la procédure stockée CA_ Fournisseur, qui pour un code fournisseur et une année entrée en paramètre, calcule et restitue le CA potentiel de ce fournisseur pour l'année souhaitée (cette requête sera construite à partir de la requête n°19).

-- On exécutera la requête que si le code fournisseur est valide, c'est-à-dire dans la table FOURNIS.

-- Testez cette procédure avec différentes valeurs des paramètres. 

DELIMITER |

CREATE PROCEDURE P_CA_Fournisseur(IN fournisseur IN année OUT CAP)
BEGIN
  SELECT NUMFOU,((QTECDE*PRIUNI)*0.2) 
 FROM vente 
 JOIN produit ON vente.CODART=produit.CODART 
 JOIN ligcom ON produit.CODART =ligcom.CODART 
 WHERE NUMFOU 
   IN 
   (SELECT NUMFOU 
   FROM vente 
   JOIN produit ON vente.CODART=produit.CODART 
   JOIN ligcom ON produit.CODART =ligcom.CODART 
   WHERE DATEPART(yy,DERLIV)=93 )
 And fournis.NUMFOU IS NOT NULL
 AND fournisseur = NUMFOU  
 AND année = DERLIV
 AND CAP = ((QTECDE*PRIUNI)*0.2) 
 group by NUMFOU;
END |

DELIMITER ;
