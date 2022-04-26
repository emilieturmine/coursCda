CREATE DATABASE exo1;
USE exo1;

CREATE TABLE Client(
    cli_num int AUTO_INCREMENT NOT NULL,
    cli_nom varchar(50),
    cli_adresse varchar(50),
    cli_tel varchar(30),
    PRIMARY KEY (cli_num)
);
CREATE TABLE Commande( 
       com_num int AUTO_INCREMENT NOT NULL ,
       com_date datetime,
       com_obs varchar(50),
       cli_num int,
       PRIMARY KEY (com_num),
       FOREIGN KEY (cli_id) REFERENCES Client(cli_num)
);
CREATE TABLE Produit(
    pro_num int AUTO_INCREMENT NOT NULL,
    pro_libelle varchar(50),
    pro_description varchar(50),
    PRIMARY KEY (pro_num)
);
CREATE TABLE Facturation( 
       com_num int,
       pro_num int,
       est_qte int,
       PRIMARY KEY (com_num,pro_num),
       FOREIGN KEY (com_num) REFERENCES Commande(com_num),
       FOREIGN KEY (pro_num) REFERENCES Produit(pro_num)
       );
    CREATE INDEX nom_client
ON Client ( nom_cli  ASC  );