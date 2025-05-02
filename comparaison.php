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

// Récupérer tous les services disponibles
$all_services = [];
foreach ($assurances as $assurance) {
    $services = explode(',', $assurance['services']);
    foreach ($services as $service) {
        $service = trim($service);
        if (!in_array($service, $all_services)) {
            $all_services[] = $service;
        }
    }
}
sort($all_services);
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
            $moyenne = (
                $assurance['rse_fort'] + 
                $assurance['capital_humain_fort'] + 
                $assurance['experience_client_fort'] + 
                $assurance['impact_local_fort']
            ) / 4;
            
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
                <!-- <div class="average-score">Moyenne: <?= round($moyenne) ?>%</div> -->
            </div>

            <table class="criteres">
                <!-- RSE -->
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
                
                <!-- Capital Humain -->
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
                
                <!-- Expérience Client -->
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
                
                <!-- Impact Local -->
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

            <div class="services-section">
                <h4>Services proposés</h4>
                <?php 
                $current_services = array_map('trim', explode(',', $assurance['services']));
                $service_ratings = json_decode($assurance['services_ratings'] ?? '{}', true);
                
                foreach ($all_services as $service): 
                    $has_service = in_array($service, $current_services);
                    $rating = $service_ratings[$service] ?? 3; // Valeur par défaut si non trouvée
                ?>
                    <div class="service-item <?= $has_service ? '' : 'service-unavailable' ?>">
                        <span class="service-name"><?= htmlspecialchars($service) ?></span>
                        <?php if ($has_service): ?>
                            <div class="star-rating">
                                <?php for ($i = 1; $i <= 5; $i++): ?>
                                    <span class="star <?= $i <= $rating ? 'filled' : '' ?>">★</span>
                                <?php endfor; ?>
                                <span class="rating-value">(<?= $rating ?>.0)</span>
                            </div>
                        <?php else: ?>
                            <span class="not-available">Non disponible</span>
                        <?php endif; ?>
                    </div>
                <?php endforeach; ?>
            </div>

            <div class="description">
                <?= nl2br(htmlspecialchars($assurance['description'])) ?>
            </div>
        </div>
    <?php endforeach; ?>
</div>