<?php
include('database.php');
$id = isset($_GET['id']) ? (int) $_GET['id'] : 0;

$req = $bdd->prepare("SELECT nom, capital_humain_fort, capital_humain_faible FROM assurances WHERE id_assurances = ?");
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
  <h2>Performance Capital Humain - <?= htmlspecialchars($assurance['nom']) ?></h2>

  <div class="diagramme">
    <div class="barre">
      <div class="barre-forte" style="width: <?= (int)$assurance['capital_humain_fort'] ?>%">
        <?= (int)$assurance['capital_humain_fort'] ?>%
      </div>
    </div>

    <div class="details">
      <strong>Points forts :</strong>
      <ul>
        <li>Organisation et management</li>
        <li>Mobilité réduite bien prise en compte</li>
        <li>Dialogue social actif</li>
      </ul>
    </div>

    <div class="barre">
      <div class="barre-faible" style="width: <?= (int)$assurance['capital_humain_faible'] ?>%">
        <?= (int)$assurance['capital_humain_faible'] ?>%
      </div>
    </div>

    <div class="details">
      <strong>Points faibles :</strong>
      <ul>
        <li>Manque d'accompagnement socio-professionnel</li>
        <li>Conditions matérielles perfectibles</li>
      </ul>
    </div>
  </div>
</body>
</html>
