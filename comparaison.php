<?php
if (empty($_SESSION['comparaison'])) {
    echo "<p>Aucune assurance sélectionnée pour la comparaison.</p>";
    exit();
}

// Récupérer les assurances sélectionnées
$ids = implode(',', array_map('intval', $_SESSION['comparaison']));
$req = $bdd->query("SELECT * FROM assurances WHERE id_assurances IN ($ids)");
$assurances = $req->fetchAll();
?>

<h2>Comparaison des Assurances</h2>

<div class="comparaison-container">
<?php foreach ($assurances as $assurance): ?>
    <div class="assurance-box">
        <img src="<?= htmlspecialchars($assurance['image']) ?>" alt="<?= htmlspecialchars($assurance['nom']) ?>" class="img-compare">
        <h3><?= htmlspecialchars($assurance['nom']) ?></h3>
        <p><?= nl2br(htmlspecialchars($assurance['description'])) ?></p>

        <div class="score">
            <?php
            $moyenne = ($assurance['rse_fort'] + $assurance['capital_humain_fort'] + $assurance['experience_client_fort'] + $assurance['impact_local_fort']) / 4;
            if ($moyenne >= 80) { $grade = "A"; }
            elseif ($moyenne >= 70) { $grade = "B"; }
            elseif ($moyenne >= 60) { $grade = "C"; }
            elseif ($moyenne >= 50) { $grade = "D"; }
            else { $grade = "E"; }
            ?>
            <div class="assur-score <?= $grade ?>"><?= $grade ?></div>
        </div>

        <div class="criteres">
            <div><strong>RSE :</strong> <?= $assurance['rse_fort'] ?>%</div>
            <div><strong>Capital Humain :</strong> <?= $assurance['capital_humain_fort'] ?>%</div>
            <div><strong>Expérience Client :</strong> <?= $assurance['experience_client_fort'] ?>%</div>
            <div><strong>Impact Local :</strong> <?= $assurance['impact_local_fort'] ?>%</div>
        </div>
    </div>
<?php endforeach; ?>
</div>
