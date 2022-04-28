/*1.Quelles sont les commandes du fournisseur 09120 ?*/
SELECT NUMCOM,DATCOM,NUMFOU FROM entcom WHERE NUMFOU = 09120;
/*2.Afficher le code des fournisseurs pour lesquels des commandes ont été passées.*/
SELECT NUMFOU FROM entcom WHERE NUMCOM IS NOT NULL;
/*3.Afficher le nombre de commandes fournisseurs passées,
 et le nombre de fournisseur concernés.*/
 SELECT count(distinct NUMFOU) , count ( NUMCOM) FROM entcom WHERE NUMCOM IS NOT NULL;
/*4.Editer les produits ayant un stock inférieur ou égal au stock d 'alerte et
 dont la quantité annuelle est inférieur est inférieure à 1000
 (informations à fournir : n° produit, libellé produit, stock, stock actuel
 d' alerte,
 quantité annuelle
 )*/
 SELECT CODART,LIBART,STKPHY,STKALE,QTEANN FROM produit WHERE STKPHY < STKALE AND QTEANN < 1000;
/* 5.Quels sont les fournisseurs situés dans les départements 75 78 92 77 ? L ’ affichage (département, nom fournisseur) sera effectué par département décroissant,
 puis par ordre alphabétique*/
 SELECT NOMFOU,POSFOU 
 FROM fournis 
 WHERE lEFT(POSFOU,2) 
 IN ('75' , '78' , '92' , '77')
 ORDER BY 
 POSFOU DESC, 
 NOMFOU DESC;
 /*

 6.Quelles sont les commandes passées au mois de mars et avril ?*/


SELECT NUMCOM,DATCOM 
 FROM entcom 
 WHERE MONTH( DATCOM) 
 IN (03,04);
 /*
7.Quelles sont les commandes du jour qui ont des observations particulières ? (Affichage numéro de commande, date de commande)
 */
SELECT NUMCOM,DATCOM
 FROM entcom WHERE OBSCOM IS NOT NULL;
 /*8.Lister le total de chaque commande par total décroissant (Affichage numéro de commande et total)
 */SELECT NUMCOM ,(QTECDE*PRIUNI)FROM ligcom group BY NUMCOM ORDER BY (QTECDE*PRIUNI)DESC;
/*9.Lister les commandes dont le total est supérieur à 10 000 €;
 on exclura dans le calcul du total les articles commandés en quantité supérieure ou égale à 1000.(Affichage numéro de commande et total) 
 */
 SELECT NUMCOM ,(QTECDE*PRIUNI)FROM ligcom WHERE (QTECDE*PRIUNI)>10000 AND QTECDE >= 1000;
 
/*10.Lister les commandes par nom fournisseur (
 Afficher le nom du fournisseur,
 le numéro de commande et la date
 ) */
 SELECT NOMFOU,NUMCOM,DATCOM FROM entcom JOIN fournis ON entcom.NUMFOU = fournis.NUMFOU GROUP BY NOMFOU;
/*11.Sortir les produits des commandes ayant le mot "urgent' en
 observation?
 (Afficher le numéro de commande, le nom du fournisseur, le libellé du
 produit et le sous total = quantité commandée * Prix unitaire)*/
SELECT entcom.NUMCOM,fournis.NOMFOU,produit.LIBART,(QTECDE*PRIUNI) FROM fournis JOIN entcom ON fournis.NUMFOU=entcom.NUMFOU JOIN ligcom ON ligcom.NUMCOM=entcom.NUMCOM JOIN produit ON ligcom.CODART=produit.CODART WHERE entcom.OBSCOM LIKE '%urgent%';

 
/*12. Coder de 2 manières différentes la requête suivante :
 Lister le nom des fournisseurs susceptibles de livrer au moins un article*/

SELECT NOMFOU FROM fournis JOIN  entcom ON fournis.NUMFOU=entcom.NUMFOU WHERE NUMCOM IS NOT NULL;

SELECT DISTINCT NOMFOU FROM fournis JOIN  vente ON fournis.NUMFOU=vente.NUMFOU WHERE DELLIV IS NOT NULL;


/*13. 
 Lister les commandes (Numéro et date) dont le fournisseur est celui de
 la commande 70210 :*/
