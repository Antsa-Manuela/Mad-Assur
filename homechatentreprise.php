<?php
session_start();
require 'database.php';

if (!isset($_SESSION['id_assurances'])) {
    header('Location: loginassociation.php');
    exit();
}

$id_assurance = $_SESSION['id_assurances'];
$id_user = filter_input(INPUT_GET, 'id_users', FILTER_VALIDATE_INT);
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Messagerie - <?= htmlspecialchars($_SESSION['nom']) ?></title>
    <link rel="stylesheet" href="css/navchat.css">
    <style>
        body { margin: 0; font-family: Arial; }
        .main-container { display: flex; height: 100vh; }
        .discussion-container { 
            flex: 1; padding: 20px; background: #f0f2f5;
            display: flex; flex-direction: column;
        }
    </style>
</head>
<body>
    <div class="main-container">
        <?php include 'navchatassurance.php'; ?>
        
        <div class="discussion-container">
            <?php if ($id_user): ?>
                <?php include 'discussionassurance.php'; ?>
            <?php else: ?>
                <div style="text-align: center; margin-top: 50px;">
                    <p>Sélectionnez une entreprise pour démarrer la discussion</p>
                </div>
            <?php endif; ?>
        </div>
    </div>
</body>
</html>