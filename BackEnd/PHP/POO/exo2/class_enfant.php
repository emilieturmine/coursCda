<?php 

    class enfant 
    //extends employes
    {
        public$_nom_parent;
        public$_prenom_enfant;
        public$_age;

        public function __construct($new_nom_parent,$new_prenom_enfant, $new_age) {
            $this->_nom_parent = $new_nom_parent;
            $this->_prenom_enfant= $new_prenom_enfant;
            $this->_age =$new_age;
        }
        public function getNom_parent() {
            return $this->_nom_parent;
        }
        public function getPrenomEnfant() {
            return $this->_prenom_enfant;
        }
        public function getAge() {        
            return $this->_age;
        }
        public function setNom_parent($sNom_parent) {
            $this->_nom_parent = $sNom_parent;
        }
        public function setPrenom($sPrenom) {
            $this->_prenom = $sPrenom;
        }
        public function setAge( $sAge) {  
            $this->_age = $sAge;
        }
       // public function getChequesNoel(){
                //if ( $this->_nom_parent==$this->_nom){
           // return 'OUI';
               // }
                //else{
            //return 'NON';
               // }
       // }
        public function getMontantCqNoel(){
                if($this->_age<=10){
            return'20 euros';}
                if($this->_age>=11 && $this->_age<=15){
            return'30 euros';}
                if($this->_age>=16 &&$this-> _age<=18){
            return'50 euros';}
                
                
        }
        public function  __toString(){
            return(string)  
                //'<td>'.$this->getChequesNoel().'</td>'.
                '<td>'.$this->_nom_parent.'</td>'.
                '<td>'.$this->_prenom_enfant.'</td>'.
                '<td>'.$this->_age.'</td>'.
                '<td>'.$this->getMontantCqNoel().'</td>';
        }
    
    }
    ?>