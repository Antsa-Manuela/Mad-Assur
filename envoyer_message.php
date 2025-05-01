<?php
session_start();
include('database.php');

$from_id = $_SESSION['id_users'] ?? $_SESSION['id_assurances'];
$from_type = isset($_SESSION['id_users']) ? 'user' : 'assurance';

$message = $_POST['message'] ?? '';
$to_id = (int)$_POST['to_id'];
$to_type = $_POST['to_type'];

if ($message && $to_id && $to_type) {
    $stmt = $bdd->prepare("INSERT INTO messages (expediteur_id, expediteur_type, destinataire_id, destinataire_type, message) VALUES (?, ?, ?, ?, ?)");
    $stmt->execute([$from_id, $from_type, $to_id, $to_type, $message]);
}
