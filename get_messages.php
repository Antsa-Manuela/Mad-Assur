<?php
session_start();
include('database.php');

$from_id = $_SESSION['id_users'] ?? $_SESSION['id_assurances'];
$from_type = isset($_SESSION['id_users']) ? 'user' : 'assurance';

$to_id = (int)$_GET['to_id'];
$to_type = $_GET['to_type'];

$stmt = $bdd->prepare("SELECT * FROM messages WHERE 
    (expediteur_id = ? AND expediteur_type = ? AND destinataire_id = ? AND destinataire_type = ?)
 OR (expediteur_id = ? AND expediteur_type = ? AND destinataire_id = ? AND destinataire_type = ?)
 ORDER BY date_envoi ASC");
$stmt->execute([$from_id, $from_type, $to_id, $to_type, $to_id, $to_type, $from_id, $from_type]);

$messages = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Nom de l’interlocuteur
$nom = $to_type === 'assurance'
    ? $bdd->query("SELECT nom FROM assurances WHERE id_assurances = $to_id")->fetchColumn()
    : $bdd->query("SELECT nom FROM users WHERE id_users = $to_id")->fetchColumn();

echo json_encode(['messages' => $messages, 'nom' => $nom]);
