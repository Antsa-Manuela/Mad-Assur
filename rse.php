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

<style>
.metric-title {
  font-size: 1.3rem;
  color: var(--primary);
  margin-bottom: 1.5rem;
  text-align: center;
}

.metric-bar {
  background: var(--white);
  height: 20px;
  border-radius: 10px;
  margin: 1rem 0;
  overflow: hidden;
}

.metric-bar-strong {
  background: linear-gradient(90deg, var(--success), #2ecc71);
  color: white;
  text-align: right;
  padding-right: 10px;
  line-height: 20px;
  font-size: 0.8rem;
  font-weight: 600;
}

.metric-bar-weak {
  background: linear-gradient(90deg, var(--danger), #c0392b);
  color: white;
  text-align: right;
  padding-right: 10px;
  line-height: 20px;
  font-size: 0.8rem;
  font-weight: 600;
}

.metric-details {
  background: var(--bg);
  border-left: 2px solid var(--success);
  margin: 1.5rem 0;
  padding: 1rem;
/*   border-radius: 8px; */
}

.metric-details-weak {
  border-left-color: var(--danger);
}

.metric-details strong {
  color: var(--text-dark);
  font-size: 1rem;
}

.metric-details ul {
  margin: 0.5rem 0 0 1.2rem;
  padding: 0;
}
</style>

<div class="metric-card">
  <h2 class="metric-title">Aperçu RSE</h2>
  
  <div class="metric-bar">
    <div class="metric-bar-strong" style="width: <?= (int)$assurance['rse_fort'] ?>%">
      <?= (int)$assurance['rse_fort'] ?>%
    </div>
  </div>

  <div class="metric-details">
    <strong>Points forts RSE :</strong>
    <ul>
      <li>Gouvernance responsable</li>
      <li>Protection des données personnelles</li>
      <li>Égalité des chances</li>
    </ul>
  </div>

  <div class="metric-bar">
    <div class="metric-bar-weak" style="width: <?= (int)$assurance['rse_faible'] ?>%">
      <?= (int)$assurance['rse_faible'] ?>%
    </div>
  </div>

  <div class="metric-details metric-details-weak">
    <strong>Points faibles RSE :</strong>
    <ul>
      <li>Faible engagement communautaire</li>
      <li>Impact environnemental non maîtrisé</li>
    </ul>
  </div>
</div>