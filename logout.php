<?php
    session_start();
    //supprime la session
    unset($_SESSION['id_users']);
    /* session_destroy(); */
    header('Location:index.php');
?>