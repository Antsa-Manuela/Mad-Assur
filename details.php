<?php
// Partie PHP - Logique métier
include('database.php');
$id = isset($_GET['id']) ? (int) $_GET['id'] : 0;

$req = $bdd->prepare("SELECT * FROM assurances WHERE id_assurances = ?");
$req->execute([$id]);
$assurance = $req->fetch();

if (!$assurance) {
    echo "Assurance introuvable ou ID non valide.";
    exit;
}

// Calcul du score global
$moyenne = ($assurance['rse_fort'] + $assurance['capital_humain_fort'] + $assurance['experience_client_fort'] + $assurance['impact_local_fort']) / 4;

if ($moyenne >= 80) {
    $score = 'A';
    $score_label = 'Excellent';
} elseif ($moyenne >= 60) {
    $score = 'B';
    $score_label = 'Bon';
} elseif ($moyenne >= 40) {
    $score = 'C';
    $score_label = 'Moyen';
} elseif ($moyenne >= 20) {
    $score = 'D';
    $score_label = 'Faible';
} else {
    $score = 'E';
    $score_label = 'Médiocre';
}

$services = array_map('trim', explode(',', $assurance['services']));
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Détails - <?= htmlspecialchars($assurance['nom']) ?></title>
    <style>
        /* Variables CSS */
        :root {
            --primary: #374a37;
            --accent: #eb723d;
            --bg: #e4fff4;
            --white: #ffffff;
            --text-light: #f8f9fa;
            --text-dark: #333;
            --gray-light: #f0f0f0;
            
            /* Couleurs Nutri-Score */
            --score-a: #4CAF50;
            --score-b: #8BC34A;
            --score-c: #FFEB3B;
            --score-d: #FF9800;
            --score-e: #F44336;
        }

        /* Styles de base */
        body {
            font-family: 'Montserrat', sans-serif;
            margin: 0;
            padding: 0;
            color: var(--text-dark);
            line-height: 1.6;
        }

        h1 {
            color: var(--accent);
            width: 40%;
            margin: auto;
            border-bottom: 3px solid var(--accent);
        }
        .container {
            max-width: 900px;
            /* margin: 2rem auto; */
            background: var(--white);
            border-radius: 12px;
            /* box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05); */
        }

        /* En-tête */
        .header {
            text-align: center;
            margin-top: 2rem;
        }

        .header img {
            width: 150px;
            object-fit: contain;
            /* border-radius: 50%;
            border: 4px solid var(--bg);
            box-shadow: 0 0 0.2rem rgba(0,0,0,0.1); */
            margin-left: auto;
        }

        .company-name {
            /* font-size: 2rem; */
            margin: 1rem 0 0.5rem;
            color: var(--primary);
        }

        .description {
            text-align: justify;
            margin: 0 auto 3rem;
            max-width: 700px;
            color: #555;
            background-color: white;
            padding: 2rem;
            border-radius: 10px;
        }

        /* Services */
        .services-container {
            margin: 2rem 0;
            text-align: center;
        }

        .services-title {
            font-size: 1.3rem;
            margin-bottom: 1rem;
            color: var(--primary);
        }

        .services-flex {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 0.5rem;
        }

        .service-tag {
            background: var(--white);
            color: var(--primary);
            padding: 6px 14px;
            border-radius: 20px;
            font-size: 0.9rem;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .service-tag:hover {
            padding: 6px 17px;
        }

        /* Assur'Score */
        .score-section {
            margin: 3rem 0;
            text-align: center;
        }

        .score-title {
            font-size: 1.4rem;
            margin-bottom: 0.5rem;
            color: var(--primary);
        }

        .score-display {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 0.5rem;
            margin-bottom: 1rem;
        }

        .score-letter {
            width: 60px;
            height: 60px;
            border-radius: 8px;
            font-size: 1.8rem;
            font-weight: bold;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            opacity: 0.3;
            transition: all 0.3s ease;
        }

        .score-letter.active {
            opacity: 1;
            transform: scale(1.2);
            box-shadow: 0 0 0.5vw rgba(0, 0, 0, 0.1);
            border-radius: 5vw;
/*             opacity: 1;
            transform: scale(1.1);
            box-shadow: 0 4px 8px rgba(0,0,0,0.1); */
        }

        .score-label {
            font-size: 0.8rem;
            color: var(--primary);
            margin-top: 0.5rem;
        }

        /* Couleurs des scores */
        .score-a { background: var(--score-a); }
        .score-b { background: var(--score-b); }
        .score-c { background: var(--score-c); color: #000; }
        .score-d { background: var(--score-d); }
        .score-e { background: var(--score-e); }

        /* Diagrammes */
        .metrics-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1.5rem;
            margin: 3rem 0;
        }

        .metric-card {
            background: var(--bg);
/*             border-radius: 10px;
            padding: 1.5rem; */
/*             box-shadow: 0 2px 8px rgba(0,0,0,0.05); */
            transition: transform 0.3s ease;
        }

/*         .metric-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        } */

        .metric-title {
            font-size: 1.2rem;
            text-align: center;
            margin-bottom: 1rem;
            color: var(--primary);
        }

        .progress-bar {
            background: var(--white);
            height: 22px;
            border-radius: 11px;
            overflow: hidden;
            margin: 1rem 0;
            /* box-shadow: inset 0 1px 3px rgba(0,0,0,0.1); */
        }

        .progress-value {
            height: 100%;
            background: linear-gradient(90deg, #3498db, #5dade2);
            text-align: right;
            padding-right: 10px;
            color: white;
            font-weight: 600;
            line-height: 22px;
            font-size: 0.85rem;
            border-radius: 11px;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .metrics-grid {
                grid-template-columns: 1fr;
            }

            .header img {
                width: 120px;
                height: 120px;
            }

            .score-letter {
                width: 50px;
                height: 50px;
                font-size: 1.5rem;
            }
        }

        @media (max-width: 480px) {
            .container {
                padding: 1.5rem;
            }
            
            .company-name {
                /* font-size: 1.5rem; */
            }
        }
        /* Conteneur inline */
        .inline-container {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 2rem;
            /* margin-bottom: 2rem; */
            flex-wrap: wrap;
        }

        .company-logo {
            width: 150px;
            height: 150px;
            object-fit: contain;
            /* border-radius: 50%;
            border: 4px solid var(--bg);
            box-shadow: 0 0 0.2rem rgba(0,0,0,0.1); */
            flex-shrink: 0;
        }

        /* Score section - version inline */
        .score-section {
            text-align: center;
            flex-grow: 1;
            min-width: 300px;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .inline-container {
                flex-direction: column;
                gap: 1.5rem;
            }
            
            .company-logo {
                width: 120px;
                height: 120px;
            }
            
            .score-section {
                min-width: auto;
                width: 100%;
            }
        }
        .service-tag {
        position: relative;
    }    
    .price-tooltip {
        position: absolute;
        bottom: 100%;
        left: 50%;
        transform: translateX(-50%);
        background: var(--primary);
        color: white;
        padding: 5px 10px;
        border-radius: 4px;
        font-size: 0.8rem;
        white-space: nowrap;
        opacity: 0;
        visibility: hidden;
        transition: all 0.3s ease;
        z-index: 10;
        margin-bottom: 5px;
    }
    
    .price-tooltip:after {
        content: '';
        position: absolute;
        top: 100%;
        left: 50%;
        transform: translateX(-50%);
        border-width: 5px;
        border-style: solid;
        border-color: var(--primary) transparent transparent transparent;
    }
    
    .service-tag:hover .price-tooltip {
        opacity: 1;
        visibility: visible;
    }
    </style>
</head>
<body>
    <div class="container">
        <!-- En-tête -->
        <div class="header">
        <h1><?= htmlspecialchars($assurance['nom']) ?></h1>
        <div class="inline-container">
            <img src="<?= htmlspecialchars($assurance['image']) ?>" alt="<?= htmlspecialchars($assurance['nom']) ?>" class="company-logo">
            
            <div class="score-section">
                <h3 class="score-title">Assur'Score<sup>®</sup></h3>
                <div class="score-display">
                    <div class="score-letter score-a <?= ($score == 'A') ? 'active' : '' ?>">A</div>
                    <div class="score-letter score-b <?= ($score == 'B') ? 'active' : '' ?>">B</div>
                    <div class="score-letter score-c <?= ($score == 'C') ? 'active' : '' ?>">C</div>
                    <div class="score-letter score-d <?= ($score == 'D') ? 'active' : '' ?>">D</div>
                    <div class="score-letter score-e <?= ($score == 'E') ? 'active' : '' ?>">E</div>
                </div>
                <!-- <div class="score-label"><?= $score_label ?></div> -->
            </div>

            <div class="discuss-btn">
    <a href="homechat.php?id=ici">Discutons !</a>
  </div>
        </div>
            
            <!-- Services -->
            <div class="services-container">
                <!-- <h3 class="services-title">Services proposés</h3> -->
                <div class="services-flex">
                    <?php 
                    $services_prices = json_decode($assurance['services_prices'], true);
                    foreach ($services as $service): 
                        $price = isset($services_prices[$service]) ? $services_prices[$service] : 'N/A';
                    ?>
                        <div class="service-tag" onclick="searchService('<?= htmlspecialchars($service) ?>')">
                            <?= htmlspecialchars($service) ?>
                            <span class="price-tooltip"><?= number_format($price, 0, ',', ' ') ?> MGA</span>
                        </div>
                    <?php endforeach; ?>
                </div>
            </div>
            <p class="description"><?= nl2br(htmlspecialchars($assurance['description'])) ?></p>
        </div>



        <!-- Diagrammes -->
        <div class="metrics-grid">
            <div class="metric-card">
                <h3 class="metric-title">RSE</h3>
                <div class="progress-bar">
                    <div class="progress-value" style="width: <?= (int)$assurance['rse_fort'] ?>%"><?= (int)$assurance['rse_fort'] ?>%</div>
                </div>
            </div>
            
            <div class="metric-card">
                <h3 class="metric-title">Capital Humain</h3>
                <div class="progress-bar">
                    <div class="progress-value" style="width: <?= (int)$assurance['capital_humain_fort'] ?>%"><?= (int)$assurance['capital_humain_fort'] ?>%</div>
                </div>
            </div>
            
            <div class="metric-card">
                <h3 class="metric-title">Expérience Client</h3>
                <div class="progress-bar">
                    <div class="progress-value" style="width: <?= (int)$assurance['experience_client_fort'] ?>%"><?= (int)$assurance['experience_client_fort'] ?>%</div>
                </div>
            </div>
            
            <div class="metric-card">
                <h3 class="metric-title">Impact Local</h3>
                <div class="progress-bar">
                    <div class="progress-value" style="width: <?= (int)$assurance['impact_local_fort'] ?>%"><?= (int)$assurance['impact_local_fort'] ?>%</div>
                </div>
            </div>
        </div>
    </div>

    <script>
    function searchService(service) {
        window.location.href = 'recherche.php?service=' + encodeURIComponent(service);
    }
    </script>
    <script src="js/selection.js"></script>
</body>
</html>