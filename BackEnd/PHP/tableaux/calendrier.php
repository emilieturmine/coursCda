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