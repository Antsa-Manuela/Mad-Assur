<link rel="stylesheet" href="./css/style_chat.css">
<div class="header">
<?php
session_start();
if (!isset($_SESSION['id_users'])) {
    header('Location:index.php');
    exit();
}
include('database.php');
?>
</div>
<hr>
<!-- style="border: solid 1px #00cc66;" -->

<?php
/*     include('footer.php'); */
/*     if (isset($_SESSION['id_users'])) {
 */        # code...

?>
<!-- <hr> -->
<br>
<br>
<br>
<div class="chat">

<form action="sendmessage.php" method="post">
<span class="send">
<!--     <label for="nom">Votre pseudo:</label>
    <input type="text" name="nom" id="nom" value=" --><?php 
    /* if (isset($_SESSION['id_users'])) {
    echo "     ".$_SESSION['nom'];
    } */
    ?><!-- "> -->
</span>
<br>
<hr>

<?php

    include('database.php');
    $selection = $bdd->query("SELECT id, expediteur_id, contenu FROM messages");
    $donnees=$selection->fetch();
    while ($donnees=$selection->fetch()){
        echo "<br><p class=\"sms\"><span class=\"envoyeur\">".$donnees["expediteur_id"]."</span> : ".$donnees["contenu"]."</p>";
    }
?>
<br>
<hr>
<br>
<?php
/*     else {
        header('Location:index.php');
    } */
?>

</div>

<span class="envoie">
    <input type="text" name="message" placeholder="Insérer votre message">
    <input type="submit" value="Send">
</span>
</form>
<br>
<script>
    
</script>