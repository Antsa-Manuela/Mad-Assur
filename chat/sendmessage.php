<?php
    include('database.php');
    $id = $_POST['id'];
    $expediteur = $_POST['expediteur_id']
    $message = $_POST['message'];

    //Ajouter ici les contrôles souhaités

    $rkt=$bdd->query("INSERT INTO messages (id, expediteur_id, contenu) VALUES('".$id."', '".$expediteur."', '".$message."')");
    header("Location:chat.php");
?>