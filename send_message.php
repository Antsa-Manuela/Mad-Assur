<?php
require __DIR__.'/database.php';
session_start();

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    die(json_encode(['error' => 'Method not allowed']));
}

if (!isset($_SESSION['id_users'])) {
    http_response_code(401);
    die(json_encode(['error' => 'Unauthorized']));
}

$contactId = (int)$_POST['contact_id'] ?? 0;
$message = trim($_POST['message'] ?? '');

if (empty($message) || $contactId <= 0) {
    http_response_code(400);
    die(json_encode(['error' => 'Invalid data']));
}

try {
    $stmt = $bdd->prepare("
        INSERT INTO messages 
        (expediteur_id, expediteur_type, destinataire_id, destinataire_type, message, date_envoi, lu)
        VALUES (?, 'user', ?, 'assurance', ?, NOW(), 0)
    ");
    $stmt->execute([$_SESSION['id_users'], $contactId, $message]);
    
    echo json_encode(['success' => true]);
} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(['error' => 'Database error']);
}
?>