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
            <img src="img/logoin.png" alt="logomadassur" width="20%">
            <div class="flex-row-af">
              <div class="regroup">
                <div class="linkedin-fill"></div>
                <div class="twitter-fill"></div>
                <div class="facebook-fill"></div>
              </div>
              <span class="nos-services">Nos services</span
              ><span class="partenaires">Partenaires</span
              ><span class="a-propos">A propos</span
              ><span class="nous-rejoindre">Nous rejoindre</span
              ><span class="contact">Contact</span>
            </div>
            <form method="GET" action="">
              <input type="search" name="q" class="search" placeholder="Nom / adresse / N° SIRET - SIREN..." value="<?= isset($_GET['q']) ? htmlspecialchars($_GET['q']) : '' ?>">
            </form>

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