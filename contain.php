<div id="contenu">
    <?php foreach ($assurances as $assurance): ?>
        <?php $isSelected = in_array($assurance['id_assurances'], $_SESSION['comparaison'] ?? []); ?>
        <div class="block <?= $isSelected ? 'selected' : '' ?>" 
             data-id="<?= $assurance['id_assurances'] ?>">
            
            <a href="page.php?id=<?= $assurance['id_assurances'] ?>" class="block-link">
                <?php if (!empty($assurance['image'])): ?>
                    <img src="<?= htmlspecialchars($assurance['image']) ?>" 
                         alt="<?= htmlspecialchars($assurance['nom']) ?>" 
                         class="img">
                <?php endif; ?>
                <h3><?= htmlspecialchars($assurance['nom']) ?></h3>
            </a>

            <button class="btn-compare" 
                    data-id="<?= $assurance['id_assurances'] ?>"
                    aria-label="<?= $isSelected ? 'Retirer de la comparaison' : 'Ajouter à la comparaison' ?>">
                <?= $isSelected ? 'Retirer' : 'Comparer' ?>
            </button>
        </div>
    <?php endforeach; ?>

    <?php if (!empty($_SESSION['comparaison'])): ?>
        <div class="action-buttons">
            <a href="home.php?page=comparaison" class="btn-action-link">
                <button class="btn-action">
                    Voir la comparaison (<?= count($_SESSION['comparaison']) ?>)
                </button>
            </a>
            <button class="btn-action reset-link reset">Réinitialiser</button>
        </div>
    <?php endif; ?>
</div>