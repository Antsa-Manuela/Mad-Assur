<?php
session_start();
require 'database.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = filter_input(INPUT_POST, 'email', FILTER_SANITIZE_EMAIL);
    $mdp = $_POST['mdp'];

    if ($email && !empty($mdp)) {
        $stmt = $bdd->prepare("SELECT * FROM assurances WHERE email = ? LIMIT 1");
        $stmt->execute([$email]);
        $assur = $stmt->fetch();

        if ($assur && $mdp === $assur['mdp']) { // À remplacer par password_verify() en production
            $_SESSION = [
                'id_assurances' => $assur['id_assurances'],
                'email' => $assur['email'],
                'nom' => $assur['nom']
            ];
            header('Location: homechatentreprise.php');
            exit();
        }
    }
    header('Location: loginassociation.php?erreur=1');
    exit();
}
header('Location: loginassociation.php');
exit();
?>