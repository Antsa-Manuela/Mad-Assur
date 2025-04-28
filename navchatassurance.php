<?php
if (!isset($_SESSION['id_assurances'])) {
    header('Location: loginassociation.php');
    exit();
}

$id_assurance = $_SESSION['id_assurances'];
$query = $bdd->prepare("
    SELECT DISTINCT u.id_users, u.nom 
    FROM messages m
    JOIN users u ON (
        (m.expediteur_type = 'user' AND m.expediteur_id = u.id_users) OR
        (m.destinataire_type = 'user' AND m.destinataire_id = u.id_users)
    )
    WHERE (m.expediteur_id = ? AND m.expediteur_type = 'assurance')
       OR (m.destinataire_id = ? AND m.destinataire_type = 'assurance')
");
$query->execute([$id_assurance, $id_assurance]);
$users = $query->fetchAll();
?>

<div class="sidebar" style="  width: 250px;
  background: #ffffff;
  border-right: 1px solid #ccc;
  padding: 10px;
  overflow-y: auto;">
    <h3 style="padding: 15px; margin: 0; border-bottom: 1px solid #eee;">Entreprises</h3>
    <?php foreach ($users as $user): ?>
        <a href="homechatentreprise.php?id_users=<?= $user['id_users'] ?>" 
           style="display: block; padding: 15px; border-bottom: 1px solid #eee; text-decoration: none; color: #333;">
            <?= htmlspecialchars($user['nom']) ?>
        </a>
    <?php endforeach; ?>
</div>