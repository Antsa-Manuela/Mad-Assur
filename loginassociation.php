<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/login.css">
    <title>Connexion</title>
</head>
<body>
<fieldset>
<!--     <legend><h1>Connexion</h1></legend> -->
        <img src="img/logoin.png" alt="logomadassur" width="50%"><br>
        <!-- Vous souhaite bon retour! -->
    <form action="userassociation.php?id=ici" method="post">
        <input type="email" name="email" id="email" placeholder="Email" required>
        <input type="password" name="mdp" placeholder="Mot de passe" id="mdp" required>
        <input type="submit" value="Se connecter">
    <p>Pas de compte? S'inscrire <a href="signin.php?id=ici">ici</a></p>
    <p>Se connecter en tant qu' <a href="login.php?id=ici">entreprise</a></p>
    </form>
</fieldset>
<!-- <div id="rectangle"></div> -->
</body>
</html>