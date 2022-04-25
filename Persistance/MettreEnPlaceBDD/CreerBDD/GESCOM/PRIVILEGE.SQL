UTIL1:
CREATE USER' user_1'@'localhost' IDENTIFIED BY 'MDP';
GRANT ALL PRIVILEGES ON Papyrus.* TO ' user_1'@'localhost';

UTIL2:
CREATE USER 'nom_utilisateur'@'adresse_ip' IDENTIFIED BY 'mot_de_passe';
GRANT privilege 
	
ON objet 
	
TO utilisateur;