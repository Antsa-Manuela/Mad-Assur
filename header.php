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
<!--            <form method="GET" action="">
              <input type="search" name="q" class="search" placeholder="Nom / adresse / N° SIRET - SIREN..." value="<?= isset($_GET['q']) ? htmlspecialchars($_GET['q']) : '' ?>">
            </form> -->

            <!-- Barre filtres -->
            <div class="filtre-container">
    <form method="GET" action="home.php">
        <input type="text" name="q" placeholder="Recherche par nom ou service..." value="<?= isset($_GET['q']) ? htmlspecialchars($_GET['q']) : '' ?>">

        <select name="score">
            <option value="">Score Global</option>
            <option value="A" <?= (isset($_GET['score']) && $_GET['score'] == 'A') ? 'selected' : '' ?>>A (≥80%)</option>
            <option value="B" <?= (isset($_GET['score']) && $_GET['score'] == 'B') ? 'selected' : '' ?>>B (70-79%)</option>
            <option value="C" <?= (isset($_GET['score']) && $_GET['score'] == 'C') ? 'selected' : '' ?>>C (60-69%)</option>
        </select>

        <select name="rse">
            <option value="">RSE min</option>
            <option value="90" <?= (isset($_GET['rse']) && $_GET['rse'] == '90') ? 'selected' : '' ?>>≥90%</option>
            <option value="80" <?= (isset($_GET['rse']) && $_GET['rse'] == '80') ? 'selected' : '' ?>>≥80%</option>
            <option value="70" <?= (isset($_GET['rse']) && $_GET['rse'] == '70') ? 'selected' : '' ?>>≥70%</option>
            <option value="60" <?= (isset($_GET['rse']) && $_GET['rse'] == '60') ? 'selected' : '' ?>>≥60%</option>
        </select>

        <select name="capital">
            <option value="">Capital Humain min</option>
            <option value="90" <?= (isset($_GET['capital']) && $_GET['capital'] == '90') ? 'selected' : '' ?>>≥90%</option>
            <option value="80" <?= (isset($_GET['capital']) && $_GET['capital'] == '80') ? 'selected' : '' ?>>≥80%</option>
            <option value="70" <?= (isset($_GET['capital']) && $_GET['capital'] == '70') ? 'selected' : '' ?>>≥70%</option>
            <option value="60" <?= (isset($_GET['capital']) && $_GET['capital'] == '60') ? 'selected' : '' ?>>≥60%</option>
        </select>

        <select name="experience">
            <option value="">Expérience Client min</option>
            <option value="90" <?= (isset($_GET['experience']) && $_GET['experience'] == '90') ? 'selected' : '' ?>>≥90%</option>
            <option value="80" <?= (isset($_GET['experience']) && $_GET['experience'] == '80') ? 'selected' : '' ?>>≥80%</option>
            <option value="70" <?= (isset($_GET['experience']) && $_GET['experience'] == '70') ? 'selected' : '' ?>>≥70%</option>
            <option value="60" <?= (isset($_GET['experience']) && $_GET['experience'] == '60') ? 'selected' : '' ?>>≥60%</option>
        </select>

        <select name="impact">
            <option value="">Impact Local min</option>
            <option value="90" <?= (isset($_GET['impact']) && $_GET['impact'] == '90') ? 'selected' : '' ?>>≥90%</option>
            <option value="80" <?= (isset($_GET['impact']) && $_GET['impact'] == '80') ? 'selected' : '' ?>>≥80%</option>
            <option value="70" <?= (isset($_GET['impact']) && $_GET['impact'] == '70') ? 'selected' : '' ?>>≥70%</option>
            <option value="60" <?= (isset($_GET['impact']) && $_GET['impact'] == '60') ? 'selected' : '' ?>>≥60%</option>
        </select>

        <button type="submit" class="btn-action">Appliquer</button>
        <a href="home.php" class="btn-action reset">Réinitialiser</a>
    </form>
</div>



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