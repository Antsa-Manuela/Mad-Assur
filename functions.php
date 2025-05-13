<?php
if (!function_exists('cleanInput')) {
    function cleanInput($data) {
        return htmlspecialchars(trim($data), ENT_QUOTES, 'UTF-8');
    }
}

// Autres fonctions utilitaires...
?>