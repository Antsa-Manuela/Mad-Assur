<?php
session_start();
if (!isset($_SESSION['id_users'])) {
    header('Location: index.php');
    exit();
}
include('database.php');

// Récupération dynamique des services
$liste_services = [];
$req = $bdd->query("SELECT services FROM assurances");
while ($row = $req->fetch(PDO::FETCH_ASSOC)) {
    $services = explode(',', $row['services']);
    foreach ($services as $srv) {
        $srv = trim($srv);
        if (!in_array($srv, $liste_services)) {
            $liste_services[] = $srv;
        }
    }
}
sort($liste_services);
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mad(Assur)</title>
    <link rel="stylesheet" href="css/header.css">
</head>
<body>
    <header class="main-header">
        <div class="header-container">
            <div class="logo-container">
                <a href="home.php?id=ici"><img src="img/logoin.png" alt="Logo Mad(Assur)" class="logo"></a>
            </div>

            <nav class="main-nav">
                <a href="#" class="nav-item">Nos services</a>
                <a href="#" class="nav-item">Partenaires</a>
                <a href="#footer-container" class="nav-item">A propos</a>
                <a href="#" class="nav-item">Nous rejoindre</a>
                <a href="#footer-container" class="nav-item">Contact</a>
            </nav>

            <div class="search-container">
                <form method="GET" action="home.php" class="search-form">
                    <input type="text" name="q" placeholder="Recherche par nom ou service..." 
                           value="<?= isset($_GET['q']) ? htmlspecialchars($_GET['q']) : '' ?>">

                    <select name="score">
                        <option value="">Assur'Score</option>
                        <option value="A" <?= (isset($_GET['score']) && $_GET['score'] == 'A') ? 'selected' : '' ?>>A (≥80%)</option>
                        <option value="B" <?= (isset($_GET['score']) && $_GET['score'] == 'B') ? 'selected' : '' ?>>B (70-79%)</option>
                        <option value="C" <?= (isset($_GET['score']) && $_GET['score'] == 'C') ? 'selected' : '' ?>>C (60-69%)</option>
                    </select>

                    <select name="service">
                        <option value="">Tous les services</option>
                        <?php foreach ($liste_services as $srv): ?>
                            <option value="<?= htmlspecialchars($srv) ?>" <?= (isset($_GET['service']) && $_GET['service'] == $srv) ? 'selected' : '' ?>>
                                <?= htmlspecialchars($srv) ?>
                            </option>
                        <?php endforeach; ?>
                    </select>

                    <a><button type="submit" class="search-btn">√</button></a>
                    <a href="home.php" class="reset-btn" style="text-decoration: none;">X</a>
                </form>
            </div>

            <a href="logout.php?id=Deconnexion" class="logout-btn">
                Déconnexion
            </a>
        </div>
    </header>
</body>
</html>