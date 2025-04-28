<div id="contenu">
    <?php foreach ($assurances as $assurance): ?>
        <div class="block" data-id="<?= $assurance['id_assurances']; ?>">
            <a href="page.php?id=<?= $assurance['id_assurances']; ?>">
                <?php if (!empty($assurance['image'])): ?>
                    <img src="<?= htmlspecialchars($assurance['image']); ?>" alt="<?= htmlspecialchars($assurance['nom']); ?>" class="img">
                <?php endif; ?>
                <p><?= htmlspecialchars($assurance['nom']); ?></p>
            </a>

            <!-- Bouton Comparer -->
            <a href="home.php?compare=<?= $assurance['id_assurances']; ?>">
                <button class="btn-compare" data-id="<?= $assurance['id_assurances']; ?>">Comparer</button>
            </a>
        </div>
    <?php endforeach; ?>

    <?php if (!empty($_SESSION['comparaison'])): ?>
        <div class="action-buttons">
            <a href="home.php?page=comparaison">
                <button class="btn-action">Voir la comparaison (<?= count($_SESSION['comparaison']); ?>)</button>
            </a>
            <a href="home.php?reset=1">
                <button class="btn-action reset">Réinitialiser</button>
            </a>
        </div>
    <?php endif; ?>
</div>
