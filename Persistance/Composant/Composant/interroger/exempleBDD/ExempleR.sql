/*1. Afficher toutes les informations concernant les employés.*/
SELECT
	*
FROM
	employe;

/*2. Afficher toutes les informations concernant les départements.*/
SELECT
	*
FROM
	dept;

/*3. Afficher le nom, la date d'embauche, le numéro du supérieur, le
 numéro de département et le salaire de tous les employés.*/
SELECT
	nom,
	dateemb,
	nosup,
	nodep,
	salaire
FROM
	employe;

/*4. Afficher le titre de tous les employés.*/
SELECT
	nom,
	titre
FROM
	employe;

/*5. Afficher les différentes valeurs des titres des employés.*/
SELECT
	DISTINCT titre
FROM
	employe;

/*6. Afficher le nom, le numéro d'employé et le numéro du
 département des employés dont le titre est « Secrétaire ».  A TESTER */
SELECT
	nom,
	noemp,
	nodep
FROM
	employe
WHERE
	titre = "Secrétaire";

/*7. Afficher le nom et le numéro de département dont le numéro de
 département est supérieur à 40.*/
SELECT
	nom,
	noemp,
	nodep
FROM
	employe
WHERE
	nodep > 40;

/*8. Afficher le nom et le prénom des employés dont le nom est
 alphabétiquement antérieur au prénom. */
SELECT
	nom,
	prenom
FROM
	employe
WHERE
	nom < prenom;

/*9. Afficher le nom, le salaire et le numéro du département des employés
 dont le titre est « Représentant », le numéro de département est 35 et
 le salaire est supérieur à 20000. */
SELECT
	nom,
	salaire,
	nodep
FROM
	employe
WHERE
	titre = "Représentant"
	AND nodep = 35
	AND salaire > 20000;

/*10.Afficher le nom, le titre et le salaire des employés dont le titre est
 « Représentant » ou dont le titre est « Président ».*/
SELECT
	nom,
	titre,
	salaire
FROM
	employe
WHERE
	titre = "Représentant"
	OR "Président"
	/*11.Afficher le nom, le titre, le numéro de département, le salaire des
	 employés du département 34, dont le titre est « Représentant » ou
	 « Secrétaire ». */
SELECT
	nom,
	titre,
	nodep,
	salaire
FROM
	employe
WHERE
	nodep = 34
	AND titre = "Représentant"
	OR "Secrétaire";

/*12.Afficher le nom, le titre, le numéro de département, le salaire des
 employés dont le titre est Représentant, ou dont le titre est Secrétaire
 dans le département numéro 34.*/
SELECT
	nom,
	titre,
	nodep,
	salaire
FROM
	employe
WHERE
	nodep = 34
	AND titre = "Représentant"
	OR "Secrétaire";

/*13.Afficher le nom, et le salaire des employés dont le salaire est compris
 entre 20000 et 30000.  */
SELECT
	nom,
	salaire
FROM
	employe
WHERE
	salaire > 20000
	AND salaire < 30000;

/*15.Afficher le nom des employés commençant par la lettre « H ». A*/
SELECT
	nom
FROM
	employe
WHERE
	nom LIKE "H%";

/*16.Afficher le nom des employés se terminant par la lettre « n ».*/
SELECT
	nom
FROM
	employe
WHERE
	nom LIKE "%n";

/*17.Afficher le nom des employés contenant la lettre « u » en 3ème
 position. A TESTER*/
SELECT
	nom
FROM
	employe
WHERE
	nom LIKE "__u%";

/*18.Afficher le salaire et le nom des employés du service 41 classés par
 salaire croissant. */
SELECT
	salaire,
	nom
FROM
	employe
WHERE
	nodep = 41
ORDER BY
	salaire ASC;

/*19.Afficher le salaire et le nom des employés du service 41 classés par
 salaire décroissant. */
SELECT
	salaire,
	nom
FROM
	employe
WHERE
	nodep = 41
ORDER BY
	salaire DESC;

/*20.Afficher le titre, le salaire et le nom des employés classés par titre
 croissant et par salaire décroissant. */
SELECT
	salaire,
	titre,
	nom
FROM
	employe
ORDER BY
	titre ASC,
	salaire DESC;

/*21.Afficher le taux de commission, le salaire et le nom des employés
 classés par taux de commission croissante.*/
SELECT
	tauxcom,
	salaire,
	nom
FROM
	employe
ORDER BY
	tauxcom ASC;

/*22.Afficher le nom, le salaire, le taux de commission et le titre des
 employés dont le taux de commission n'est pas renseigné.*/
