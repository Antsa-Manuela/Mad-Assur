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

try {
    $stmt = $bdd->prepare("
        UPDATE messages SET lu = 1 
        WHERE destinataire_id = ? AND destinataire_type = 'assurance'
        AND expediteur_id = ? AND expediteur_type = 'user'
        AND (lu IS NULL OR lu = 0)
    ");
    $stmt->execute([
        $_SESSION['id_assurances'],
        $userId
    ]);
    
    echo json_encode(['success' => true, 'marked' => $stmt->rowCount()]);

} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(['error' => 'Database error', 'details' => $e->getMessage()]);
}
?>