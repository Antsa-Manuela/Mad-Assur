<?php
include('database.php');
$id = isset($_GET['id']) ? (int) $_GET['id'] : 0;

$req = $bdd->prepare("SELECT nom, experience_client_fort, experience_client_faible FROM assurances WHERE id_assurances = ?");
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
  <h2>Performance Expérience Client - <?= htmlspecialchars($assurance['nom']) ?></h2>

  <div class="diagramme">
    <div class="barre">
      <div class="barre-forte" style="width: <?= (int)$assurance['experience_client_fort'] ?>%">
        <?= (int)$assurance['experience_client_fort'] ?>%
      </div>
    </div>

    <div class="details">
      <strong>Points forts :</strong>
      <ul>
        <li>Innovation dans la relation client</li>
        <li>Protection des données</li>
        <li>Accessibilité des produits</li>
      </ul>
    </div>

    <div class="barre">
      <div class="barre-faible" style="width: <?= (int)$assurance['experience_client_faible'] ?>%">
        <?= (int)$assurance['experience_client_faible'] ?>%
      </div>
    </div>

    <div class="details">
      <strong>Points faibles :</strong>
      <ul>
        <li>Respect des engagements client à améliorer</li>
        <li>Proposition de contrats ISR insuffisante</li>
      </ul>
    </div>
  </div>
</body>
</html>
