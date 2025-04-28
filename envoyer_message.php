<?php
/* session_start();
include('database.php');

if (!isset($_SESSION['id_users'])) {
    header('Location: index.php');
    exit();
}

$id_user = $_SESSION['id_users'];
$id_assurance = (int) $_POST['id_assurance'];
$message = trim($_POST['message']);

if ($message !== '') {
    $query = $bdd->prepare("
        INSERT INTO messages (expediteur_id, expediteur_type, destinataire_id, destinataire_type, message)
        VALUES (?, 'user', ?, 'assurance', ?)
    ");
    $query->execute([$id_user, $id_assurance, $message]);
}

header("Location: discussion.php?id_assurance=" . $id_assurance);
exit();
 */
session_start();
include('database.php');

if (!isset($_SESSION['id_users'])) {
    header('Location: login.php');
    exit();
}

$id_user = $_SESSION['id_users'];
$id_assurance = (int)$_POST['id_assurance'];
$message = trim($_POST['message']);

if (!empty($message)) {
    $stmt = $bdd->prepare("
        INSERT INTO messages 
        (expediteur_id, expediteur_type, destinataire_id, destinataire_type, message, date_envoi) 
        VALUES (?, 'user', ?, 'assurance', ?, NOW())
    ");
    $stmt->execute([$id_user, $id_assurance, $message]);
}

header("Location: homechat.php?id_assurance=" . $id_assurance);
exit();
?>