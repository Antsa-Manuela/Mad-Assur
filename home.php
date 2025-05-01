<?php
session_start();
include('header.php');
include('database.php');

// Initialiser la session comparaison
if (!isset($_SESSION['comparaison'])) {
    $_SESSION['comparaison'] = [];
}

// Message de notification
if (isset($_SESSION['notification'])) {
    $notification = $_SESSION['notification'];
    unset($_SESSION['notification']);
}

// Ajouter/retirer une assurance à comparer (GESTION AJAX)
if (isset($_GET['compare']) && is_numeric($_GET['compare'])) {
    $idCompare = (int)$_GET['compare'];
    $response = ['success' => false, 'message' => '', 'count' => count($_SESSION['comparaison'])];
    
    if (in_array($idCompare, $_SESSION['comparaison'])) {
        $_SESSION['comparaison'] = array_diff($_SESSION['comparaison'], [$idCompare]);
        $response['message'] = "Assurance retirée de la comparaison";
        $response['success'] = true;
    } else {
        if (count($_SESSION['comparaison']) < 3) {
            $_SESSION['comparaison'][] = $idCompare;
            $response['message'] = "Assurance ajoutée à la comparaison";
            $response['success'] = true;
        } else {
            $response['message'] = "Maximum 3 assurances comparables";
        }
    }
    
    header('Content-Type: application/json');
    echo json_encode($response);
    exit();
}

// Réinitialiser comparaison
if (isset($_GET['reset'])) {
    $_SESSION['comparaison'] = [];
    $_SESSION['notification'] = "Comparaison réinitialisée";
    
    if (isset($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) === 'xmlhttprequest') {
        $response = ['success' => true, 'message' => "Comparaison réinitialisée", 'count' => 0, 'redirect' => 'home.php'];
        header('Content-Type: application/json');
        echo json_encode($response);
    } else {
        header("Location: home.php");
    }
    exit();
}

// Récupérer tous les services distincts
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

// Construction de la requête avec filtres
$assurances = [];
$where = [];
$params = [];

if (isset($_GET['q']) && trim($_GET['q']) !== '') {
    $q = '%' . trim($_GET['q']) . '%';
    $where[] = "(nom LIKE ? OR services LIKE ?)";
    $params[] = $q;
    $params[] = $q;
}

if (!empty($_GET['score'])) {
    $score = $_GET['score'];
    if ($score == 'A') $where[] = "( (rse_fort + capital_humain_fort + experience_client_fort + impact_local_fort)/4 ) >= 80";
    elseif ($score == 'B') $where[] = "( (rse_fort + capital_humain_fort + experience_client_fort + impact_local_fort)/4 ) BETWEEN 70 AND 79";
    elseif ($score == 'C') $where[] = "( (rse_fort + capital_humain_fort + experience_client_fort + impact_local_fort)/4 ) BETWEEN 60 AND 69";
}

$filters = ['rse', 'capital', 'experience', 'impact'];
foreach ($filters as $f) {
    if (!empty($_GET[$f]) && is_numeric($_GET[$f])) {
        $where[] = "{$f}_fort >= ?";
        $params[] = $_GET[$f];
    }
}

if (!empty($_GET['service']) && in_array($_GET['service'], $liste_services)) {
    $where[] = "services LIKE ?";
    $params[] = '%' . $_GET['service'] . '%';
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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mad'Assur</title>
    <link rel="stylesheet" href="css/contain.css">
    <link rel="stylesheet" href="css/comparaison.css">
    <script src="js/selection.js" defer></script>
    <style>
        .notification {
            position: fixed;
            top: 20px;
            left: 50%;
            transform: translateX(-50%);
            background-color: #4CAF50;
            color: white;
            padding: 15px 20px;
            border-radius: 5px;
            z-index: 1000;
            opacity: 1;
            transition: opacity 0.5s ease-in-out;
        }
        .notification.error {
            background-color: #f44336;
        }
        .result-count {
            padding: 15px;
            text-align: center;
            font-style: italic;
            color: #777;
        }
        .reset-link {
            background: #eb723d;
            border: none;
            color: #fff;
            padding: 10px;
            cursor: pointer;
            font-size: 1em;
            text-decoration: underline;
            margin-left: 15px;
            text-decoration: none;
        }
        .reset-link:hover {
            color: #d32f2f;
        }
    </style>
</head>
<body data-comparaison="<?= implode(',', $_SESSION['comparaison'] ?? []) ?>">

<?php if (!empty($notification)): ?>
    <div class="notification <?= strpos($notification, 'Maximum') !== false || strpos($notification, 'retirée') !== false ? 'error' : 'success' ?>"><?= htmlspecialchars($notification) ?></div>
    <script>
        setTimeout(() => {
            const notif = document.querySelector('.notification');
            if (notif) {
                notif.style.opacity = '0';
                setTimeout(() => notif.remove(), 500);
            }
        }, 2000);
    </script>
<?php endif; ?>

<?php if (!empty($assurances)): ?>
    <div class="result-count"><?= count($assurances) ?> assurance(s) trouvée(s)</div>
<?php else: ?>
    <div class="result-count">Aucune assurance trouvée</div>
<?php endif; ?>

<main class="main-content">
    <?php
    if (isset($_GET['page']) && $_GET['page'] === 'comparaison') {
        include('comparaison.php');
    } else {
        include('contain.php');
    }
    ?>
</main>

<?php include('footer.php'); ?>
</body>
</html>