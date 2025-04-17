
<?php
$query = $bdd->prepare("
    SELECT * FROM messages 
    WHERE 
        (expediteur_id = ? AND expediteur_type = 'user' AND destinataire_id = ? AND destinataire_type = 'assurance')
        OR
        (expediteur_id = ? AND expediteur_type = 'assurance' AND destinataire_id = ? AND destinataire_type = 'user')
    ORDER BY date_envoi ASC
");
$query->execute([$id_user, $id_assurance, $id_assurance, $id_user]);
$messages = $query->fetchAll();
?>

<div class="chat-box">
    <?php foreach ($messages as $msg): ?>
        <div class="<?= ($msg['expediteur_type'] == 'user') ? 'msg-right' : 'msg-left' ?>">
            <?= htmlspecialchars($msg['message']) ?>
        </div>
    <?php endforeach; ?>
</div>

<form action="envoyer_message.php" method="post">
    <input type="hidden" name="id_assurance" value="<?= $id_assurance ?>">
    <textarea name="message" placeholder="Votre message..."></textarea>
    <button type="submit">Envoyer</button>
</form>