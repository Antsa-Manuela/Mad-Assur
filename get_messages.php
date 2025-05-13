<?php
session_start();
include('database.php');

header('Content-Type: application/json');

try {
    // Vérifier si l'utilisateur est connecté
    if (!isset($_SESSION['id_users']) && !isset($_SESSION['id_assurances'])) {
        throw new Exception('Non authentifié');
    }

    $from_id = $_SESSION['id_users'] ?? $_SESSION['id_assurances'];
    $from_type = isset($_SESSION['id_users']) ? 'user' : 'assurance';

    // Valider les paramètres d'entrée
    if (!isset($_GET['to_id']) || !isset($_GET['to_type'])) {
        throw new Exception('Paramètres manquants');
    }

    $to_id = (int)$_GET['to_id'];
    $to_type = $_GET['to_type'] === 'user' ? 'user' : 'assurance';

    // Récupérer les messages
    $stmt = $bdd->prepare("SELECT * FROM messages WHERE 
        (expediteur_id = ? AND expediteur_type = ? AND destinataire_id = ? AND destinataire_type = ?)
        OR 
        (expediteur_id = ? AND expediteur_type = ? AND destinataire_id = ? AND destinataire_type = ?)
        ORDER BY date_envoi ASC");
    $stmt->execute([$from_id, $from_type, $to_id, $to_type, $to_id, $to_type, $from_id, $from_type]);

    $messages = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Récupérer le nom de l'interlocuteur
    if ($to_type === 'assurance') {
        $stmt = $bdd->prepare("SELECT nom FROM assurances WHERE id_assurances = ?");
    } else {
        $stmt = $bdd->prepare("SELECT nom FROM users WHERE id_users = ?");
    }
    $stmt->execute([$to_id]);
    $nom = $stmt->fetchColumn();

    echo json_encode([
        'status' => 'success',
        'messages' => $messages,
        'nom' => $nom ?: 'Inconnu'
    ]);

} catch (Exception $e) {
    echo json_encode([
        'status' => 'error',
        'message' => $e->getMessage()
    ]);
}