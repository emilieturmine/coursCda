<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
</head>
<body>
    <h1>POO</h1>
    
    <?php require "class_agence.php";?>
    <?php require "class_enfant.php";?>
    <?php require "class_direction.php";?>
    <?php require "class_employe.php";?>
    <?php  require "instanciation.php";?> 

    <?php //exo 4?>
    <table class="table">
    <caption>employes</caption>
    <thead>
    <tr>
    <th>Nom</th>
    <th>Prenom</th>
    <th>Date d'embauche</th>
    <th>Poste</th>
    <th>Salaire</th>
    <th>Service</th>
    <th>Ancieneté</th>
    <th>prime</th>
    <th>Versement</th>
    <th>Agence</th>
    <th>Restauration</th>
    <th>Cheques vacances</th>
    <th>Cheques noel</th>
</tr>
    </thead>
    <tbody>
            <tr><?php echo $e1;?></tr>
            <tr><?php echo $e2;?></tr>
            <tr><?php echo $e3;?></tr>
            <tr><?php echo $e4;?></tr>
            <tr><?php echo $e5;?></tr>
</tbody>
    </table>
    <table class="table">
    <caption>Direction</caption>
    <thead>
    <tr>
    <th>Nom</th>
    <th>Prenom</th>
    <th>Date d'embauche</th>
    <th>Poste</th>
    <th>Salaire</th>
    <th>Service</th>
    <th>Ancieneté</th>
    <th>prime</th>
    <th>Versement</th>
    <th>Agence</th>
    <th>Restauration</th>
    <th>Cheques vacances</th>
    <th>Cheques noel</th>
</tr>
    </thead>
    <tbody>
            <tr><?php echo $d1;?></tr>
            <tr><?php echo $d2;?></tr>
            <tr><?php echo $d3;?></tr>
            <tr><?php echo $d4;?></tr>
            <tr><?php echo $d5;?></tr>
</tbody>
    </table>
    <table class="table">
    <caption>Agences</caption>
    <thead>
    <tr>
    <th>Nom</th>
    <th>Adresse</th>
    <th>Code postal</th>
    <th>Ville</th>
    <th>Restauration</th>
</tr>
    </thead>
    <tbody>
            <tr><?php echo $a1;?></tr>
            <tr><?php echo $a2;?></tr>
            <tr><?php echo $a3;?></tr>
            <tr><?php echo $a4;?></tr>
            <tr><?php echo $a5;?></tr>
</tbody>
    </table>
    <table class="table">
    <caption>enfants d'employes</caption>
    <thead>
    <tr>
    <th>Famille</th>
    <th>prenom</th>
    <th>age</th>
    <th> Montant cheque noel</th>
    </tr>
    </thead>
    <tbody>
            <tr><?php echo $ee1;?></tr>
            <tr><?php echo $ee2;?></tr>
            <tr><?php echo $ee3;?></tr>
            <tr><?php echo $ee4;?></tr>
</tbody>
    </table>



    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-eMNCOe7tC1doHpGoWe/6oMVemdAVTMs2xqW4mwXrXsW0L84Iytr2wi5v2QjrP/xp" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js" integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/" crossorigin="anonymous"></script>
</body>
</html>