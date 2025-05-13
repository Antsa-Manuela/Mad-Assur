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

$stmt = $bdd->prepare("
    UPDATE messages SET lu = 1 
    WHERE destinataire_id = ? AND destinataire_type = 'user'
    AND expediteur_id = ? AND expediteur_type = 'assurance'
");
$stmt->execute([$_SESSION['id_users'], $contactId]);

echo json_encode(['marked' => $stmt->rowCount()]);
?>