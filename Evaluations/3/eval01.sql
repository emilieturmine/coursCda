-- 1) Requêtes d'intérrogation sur la base NorthWind


-- 1 - Liste des contacts français :
SELECT 
	customers.CompanyName AS "Société",
	customers.ContactName AS "contact",
	customers.ContactTitle AS "Fonction",
	customers.Phone AS "Téléphone"
		FROM customers 
	  			WHERE customers.Country = "France";

-- 2 - Produits vendus par le fournisseur « Exotic Liquids » :
SELECT ProductName AS "Produit",UnitPrice AS "Prix"
FROM products
JOIN suppliers ON products.SupplierID= suppliers.SupplierID
WHERE suppliers.CompanyName="Exotic Liquids";

-- 3 - Nombre de produits vendus par les fournisseurs Français dans l’ordre décroissant :
SELECT CompanyName AS "Fournisseur",COUNT(DISTINCT ProductName) AS `Nbre Produits` FROM products
JOIN suppliers ON suppliers.SupplierID = products.SupplierID
WHERE suppliers.country = "France"
GROUP BY CompanyName 
ORDER BY `Nbre Produits` DESC 
;
-- 4 - Liste des clients Français ayant plus de 10 commandes :
SELECT CompanyName AS "Client",COUNT(OrderID) AS `Nombre commandes`
FROM orders
JOIN customers ON orders.CustomerID = customers.CustomerID
  WHERE customers.Country = "France"
GROUP BY customers.customerID
HAVING COUNT(orderID)>10  ;

-- 5 - Liste des clients ayant un chiffre d’affaires > 30.000 :

SELECT customers.CompanyName AS "Client",SUM((UnitPrice*Quantity)-Discount) AS "CA",Country as "Pays"
FROM customers 
JOIN orders ON customers.CustomerID=orders.CustomerID
JOIN `order details` ON orders.OrderID= `order details`.OrderID
GROUP BY CompanyName
HAVING SUM((UnitPrice*Quantity)-Discount) > 30000
ORDER BY SUM((UnitPrice*Quantity)-Discount) DESC;

-- 6 – Liste des pays dont les clients ont passé commande de produits fournis par « Exotic
-- Liquids » :
SELECT Distinct customers.country AS "Pays" FROM customers 
JOIN orders ON customers.CustomerID=orders.CustomerID
JOIN `order details` ON orders.OrderID= `order details`.OrderID
JOIN products ON `order details`.ProductID = products.ProductID
JOIN suppliers ON products.SupplierID= suppliers.SupplierID
WHERE customers.CustomerID IN ( SELECT customers.CustomerID FROM customers 
JOIN orders ON customers.CustomerID=orders.CustomerID
JOIN `order details` ON orders.OrderID= `order details`.OrderID
JOIN products ON `order details`.ProductID = products.ProductID
JOIN suppliers ON products.SupplierID= suppliers.SupplierID WHERE suppliers.CompanyName = "Exotic Liquids")
ORDER BY customers.Country ASC;
-- 7 – Montant des ventes de 1997
SELECT SUM((UnitPrice*Quantity) 
FROM `order details` 
JOIN orders 
ON `order details`.OrderID = orders.OrderID
WHERE DATEPART(OrderDate,yyyy)= 1997;

-- 8 – Montant des ventes de 1997 mois par mois
SELECT SUM((UnitPrice*Quantity) 
FROM `order details` 
JOIN orders 
ON `order details`.OrderID = orders.OrderID
WHERE DATEPART(OrderDate,yyyy)= 1997;
Group by DATEPART(OrderDate,mm);
-- 9 – Depuis quelle date le client « Du monde entier » n’a plus commandé ?
Select Max(OrderDate) from orders join customers on orders.CustomerID = customers.CustomerID
WHERE customers.CompanyName = "Du monde entier";
-- 10 – Quel est le délai moyen de livraison en jours ?

SELECT AVG(ShippedDate-OrderDate) from orders;

-- 2) Procédures stockées

-- Codez deux procédures stockées correspondant aux requêtes 9 et 10. Les procédures stockées doivent prendre en compte les éventuels paramètres.

-- 9-


DELIMITER |

CREATE PROCEDURE P_derniere_commande(in nom_client varchar(255))
BEGIN
    Select Max(OrderDate) from orders join customers on orders.CustomerID = customers.CustomerID
WHERE customers.CompanyName = "nom_client";
END | ;

DELIMITER ;

-- -10

DELIMITER |

CREATE PROCEDURE P_delai_moyen(in Date_commande date,in date_reception date)
BEGIN
    SELECT AVG(ShippedDate-OrderDate) from orders
    WHERE ShippedDate = Date_commande And OrderDate=date_reception;

END | ;

DELIMITER ;

-- 3) Mise en place d'une règle de gestion

-- L'entreprise souhaite mettre en place cette règle de gestion:

-- Pour tenir compte des coûts liés au transport, on vérifiera que pour chaque produit d’une commande, le client réside dans le même pays que le fournisseur du même produit

-- Il s'agit d'interdire l'insertion de produits dans les commandes ne satisfaisants pas à ce critère.

-- Décrivez par quel moyen et avec quels outils (procédures stockées, trigger...) vous pourriez implémenter la règle de gestion suivante. 




On peut mettre  en place un trigger qui verifieras pour chaque ajot de produit dans une commande (order detail) que le pays du client et que le pays ou doit être livrés la commande est bien le même que celui de l'entreprise qui fournit le produit si ce n'est pas le cas le trigger pourras stoper l'entrée dans la bdd et prevenir le client par un message personalisé.































