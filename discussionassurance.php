<?php
// Récupération de l'ID de l'assurance depuis la session
$assurance_id = $_SESSION['id_assurances'];

$query = $bdd->prepare("
    SELECT m.*, 
           u.nom as expediteur_nom,
           a.nom as destinataire_nom
    FROM messages m
    LEFT JOIN users u ON m.expediteur_type = 'user' AND m.expediteur_id = u.id_users
    LEFT JOIN assurances a ON m.expediteur_type = 'assurance' AND m.expediteur_id = a.id_assurances
    WHERE (m.expediteur_id = ? AND m.destinataire_id = ?)
       OR (m.expediteur_id = ? AND m.destinataire_id = ?)
    ORDER BY m.date_envoi ASC
");
$query->execute([$assurance_id, $id_user, $id_user, $assurance_id]); // Correction ici
$messages = $query->fetchAll();
?>

<div style="flex: 1; overflow-y: auto; padding: 20px;">
    <?php foreach ($messages as $msg): ?>
        <div style="
            display: flex;
            justify-content: <?= $msg['expediteur_type'] === 'assurance' ? 'flex-end' : 'flex-start' ?>;
            margin-bottom: 10px;
        ">
            <div style="
                background: <?= $msg['expediteur_type'] === 'assurance' ? '#0084ff' : '#e4e6eb' ?>;
                color: <?= $msg['expediteur_type'] === 'assurance' ? 'white' : 'black' ?>;
                padding: 10px 15px;
                border-radius: 18px;
                max-width: 70%;
                word-break: break-word;
                overflow-wrap: break-word;
                font-size: 14px;
                line-height: 1.4;
            ">
                <?= htmlspecialchars($msg['message']) ?>
                <div style="font-size: 0.8em; text-align: right; margin-top: 5px; opacity: 0.7;">
                    <?= date('H:i', strtotime($msg['date_envoi'])) ?>
                </div>
            </div>
        </div>

    <?php endforeach; ?>
</div>

<form action="envoyer_messageassurance.php" method="post" style="display: flex; padding: 10px; border-top: 1px solid #ddd;">
    <input type="hidden" name="destinataire_id" value="<?= $id_user ?>">
    <input type="hidden" name="destinataire_type" value="user">
    <textarea name="message" style="flex: 1; padding: 10px; border: 1px solid #ddd; border-radius: 20px;"></textarea>
    <button type="submit" style="
        background: #0084ff; color: white; border: none; 
        border-radius: 50%; width: 40px; height: 40px;
        margin-left: 10px;
    ">
        >
    </button>
</form>