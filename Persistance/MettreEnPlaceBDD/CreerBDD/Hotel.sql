CREATE DATABASE Hotel;
USE Hotel;

CREATE TABLE Hotel(
    hot_num int AUTO_INCREMENT NOT NULL,
    hot_cap varchar(255),
    hot_cat varchar(255),
    hot_nom varchar(255),
    hot_adr varchar(255),
    sta_num int,
    PRIMARY KEY (hot_num),
    FOREIGN KEY (sta_num) REFERENCES Station (sta_num)
);
CREATE TABLE Station (
    sta_num int AUTO_INCREMENT NOT NULL,
    sta_nom varchar(255),
     PRIMARY KEY (sta_num)
);
CREATE TABLE Chambre (
    cha_num int AUTO_INCREMENT NOT NULL,
    cha_cap varchar(255),
    cha_deg_con varchar(255),
    cha_exp varchar(255),
    cha_typ varchar(255),
    hot_num int,
     PRIMARY KEY (cha_num),
     FOREIGN KEY (hot_num) REFERENCES Hotel (hot_num)
);
CREATE TABLE Client(
    cli_num int AUTO_INCREMENT NOT NULL,
    cli_nom varchar(255),
    cli_pre varchar(255),
    cli_adr varchar(255),
      PRIMARY KEY (cli_num)
);
CREATE TABLE Reservation(
    cha_num int,
    cli_num int,
    res_dat_deb date,
    res_dat_fin date,
    res_date date,
    res_mon_arr decimal(9.2),
    res_prx_tot decimal(9.2),
     PRIMARY KEY (cha_num,cli_num),
    FOREIGN KEY (cha_num) REFERENCES Chambre (cha_num),
    FOREIGN KEY (cli_num) REFERENCES Client (cli_num)
);