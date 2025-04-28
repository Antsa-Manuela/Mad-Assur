<?php
session_start();
require 'database.php';

if (!isset($_SESSION['id_assurances']) || $_SERVER['REQUEST_METHOD'] !== 'POST') {
    header('Location: loginassociation.php');
    exit();
}

$expediteur_id = $_SESSION['id_assurances'];
$destinataire_id = filter_input(INPUT_POST, 'destinataire_id', FILTER_VALIDATE_INT);
$message = trim(filter_input(INPUT_POST, 'message', FILTER_SANITIZE_STRING));

if ($destinataire_id && !empty($message)) {
    $stmt = $bdd->prepare("
        INSERT INTO messages (
            expediteur_id, expediteur_type, 
            destinataire_id, destinataire_type, 
            message, date_envoi
        ) VALUES (?, 'assurance', ?, 'user', ?, NOW())
    ");
    $stmt->execute([$expediteur_id, $destinataire_id, $message]);
}

header("Location: homechatentreprise.php?id_users=$destinataire_id");
exit();
?>