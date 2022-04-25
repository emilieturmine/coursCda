CREATE DATABASE Papyrus;
USE Papyrus;

CREATE TABLE PRODUIT(
    CODART int AUTO_INCREMENT NOT NULL,
    LIBART varchar(30)NOT NULL,
    STKALE INT NOT NULL,
    STKPHY INT NOT NULL,
    QTEANN INT NOT NULL,
    UNIMES VARCHAR(255) NOT NULL,
    PRIMARY KEY (CODART)
   
);
CREATE TABLE FOURNIS(
    NUMFOU int AUTO_INCREMENT NOT NULL,
    NOMFOU varchar(255)NOT NULL,
    RUEFOU varchar(255)NOT NULL,
    POSFOU varchar(5) NOT NULL,
    VILFOU VARCHAR(255) NOT NULL,
    CONFOU VARCHAR(255)NOT NULL,
    SATISF INT CHECK (SATISF BETWEEN 1 AND 10),
      PRIMARY KEY (NUMFOU)
);
CREATE TABLE ENTCOM (
    NUMCOM int AUTO_INCREMENT NOT NULL,
    OBSCOM  varchar(255),
    DATCOM DATETIME NOT NULL,
    NUMFOU INT,
    PRIMARY KEY (NUMCOM),
    FOREIGN KEY (NUMFOU) REFERENCES FOURNIS(NUMFOU)
);
CREATE TABLE LIGCOM (
    NUMCOM INT NOT NULL,
    NUMLIG INT AUTO_INCREMENT NOT NULL,
    CODART INT NOT NULL,
    QTECDE INT NOT NULL,
    PRIUNI DECIMAL(9.2) NOT NULL,
    QTELIV int,
    DERLIV DATETIME NOT NULL,
    PRIMARY KEY (NUMLIG),
    FOREIGN KEY (NUMCOM) REFERENCES ENTCOM (NUMCOM),
    FOREIGN KEY (CODART) REFERENCES PRODUIT (CODART)
);

CREATE TABLE VENTE (
    CODART int NOT NULL,
    NUMFOU int NOT NULL,
    DELLIV INT NOT NULL,
    QTE1 INT NOT NULL,
    PRIX1 DECIMAL(9.2) NOT NULL,
    QTE2 INT,
    PRIX2 decimal(9.2),
    QTE3 INT,
    PRIX3 decimal(9.2),
     PRIMARY KEY (NUMFOU,CODART),
    FOREIGN KEY (NUMFOU) REFERENCES FOURNIS (NUMFOU),
    FOREIGN KEY (CODART) REFERENCES PRODUIT (CODART)
);