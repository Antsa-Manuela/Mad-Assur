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

<div class="metric-card">
  <h2 class="metric-title">Aperçu Expérience Client</h2>
  
  <div class="metric-bar">
    <div class="metric-bar-strong" style="width: <?= (int)$assurance['experience_client_fort'] ?>%">
      <?= (int)$assurance['experience_client_fort'] ?>%
    </div>
  </div>

  <div class="metric-details">
    <strong>Points forts :</strong>
    <ul>
      <li>Innovation dans la relation client</li>
      <li>Protection des données</li>
      <li>Accessibilité des produits</li>
    </ul>
  </div>

  <div class="metric-bar">
    <div class="metric-bar-weak" style="width: <?= (int)$assurance['experience_client_faible'] ?>%">
      <?= (int)$assurance['experience_client_faible'] ?>%
    </div>
  </div>

  <div class="metric-details metric-details-weak">
    <strong>Points faibles :</strong>
    <ul>
      <li>Respect des engagements client à améliorer</li>
      <li>Proposition de contrats ISR insuffisante</li>
    </ul>
  </div>
</div>