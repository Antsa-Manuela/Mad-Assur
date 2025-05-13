<?php
require __DIR__.'/database.php';
session_start();

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    die(json_encode(['error' => 'Method not allowed']));
}

if (!isset($_SESSION['id_assurances'])) {
    http_response_code(401);
    die(json_encode(['error' => 'Unauthorized']));
}

$userId = (int)$_POST['user_id'] ?? 0;
$message = trim($_POST['message'] ?? '');

if (empty($message) || $userId <= 0) {
    http_response_code(400);
    die(json_encode(['error' => 'Invalid data']));
}

try {
    $stmt = $bdd->prepare("
        INSERT INTO messages 
        (expediteur_id, expediteur_type, destinataire_id, destinataire_type, message, date_envoi)
        VALUES (?, 'assurance', ?, 'user', ?, NOW())
    ");
    $stmt->execute([
        $_SESSION['id_assurances'],
        $userId,
        $message
    ]);
    
    echo json_encode(['success' => true, 'message_id' => $bdd->lastInsertId()]);

} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(['error' => 'Database error', 'details' => $e->getMessage()]);
}
?>