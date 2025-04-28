<?php
include('database.php');
$id = isset($_GET['id']) ? (int) $_GET['id'] : 0;

$req = $bdd->prepare("SELECT nom, rse_fort, rse_faible FROM assurances WHERE id_assurances = ?");
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
  <h2>Performance RSE - <?= htmlspecialchars($assurance['nom']) ?></h2>

  <div class="diagramme">
    <div class="barre">
      <div class="barre-forte" style="width: <?= (int)$assurance['rse_fort'] ?>%">
        <?= (int)$assurance['rse_fort'] ?>%
      </div>
    </div>

    <div class="details">
      <strong>Points forts RSE :</strong>
      <ul>
        <li>Gouvernance responsable</li>
        <li>Protection des données personnelles</li>
        <li>Égalité des chances</li>
      </ul>
    </div>

    <div class="barre">
      <div class="barre-faible" style="width: <?= (int)$assurance['rse_faible'] ?>%">
        <?= (int)$assurance['rse_faible'] ?>%
      </div>
    </div>

    <div class="details">
      <strong>Points faibles RSE :</strong>
      <ul>
        <li>Faible engagement communautaire</li>
        <li>Impact environnemental non maîtrisé</li>
      </ul>
    </div>
  </div>
</body>
</html>