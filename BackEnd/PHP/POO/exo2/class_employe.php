<?php
 
                                        //1.ecrire la classe employes


    class employes {
        public $_nom;
        public $_prenom;
        public $_d_embauche;
        public $_poste;
        public $_salaire;
        public $_service;
        public $_agence;
        public $_restauration;
        public $_cheque_noel;
        

        public function __construct($new_nom,$new_prenom, $new_d_embauche,$new_poste,$new_salaire,$new_service,$new_agence,$new_restauration,$_new_cheque_noel) {
            $this->_nom = $new_nom;
            $this->_prenom = $new_prenom;
            $this->_d_embauche =date_create($new_d_embauche);
            $this->_poste = $new_poste;
            $this->_salaire = $new_salaire;
            $this->_service = $new_service;
            $this->_agence=$new_agence;
            $this->_restauration=$new_restauration;
            $this->_cheque_noel=$_new_cheque_noel;
        }

        public function getNom() {
            return $this->_nom;
        }
        public function getPrenom() {
            return $this->_prenom;
        }
        public function getD_embauche() {        
            $datemb = $this->_d_embauche;  
                return $this->_d_embauche;
        }
        public function getPoste() {
            return $this->_poste;
        }
        public function getSalaire() : float {
            return $this->_salaire;
        }
        public function getService() {
            return $this->_service;
        }
        public function getAgence() {
            return $this->_agence;
        }
        public function getRestauration(){
            return $this->_restauration;
        }
        public function getChequeNoel(){
            return $this->_cheque_noel;
        }
        public function setNom($sNom) {
            $this->_nom = $sNom;
        }
        public function setPrenom($sPrenom) {
            $this->_prenom = $sPrenom;
        }
        public function setD_embauche(DateTime $sDate) {  
            $this->_d_embauche = $sDate;
        }
        public function setPoste($sPoste) {
            $this->_poste = $sPoste;
        }
        public function setSalaire($sSalaire) {
            $this->_salaire = $sSalaire;
        }
        public function setService($sService) {
            $this->_service = $sService;
        }
        public function setAgence($sAgence) {
            $this->_agence = $sAgence;
        }
        public function setRestauration($sRestauration) {
            $this->_restauration = $sRestauration;
        }
        public function setChequeNoel($sChequeNoel) {
            $this->_cheque_noel = $sChequeNoel;
        }
                                    //2. methode pour calculer l'ancieneté
        public function getAncienete(){
                $_annee=date_create();
                $_ancienete=date_diff($this->_d_embauche,$_annee);
            return  $_ancienete->format('%y');
        }
                                     //3. methodes pour calculer la prime
        public function getPrime(){
                $_prime_salaire =$this->_salaire*(5/100);
                $_prime_ancienete=($this->_salaire* $this->getAncienete()*(2/100));
                $_prime_totale=$_prime_salaire +$_prime_ancienete; 
            return $_prime_totale;
        }
        public function getVersement(){
                $d = '30';
                $m = '11';
                $dateSrc = date_create();
                $d_curr = $dateSrc->format('d');
                $m_curr = $dateSrc->format('m');
                    if ($d == $d_curr && $m == $m_curr) {
            return 'Le transfert d\'un montant de '. $this->getPrime() . ' € a été envoyé.';
                    }
                    else {
            return 'Le paiement sera effectué le 30/11 !';
                    }
            }
        public function getChequesVacances(){
                    if ($this->getAncienete() >= 1) {
                return 'Oui';
                    }
                    else {
                return 'Non'; 
                    }
        }
              public function  __toString(){
            return(string)  '<td>'.$this->_nom.
                            '<td>'.  $this->_prenom.'</td>'.
                            '<td>'.  $this->getD_embauche()->format('d-m-Y')     .'</td>'. 
                            '<td>'.  $this->_poste.'</td>'.
                            '<td>'.  $this->_salaire.'</td>'.      
                            '<td>'.  $this->_service.'</td>'.
                            '<td>'.   $this->getAncienete().'</td>'.
                            '<td>'.  $this->getPrime().'</td>'.
                            '<td>'.  $this->getVersement().'</td>'.
                            '<td>'. $this->_agence.'</td>'.
                            '<td>'. $this->_restauration.'</td>'.
                            '<td>'. $this->getChequesVacances().'</td>'.
                            '<td>'. $this->_cheque_noel.'</td>';
        }
    }
       


?>
