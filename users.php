<?php
    //Démarrer la session
    session_start();
    include('database.php');
    if (!empty($_POST)) {
        if (isset($_POST["email"], $_POST["mdp"]) && !empty($_POST["email"]) && !empty($_POST["mdp"]) ){
            $email = $_POST['email'];
            $password = $_POST['mdp'];
            $requete = $bdd->query("SELECT * FROM users WHERE email = '".$email."' AND mdp = '".$password."'");
            $i=0;
            while ($donnees=$requete->fetch()) {
                //On stocke dans $_SESSION les informations de l'utilisateur
                $_SESSION["email"]=$donnees["email"]; 
                $_SESSION["nom"]=$donnees["nom"];
                $_SESSION["pseudo"]=$donnees["pseudo"];
                $_SESSION["mdp"]=$donnees["password"];
                $i++;
            }
            if ($i==1) {/* 
                header("Location:home.php"); */
                header("Location:home.php");
            }
            else {
                header ("Location:signin.php");
            }

            //connecter l'utilisateur

        }
        else {
            die("Le formulaire est incomplet");
        }
    }
?>