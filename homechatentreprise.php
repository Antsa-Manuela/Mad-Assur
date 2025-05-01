<?php
session_start();
$id_assurance = $_SESSION['id_assurances'] ?? 2;
include('database.php');

$contacts = $bdd->prepare("
    SELECT DISTINCT u.id_users, u.nom, u.image
    FROM messages m
    JOIN users u ON u.id_users = m.expediteur_id AND m.expediteur_type = 'user'
    WHERE m.destinataire_id = ? AND m.destinataire_type = 'assurance'
    UNION
    SELECT DISTINCT u.id_users, u.nom, u.image
    FROM messages m
    JOIN users u ON u.id_users = m.destinataire_id AND m.destinataire_type = 'user'
    WHERE m.expediteur_id = ? AND m.expediteur_type = 'assurance'
");
$contacts->execute([$id_assurance, $id_assurance]);
$contacts = $contacts->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Chat Assurance</title>
    <link rel="stylesheet" href="css/chat.css">
</head>
<body>
    <div class="sidebar">
        <?php foreach ($contacts as $contact): ?>
            <div class="contact" onclick="loadMessages(<?= $contact['id_users'] ?>, 'user')">
                <img src="<?= htmlspecialchars($contact['image']) ?>" alt="">
                <div><?= htmlspecialchars($contact['nom']) ?></div>
            </div>
        <?php endforeach; ?>
    </div>

    <div class="main-chat">
        <div class="chat-header" id="chat-header">Sélectionnez une conversation</div>
        <div class="chat-box" id="chat-box"></div>
        
        <form class="chat-form" onsubmit="sendMessage(event)">
            <textarea id="message" placeholder="Écrivez un message..."></textarea>
            <button type="submit">→</button>
        </form>
    </div>

    <script>
        let currentId = null;
        let currentType = null;

        function loadMessages(id, type) {
            currentId = id;
            currentType = type;

            fetch(`get_messages.php?to_id=${id}&to_type=${type}`)
                .then(res => res.json())
                .then(data => {
                    const chatBox = document.getElementById("chat-box");
                    const header = document.getElementById("chat-header");
                    
                    chatBox.innerHTML = '';
                    
                    data.messages.forEach(msg => {
                    const div = document.createElement("div");
                    div.className = 'message ' + (msg.expediteur_type === 'user' ? 'from-me' : 'from-other');
                    div.innerHTML = `
                        <div class="message-content">${msg.message.replace(/\n/g, '<br>')}</div>
                        <div class="message-time">
                            ${new Date(msg.date_envoi).toLocaleTimeString([], {hour: '2-digit', minute:'2-digit'})}
                        </div>
                `;
                    chatBox.appendChild(div);
                });
                    
                    header.innerText = data.nom;
                    chatBox.scrollTop = chatBox.scrollHeight;
                });
        }

        function sendMessage(e) {
            e.preventDefault();
            const message = document.getElementById("message").value;
            
            if (!currentId || !message.trim()) return;

            fetch('envoyer_message.php', {
                method: 'POST',
                body: new URLSearchParams({
                    message,
                    to_id: currentId,
                    to_type: currentType
                })
            }).then(() => {
                document.getElementById("message").value = '';
                loadMessages(currentId, currentType);
            });
        }

        setInterval(() => {
            if (currentId) loadMessages(currentId, currentType);
        }, 3000);
    </script>
<a href="logout.php" class="logout-btn" title="Déconnexion">
    Déconnexion
</a>
</body>
</html>