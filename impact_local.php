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

<div class="metric-card">
  <h2 class="metric-title">Aperçu Impact Local</h2>
  
  <div class="metric-bar">
    <div class="metric-bar-strong" style="width: <?= (int)$assurance['impact_local_fort'] ?>%">
      <?= (int)$assurance['impact_local_fort'] ?>%
    </div>
  </div>

  <div class="metric-details">
    <strong>Points forts :</strong>
    <ul>
      <li>Réduction des émissions de CO2</li>
      <li>Soutien des projets sociaux</li>
      <li>Favoriser l'emploi local</li>
    </ul>
  </div>

  <div class="metric-bar">
    <div class="metric-bar-weak" style="width: <?= (int)$assurance['impact_local_faible'] ?>%">
      <?= (int)$assurance['impact_local_faible'] ?>%
    </div>
  </div>

  <div class="metric-details metric-details-weak">
    <strong>Points faibles :</strong>
    <ul>
      <li>Manque de politique de biodiversité</li>
      <li>Gestion des fournitures peu durable</li>
    </ul>
  </div>
</div>