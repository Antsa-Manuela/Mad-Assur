<?php if (empty($_SESSION['comparaison'])): ?>
    <div class="empty-comparison">
        <p>Aucune assurance sélectionnée pour la comparaison.</p>
        <a href="home.php" class="back-link">← Retour à la liste</a>
    </div>
    <?php exit(); ?>
<?php endif; ?>

<?php
$ids = implode(',', array_map('intval', $_SESSION['comparaison']));
$assurances = $bdd->query("SELECT * FROM assurances WHERE id_assurances IN ($ids)")->fetchAll();
?>

<h2 class="comparison-title">Comparaison des Assurances</h2>

<div class="comparison-actions">
    <a href="home.php" class="back-link">← Retour à la liste</a>
    <button class="reset-link reset">Réinitialiser la comparaison</button>
</div>

<div class="comparaison-container">
    <?php foreach ($assurances as $assurance): ?>
        <div class="assurance-box">
            <img src="<?= htmlspecialchars($assurance['image']) ?>" 
                 alt="<?= htmlspecialchars($assurance['nom']) ?>" 
                 class="img-compare">

            <h3 class="assurance-name"><?= htmlspecialchars($assurance['nom']) ?></h3>

            <?php
            $moyenne = array_sum([
                $assurance['rse_fort'],
                $assurance['capital_humain_fort'],
                $assurance['experience_client_fort'],
                $assurance['impact_local_fort']
            ]) / 4;
            
            $grade = match (true) {
                $moyenne >= 80 => 'A',
                $moyenne >= 70 => 'B',
                $moyenne >= 60 => 'C',
                $moyenne >= 50 => 'D',
                default => 'E'
            };
            ?>

            <div class="score">
                <div class="assur-score <?= $grade ?>">Score <?= $grade ?></div>
            </div>

            <table class="criteres">
                <tr>
                    <td><strong>RSE</strong></td>
                    <td><?= $assurance['rse_fort'] ?>%</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="progress-container">
                            <div class="progress-bar" style="width: <?= $assurance['rse_fort'] ?>%"></div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td><strong>Capital Humain</strong></td>
                    <td><?= $assurance['capital_humain_fort'] ?>%</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="progress-container">
                            <div class="progress-bar" style="width: <?= $assurance['capital_humain_fort'] ?>%"></div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td><strong>Expérience Client</strong></td>
                    <td><?= $assurance['experience_client_fort'] ?>%</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="progress-container">
                            <div class="progress-bar" style="width: <?= $assurance['experience_client_fort'] ?>%"></div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td><strong>Impact Local</strong></td>
                    <td><?= $assurance['impact_local_fort'] ?>%</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="progress-container">
                            <div class="progress-bar" style="width: <?= $assurance['impact_local_fort'] ?>%"></div>
                        </div>
                    </td>
                </tr>
            </table>

            <div class="description">
                <?= nl2br(htmlspecialchars($assurance['description'])) ?>
            </div>

<!--             <a href="home.php?compare=<?= $assurance['id_assurances'] ?>" class="remove-compare" onclick="return confirm('Retirer cette assurance de la comparaison ?')">
                ❌ Retirer
            </a> -->
        </div>
    <?php endforeach; ?>
</div>