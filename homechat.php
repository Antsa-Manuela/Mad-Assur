<!-- <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Discussion</title>
</head>
<body> -->
    <?php
/*     include('header.php'); */
    ?>
<!--     <div style="display: flex;"> -->
    <?php
    /*include('navchat.php'); 
    include('chatcontainer.php') */
    ?>
    <!-- </div> -->
    <?php 
session_start();
include('database.php');

if (!isset($_SESSION['id_users'])) {
    header('Location: login.php');
    exit();
}

$id_user = $_SESSION['id_users'];
$id_assurance = isset($_GET['id_assurance']) ? (int)$_GET['id_assurance'] : null;
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Messagerie</title>
    <link rel="stylesheet" href="css/navchat.css">
</head>
<body>
    <div class="container">
        <?php include('navchat.php'); ?>
        
        <div class="discussion-container">
            <?php if ($id_assurance) {
                include('discussion.php');
            } else {
                echo "<p class='placeholder'>Sélectionnez une assurance pour démarrer la discussion.</p>";
            } ?>
        </div>
    </div>
</body>
</html>
</body>
</html>