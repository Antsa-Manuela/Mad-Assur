<?php 
include('header.php');
include('database.php');

if (!isset($_SESSION['comparaison'])) {
    $_SESSION['comparaison'] = [];
}

if (isset($_GET['compare']) && is_numeric($_GET['compare'])) {
    $idCompare = (int)$_GET['compare'];
    if (!in_array($idCompare, $_SESSION['comparaison']) && count($_SESSION['comparaison']) < 3) {
        $_SESSION['comparaison'][] = $idCompare;
    }
    if (count($_SESSION['comparaison']) >= 2) {
        header('Location: home.php?page=comparaison');
        exit();
    } else {
        header('Location: home.php');
        exit();
    }
}

if (isset($_GET['reset'])) {
    $_SESSION['comparaison'] = [];
    header('Location: home.php');
    exit();
}

// Recherche et filtres
$assurances = [];
$where = [];
$params = [];

if (isset($_GET['q']) && !empty(trim($_GET['q']))) {
    $q = '%' . trim($_GET['q']) . '%';
    $where[] = "(nom LIKE ? OR services LIKE ?)";
    $params[] = $q;
    $params[] = $q;
}

if (isset($_GET['score']) && !empty($_GET['score'])) {
    $score = $_GET['score'];
    if ($score === 'A') {
        $where[] = "( (rse_fort + capital_humain_fort + experience_client_fort + impact_local_fort)/4 ) >= 80";
    } elseif ($score === 'B') {
        $where[] = "( (rse_fort + capital_humain_fort + experience_client_fort + impact_local_fort)/4 ) BETWEEN 70 AND 79";
    } elseif ($score === 'C') {
        $where[] = "( (rse_fort + capital_humain_fort + experience_client_fort + impact_local_fort)/4 ) BETWEEN 60 AND 69";
    }
}

if (isset($_GET['rse']) && is_numeric($_GET['rse'])) {
    $where[] = "rse_fort >= ?";
    $params[] = (int)$_GET['rse'];
}
if (isset($_GET['capital']) && is_numeric($_GET['capital'])) {
    $where[] = "capital_humain_fort >= ?";
    $params[] = (int)$_GET['capital'];
}
if (isset($_GET['experience']) && is_numeric($_GET['experience'])) {
    $where[] = "experience_client_fort >= ?";
    $params[] = (int)$_GET['experience'];
}
if (isset($_GET['impact']) && is_numeric($_GET['impact'])) {
    $where[] = "impact_local_fort >= ?";
    $params[] = (int)$_GET['impact'];
}

$sql = "SELECT * FROM assurances";
if (!empty($where)) {
    $sql .= " WHERE " . implode(" AND ", $where);
}
$sql .= " ORDER BY nom ASC";

$stmt = $bdd->prepare($sql);
$stmt->execute($params);
$assurances = $stmt->fetchAll();
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Mad'Assur</title>
    <link rel="stylesheet" href="css/contain.css">
    <link rel="stylesheet" href="css/comparaison.css">
    <style>
        /* Style pour la zone de filtres */
        .filtre-container {
            padding: 20px;
/*             border-bottom: 1px solid #ccc; */
        }
        .filtre-container form {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            align-items: center;
            justify-content: center;
        }
        .filtre-container input[type="text"],
        .filtre-container input[type="number"],
        .filtre-container select {
            padding: 8px 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 14px;
        }
        .btn-action {
            padding: 8px 15px;
            background-color: #2e8b57;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s;
            font-size: 14px;
        }
        .btn-action:hover {
            background-color: #246c45;
        }
        .reset {
            background-color: #c0392b;
        }
        .reset:hover {
            background-color: #a5281f;
        }
        /* Animation fade-in */
        #contenu {
            animation: fadeIn 0.8s ease;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }
        /* Message résultats */
        .result-count {
            text-align: center;
            margin-top: 10px;
            font-size: 16px;
            color: #333;
            margin-top: 3vw;
        }
    </style>
    <script src="js/selection.js" defer></script>
</head>
<body>

<!-- Barre filtres -->
<!-- <div class="filtre-container">
    <form method="GET" action="home.php">
        <input type="text" name="q" placeholder="Recherche par nom ou service..." value="<?= isset($_GET['q']) ? htmlspecialchars($_GET['q']) : '' ?>">
        <select name="score">
            <option value="">Score Global</option>
            <option value="A" <?= (isset($_GET['score']) && $_GET['score'] == 'A') ? 'selected' : '' ?>>A (≥80%)</option>
            <option value="B" <?= (isset($_GET['score']) && $_GET['score'] == 'B') ? 'selected' : '' ?>>B (70-79%)</option>
            <option value="C" <?= (isset($_GET['score']) && $_GET['score'] == 'C') ? 'selected' : '' ?>>C (60-69%)</option>
        </select>
        <input type="number" name="rse" placeholder="RSE min %" min="0" max="100" value="<?= isset($_GET['rse']) ? htmlspecialchars($_GET['rse']) : '' ?>">
        <input type="number" name="capital" placeholder="Capital Humain min %" min="0" max="100" value="<?= isset($_GET['capital']) ? htmlspecialchars($_GET['capital']) : '' ?>">
        <input type="number" name="experience" placeholder="Expérience Client min %" min="0" max="100" value="<?= isset($_GET['experience']) ? htmlspecialchars($_GET['experience']) : '' ?>">
        <input type="number" name="impact" placeholder="Impact Local min %" min="0" max="100" value="<?= isset($_GET['impact']) ? htmlspecialchars($_GET['impact']) : '' ?>">
        <button type="submit" class="btn-action">Appliquer</button>
        <a href="home.php" class="btn-action reset">Réinitialiser</a>
    </form>
</div> -->

<!-- Résultats trouvés -->
<?php if (!empty($assurances)): ?>
    <div class="result-count"><?= count($assurances) ?> assurance(s) trouvée(s)</div>
<?php else: ?>
    <div class="result-count">Aucune assurance trouvée</div>
<?php endif; ?>

<!-- Zone principale -->
<?php
if (isset($_GET['page']) && $_GET['page'] === 'comparaison') {
    include('comparaison.php');
} else {
    include('contain.php');
}
?>

<?php include('footer.php'); ?>

</body>
</html>
