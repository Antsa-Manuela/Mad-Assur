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

<div class="metric-card">
  <h2 class="metric-title">Aperçu Capital Humain</h2>
  
  <div class="metric-bar">
    <div class="metric-bar-strong" style="width: <?= (int)$assurance['capital_humain_fort'] ?>%">
      <?= (int)$assurance['capital_humain_fort'] ?>%
    </div>
  </div>

  <div class="metric-details">
    <strong>Points forts :</strong>
    <ul>
      <li>Organisation et management</li>
      <li>Mobilité réduite bien prise en compte</li>
      <li>Dialogue social actif</li>
    </ul>
  </div>

  <div class="metric-bar">
    <div class="metric-bar-weak" style="width: <?= (int)$assurance['capital_humain_faible'] ?>%">
      <?= (int)$assurance['capital_humain_faible'] ?>%
    </div>
  </div>

  <div class="metric-details metric-details-weak">
    <strong>Points faibles :</strong>
    <ul>
      <li>Manque d'accompagnement socio-professionnel</li>
      <li>Conditions matérielles perfectibles</li>
    </ul>
  </div>
</div>