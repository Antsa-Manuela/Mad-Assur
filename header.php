<?php
session_start();
if (!isset($_SESSION['id_users'])) {
    header('Location:index.php');
    exit();
}
include('database.php');
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/header.css">
</head>
<body>
        <div class="main-container">
          <div class="rectangle">
            <img src="img/logoin.png" alt="logomadassur" width="20%" style="display: flex; position: absolute; top: 3vw; left: 4vw;">
            <div class="flex-row-af" style="position: relative; left: 17%; width: 884.615px; height: 24px; margin: 63px 0 0 160px; z-index: 11;">
              <!-- <div class="regroup">
                <div class="linkedin-fill"></div>
                <div class="twitter-fill"></div>
                <div class="facebook-fill"></div>
              </div> -->
              <span class="nos-services">Nos services</span
              ><span class="partenaires">Partenaires</span
              ><span class="a-propos">A propos</span
              ><span class="nous-rejoindre">Nous rejoindre</span
              ><span class="contact">Contact</span>
            </div>
            <form method="GET" action="">
              <input type="search" name="q" class="search" placeholder="Nom / adresse / N° SIRET - SIREN..." value="<?= isset($_GET['q']) ? htmlspecialchars($_GET['q']) : '' ?>">
            </form>
            <a href="logout.php?id=Deconnexion" style="border: solid 1px black;">
              <button style="background-color: #eb723d; border-radius: 3vw; padding: 1vw; color: #fff; border: none;display: flex; position: absolute; top: 4vw; right: 13vw; font-size: 1vw; font-family: Open Sans;">
                Déconnexion
              </button>
            </a>
            <!-- <div class="search">
              <span class="nom-adresse-siret"
                >Nom / adresse / N° SIRET - SIREN...</span
              >
              <div class="search-line"></div>
            </div> -->
          </div>
        </div>
</body>
</html>