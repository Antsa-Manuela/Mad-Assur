<?php
include('database.php');
$id = isset($_GET['id']) ? (int) $_GET['id'] : 0;

$req = $bdd->prepare("SELECT * FROM assurances WHERE id_assurances = ?");
$req->execute([$id]);
$assurance = $req->fetch();

if (!$assurance) {
    echo "Assurance introuvable ou ID non valide.";
    exit;
}

// Calcul de l'Assur'Score (moyenne des 4 domaines forts)
$moyenne = ($assurance['rse_fort'] + $assurance['capital_humain_fort'] + $assurance['experience_client_fort'] + $assurance['impact_local_fort']) / 4;

// Déterminer la lettre du score
if ($moyenne >= 80) {
    $score = 'A';
} elseif ($moyenne >= 60) {
    $score = 'B';
} elseif ($moyenne >= 40) {
    $score = 'C';
} elseif ($moyenne >= 20) {
    $score = 'D';
} else {
    $score = 'E';
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Détails - <?= htmlspecialchars($assurance['nom']) ?></title>
    <link rel="stylesheet" href="css/details.css">
</head>
<body>

<div class="container">
    <div class="header">
        <img src="<?= htmlspecialchars($assurance['image']) ?>" alt="<?= htmlspecialchars($assurance['nom']) ?>">
        <h1><?= htmlspecialchars($assurance['nom']) ?></h1>
    </div>

    <p class="description">
        <?= nl2br(htmlspecialchars($assurance['description'])) ?>
    </p>

    <!-- AssurScore -->
    <div class="assur">
      <div class="assurscore">
        <div class="title">Assur'Score<sup>®</sup></div>

        <div class="score-container">
          <div class="score-box <?= ($score == 'A') ? 'active' : '' ?>">A</div>
          <div class="score-box <?= ($score == 'B') ? 'active' : '' ?>">B</div>
          <div class="score-box <?= ($score == 'C') ? 'active' : '' ?>">C</div>
          <div class="score-box <?= ($score == 'D') ? 'active' : '' ?>">D</div>
          <div class="score-box <?= ($score == 'E') ? 'active' : '' ?>">E</div>
        </div>
      </div>
    </div>

    <!-- Diagrammes -->
    <div class="domains">
        <div class="domain">
            <h3>RSE</h3>
            <div class="barre">
                <div class="barre-forte" style="width: <?= (int)$assurance['rse_fort'] ?>%"><?= (int)$assurance['rse_fort'] ?>%</div>
            </div>
        </div>
        <div class="domain">
            <h3>Capital Humain</h3>
            <div class="barre">
                <div class="barre-forte" style="width: <?= (int)$assurance['capital_humain_fort'] ?>%"><?= (int)$assurance['capital_humain_fort'] ?>%</div>
            </div>
        </div>
        <div class="domain">
            <h3>Expérience Client</h3>
            <div class="barre">
                <div class="barre-forte" style="width: <?= (int)$assurance['experience_client_fort'] ?>%"><?= (int)$assurance['experience_client_fort'] ?>%</div>
            </div>
        </div>
        <div class="domain">
            <h3>Impact Local</h3>
            <div class="barre">
                <div class="barre-forte" style="width: <?= (int)$assurance['impact_local_fort'] ?>%"><?= (int)$assurance['impact_local_fort'] ?>%</div>
            </div>
        </div>
    </div>

</div>

</body>
</html>