SELECT NUMCOM,DATECOM FROM entcom WHERE NUMFOU IN (SELECT NUMFOU FROM entcom WHERE NUMCOM = 70210);





/*14. Dans les articles susceptibles d’être vendus, lister les articles moins
 chers (basés sur Prix1) que le moins cher des rubans (article dont le
 premier caractère commence par R). On affichera le libellé de l’article
 et prix1*/
SELECT LIBART, PRIX1 
FROM produit 
JOIN vente ON produit.CODART = vente.CODART 
WHERE PRIX1<(SELECT MIN(PRIX1) 
FROM vente 
WHERE 
LEFT('LIBART',1)="r" );
/*15. Editer la liste des fournisseurs susceptibles de livrer les produits
 dont le stock est inférieur ou égal à 150 % du stock d'alerte. La liste est
 triée par produit puis fournisseur*/


 SELECT vente.NuMFOU FROM vente JOIN produit ON vente.CODART = produit.CODART WHERE STKPHY <= (STKALE*1.5) GROUP BY LIBART order BY  LIBART ASC ;

 SELECT vente.NuMFOU FROM vente JOIN produit ON vente.CODART = produit.CODART WHERE STKPHY <= (STKALE*1.5) GROUP BY NUMFOU order BY  NUMFOU ASC ;
/*16. Éditer la liste des fournisseurs susceptibles de livrer les produit dont
 le stock est inférieur ou égal à 150 % du stock d'alerte et un délai de
 livraison d'au plus 30 jours. La liste est triée par fournisseur puis
 produit*/
 SELECT vente.NuMFOU FROM vente JOIN produit ON vente.CODART = produit.CODART JOIN ligcom ON WHERE DELLIV <= 30 AND STKPHY <= (STKALE*1.5) GROUP BY NUMFOU order BY  NUMFOU ASC ;

/*17. Avec le même type de sélection que ci-dessus, sortir un total des
 stocks par fournisseur trié par total décroissant*/
SELECT SUM(STKPHY),NUMFOU 
FROM produit 
JOIN vente 
ON vente.CODART=produit.CODART 
GROUP BY NUMFOU 
ORDER BY SUM(STKPHY) DESC;

/*18. En fin d'année, sortir la liste des produits dont la quantité réellement
 commandée dépasse 90% de la quantité annuelle prévue.*/
 SELECT produit.CODART,LIBART FROM produit JOIN vente ON vente.CODART=produit.CODART WHERE ( QTE1+QTE2+QTE3) > (QTEANN*0.9);
  

/*19. Calculer le chiffre d'affaire par fournisseur pour l'année 93 sachant
 que les prix indiqués sont hors taxes et que le taux de TVA est 20%.*/

SELECT NUMFOU,((QTECDE*PRIUNI)*0.2) 
 FROM vente 
 JOIN produit ON vente.CODART=produit.CODART 
 JOIN ligcom ON produit.CODART =ligcom.CODART 
 WHERE NUMFOU IN (SELECT NUMFOU FROM vente 
 JOIN produit ON vente.CODART=produit.CODART 
 JOIN ligcom ON produit.CODART =ligcom.CODART WHERE DATEPART(yy,DERLIV)=93 )
 group by NUMFOU;
 
 
/*1. Application d'une augmentation de tarif de 4% pour le prix 1 et de 2%
 pour le prix2 pour le fournisseur 9180*/

UPDATE vente 
SET PRIX1 = PRIX1*1.04 
AND PRIX2= PRIX2*1.02 
WHERE NUMFOU=9180;



/*2.Dans la table vente,
 mettre à jour le prix2 des articles dont le prix2 est null,
 en affectant a prix2 la valeur de prix1.*/

UPDATE vente 
SET PRIX2 = PRIX1

WHERE PRIX2 IS NULL;
 
/*3.Mettre à jour le champ obscom en positionnant '*****' pour toutes les commandes dont le fournisseur a un indice de satisfaction < 5 */
UPDATE entcom,FOURNIS
SET OBSCOM = '*******'
WHERE SATISF <5;


/*4.Suppression du produit I110 */
DELETE FROM produit
WHERE CODART =I110;
/*5.Suppression des entête de commande qui n 'ont aucune ligne*/
DELETE  FROM ligcom WHERE NUMLIG IS NULL;