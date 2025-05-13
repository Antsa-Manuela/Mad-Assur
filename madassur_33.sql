-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 05 mai 2025 à 14:17
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `madassur_33`
--

-- --------------------------------------------------------

--
-- Structure de la table `assurances`
--

CREATE TABLE `assurances` (
  `id_assurances` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `mdp` varchar(20) NOT NULL,
  `image` varchar(50) NOT NULL,
  `rse_fort` int(11) DEFAULT 0,
  `rse_faible` int(11) DEFAULT 0,
  `capital_humain_fort` int(11) DEFAULT 0,
  `capital_humain_faible` int(11) DEFAULT 0,
  `experience_client_fort` int(11) DEFAULT 0,
  `experience_client_faible` int(11) DEFAULT 0,
  `impact_local_fort` int(11) DEFAULT 0,
  `impact_local_faible` int(11) DEFAULT 0,
  `description` longtext DEFAULT NULL,
  `services` text DEFAULT NULL,
  `services_prices` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `assurances`
--

INSERT INTO `assurances` (`id_assurances`, `nom`, `email`, `mdp`, `image`, `rse_fort`, `rse_faible`, `capital_humain_fort`, `capital_humain_faible`, `experience_client_fort`, `experience_client_faible`, `impact_local_fort`, `impact_local_faible`, `description`, `services`, `services_prices`) VALUES
(2, 'Assurance Ny Havana', 'havana@email.com', 'azerty', 'img/Havana.png', 85, 15, 70, 30, 60, 40, 50, 50, '\r\nAssurance Ny Havana est un acteur majeur du secteur assurantiel à Madagascar, avec une histoire riche et un engagement profond envers le développement économique et social du pays. Fondée il y a plus de trois décennies, cette compagnie a su évoluer avec les besoins changeants de la population malgache tout en maintenant ses valeurs fondamentales de proximité, de solidarité et d\'innovation.\r\n\r\nL\'offre d\'assurance santé de Ny Havana est particulièrement remarquable. Avec des formules adaptées à tous les budgets, elle couvre les consultations médicales, les analyses biologiques, les médicaments sur ordonnance, les hospitalisations et même certaines interventions chirurgicales. Les polices incluent également des services de prévention comme des bilans de santé annuels gratuits et des campagnes de vaccination. Pour les familles rurales, Ny Havana a développé un réseau de cliniques partenaires dans les zones reculées, permettant un accès aux soins de base même loin des centres urbains.\r\n\r\nEn matière d\'assurance vie, la compagnie propose des produits innovants combinant épargne à long terme et protection des proches. Les contrats sont flexibles, permettant d\'ajuster les cotisations en fonction des capacités financières de l\'assuré. Un aspect unique est l\'option \"solidarité communautaire\" qui permet de mutualiser une partie des bénéfices entre les membres d\'une même communauté.\r\n\r\nLes assurances habitation couvrent non seulement les dommages matériels (incendie, vol, dégâts des eaux), mais aussi la responsabilité civile locative. Un service d\'assistance 24h/24 est disponible pour les urgences domestiques. Pour les régions exposées aux cyclones, Ny Havana propose une couverture catastrophes naturelles avec un système de pré-alerte et d\'accompagnement post-sinistre.\r\n\r\nLa politique RSE de Ny Havana est intégrée à son modèle économique. La compagnie consacre 5% de ses bénéfices à des projets communautaires : construction d\'écoles, accès à l\'eau potable, formation professionnelle pour les jeunes. Elle a également lancé un programme de micro-assurance pour les agriculteurs, leur permettant de se protéger contre les aléas climatiques.\r\n\r\nSur le plan du capital humain, Ny Havana investit massivement dans la formation de ses 1200 employés. Le centre de formation interne dispense des cours techniques mais aussi sur le service client et l\'intelligence émotionnelle. La compagnie pratique une politique active de promotion interne et compte 45% de femmes dans ses postes de direction.\r\n\r\nL\'expérience client est au cœur des préoccupations. Les assurés bénéficient d\'un conseiller dédié, d\'une application mobile complète pour gérer leurs contrats, et d\'un processus de remboursement simplifié prenant moins de 72h. Les agences sont conçues pour être accueillantes, avec des espaces enfants et des interprètes disponibles pour les locuteurs des langues régionales.\r\n\r\nNy Havana a également développé des partenariats stratégiques avec des institutions financières, des hôpitaux et des organisations communautaires. Ces alliances permettent d\'élargir l\'accès à l\'assurance tout en renforçant l\'économie locale. Par exemple, le programme \"Mpiara-miasa\" (\"Travailler ensemble\" en malgache) soutient les petites entreprises en leur proposant des packages assurance-crédit adaptés.\r\n\r\nFace aux défis du changement climatique, Ny Havana a mis en place une cellule dédiée aux risques environnementaux. Elle propose des audits gratuits pour aider les entreprises à réduire leur vulnérabilité et organise des ateliers de sensibilisation dans les écoles. La compagnie compense également son empreinte carbone en finançant des projets de reforestation.\r\n\r\nLa gouvernance de Ny Havana est exemplaire, avec un conseil d\'administration paritaire et un comité éthique indépendant. La transparence est de mise, avec la publication trimestrielle de rapports détaillés sur les performances financières et sociales. Cette approche a valu à la compagnie plusieurs distinctions internationales en matière de responsabilité sociale.\r\n\r\nEn termes d\'innovation, Ny Havana expérimente actuellement des solutions blockchain pour sécuriser les contrats et accélérer les indemnisations. Un projet pilote de \"smart contracts\" pour les assurances agricoles est en cours dans la région du Vakinankaratra. La compagnie investit également dans l\'intelligence artificielle pour améliorer la détection des fraudes et le service client.\r\n\r\nPour les années à venir, Ny Havana prévoit de renforcer sa présence dans les zones rurales grâce à un réseau d\'agents mobiles équipés de tablettes. Un nouveau produit d\'assurance santé familiale avec options modulaires est en développement, ainsi qu\'un programme spécifique pour les travailleurs informels qui représentent près de 80% de l\'économie malgache.\r\n\r\nLa force de Ny Havana réside dans sa capacité à allier expertise technique et profonde connaissance du terrain. Ses produits sont conçus en collaboration avec les communautés qu\'ils servent, garantissant ainsi leur pertinence et leur accessibilité. Cette approche participative, combinée à une gestion rigoureuse, fait de Ny Havana bien plus qu\'une simple compagnie d\'assurance : un véritable partenaire du développement malgache.\r\n', 'Santé,Vie,Habitation,Voyage', '{\"Santé\":\"45000\",\"Vie\":\"28000\",\"Habitation\":\"22000\",\"Voyage\":\"38000\"}'),
(3, 'Allianz Madagascar', 'allianz@email.com', 'azerty', 'img/Allianz.png', 90, 10, 80, 20, 75, 25, 70, 30, '\r\nAllianz Madagascar, filiale du géant mondial de l\'assurance, apporte à Madagascar son expertise internationale tout en s\'adaptant parfaitement aux spécificités locales. Présente dans le pays depuis 2008, la compagnie s\'est rapidement imposée comme un leader du secteur grâce à ses produits innovants et ses standards de qualité élevés.\r\n\r\nLe portefeuille d\'Allianz Madagascar couvre tous les besoins en assurance des particuliers et des entreprises. L\'assurance santé propose plusieurs niveaux de couverture, depuis les formules basiques jusqu\'aux packages premium incluant médecine alternative et évacuation sanitaire à l\'étranger. Un réseau de plus de 200 établissements de santé partenaires garantit des soins de qualité dans tout le pays.\r\n\r\nL\'assurance automobile d\'Allianz se distingue par sa couverture complète et ses services additionnels. En plus des garanties standards (dommages collision, vol, incendie), les clients bénéficient d\'une assistance routière 24h/24, d\'un service de remplacement véhicule, et même d\'une application de conduite sécurisée qui permet de réduire les primes grâce à une éco-conduite.\r\n\r\nPour les entreprises, Allianz propose des solutions sur mesure couvrant les risques professionnels, la protection des biens, la responsabilité civile et même la cyber-assurance. Les grandes entreprises bénéficient d\'un risk manager dédié qui les accompagne dans l\'identification et la gestion de leurs risques spécifiques.\r\n\r\nLa politique RSE d\'Allianz Madagascar s\'articule autour de trois axes : l\'éducation financière, la protection de l\'environnement et l\'inclusion sociale. La compagnie organise régulièrement des \"Villages Allianz\", événements itinérants qui proposent des consultations médicales gratuites, des ateliers sur la gestion des risques et des formations à l\'entrepreneuriat.\r\n\r\nLe capital humain est une priorité pour Allianz. La compagnie a mis en place un programme de développement des talents qui permet à ses employés de suivre des formations certifiantes, y compris à l\'étranger. Le programme \"Allianz Academy\" offre des cours en ligne sur plus de 100 sujets techniques et managériaux.\r\n\r\nL\'expérience client chez Allianz est hautement digitalisée. Le portail client permet de souscrire des contrats, déclarer des sinistres, suivre des indemnisations et chatter avec un conseiller en temps réel. Une innovation récente est le \"QuickClaim\" qui permet d\'obtenir un remboursement express pour les petits sinistres via une simple photo envoyée depuis son smartphone.\r\n\r\nAllianz Madagascar investit également dans la recherche et développement. Le centre d\'innovation d\'Antananarivo travaille sur des solutions adaptées au contexte local, comme des micro-assurances paramétriques pour les agriculteurs ou des produits d\'assurance indexés sur les conditions météorologiques.\r\n\r\nEn partenariat avec des universités malgaches, Allianz a créé des chaires d\'enseignement spécialisées en actuariat et gestion des risques. Ces programmes forment la relève des professionnels de l\'assurance tout en contribuant à la recherche appliquée sur les risques spécifiques à Madagascar.\r\n\r\nFace aux défis climatiques, Allianz Madagascar a développé une expertise reconnue en gestion des catastrophes naturelles. La compagnie participe activement aux systèmes d\'alerte précoce et a mis en place des protocoles d\'indemnisation accélérée pour les zones sinistrées.\r\n\r\nLa gouvernance d\'Allianz Madagascar suit les standards les plus stricts du groupe, avec des audits réguliers et des processus de contrôle rigoureux. Cette rigueur, combinée à une approche résolument tournée vers l\'innovation et le service client, explique le succès durable de la compagnie sur le marché malgache.\r\n', 'Santé,Auto,Vie,Responsabilité Civile,Habitation,Retraite,Éducation,Entreprise', '{\"Santé\":\"50000\",\"Auto\":\"32000\",\"Vie\":\"35000\",\"Responsabilité Civile\":\"18000\",\"Habitation\":\"25000\",\"Retraite\":\"40000\",\"Éducation\":\"35000\",\"Entreprise\":\"55000\"}'),
(4, 'Sanlam Madagascar', 'sanlam@email.com', 'azerty', 'img/Sanlam.png', 78, 22, 65, 35, 70, 30, 60, 40, ' Sanlam Madagascar est une filiale du groupe Sanlam, géant sud-africain de la finance et de l’assurance présent sur plusieurs continents. À Madagascar, Sanlam s’est affirmée comme un acteur de référence, notamment dans les domaines de l’assurance vie, de la santé, de l’éducation et de la protection sociale. Sa stratégie repose sur trois piliers fondamentaux : l’accessibilité, la proximité et la transformation numérique.\r\n\r\nL’assurance vie proposée par Sanlam Madagascar permet aux particuliers de constituer une épargne tout en assurant la sécurité financière de leur famille en cas de décès. Les contrats incluent des garanties pour les maladies graves, l’invalidité et les décès accidentels, avec une flexibilité dans le choix des bénéficiaires et la durée des contrats. L’assurance santé complète cette offre avec une couverture allant des soins de base à l’hospitalisation lourde, incluant le remboursement des frais médicaux, la maternité et les urgences.\r\n\r\nSanlam se démarque aussi par son engagement envers l’éducation. Des produits spécifiques couvrent les frais de scolarité en cas d’imprévus (décès d’un parent, invalidité, etc.), garantissant ainsi la continuité des études pour les enfants assurés. Ces offres sont très appréciées dans les familles malgaches soucieuses de l’avenir de leurs enfants.\r\n\r\nLes assurances automobile et habitation proposées par Sanlam incluent une protection contre les sinistres, les catastrophes naturelles, les accidents et le vol. Elles sont modulables selon le profil du client, qu’il s’agisse d’un particulier ou d’un professionnel.\r\n\r\nSur le plan de la RSE, Sanlam Madagascar s’investit dans des actions de proximité : campagnes de dépistage, sensibilisation à la santé mentale, accompagnement des familles rurales, et soutien à des associations communautaires. Elle œuvre pour l’inclusion financière des populations exclues du système bancaire traditionnel grâce à des produits simples et peu coûteux.\r\n\r\nCôté capital humain, Sanlam développe un climat de travail collaboratif, favorise le leadership féminin, et offre des opportunités d’évolution de carrière à ses collaborateurs. Elle applique une politique stricte contre les discriminations et favorise les recrutements locaux. Ses centres de formation internes garantissent un haut niveau de compétence technique et comportementale.\r\n\r\nL’expérience client est placée au cœur de la stratégie de Sanlam, avec des services de conseil personnalisé, une gestion fluide des contrats et un espace client numérique convivial. La compagnie mise sur la digitalisation des parcours client pour garantir rapidité, transparence et autonomie.\r\n\r\nEnfin, son impact local se manifeste par le maillage de ses agences sur l’ensemble du territoire, la collaboration avec des réseaux de santé partenaires, et le soutien à des initiatives citoyennes dans les domaines de l’environnement, de l’alphabétisation et de l’entrepreneuriat.\r\n\r\nSanlam Madagascar se distingue ainsi par sa capacité à proposer des solutions modernes et responsables, qui répondent aux enjeux sociaux et économiques du pays tout en respectant les plus hauts standards internationaux. ', 'Vie,Santé,Scolaire,Décès/Invalidité,Automobile,Habitation', '{\"Vie\":\"33000\",\"Santé\":\"48000\",\"Scolaire\":\"15000\",\"Décès/Invalidité\":\"22000\",\"Automobile\":\"28000\",\"Habitation\":\"23000\"}'),
(5, 'Ascoma Madagascar', 'ascoma@email.com', 'azerty', 'img/ASCOMA.png', 82, 18, 77, 23, 68, 32, 58, 42, ' Ascoma Madagascar est une filiale du groupe Ascoma, acteur reconnu du courtage en assurance à l’échelle africaine. Présente dans plus de 20 pays du continent, Ascoma s’appuie sur une expertise multisectorielle et une solide connaissance des marchés locaux pour apporter à ses clients des solutions de couverture adaptées et personnalisées. À Madagascar, elle s’impose comme un interlocuteur privilégié pour les entreprises, les institutions publiques et les particuliers à la recherche d’un accompagnement de qualité dans la gestion de leurs risques.\r\n\r\nSpécialisée dans le conseil et la négociation de contrats d’assurance, Ascoma propose des solutions sur mesure en matière de santé, de responsabilité civile, d’assurance professionnelle, de flotte automobile, d’habitation, et de patrimoine. Elle agit comme intermédiaire entre le client et les compagnies d’assurance, veillant à ce que les conditions contractuelles soient toujours à l’avantage de l’assuré.\r\n\r\nDans le domaine de la santé, Ascoma élabore des contrats collectifs pour les entreprises et des produits individuels pour les particuliers. Elle accompagne également les employeurs dans la mise en place de systèmes de couverture santé pour leurs salariés, y compris dans les zones rurales ou enclavées.\r\n\r\nSon expertise en assurance professionnelle couvre notamment les risques liés aux chantiers, à la responsabilité des dirigeants, aux pertes d’exploitation et aux garanties financières. Pour les particuliers, elle propose des assurances habitation incluant les garanties incendie, vol, dégâts des eaux et catastrophes naturelles, ainsi qu’une assurance auto avec assistance et prise en charge rapide des sinistres.\r\n\r\nLa RSE occupe une place importante chez Ascoma Madagascar. L’entreprise s’engage dans des programmes de sensibilisation aux risques climatiques, de soutien aux femmes entrepreneures, et de développement de l’assurance inclusive. Elle promeut également l’éducation financière à travers des partenariats avec des institutions locales et l’organisation d’ateliers dans les écoles et universités.\r\n\r\nLe capital humain est au centre de la stratégie d’Ascoma. Les équipes bénéficient d’un encadrement permanent, de plans de formation certifiants, et d’un environnement de travail moderne et stimulant. L’accent est mis sur la qualité du service, l’intégrité professionnelle et la réactivité.\r\n\r\nSur le plan de l’expérience client, Ascoma se positionne comme un conseiller de confiance. Ses courtiers accompagnent les clients de A à Z, depuis la définition des besoins jusqu’à la gestion des sinistres, avec un souci constant de pédagogie et d’optimisation des coûts.\r\n\r\nEnfin, l’impact local d’Ascoma se reflète dans sa collaboration avec les collectivités, les opérateurs économiques et les ONG pour proposer des couvertures adaptées aux réalités de terrain. Grâce à sa flexibilité et son engagement, Ascoma contribue activement à la structuration du secteur de l’assurance à Madagascar.\r\n\r\n', 'Auto,Professionnelle,Habitation,Responsabilité Civile,Santé,Courtage', '{\"Auto\":\"30000\",\"Professionnelle\":\"45000\",\"Habitation\":\"24000\",\"Responsabilité Civile\":\"20000\",\"Santé\":\"46000\",\"Courtage\":\"35000\"}'),
(6, 'Saham Assurance', 'saham@email.com', 'azerty', 'img/SAHAM.png', 75, 25, 70, 30, 65, 35, 55, 45, 'Saham Assurance est une compagnie d\'assurance opérant à Madagascar, connue pour son engagement envers l\'innovation, la qualité de service et l\'accessibilité. Elle s\'efforce d\'apporter une couverture d\'assurance adaptée aux besoins évolutifs des particuliers et des entreprises locales. Parmi ses offres, on trouve des produits d\'assurance santé, vie, voyage, auto et scolaire, notamment à travers des services en ligne accessibles, même dans les zones éloignées.\r\n\r\nSa politique de Responsabilité Sociétale des Entreprises (RSE) est axée sur le soutien aux communautés vulnérables, la digitalisation des services pour réduire les inégalités d\'accès, et la promotion de l\'éducation via des partenariats. Saham investit également dans la formation de ses agents pour améliorer la qualité de la relation client et encourager la transparence.\r\n\r\nAvec un capital humain fort et une expérience client marquée par la personnalisation des services, Saham Assurance entend renforcer sa position de leader innovant du secteur. En collaborant avec des écoles et des ONG, elle propose aussi des produits d\'assurance scolaire destinés aux familles à faibles revenus.\r\n\r\nL\'entreprise prévoit également le développement de produits micro-assurance pour les zones rurales, tout en adoptant des outils numériques pour simplifier la souscription et le remboursement. Elle participe à des projets de développement durable en finançant des initiatives vertes, comme l\'énergie renouvelable et la reforestation, et intègre des critères sociaux dans sa politique d’investissement.\r\n\r\nEn termes de services, Saham propose également une hotline santé 24h/24, des consultations médicales à distance, et des applications mobiles permettant la gestion des contrats et des sinistres. Elle travaille avec un réseau de partenaires médicaux pour offrir des services de soins directs et de remboursement simplifiés.\r\n\r\nÀ travers toutes ces initiatives, Saham Assurance se positionne comme un acteur responsable, innovant et résolument tourné vers l’avenir, alliant performance financière et impact social positif dans le paysage assurantiel malgache.\r\n', 'Santé, Voyage, Vie, Auto, Assurance scolaire en ligne', '{\"Santé\":\"42000\",\"Voyage\":\"35000\",\"Vie\":\"30000\",\"Auto\":\"29000\",\"Assurance scolaire en ligne\":\"12000\"}'),
(7, 'Assurance MAMA', 'mama@email.com', 'azerty', 'img/MAMA.png', 80, 20, 72, 28, 60, 40, 50, 50, 'Assurance MAMA est l’un des piliers historiques du secteur de l’assurance à Madagascar, particulièrement reconnu pour son ancrage local, son accessibilité et son impact social. Depuis sa création, l’entreprise s’est donné pour mission de proposer une couverture d’assurance adaptée aux besoins spécifiques des familles malgaches, notamment celles issues des milieux ruraux ou défavorisés.\r\n\r\nParmi les services proposés par MAMA, on retrouve l’assurance santé, vie et agricole, qui couvrent respectivement les frais médicaux, les aléas liés à la vie (comme le décès ou l’invalidité), et les pertes liées aux activités agricoles — secteur vital dans l’économie malgache. Cette orientation stratégique vers les besoins de base permet à MAMA d’assurer une population souvent exclue des offres traditionnelles des grandes compagnies d’assurance.\r\n\r\nL’entreprise développe des partenariats solides avec des centres de santé locaux et des associations communautaires pour renforcer la proximité avec ses assurés. Grâce à son réseau étendu d’agents, elle couvre une grande partie du territoire national et parvient à maintenir un lien direct avec les communautés desservies.\r\n\r\nDans le cadre de sa démarche RSE, MAMA soutient des projets d’éducation, d’autonomisation des femmes et de reforestation. Elle organise également des campagnes de sensibilisation à la prévention des maladies, à la sécurité routière et à la gestion des risques en milieu rural.\r\n\r\nL’entreprise investit également dans la formation continue de ses agents et l’amélioration de l’expérience client, notamment à travers la digitalisation progressive de ses services. Une application mobile est en cours de développement pour faciliter la souscription et la gestion des contrats.\r\n\r\nAssurance MAMA reste fidèle à ses valeurs fondatrices : solidarité, simplicité, proximité. Elle entend continuer à évoluer dans un esprit d’innovation inclusive, avec pour objectif de rendre l’assurance accessible, compréhensible et utile à tous les Malgaches.', 'Santé, Agricole, Vie', '{\"Santé\":\"38000\",\"Agricole\":\"25000\",\"Vie\":\"27000\"}'),
(8, 'BNI Madagascar', 'bni@email.com', 'azerty', 'img/BNI.png', 88, 12, 85, 15, 80, 20, 78, 22, 'BNI Madagascar, branche assurantielle de la Banque Nationale d’Investissement, est un acteur de référence dans le secteur bancaire et assurantiel malgache. Alliant expertise financière et solutions d’assurance innovantes, BNI développe une offre cohérente autour des besoins concrets de sa clientèle. L’assurance santé \"Tomady\" offre une couverture élargie à des tarifs préférentiels, avec un accès facilité à un réseau de cliniques partenaires dans toutes les grandes villes. L’assurance \"Mahasoa\", dédiée à la prise en charge des accidents, couvre les dépenses imprévues liées aux blessures, à l’hospitalisation et à la rééducation, même pour les auto-entrepreneurs et les travailleurs informels. Le produit \"Miarina\", quant à lui, s’adresse aux familles souhaitant une couverture complète en cas de décès ou d’invalidité, avec un capital versé rapidement, des frais d’obsèques couverts, et un accompagnement administratif assuré. BNI mise aussi sur la digitalisation : les clients peuvent souscrire, modifier et résilier leurs contrats via leur espace en ligne, et consulter leur historique de remboursement. L’entreprise attache une importance particulière à la confidentialité des données et à la cybersécurité. Elle collabore régulièrement avec des écoles et universités pour promouvoir la culture assurantielle. Grâce à sa rigueur et sa vision de long terme, BNI Madagascar attire aussi les entreprises avec ses offres sur-mesure en assurance collective et prévoyance.', 'Santé (Tomady), Hospitalisation, Accident (Mahasoa), Décès/Invalidité (Miarina)', '{\"Santé (Tomady)\":\"40000\",\"Hospitalisation\":\"35000\",\"Accident (Mahasoa)\":\"30000\",\"Décès/Invalidité (Miarina)\":\"32000\"}'),
(10, 'Assurance AFAFI', 'afafi@email.com', 'azerty', 'img/AFAFI.gif', 70, 30, 65, 35, 62, 38, 48, 52, 'AFAFI Mutuelle est une institution d\\\'assurance malgache à forte vocation sociale, spécialisée dans la protection des populations rurales et des travailleurs du secteur informel. Fondée sur des principes mutualistes, elle s\\\'est imposée comme un acteur clé de l\\\'inclusion assurantielle à Madagascar grâce à des produits accessibles et une approche communautaire.\r\n\r\nSon offre phare, l\\\'assurance santé, couvre les consultations médicales, les hospitalisations, les médicaments essentiels et même certains actes chirurgicaux, avec un réseau étendu de prestataires de santé conventionnés dans tout le pays. AFAFI se distingue par son système de cotisations adaptables aux revenus irréguliers des agriculteurs, artisans et petits commerçants.\r\n\r\nLa mutuelle propose également des produits d\\\'accompagnement social innovants : aide à l\\\'installation de pharmacie communautaire, mutuelles de santé scolaires, et programmes de prévention contre les maladies endémiques. Ces services sont renforcés par des actions de terrain menées par des agents formés aux spécificités culturelles locales.\r\n\r\nEn matière de RSE, AFAFI s\\\'engage dans la formation des leaders communautaires à la gestion des risques sanitaires, le soutien aux centres de santé de brousse, et la promotion de la couverture maladie universelle. Son modèle économique solidaire permet de maintenir des tarifs très compétitifs tout en garantissant la pérennité du système.\r\n\r\nL\\\'expérience client chez AFAFI repose sur la proximité : les adhérents sont accompagnés par des conseillers issus de leur communauté, parlant leur dialecte et comprenant leurs réalités socio-économiques. Des outils simplifiés de gestion (carnets de santé, SMS interactifs) pallient le faible taux de bancarisation en zone rurale.\r\n\r\nAvec plus de 200 points de service répartis dans les 22 régions de Madagascar, AFAFI joue un rôle majeur dans la réduction des inégalités d\\\'accès aux soins. Son impact social se mesure aussi à travers ses partenariats avec les autorités locales, les ONG sanitaires et les programmes internationaux de développement.\r\n\r\nEn constante innovation, AFAFI développe actuellement des solutions hybrides combinant assurance traditionnelle et télémédecine, ainsi que des produits paramétriques pour couvrir les aléas climatiques affectant les récoltes de ses membres.\', \'Mutuelle santé,Soins médico-sociaux,Accompagnement social,Prévention santé,Télémédecine\');', 'Mutuelle santé,Soins médico-sociaux,Accompagnement social', '{\"Mutuelle santé\":\"15000\",\"Soins médico-sociaux\":\"12000\",\"Accompagnement social\":\"10000\"}'),
(12, 'Assurance FJKM', 'fjkm@email.com', 'azerty', 'img/FJKM.png', 77, 23, 68, 32, 66, 34, 57, 43, 'Assurance FJKM, étroitement liée à l\'Église protestante malgache, met l\'accent sur la solidarité et l\'entraide communautaire à travers ses offres d\'assurance santé, vie et scolaire.', 'Santé,Vie,Décès/Invalidité', '{\"Santé\":\"35000\",\"Vie\":\"25000\",\"Décès/Invalidité\":\"20000\"}'),
(13, 'Assurance OTIV', 'otiv@email.com', 'azerty', 'img/OTIV.png', 74, 26, 60, 40, 63, 37, 52, 48, 'Assurance OTIV propose des solutions destinées aux structures mutualistes et aux micro-entreprises, avec une forte orientation sociale et solidaire. Elle accompagne les projets locaux et soutient les initiatives citoyennes.', 'Santé,Agricole,Responsabilité Civile', '{\"Santé\":\"32000\",\"Agricole\":\"22000\",\"Responsabilité Civile\":\"18000\"}'),
(14, 'Assurance CNaPS', 'cnaps@email.com', 'azerty', 'img/CNaPS.png', 79, 21, 0, 27, 67, 33, 56, 44, 'CNaPS est l\'organisme public de protection sociale à Madagascar. Il propose une couverture sociale complète incluant les allocations familiales, les indemnités d\'accident du travail, la retraite, et des actions sociales au bénéfice des assurés.', 'Prestations familiales,Accidents de travail,Maladies professionnelles,Retraite,Actions sanitaires', '{\"Prestations familiales\":\"8000\",\"Accidents de travail\":\"15000\",\"Maladies professionnelles\":\"12000\",\"Retraite\":\"25000\",\"Actions sanitaires\":\"10000\"}'),
(15, 'Assurance APEM', 'apem@email.com', 'azerty', 'img/APEM.jpg', 72, 28, 64, 36, 61, 39, 49, 51, 'Assurance APEM\', \'apem@email.com\', \'azerty\', \'img/APEM.jpg\', 72, 28, 64, 36, 61, 39, 49, 51, \'L’Association pour l’Épanouissement de la Population et de l’Environnement de Madagascar (APEM) est un acteur engagé dans la protection sociale et financière des communautés malgaches, particulièrement en milieu rural et semi-urbain. Fondée sur des valeurs de solidarité et de développement durable, APEM combine services financiers et non financiers pour offrir une couverture adaptée aux besoins des familles et des micro-entrepreneurs.\r\n\r\nAPEM propose une gamme d’assurances santé conçues pour les populations à revenus modestes, avec des formules couvrant les consultations médicales, les médicaments essentiels, les soins d’urgence et l’hospitalisation de base. Ses contrats flexibles permettent des cotisations ajustables selon les capacités financières des assurés, avec un accent mis sur la prévention et l’éducation sanitaire.\r\n\r\nL’assurance scolaire APEM garantit la continuité de l’éducation des enfants en cas d’imprévus familiaux (décès, invalidité d’un parent), tandis que son assurance responsabilité civile protège les petits commerçants et artisans contre les risques liés à leur activité. APEM collabore étroitement avec des mutuelles locales et des associations villageoises pour faciliter l’accès à ses services.\r\n\r\nSon engagement RSE se traduit par des programmes de sensibilisation à l’hygiène, des ateliers sur la gestion des risques, et le soutien aux initiatives environnementales (reboisement, gestion des déchets). APEM intègre également des critères sociaux dans ses produits, comme des bonus de fidélité convertibles en primes d’assurance ou en microcrédits.\r\n\r\nLe capital humain d’APEM repose sur des équipes formées aux spécificités des publics cibles, avec un maillage territorial renforcé par des relais communautaires. L’expérience client est personnalisée : conseil en face-à-face, documents simplifiés en malgache, et suivi régulier des sinistres.\r\n\r\nAvec une présence dans les principales régions de Madagascar, APEM contribue activement à la réduction de la vulnérabilité économique grâce à des produits inclusifs et une approche holistique du développement local.\', \'Santé,Scolaire,Responsabilité Civile,Microcrédits,Éducation financière', 'Santé,Scolaire,Responsabilité Civile', '{\"Santé\":\"30000\",\"Scolaire\":\"18000\",\"Responsabilité Civile\":\"15000\"}'),
(16, 'Assurance OTIVTANA', 'oti@email.com', 'azerty', 'img/OTIVTana.jpg', 69, 31, 62, 38, 59, 41, 46, 54, 'OTIVTANA est une branche régionale d\'OTIV, centrée sur l\'assurance de proximité pour les zones rurales et les petites structures économiques. Elle favorise l\'accès à la protection sociale à travers une démarche solidaire.', 'Santé,Agricole,Responsabilité Civile', '{\"Santé\":\"28000\",\"Agricole\":\"20000\",\"Responsabilité Civile\":\"15000\"}'),
(17, 'Assurance SIPEM', 'sipem@email.com', 'azerty', 'img/SIPEM.webp', 76, 24, 69, 31, 64, 36, 55, 45, 'SIPEM, société de microfinance, propose également des produits d\'assurance santé et vie adaptés aux micro-entrepreneurs, avec un focus sur la proximité et l\'inclusion financière.', 'Découvert,Ligne de trésorerie,Épargne,Prêts,Retrait espèces', '{\"Découvert\":\"10000\",\"Ligne de trésorerie\":\"12000\",\"Épargne\":\"5000\",\"Prêts\":\"15000\",\"Retrait espèces\":\"3000\"}'),
(21, 'Assurances ARO', 'aro@email.com', 'azerty', 'img/Aro.png', 87, 13, 82, 18, 78, 22, 75, 25, 'Assurances ARO est l\'une des plus anciennes compagnies malgaches. Elle propose une gamme étendue d\'assurances, incluant la prise en charge des funérailles, le rapatriement, ainsi que des couvertures auto, vie et habitation.', 'Funérailles,Rapatriement,Santé,Vie,Auto,Habitation', '{\"Funérailles\":\"25000\",\"Rapatriement\":\"40000\",\"Santé\":\"45000\",\"Vie\":\"30000\",\"Auto\":\"32000\",\"Habitation\":\"28000\"}'),
(23, 'SAMB\'A assurances', 'samba@email.com', 'azerty', 'img/SAMBA.png', 68, 32, 63, 37, 58, 42, 45, 55, 'SAMB\'A Assurances est une compagnie émergente orientée vers les jeunes et les professionnels. Elle propose des produits accessibles en ligne et des solutions simples adaptées à la mobilité des usagers.', 'Auto,Santé,Responsabilité Civile', '{\"Auto\":\"28000\",\"Santé\":\"40000\",\"Responsabilité Civile\":\"15000\"}'),
(24, 'BOA assurance', 'boa@email.com', 'azerty', 'img/BOA.png', 84, 16, 79, 21, 74, 26, 71, 29, 'BOA Assurance, affiliée à la Banque of Africa, offre des produits d\'assurance adaptés aux particuliers et aux entreprises. Elle met l\'accent sur la complémentarité entre services bancaires et couverture d\'assurance.', 'Vie,Auto,Professionnelle', '{\"Vie\":\"35000\",\"Auto\":\"30000\",\"Professionnelle\":\"50000\"}'),
(28, 'BSA Madagascar Gras ', 'bsa@email.com', 'azerty', 'img/bsa.png', 75, 25, 70, 30, 65, 35, 55, 45, 'BSA Madagascar Gras Savoye est un cabinet de courtage d\'assurance proposant des solutions sur mesure pour les entreprises, notamment dans les secteurs de la construction, de l\'automobile et de la responsabilité civile.', 'Auto,Professionnelle,Responsabilité Civile', '{\"Auto\":\"32000\",\"Professionnelle\":\"55000\",\"Responsabilité Civile\":\"25000\"}'),
(31, 'Assurances Mitsinjo', 'mitsinjo@email.com', 'azerty', 'img/mitsinjo.jpg', 71, 29, 66, 34, 61, 39, 50, 50, 'Assurances Mitsinjo est une structure à vocation sociale qui développe des services d\'assurance de proximité pour les foyers modestes. Elle favorise l\'accès aux soins et à la couverture habitation.', 'Santé,Habitation,Responsabilité Civile', '{\"Santé\":\"35000\",\"Habitation\":\"20000\",\"Responsabilité Civile\":\"15000\"}'),
(34, 'BAOBAB Assurance', 'baobab@email.com', 'azerty', 'img/baobab.png', 85, 15, 80, 20, 76, 24, 72, 28, 'BAOBAB Assurance est une filiale d\'un groupe spécialisé dans la microfinance. Elle propose des produits d\'assurance santé, vie et professionnelle, adaptés aux besoins des entrepreneurs et PME.', 'Santé,Vie,Habitation,Professionnelle', '{\"Santé\":\"38000\",\"Vie\":\"30000\",\"Habitation\":\"22000\",\"Professionnelle\":\"45000\"}'),
(35, 'Assurance KOBABY', 'kobaby@email.com', 'azert', 'img/KOBABY.png', 65, 35, 60, 40, 55, 45, 40, 60, 'Assurance KOBABY est dédiée à la protection des familles malgaches à travers des solutions d\'assurance santé, scolaire et agricole accessibles, tout en mettant en avant la solidarité communautaire.', 'Santé,Scolaire,Agricole', '{\"Santé\":\"30000\",\"Scolaire\":\"15000\",\"Agricole\":\"18000\"}');

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `expediteur_id` int(11) NOT NULL,
  `expediteur_type` enum('user','assurance') NOT NULL,
  `destinataire_id` int(11) NOT NULL,
  `destinataire_type` enum('user','assurance') NOT NULL,
  `date_envoi` datetime DEFAULT current_timestamp(),
  `message` text NOT NULL,
  `lu` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `messages`
--

INSERT INTO `messages` (`id`, `expediteur_id`, `expediteur_type`, `destinataire_id`, `destinataire_type`, `date_envoi`, `message`, `lu`) VALUES
(3, 1, 'user', 21, 'assurance', '2025-04-17 12:51:10', 'y a t il quelqu\'un?', 0),
(4, 1, 'user', 2, 'assurance', '2025-04-17 13:39:39', 'bonjour encore', 0),
(5, 2, 'user', 21, 'assurance', '2025-04-17 13:47:41', '', 0),
(6, 2, 'user', 1, 'assurance', '2025-04-17 13:47:41', '', 0),
(14, 21, 'assurance', 1, 'user', '2025-04-17 20:44:24', 'oui que puis - je faire?', 0),
(15, 2, 'assurance', 1, 'user', '2025-04-17 21:35:53', 'Bonjour je suis le représentant de l\'Assurance Ny Havana', 0),
(16, 1, 'user', 21, 'assurance', '2025-04-18 02:14:33', 'Plus de renseignements concernant la RSE', 0),
(17, 1, 'user', 2, 'assurance', '2025-04-18 04:41:18', 'bonjour c\'est quoi l\'impact local?', 0),
(18, 1, 'user', 2, 'assurance', '2025-04-18 04:43:51', 'et la RSE', 0),
(19, 2, 'assurance', 1, 'user', '2025-04-18 04:46:25', 'OK\r\n', 0),
(20, 2, 'assurance', 1, 'user', '2025-04-18 05:12:31', 'alors', 0),
(21, 2, 'user', 3, 'assurance', '2025-04-29 19:25:24', 'yo', 1),
(22, 3, 'assurance', 2, 'user', '2025-04-29 19:25:24', 'oui?', 0),
(23, 1, 'user', 21, 'assurance', '2025-04-30 04:35:40', 'yo', 0),
(24, 3, 'assurance', 2, 'user', '2025-04-30 04:36:40', 'donc...', 0),
(25, 2, 'assurance', 1, 'user', '2025-04-30 08:36:05', 'ohé', 0),
(26, 2, 'assurance', 1, 'user', '2025-04-30 08:36:22', 'gsgqks', 0),
(27, 1, 'user', 21, 'assurance', '2025-05-01 10:51:07', 'je vois', 0),
(28, 2, 'assurance', 1, 'user', '2025-05-01 10:51:26', 'oui', 0),
(29, 1, 'user', 2, 'assurance', '2025-05-01 10:51:55', 'bonjour', 0),
(30, 2, 'assurance', 1, 'user', '2025-05-01 11:00:28', 'salut', 0),
(31, 1, 'user', 2, 'assurance', '2025-05-01 11:05:00', 'quoi de neuf', 0),
(32, 1, 'user', 2, 'assurance', '2025-05-01 11:05:19', 'ça va?', 0),
(33, 2, 'assurance', 1, 'user', '2025-05-01 11:29:07', 'oui', 0),
(34, 1, 'user', 2, 'assurance', '2025-05-01 11:29:54', 'hein', 0),
(35, 2, 'assurance', 1, 'user', '2025-05-01 11:30:09', 'd&#39;accord', 0),
(36, 1, 'user', 2, 'assurance', '2025-05-01 11:35:52', 'je vous prie d\'aggréer mes salutation', 0),
(37, 2, 'assurance', 1, 'user', '2025-05-01 11:37:10', 'oui', 0),
(38, 1, 'user', 2, 'assurance', '2025-05-01 11:54:00', 'renseignements sur la RSE', 0),
(39, 2, 'assurance', 1, 'user', '2025-05-01 11:54:25', 'resposabilité', 0),
(40, 1, 'user', 2, 'assurance', '2025-05-01 12:07:01', '......', 0),
(41, 2, 'assurance', 1, 'user', '2025-05-01 13:06:33', 'je vois', 0),
(42, 1, 'user', 2, 'assurance', '2025-05-01 13:33:57', 'vous voyez', 0),
(44, 1, 'user', 2, 'assurance', '2025-05-01 13:40:50', 'a,kndvqcvajvfdavfdvezva,kndvqcvajvfdavfdvezva,kndvqcvajvfdavfdvezva,kndvqcvajvfdavfdvezva,kndvqcvajvfdavfdvezva,kndvqcvajvfdavfdvezva,kndvqcvajvfdavfdvezva,kndvqcvajvfdavfdvezva,kndvqcvajvfdavfdvezva,kndvqcvajvfdavfdvezva,kndvqcvajvfdavfdvezva,kndvqcvajvfdavfdvezva,kndvqcvajvfdavfdvezva,kndvqcvajvfdavfdvezv', 0),
(45, 2, 'assurance', 1, 'user', '2025-05-01 14:49:37', 'yo', 0),
(46, 2, 'assurance', 1, 'user', '2025-05-01 14:54:18', 'bonjour je suis...', 0),
(47, 1, 'user', 3, 'assurance', '2025-05-01 15:28:02', 'bonjour', 1),
(48, 1, 'user', 4, 'assurance', '2025-05-01 15:28:02', 'bonjour', 0),
(49, 1, 'user', 5, 'assurance', '2025-05-01 15:28:02', 'bonjour', 0),
(50, 1, 'user', 6, 'assurance', '2025-05-01 15:28:02', 'bonjour', 0),
(51, 1, 'user', 7, 'assurance', '2025-05-01 15:28:02', 'bonjour', 0),
(52, 1, 'user', 8, 'assurance', '2025-05-01 15:28:02', 'bonjour', 0),
(53, 1, 'user', 10, 'assurance', '2025-05-01 15:35:32', 'bonjour', 0),
(54, 1, 'user', 12, 'assurance', '2025-05-01 15:35:32', 'bonjour', 0),
(55, 1, 'user', 13, 'assurance', '2025-05-01 15:35:32', 'bonjour', 0),
(56, 1, 'user', 14, 'assurance', '2025-05-01 15:35:32', 'bojnjour', 0),
(57, 1, 'user', 15, 'assurance', '2025-05-01 15:35:32', 'bonjour', 0),
(58, 1, 'user', 16, 'assurance', '2025-05-01 15:35:32', 'bonjour', 0),
(59, 3, 'assurance', 1, 'user', '2025-05-01 15:37:06', 'Bonjour, voici le représentant de l\'assurance Allianz que puis-je faire pour vous?', 0),
(81, 1, 'user', 3, 'assurance', '2025-05-05 13:55:47', 'C\'est quoi la RSE?', 0),
(82, 3, 'assurance', 1, 'user', '2025-05-05 13:56:00', 'Responsabilité Socio écologique', 0);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id_users` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `mdp` varchar(10) NOT NULL,
  `image` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id_users`, `nom`, `email`, `mdp`, `image`) VALUES
(1, 'Societe', 'email@email.com', 'azerty', 'img/societe.jpg'),
(2, 'startup', 'email@mail.com', 'qsdfgh', 'img/startup.jpg');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `assurances`
--
ALTER TABLE `assurances`
  ADD PRIMARY KEY (`id_assurances`);

--
-- Index pour la table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_users`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `assurances`
--
ALTER TABLE `assurances`
  MODIFY `id_assurances` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT pour la table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id_users` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
