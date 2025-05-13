<?php
require __DIR__.'/database.php';
session_start();

header('Content-Type: application/json');

if (!isset($_SESSION['id_assurances'])) {
    http_response_code(401);
    die(json_encode(['error' => 'Unauthorized']));
}

$userId = (int)$_GET['user_id'] ?? 0;

try {
    $client = $bdd->prepare("SELECT nom, image FROM users WHERE id_users = ?");
    $client->execute([$userId]);
    $clientData = $client->fetch();

    if (!$clientData) {
        http_response_code(404);
        die(json_encode(['error' => 'Client not found']));
    }

    $messages = $bdd->prepare("
        SELECT * FROM messages 
        WHERE (expediteur_id = ? AND expediteur_type = 'assurance' AND destinataire_id = ? AND destinataire_type = 'user')
        OR (expediteur_id = ? AND expediteur_type = 'user' AND destinataire_id = ? AND destinataire_type = 'assurance')
        ORDER BY date_envoi ASC
    ");
    $messages->execute([
        $_SESSION['id_assurances'], $userId,
        $userId, $_SESSION['id_assurances']
    ]);

    echo json_encode([
        'client' => $clientData,
        'messages' => $messages->fetchAll()
    ]);

} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(['error' => 'Database error', 'details' => $e->getMessage()]);
}
?>