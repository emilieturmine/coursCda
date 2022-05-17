<?php
//création de données pour les employés
$e1 = new employes("CHEBBI", "Sabrine", "10-06-2010", "commerciale", 1700,"Commercial","Arras","Restaurant d'entreprise","Oui"); 
$e2 = new employes("DERYCKE", "Quentin", "16-09-2020", "Animateur", 900,"commercial","Brest","Restaurant d'entreprise","Non"); 
$e3 = new employes("FEMERY", "Florian", "07-11-2016", "Entretien", 800,"Entretien","Amiens","Restaurant d'entreprise","Non"); 
$e4 = new employes("INACIO", "Stephane", "14-12-2014", "Vigile", 1200,"Securite","Marseille","Tickets Restaurant","Oui"); 
$e5 = new employes("MHIRI", "Houeda", "19-07-2005", "DRH", 2700,"RH","Paris","Tickets Restaurant","Oui"); 
// creation des attributs pour la direction
$d1 = new direction("GLACIER", "PINGUY", "10-06-2010", "directeur", 3500,"Direction","Arras","Restaurant d'entreprise","Non"); 
$d2 = new direction("TORNADO", "Jean", "16-09-2020", "directeur", 3500,"Direction","Brest","Restaurant d'entreprise","Non"); 
$d3 = new direction("TURMINE", "emilie", "07-11-2010", "Directrice", 14000,"Direction","Amiens","Restaurant d'entreprise","Non"); 
$d4 = new direction("RAOULT", "Didier", "14-12-2010", "directeur", 3500,"Direction","Marseille","Tickets Restaurant","Non"); 
$d5 = new direction("De Fontenay", "Paris", "19-07-2010", "directeur", 3500,"Direction","Paris","Tickets Restaurant","Non"); 



// création de données pour les agences
$a1 = new agence("artikcookie","1 bd de la glaciere",62000,"Arras","Restaurant d'entreprise");
$a2 = new agence("tornadcookie","56 bd de la bourasque",29200,"Brest","Restaurant d'entreprise");
$a3 = new agence("abricookie","5 bd de la grisaille",80000,"Amiens","Restaurant d'entreprise");
$a4 = new agence("raoultcookie","1 bd de la fournaise",13000,"Marseille","Tickets Restaurant");
$a5 = new agence("bobocookie","970 bd du narcissisme",75000,"Paris","Tickets Restaurant");

// creation des attributs pour les enfants d'employés
$ee1=new enfant("CHEBBI","kais", 3);
$ee2= new enfant("INACIO","kevin",5);
$ee3= new enfant("MHIRI","lucas",12);
$ee4= new enfant("MHIRI","lucie",17);
?> 
