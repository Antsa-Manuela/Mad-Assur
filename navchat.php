<link rel="stylesheet" href="./css/navchat.css">

<?php
$query = $bdd->prepare("
    SELECT DISTINCT a.id_assurances, a.nom, a.image 
    FROM messages m 
    JOIN assurances a ON 
        (m.expediteur_type = 'assurance' AND m.expediteur_id = a.id_assurances) 
        OR 
        (m.destinataire_type = 'assurance' AND m.destinataire_id = a.id_assurances)
    WHERE 
        (m.expediteur_id = ? AND m.expediteur_type = 'user') 
        OR 
        (m.destinataire_id = ? AND m.destinataire_type = 'user')
");
$query->execute([$id_user, $id_user]);
$assurances = $query->fetchAll();
?>

<div class="sidebar">
    <?php foreach ($assurances as $assurance): ?>
        <a class="contact" href="homechat.php?id_assurance=<?= $assurance['id_assurances'] ?>">
            <img src="<?= $assurance['image'] ?>" class="contact-img" alt="<?= $assurance['nom'] ?>">
            <div class="contact-name"><?= $assurance['nom'] ?></div>
        </a>
    <?php endforeach; ?>
</div>