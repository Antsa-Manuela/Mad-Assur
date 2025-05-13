<?php
session_start();
$id_assurance = $_SESSION['id_assurances'] ?? 2;
include('database.php');

$contacts = $bdd->prepare("
    SELECT DISTINCT u.id_users, u.nom, u.image
    FROM messages m
    JOIN users u ON (
        (m.expediteur_type = 'user' AND m.expediteur_id = u.id_users AND m.destinataire_id = ? AND m.destinataire_type = 'assurance')
        OR 
        (m.destinataire_type = 'user' AND m.destinataire_id = u.id_users AND m.expediteur_id = ? AND m.expediteur_type = 'assurance')
    )
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
<button class="menu-toggle" onclick="toggleSidebar()">☰</button>
    <div class="sidebar">
        <div class="logo-container">
            <a href="#">
                <img src="img/logoin.png" alt="Logo Mad(Assur)" class="logo">
            </a>
        </div>
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
            <button type="submit">🗨️</button>
        </form>
    </div>

    <script>
        let currentId = null;
        let currentType = null;

        function loadMessages(id, type) {
            currentId = id;
            currentType = type;

            fetch(`get_messages.php?to_id=${id}&to_type=${type}`)
                .then(res => {
                    if (!res.ok) throw new Error('Erreur réseau');
                    return res.json();
                })
                .then(data => {
                    if (data.status === 'error') {
                        console.error('Erreur:', data.message);
                        return;
                    }

                    const chatBox = document.getElementById("chat-box");
                    const header = document.getElementById("chat-header");
                    chatBox.innerHTML = '';
                    
                    if (data.messages && data.messages.length > 0) {
                        data.messages.forEach(msg => {
                            const div = document.createElement("div");
                            div.className = 'message ' + (msg.expediteur_type === 'user' ? 'from-me-assurance' : 'from-other-assurance');
                            div.innerHTML = `
                                <div class="message-content">${msg.message.replace(/\n/g, '<br>')}</div>
                                <div class="message-time">
                                    ${new Date(msg.date_envoi).toLocaleTimeString([], {hour: '2-digit', minute:'2-digit'})}
                                </div>
                            `;
                            chatBox.appendChild(div);
                        });
                    } else {
                        chatBox.innerHTML = '<div class="no-messages">Aucun message</div>';
                    }
                    
                    header.innerText = data.nom || 'Conversation';
                    chatBox.scrollTop = chatBox.scrollHeight;
                })
                .catch(error => {
                    console.error('Erreur:', error);
                    document.getElementById("chat-box").innerHTML = '<div class="error-message">Erreur lors du chargement des messages</div>';
                });
        }

        function sendMessage(e) {
            e.preventDefault();
            const message = document.getElementById("message").value;
            
            if (!currentId || !message.trim()) return;

            fetch('envoyer_message.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
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
        }, 1000);
    </script>
    <a href="logout.php" class="logout-btn" title="Déconnexion">
        Déconnexion
    </a>
    <script>
    function toggleSidebar() {
        document.querySelector('.sidebar').classList.toggle('active');
    }

    // Close sidebar when clicking outside on mobile
    document.addEventListener('click', function(e) {
        const sidebar = document.querySelector('.sidebar');
        const menuToggle = document.querySelector('.menu-toggle');
        
        if (window.innerWidth <= 768 && 
            !sidebar.contains(e.target) && 
            e.target !== menuToggle && 
            !menuToggle.contains(e.target)) {
            sidebar.classList.remove('active');
        }
    });

    // Adjust layout on resize
    window.addEventListener('resize', function() {
        if (window.innerWidth > 768) {
            document.querySelector('.sidebar').classList.remove('active');
        }
    });
</script>
</body>
</html>