<?php
include('database.php');
$id = isset($_GET['id']) ? (int) $_GET['id'] : 0;

$req = $bdd->prepare("SELECT nom, impact_local_fort, impact_local_faible FROM assurances WHERE id_assurances = ?");
$req->execute([$id]);
$assurance = $req->fetch();

if (!$assurance) {
    echo "Assurance introuvable ou ID non valide.";
    exit;
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <title><?= htmlspecialchars($assurance['nom']) ?></title>
  <link rel="stylesheet" href="css/rse.css">
</head>
<body>
  <h2>Performance Impact Local - <?= htmlspecialchars($assurance['nom']) ?></h2>

  <div class="diagramme">
    <div class="barre">
      <div class="barre-forte" style="width: <?= (int)$assurance['impact_local_fort'] ?>%">
        <?= (int)$assurance['impact_local_fort'] ?>%
      </div>
    </div>

    <div class="details">
      <strong>Points forts :</strong>
      <ul>
        <li>Réduction des émissions de CO2</li>
        <li>Soutien des projets sociaux</li>
        <li>Favoriser l'emploi local</li>
      </ul>
    </div>

    <div class="barre">
      <div class="barre-faible" style="width: <?= (int)$assurance['impact_local_faible'] ?>%">
        <?= (int)$assurance['impact_local_faible'] ?>%
      </div>
    </div>

    <div class="details">
      <strong>Points faibles :</strong>
      <ul>
        <li>Manque de politique de biodiversité</li>
        <li>Gestion des fournitures peu durable</li>
      </ul>
    </div>
  </div>
</body>
</html>
