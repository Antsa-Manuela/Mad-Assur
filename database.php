<?php

// Configuration MySQL pour XAMPP
$db_config = [
    'host' => 'localhost',
    'name' => 'madassur_33',
    'user' => 'root',
    'pass' => ''
];

// Activation de l'affichage des erreurs pour le développement
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

if (!function_exists('cleanInput')) {
    function cleanInput($data) {
        return htmlspecialchars(trim($data), ENT_QUOTES, 'UTF-8');
    }
}

try {
    $bdd = new PDO(
        "mysql:host={$db_config['host']};dbname={$db_config['name']};charset=utf8mb4",
        $db_config['user'],
        $db_config['pass'],
        [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::ATTR_EMULATE_PREPARES => false
        ]
    );
} catch (PDOException $e) {
    $error_msg = '['.date('Y-m-d H:i:s').'] DB Error: '.$e->getMessage()."\n";
    error_log($error_msg, 3, PROJECT_ROOT.'logs/db_errors.log');
    
    die(json_encode([
        'status' => 'error',
        'message' => 'Database connection failed',
        'error' => $e->getMessage()
    ]));
}
?>