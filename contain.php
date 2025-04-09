<?php
session_start();
if (!isset($_SESSION['nom'])) {
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
    <link rel="stylesheet" href="css/contain.css">
</head>
<body>

<!-- Champ de recherche -->
<form method="GET" action=""><?= isset($_GET['q']) ? htmlspecialchars($_GET['q']) : '' ?>
</form>

<div id="contenu">
  <?php
        // Si une recherche est lancée
        if (isset($_GET['q']) && !empty(trim($_GET['q']))) {
            $recherche = htmlspecialchars($_GET['q']);
            
            // Requête sécurisée avec LIKE
            $stmt = $bdd->prepare("SELECT nom, image, lien FROM assurances WHERE nom LIKE ?");
            $stmt->execute(["%$recherche%"]);
            
            $resultats = $stmt->fetchAll();

            if (count($resultats) > 0) {
                foreach ($resultats as $assurance) {
                    echo '<div class="block"><a href="'.$assurance["lien"].'">';
                    
                    // Affichage de l'image si disponible
/*                     if (!empty($assurance["image"])) {
                        echo '<img src="'.$assurance["image"].'" alt="Image de '.$assurance["nom"].'" width="100" height="100">';
                    } */

                    echo "<p>".$assurance["nom"]."</p>";
                    echo "</a></div>";
                }
            } else {
                echo "<p>Aucun résultat trouvé pour <strong>".htmlspecialchars($recherche)."</strong>.</p>";
            }

        } else {
            // Aucune recherche : affichage de toute la liste
            $selection = $bdd->query("SELECT id_assurances, nom, image, lien FROM assurances");

            while ($donnees = $selection->fetch()) {
                echo '<div class="block"><a href="'.$donnees["lien"].'">';
                
                // Affichage de l'image si disponible
/*                 if (!empty($donnees["image"])) {
                    echo '<img src="'.$donnees["image"].'" alt="Image de '.$donnees["nom"].'">';
                } */

                // Affichage du nom
                echo "<p>".$donnees["nom"]."</p>";
                echo "</a></div>";
            }
        }
    ?>
</div>
</body>
</html>
