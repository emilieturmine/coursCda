<?php 
class Personnage{
private $_nom;
private $_prenom;
private $_age;
private $_sexe;

public function _construct($_nom,$_prenom,$_age,$_sexe){
    $this->nom=$_nom;
    $this->prenom=$_prenom;
    $this->age=$_age;
    $this->sexe=$_sexe;
}

public function getNom(){
    return $this->nom;
}
public function setNom($_nom){
    $this->nom=$_nom;
}
public function getPrenom(){
    return $this->prenom;
}
public function setPrenom($_prenom){
    $this->prenom=$_prenom;
}
public function getAge(){
    return $this->age;
}
public function setAge($_age){
    $this->age=$_age;
}
public function getSexe(){
    return $this->sexe;
}
public function setSexe($_sexe){
    $this->sexe=$_sexe;
}
}

include "Personnage.class.php";
$p=new Personnage("turmine","emilie",33,"feminin");
$p->setNom ("Grandel");
$p->setPrenom("lily");
$p->setAge("168");
$p->setSexe("feminin");

echo $p->getNom();

