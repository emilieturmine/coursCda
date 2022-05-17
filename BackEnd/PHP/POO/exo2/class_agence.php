<?php
class agence  {
    public $_nom;
    public $_adresse;
    public $_cp;
    public $_ville;
    public $_restauration;

    public function __construct($new_nom,$new_adresse, $new_cp,$new_ville,$new_restauration) {
        $this->_nom = $new_nom;
        $this->_adresse = $new_adresse;
        $this->_cp = $new_cp;
        $this->_ville = $new_ville;
        $this->_restauration= $new_restauration;
    }

    public function getNom() {
        return $this->_nom;
    }
    public function getAdresse() {
        return $this->_adresse;
    }
    public function getCp() {        
        return $this->_cp;  
             }
    public function getVille() {
        return $this->_ville;
    }
    public function getRestauration() {
        return $this->_restauration;
    }
    
    public function setNom($sNom) {
        $this->_nom = $sNom;
    }
    public function setAdresse($sAdresse) {
        $this->_adresse = $sAdresse;
    }
    public function setCp( $sCp) {  
        $this->_cp = $sCp;
        
    }
    public function setVille($sVille) {
        $this->_ville = $sVille;
    }
    public function setRestauration($sRestauration) {
        $this->_restauration = $sRestauration;
    }
  
  
    public function  __toString(){
        
         return(string)'<td>'.$this->_nom.'</td>'.
            '<td>'.  $this->_adresse.'</td>'.
            '<td>'.  $this->_cp.'</td>'. 
            '<td>'.  $this->_ville.'</td>'.
            '<td>'.  $this->_restauration.'</td>';
             
         
     }



}



?>