<?php
    $calendrier = array("Janvier" => 31,"Fevrier" => 29, "Mars" => 31,"Avril" => 30,"Mai" => 31,"Juin" => 30,"Juillet" => 31,"Aout" => 31,"Septembre" => 30,"Octobre" => 31,  
"Novembre" => 30,"Decembre" => 31); 

    foreach ($calendrier as $mois => $valeur){ 
      echo $mois ." : ".$valeur."<br>"; 
           } ;

        asort($calendrier);
           foreach ($calendrier as $mois => $valeur){ 
            echo  $mois ." : ".$valeur."<br>"; 
                 } ;
      
                 ?>

                 <?php

                 $capitales = array(
                    "Bucarest" => "Roumanie",
                    "Bruxelles" => "Belgique",
                    "Oslo" => "Norvège",
                    "Ottawa" => "Canada",
                    "Paris" => "France",
                    "Port-au-Prince" => "Haïti",
                    "Port-d'Espagne" => "Trinité-et-Tobago",
                    "Prague" => "République tchèque",
                    "Rabat" => "Maroc",
                    "Riga" => "Lettonie",
                    "Rome" => "Italie",
                    "San José" => "Costa Rica",
                    "Santiago" => "Chili",
                    "Sofia" => "Bulgarie",
                    "Alger" => "Algérie",
                    "Amsterdam" => "Pays-Bas",
                    "Andorre-la-Vieille" => "Andorre",
                    "Asuncion" => "Paraguay",
                    "Athènes" => "Grèce",
                    "Bagdad" => "Irak",
                    "Bamako" => "Mali",
                    "Berlin" => "Allemagne",
                    "Bogota" => "Colombie",
                    "Brasilia" => "Brésil",
                    "Bratislava" => "Slovaquie",
                    "Varsovie" => "Pologne",
                    "Budapest" => "Hongrie",
                    "Le Caire" => "Egypte",
                    "Canberra" => "Australie",
                    "Caracas" => "Venezuela",
                    "Jakarta" => "Indonésie",
                    "Kiev" => "Ukraine",
                    "Kigali" => "Rwanda",
                    "Kingston" => "Jamaïque",
                    "Lima" => "Pérou",
                    "Londres" => "Royaume-Uni",
                    "Madrid" => "Espagne",
                    "Malé" => "Maldives",
                    "Mexico" => "Mexique",
                    "Minsk" => "Biélorussie",
                    "Moscou" => "Russie",
                    "Nairobi" => "Kenya",
                    "New Delhi" => "Inde",
                    "Stockholm" => "Suède",
                    "Téhéran" => "Iran",
                    "Tokyo" => "Japon",
                    "Tunis" => "Tunisie",
                    "Copenhague" => "Danemark",
                    "Dakar" => "Sénégal",
                    "Damas" => "Syrie",
                    "Dublin" => "Irlande",
                    "Erevan" => "Arménie",
                    "La Havane" => "Cuba",
                    "Helsinki" => "Finlande",
                    "Islamabad" => "Pakistan",
                    "Vienne" => "Autriche",
                    "Vilnius" => "Lituanie",
                    "Zagreb" => "Croatie"
                );


               /* Affichez la liste des capitales (par ordre alphabétique) suivie du nom du pays.*/

Ksort($capitales);
foreach ($capitales as $ville => $pays){ 
    echo  $ville ." : ".$pays."<br>"; 
         } ;

               /*     
                Affichez la liste des pays (par ordre alphabétique) suivie du nom de la capitale.*/
            
            Asort($capitales);

               foreach ($capitales as $ville => $pays){ 
    echo  $ville ." : ".$pays."<br>"; 
         } ; 
                
                
               /* Affichez le nombre de pays dans le tableau.
            
                Supprimer du tableau toutes les capitales ne commençant par la lettre 'B', puis affichez le contenu du tableau.*/
            
            