SELECT
	nom,
	salaire,
	tauxcom,
	titre
FROM
	employe
WHERE
	tauxcom IS NULL;

/*23.Afficher le nom, le salaire, le taux de commission et le titre des
 employés dont le taux de commission est renseigné.*/
SELECT
	nom,
	salaire,
	tauxcom,
	titre
FROM
	employe
WHERE
	tauxcom IS NOT NULL;

/*24.Afficher le nom, le salaire, le taux de commission, le titre des
 employés dont le taux de commission est inférieur à 15.*/
SELECT
	nom,
	salaire,
	tauxcom,
	titre
FROM
	employe
WHERE
	tauxcom IS NOT NULL
	AND tauxcom < 15;

/*25. Afficher le nom, le salaire, le taux de commission, le titre des
 employés dont le taux de commission est supérieur à 15.*/
SELECT
	nom,
	salaire,
	tauxcom,
	titre
FROM
	employe
WHERE
	tauxcom IS NOT NULL
	AND tauxcom > 15;

/*26.Afficher le nom, le salaire, le taux de commission et la commission des
 employés dont le taux de commission n'est pas nul. (la commission
 est calculée en multipliant le salaire par le taux de commission) */
SELECT
	nom,
	salaire,
	tauxcom,
	(tauxcom * salaire)
FROM
	employe
WHERE
	tauxcom IS NOT NULL;

/*27. Afficher le nom, le salaire, le taux de commission, la commission des
 employés dont le taux de commission n'est pas nul, classé par taux de
 commission croissant. */
SELECT
	nom,
	salaire,
	tauxcom,
	(tauxcom * salaire)
FROM
	employe
WHERE
	tauxcom IS NOT NULL
ORDER BY
	tauxcom ASC;

/*28. Afficher le nom et le prénom (concaténés) des employés. Renommer
 les colonnes A TESTER*/
SELECT
	CONCAT(nom, " ", prenom) AS NomPrenom
FROM
	employe;

/*29. Afficher les 5 premières lettres du nom des employés.*/
SELECT
	SUBSTRING(nom, 1, 5)
FROM
	employe;

/*30. Afficher le nom et le rang de la lettre « r » dans le nom des
 employés.*/
SELECT
	LOCATE("r", nom)
FROM
	employe;

/*31. Afficher le nom, le nom en majuscule et le nom en minuscule de
 l'employé dont le nom est Vrante.*/
SELECT
	UPPER(nom),
	LOWER(nom)
FROM
	employe
WHERE
	nom = "Vrante";

/*32. Afficher le nom et le nombre de caractères du nom des employés.*/
SELECT
	nom,
	LENGTH(nom)
FROM
	employe;

/*34.Rechercher le prénom des employés et le numéro de la région de leur
 département.*/
SELECT
	prenom,
	noregion
FROM
	employe
	JOIN dept ON employe.nodep = dept.nodept;

/*35.Rechercher le numéro du département, le nom du département, le
 nom des employés classés par numéro de département (renommer les
 tables utilisées).*/
SELECT
	nodep AS "numero de departement",
	dept.nom AS " nom de departement",
	employe.nom AS "nom de l'employé"
FROM
	dept
	JOIN employe ON dept.nodept = employe.nodep
ORDER BY
	nodept;

/*36.Rechercher le nom des employés du département Distribution*/
SELECT
	employe.nom
FROM
	employe
	JOIN dept ON employe.nodep = dept.nodept
WHERE
	dept.nom = "distribution";

/*37.Rechercher le nom et le salaire des employés qui gagnent plus que
 leur patron, et le nom et le salaire de leur patron.*/
SELECT
	e.nom,
	e.prenom,
	e.salaire,
	p.nom,
	p.prenom,
	p.salaire
FROM
	employe AS e
	JOIN employe AS p ON p.noemp = e.nosup
WHERE
	e.salaire > p.salaire;

/*38.Rechercher le nom et le titre des employés qui ont le même titre que
 Amartakaldire.*/
SELECT
	nom,
	titre
FROM
	employe
WHERE
	titre IN (
		SELECT
			titre
		FROM
			employe
		WHERE
			nom Like "Amartakaldire"
	);

/*39.Rechercher le nom, le salaire et le numéro de département des
 employés qui gagnent plus qu'un seul employé du département 31,
 classés par numéro de département et salaire.*/
SELECT
	nom,
	salaire,
	nodep
FROM
	employe
