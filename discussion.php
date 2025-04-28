
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
    <textarea name="message" placeholder="Votre message..." class="group-3"></textarea>
    <button type="submit">Envoyer</button>
</form>


<body>
    <div class="main-container">
      <div class="pseudo-discution">
        <div class="text">
          <div class="profile"></div>
          <span class="assurance-aro">Assurance Aro</span>
        </div>
      </div>
      <div class="group">
        <div class="wrapper">
          <div class="wrapper-2">
            <div class="img"></div>
            <div class="section-2">
              <span class="text-2">messagemessage</span>
            </div>
          </div>
        </div>
        <div class="section-3">
          <div class="group-2">
            <div class="box-2"><span class="text-3">messagemessage</span></div>
            <div class="img-2"></div>
          </div>
        </div>
      </div>
      <div class="group-3">
        <span class="text-4">messagemessage</span>
        <div class="img-3"></div>
      </div>
    </div>