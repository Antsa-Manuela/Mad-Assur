<?php
    try {
        $bdd = new PDO('mysql:host=localhost;dbname=madassur','root','');
    } catch (Exeption $e) {
        die('erreur:'.$e->getMessage());
    }
?>