WHERE
	salaire > (
		SELECT
			MIN(salaire)
		FROM
			employe
		WHERE
			nodep = 31
	)
	AND nodep != 31
order BY
	nodep DESC,
	salaire desc;

/*40.Rechercher le nom, le salaire et le numéro de département des
 employés qui gagnent plus que tous les employés du département 31,
 classés par numéro de département et salaire.*/
SELECT
	nom,
	salaire,
	nodep
FROM
	employe
WHERE
	salaire >(
		SELECT
			MAX(salaire)
		FROM
			employe
		WHERE
			nodep = 31
	)
order BY
	nodep DESC,
	salaire DESC;

/*41.Rechercher le nom et le titre des employés du service 31 qui ont un
 titre que l'on trouve dans le département 32.*/
SELECT
	nom,
	titre
FROM
	employe
WHERE
	titre IN (
		SELECT
			titre
		FROM
			employe
		WHERE
			nodep = 32
	)
	AND nodep = 31;

/*42.Rechercher le nom et le titre des employés du service 31 qui ont un
 titre l'on ne trouve pas dans le département 32.*/
SELECT
	nom,
	titre
FROM
	employe
WHERE
	titre not IN (
		SELECT
			titre
		FROM
			employe
		WHERE
			nodep = 32
	)
	AND nodep = 31;

/*43.Rechercher le nom, le titre et le salaire des employés qui ont le même
 titre et le même salaire que Fairent.*/
SELECT
	nom,
	titre,
	salaire
FROM
	employe
WHERE
	salaire IN (
		SELECT
			salaire
		FROM
			employe
		WHERE
			nom = "fairent"
	)
	AND titre IN (
		SELECT
			titre
		FROM
			employe
		WHERE
			nom = "fairent"
	);

/*44.Rechercher le numéro de département, le nom du département, le
 nom des employés, en affichant aussi les départements dans lesquels
 il n'y a personne, classés par numéro de département.*/
SELECT
	nodept,
	dept.nom,
	employe.nom
FROM
	dept
	left join employe on dept.nodept = employe.nodep
ORDER BY
	nodept DESC;

/*45.Calculer le nombre d'employés de chaque titre.*/
SELECT
	COUNT(noemp),
	titre
FROM
	employe
GROUP BY
	titre;

/*46.Calculer la moyenne des salaires et leur somme, par région.*/
SELECT
	avg(salaire),
	SUM(salaire),
	noregion
FROM
	employe
	LEFT JOIN dept ON employe.nodep = dept.nodept
GROUP BY
	noregion;

/*47.Afficher les numéros des départements ayant au moins 3 employés.*/
SELECT
	nodep,
	COUNT(noemp)
FROM
	employe
GROUP BY
	nodep
HAVING
	COUNT(noemp) > 3;

/*48.Afficher les lettres qui sont l'initiale d'au moins trois employés.*/
SELECT
	LEFT(nom, 1),
	COUNT(noemp)
FROM
	employe
GROUP BY
	LEFT(nom, 1)
HAVING
	COUNT(noemp) >= 3;

/*49.Rechercher le salaire maximum et le salaire minimum parmi tous les
 salariés et l'écart entre les deux*/
SELECT
	(MAX(salaire) - MIN(salaire)) AS "ecart",
	MAX(salaire),
	MIN(salaire)
FROM
	employe;

/*50.Rechercher le nombre de titres différents.*/
SELECT
	count(distinct titre)
FROM
	employe;

/*51.Pour chaque titre, compter le nombre d'employés possédant ce titre*/
SELECT
	titre,
	COUNT(noemp)
FROM
	employe
GROUP BY
	titre;

/*52.Pour chaque nom de département, afficher le nom du département et
 le nombre d'employés*/
SELECT
	dept.nom,
	COUNT(noemp)
FROM
	dept
	LEFT JOIN employe on dept.nodept = employe.nodep
group BY
	dept.nom;

/*53.Rechercher les titres et la moyenne des salaires par titre dont la
 moyenne est supérieure à la moyenne des salaires des Représentants  A RETRAVAILLER*/
SELECT
	AVG(salaire),
	titre
FROM
	employe
WHERE
	AVG(salaire) > ANY (
		select
			avg(salaire)
		FROM
			employe
		WHERE
			titre = "Représentant"
	)
GROUP BY
	employe.titre;

/*54.Rechercher le nombre de salaires renseignés et le nombre de taux de
 commission renseignés*/
SELECT
	count(salaire),
	count(tauxcom)
FROM
	employe
WHERE
	salaire
	AND tauxcom IS NOT NULL;