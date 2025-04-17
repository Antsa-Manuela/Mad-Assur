<?php
session_start();
include('database.php');

if (!empty($_POST)) {
    if (isset($_POST["email"], $_POST["mdp"]) && !empty($_POST["email"]) && !empty($_POST["mdp"])) {
        $email = $_POST["email"];
        $password = $_POST["mdp"];

        // Sécurisé avec prepare()
        $stmt = $bdd->prepare("SELECT * FROM users WHERE email = ? AND mdp = ?");
        $stmt->execute([$email, $password]);

        $user = $stmt->fetch();

        if ($user) {
            // Stocker les infos utiles dans la session
            $_SESSION["id_users"] = $user["id_users"];
            $_SESSION["email"] = $user["email"];
            $_SESSION["nom"] = $user["nom"];
            $_SESSION["mdp"] = $user["mdp"]; // Tu peux l'enlever si non nécessaire

            header("Location: home.php");
            exit();
        } else {
            // Échec de connexion
            header("Location: login.php?erreur=1");
            exit();
        }
    } else {
        die("Le formulaire est incomplet.");
    }
}
?>
