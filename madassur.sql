-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : jeu. 01 mai 2025 à 15:20
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
-- Base de données : `madassur`
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
  `services` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `assurances`
--

INSERT INTO `assurances` (`id_assurances`, `nom`, `email`, `mdp`, `image`, `rse_fort`, `rse_faible`, `capital_humain_fort`, `capital_humain_faible`, `experience_client_fort`, `experience_client_faible`, `impact_local_fort`, `impact_local_faible`, `description`, `services`) VALUES
(2, 'Assurance Ny Havana', 'havana@email.com', 'azerty', 'img/Havana.png', 85, 15, 70, 30, 60, 40, 50, 50, ' Assurance Ny Havana est un acteur incontournable du paysage assurantiel malgache. Forte d’un ancrage local solide et d’une compréhension approfondie des réalités économiques et sociales de Madagascar, cette compagnie s’est hissée parmi les leaders du secteur grâce à une offre diversifiée, des valeurs humaines fortes, et un engagement sociétal affirmé. Depuis sa création, Assurance Ny Havana s’efforce de proposer à ses assurés des solutions fiables, accessibles et adaptées aux besoins évolutifs des particuliers comme des entreprises. L’assurance santé occupe une place centrale dans son portefeuille de produits, avec des formules couvrant les soins courants, l’hospitalisation, les médicaments, ainsi que des services de prévention médicale. Ces offres sont conçues pour convenir à une clientèle très large, allant des travailleurs indépendants aux salariés, en passant par les familles rurales souvent éloignées des structures classiques.\r\n\r\nEn matière d’assurance vie, Assurance Ny Havana se démarque par des produits simples et transparents, offrant à la fois une épargne sécurisée et une protection des proches en cas de décès. Elle propose également des assurances habitation couvrant les risques liés aux incendies, aux catastrophes naturelles, aux vols et aux dégâts des eaux, avec une attention particulière portée à la rapidité de traitement des sinistres. Les assurances voyage, quant à elles, sont orientées vers les étudiants, les professionnels en mission et les familles en déplacement, avec une couverture incluant les frais médicaux à l’étranger, les rapatriements et les pertes de bagages.\r\n\r\nL’un des piliers de la stratégie de Ny Havana est la Responsabilité Sociétale des Entreprises (RSE). Elle investit dans des actions communautaires telles que la sensibilisation aux risques, la promotion de la santé publique dans les zones enclavées, et l’éducation financière. Ce volet RSE est soutenu par une politique de gouvernance transparente et une inclusion des parties prenantes dans la définition des priorités sociales.\r\n\r\nAssurance Ny Havana mise également sur le capital humain. La formation continue de ses employés, la promotion de la parité et le développement de compétences locales sont au cœur de sa politique RH. Elle a mis en place une série d’initiatives destinées à améliorer le bien-être de ses collaborateurs, leur implication dans les décisions stratégiques et leur progression professionnelle.\r\n\r\nDu côté de l’expérience client, Ny Havana se distingue par sa capacité à nouer des relations durables et de confiance avec ses assurés. Elle offre un accompagnement personnalisé dès la souscription, des outils digitaux pour le suivi de contrats, et un service clientèle disponible en plusieurs langues. Elle a développé une plateforme numérique qui permet la souscription en ligne, la gestion des sinistres, ainsi que l accès à un réseau de partenaires (cliniques, garages, notaires...).\r\n\r\nL’impact local de l’entreprise est mesurable dans plusieurs régions grâce à ses partenariats avec des ONG, des mutuelles locales et des coopératives agricoles. Elle soutient les micro-entrepreneurs via des assurances adaptées aux activités génératrices de revenus et participe à la formalisation de nombreux petits commerces grâce à des produits sur mesure.\r\n\r\nEn résumé, les valeurs fondamentales d’Assurance Ny Havana — proximité, solidarité, professionnalisme et innovation — se traduisent concrètement dans la qualité de ses services. Grâce à sa vision inclusive, son adaptation constante aux enjeux locaux et son souci de performance, elle continue d’être un modèle de réussite dans le domaine de l’assurance à Madagascar. ', 'Santé,Vie,Habitation,Voyage'),
(3, 'Allianz Madagascar', 'allianz@email.com', 'azerty', 'img/Allianz.png', 90, 10, 80, 20, 75, 25, 70, 30, ' Allianz Madagascar est la branche locale du groupe Allianz, l’un des plus grands groupes d’assurance et de services financiers au monde. Forte d’une présence internationale dans plus de 70 pays, Allianz a su adapter son expertise globale aux spécificités locales malgaches. Depuis son implantation à Madagascar, la compagnie s’est imposée comme un acteur majeur dans le secteur de l’assurance, offrant une gamme variée de produits destinés à la fois aux particuliers, aux professionnels et aux entreprises. Elle se distingue par la rigueur de sa gestion, l’innovation de ses solutions et son engagement pour un avenir durable.\r\n\r\nL’offre d’Allianz Madagascar couvre l’ensemble des besoins classiques d’assurance : santé, automobile, vie, responsabilité civile, habitation, retraite, éducation, et assurance entreprise. En matière de santé, Allianz propose des garanties étendues incluant les consultations médicales, les soins hospitaliers, les actes chirurgicaux, les médicaments remboursés, ainsi que l’accès à un réseau de professionnels de santé partenaires. Ces produits sont conçus pour s’adapter aux réalités économiques des familles malgaches, avec des formules souples et des options évolutives. Pour les entreprises, Allianz offre des solutions sur mesure permettant de couvrir les salariés, de garantir la continuité d’activité et de protéger les biens matériels.\r\n\r\nSon assurance automobile est particulièrement réputée pour la qualité de ses garanties (vol, incendie, bris de glace, dommages tous accidents) et la rapidité de sa gestion de sinistres. Les services complémentaires comme l’assistance routière et le remplacement de véhicule sont également très appréciés.\r\n\r\nEn matière de Responsabilité Sociétale des Entreprises (RSE), Allianz Madagascar s’engage activement dans la sensibilisation aux risques climatiques, l’accompagnement des communautés rurales et la promotion de la microassurance. La compagnie investit dans des initiatives éducatives et environnementales, comme la reforestation, le soutien à des écoles et la formation professionnelle pour les jeunes défavorisés. Cet engagement sociétal est au cœur de sa mission, en cohérence avec les objectifs du groupe Allianz à l’échelle mondiale.\r\n\r\nCôté capital humain, Allianz Madagascar valorise la diversité, l’égalité professionnelle, la formation continue et le développement des talents. Le bien-être des employés est une priorité, tout comme la transparence des processus internes et la promotion de la mobilité interne. Des programmes de mentorat, d’e-learning et d’évaluation continue des performances sont mis en place pour favoriser l’épanouissement professionnel.\r\n\r\nL’expérience client chez Allianz repose sur la simplicité, l’écoute et l’innovation. L’espace client en ligne permet de gérer ses contrats, de déclarer un sinistre, de suivre l’état de remboursement ou encore de contacter un conseiller. Les agents Allianz sont formés pour accompagner les clients à chaque étape, avec pédagogie et réactivité. Une application mobile est en développement pour élargir l’accès aux services, en particulier dans les zones éloignées.\r\n\r\nL’impact local est visible à travers les partenariats noués avec des ONG, des hôpitaux, des écoles, mais aussi avec des start-ups locales innovantes dans le secteur de la fintech et de l’assurtech. En favorisant la transformation numérique de l’assurance à Madagascar, Allianz joue un rôle moteur dans la modernisation du secteur.\r\n\r\nEn résumé, Allianz Madagascar combine l’expertise d’un géant mondial avec la flexibilité d’un acteur local engagé. Son ambition est de bâtir une société plus résiliente face aux risques, tout en apportant des solutions concrètes, durables et inclusives aux Malgaches. ', 'Santé,Auto,Vie,Responsabilité Civile,Habitation,Retraite,Éducation,Entreprise'),
(4, 'Sanlam Madagascar', 'sanlam@email.com', 'azerty', 'img/Sanlam.png', 78, 22, 65, 35, 70, 30, 60, 40, ' Sanlam Madagascar est une filiale du groupe Sanlam, géant sud-africain de la finance et de l’assurance présent sur plusieurs continents. À Madagascar, Sanlam s’est affirmée comme un acteur de référence, notamment dans les domaines de l’assurance vie, de la santé, de l’éducation et de la protection sociale. Sa stratégie repose sur trois piliers fondamentaux : l’accessibilité, la proximité et la transformation numérique.\r\n\r\nL’assurance vie proposée par Sanlam Madagascar permet aux particuliers de constituer une épargne tout en assurant la sécurité financière de leur famille en cas de décès. Les contrats incluent des garanties pour les maladies graves, l’invalidité et les décès accidentels, avec une flexibilité dans le choix des bénéficiaires et la durée des contrats. L’assurance santé complète cette offre avec une couverture allant des soins de base à l’hospitalisation lourde, incluant le remboursement des frais médicaux, la maternité et les urgences.\r\n\r\nSanlam se démarque aussi par son engagement envers l’éducation. Des produits spécifiques couvrent les frais de scolarité en cas d’imprévus (décès d’un parent, invalidité, etc.), garantissant ainsi la continuité des études pour les enfants assurés. Ces offres sont très appréciées dans les familles malgaches soucieuses de l’avenir de leurs enfants.\r\n\r\nLes assurances automobile et habitation proposées par Sanlam incluent une protection contre les sinistres, les catastrophes naturelles, les accidents et le vol. Elles sont modulables selon le profil du client, qu’il s’agisse d’un particulier ou d’un professionnel.\r\n\r\nSur le plan de la RSE, Sanlam Madagascar s’investit dans des actions de proximité : campagnes de dépistage, sensibilisation à la santé mentale, accompagnement des familles rurales, et soutien à des associations communautaires. Elle œuvre pour l’inclusion financière des populations exclues du système bancaire traditionnel grâce à des produits simples et peu coûteux.\r\n\r\nCôté capital humain, Sanlam développe un climat de travail collaboratif, favorise le leadership féminin, et offre des opportunités d’évolution de carrière à ses collaborateurs. Elle applique une politique stricte contre les discriminations et favorise les recrutements locaux. Ses centres de formation internes garantissent un haut niveau de compétence technique et comportementale.\r\n\r\nL’expérience client est placée au cœur de la stratégie de Sanlam, avec des services de conseil personnalisé, une gestion fluide des contrats et un espace client numérique convivial. La compagnie mise sur la digitalisation des parcours client pour garantir rapidité, transparence et autonomie.\r\n\r\nEnfin, son impact local se manifeste par le maillage de ses agences sur l’ensemble du territoire, la collaboration avec des réseaux de santé partenaires, et le soutien à des initiatives citoyennes dans les domaines de l’environnement, de l’alphabétisation et de l’entrepreneuriat.\r\n\r\nSanlam Madagascar se distingue ainsi par sa capacité à proposer des solutions modernes et responsables, qui répondent aux enjeux sociaux et économiques du pays tout en respectant les plus hauts standards internationaux. ', 'Vie,Santé,Scolaire,Décès/Invalidité,Automobile,Habitation'),
(5, 'Ascoma Madagascar', 'ascoma@email.com', 'azerty', 'img/ASCOMA.png', 82, 18, 77, 23, 68, 32, 58, 42, ' Ascoma Madagascar est une filiale du groupe Ascoma, acteur reconnu du courtage en assurance à l’échelle africaine. Présente dans plus de 20 pays du continent, Ascoma s’appuie sur une expertise multisectorielle et une solide connaissance des marchés locaux pour apporter à ses clients des solutions de couverture adaptées et personnalisées. À Madagascar, elle s’impose comme un interlocuteur privilégié pour les entreprises, les institutions publiques et les particuliers à la recherche d’un accompagnement de qualité dans la gestion de leurs risques.\r\n\r\nSpécialisée dans le conseil et la négociation de contrats d’assurance, Ascoma propose des solutions sur mesure en matière de santé, de responsabilité civile, d’assurance professionnelle, de flotte automobile, d’habitation, et de patrimoine. Elle agit comme intermédiaire entre le client et les compagnies d’assurance, veillant à ce que les conditions contractuelles soient toujours à l’avantage de l’assuré.\r\n\r\nDans le domaine de la santé, Ascoma élabore des contrats collectifs pour les entreprises et des produits individuels pour les particuliers. Elle accompagne également les employeurs dans la mise en place de systèmes de couverture santé pour leurs salariés, y compris dans les zones rurales ou enclavées.\r\n\r\nSon expertise en assurance professionnelle couvre notamment les risques liés aux chantiers, à la responsabilité des dirigeants, aux pertes d’exploitation et aux garanties financières. Pour les particuliers, elle propose des assurances habitation incluant les garanties incendie, vol, dégâts des eaux et catastrophes naturelles, ainsi qu’une assurance auto avec assistance et prise en charge rapide des sinistres.\r\n\r\nLa RSE occupe une place importante chez Ascoma Madagascar. L’entreprise s’engage dans des programmes de sensibilisation aux risques climatiques, de soutien aux femmes entrepreneures, et de développement de l’assurance inclusive. Elle promeut également l’éducation financière à travers des partenariats avec des institutions locales et l’organisation d’ateliers dans les écoles et universités.\r\n\r\nLe capital humain est au centre de la stratégie d’Ascoma. Les équipes bénéficient d’un encadrement permanent, de plans de formation certifiants, et d’un environnement de travail moderne et stimulant. L’accent est mis sur la qualité du service, l’intégrité professionnelle et la réactivité.\r\n\r\nSur le plan de l’expérience client, Ascoma se positionne comme un conseiller de confiance. Ses courtiers accompagnent les clients de A à Z, depuis la définition des besoins jusqu’à la gestion des sinistres, avec un souci constant de pédagogie et d’optimisation des coûts.\r\n\r\nEnfin, l’impact local d’Ascoma se reflète dans sa collaboration avec les collectivités, les opérateurs économiques et les ONG pour proposer des couvertures adaptées aux réalités de terrain. Grâce à sa flexibilité et son engagement, Ascoma contribue activement à la structuration du secteur de l’assurance à Madagascar.\r\n\r\n', 'Auto,Professionnelle,Habitation,Responsabilité Civile,Santé,Courtage'),
(6, 'Saham Assurance', 'saham@email.com', 'azerty', 'img/SAHAM.png', 75, 25, 70, 30, 65, 35, 55, 45, 'Saham Assurance est une compagnie d\'assurance opérant à Madagascar, connue pour son engagement envers l\'innovation, la qualité de service et l\'accessibilité. Elle s\'efforce d\'apporter une couverture d\'assurance adaptée aux besoins évolutifs des particuliers et des entreprises locales. Parmi ses offres, on trouve des produits d\'assurance santé, vie, voyage, auto et scolaire, notamment à travers des services en ligne accessibles, même dans les zones éloignées.\r\n\r\nSa politique de Responsabilité Sociétale des Entreprises (RSE) est axée sur le soutien aux communautés vulnérables, la digitalisation des services pour réduire les inégalités d\'accès, et la promotion de l\'éducation via des partenariats. Saham investit également dans la formation de ses agents pour améliorer la qualité de la relation client et encourager la transparence.\r\n\r\nAvec un capital humain fort et une expérience client marquée par la personnalisation des services, Saham Assurance entend renforcer sa position de leader innovant du secteur. En collaborant avec des écoles et des ONG, elle propose aussi des produits d\'assurance scolaire destinés aux familles à faibles revenus.\r\n\r\nL\'entreprise prévoit également le développement de produits micro-assurance pour les zones rurales, tout en adoptant des outils numériques pour simplifier la souscription et le remboursement. Elle participe à des projets de développement durable en finançant des initiatives vertes, comme l\'énergie renouvelable et la reforestation, et intègre des critères sociaux dans sa politique d’investissement.\r\n\r\nEn termes de services, Saham propose également une hotline santé 24h/24, des consultations médicales à distance, et des applications mobiles permettant la gestion des contrats et des sinistres. Elle travaille avec un réseau de partenaires médicaux pour offrir des services de soins directs et de remboursement simplifiés.\r\n\r\nÀ travers toutes ces initiatives, Saham Assurance se positionne comme un acteur responsable, innovant et résolument tourné vers l’avenir, alliant performance financière et impact social positif dans le paysage assurantiel malgache.\r\n', 'Santé, Voyage, Vie, Auto, Assurance scolaire en ligne'),
(7, 'Assurance MAMA', 'mama@email.com', 'azerty', 'img/MAMA.png', 80, 20, 72, 28, 60, 40, 50, 50, 'Assurance MAMA est l’un des piliers historiques du secteur de l’assurance à Madagascar, particulièrement reconnu pour son ancrage local, son accessibilité et son impact social. Depuis sa création, l’entreprise s’est donné pour mission de proposer une couverture d’assurance adaptée aux besoins spécifiques des familles malgaches, notamment celles issues des milieux ruraux ou défavorisés.\r\n\r\nParmi les services proposés par MAMA, on retrouve l’assurance santé, vie et agricole, qui couvrent respectivement les frais médicaux, les aléas liés à la vie (comme le décès ou l’invalidité), et les pertes liées aux activités agricoles — secteur vital dans l’économie malgache. Cette orientation stratégique vers les besoins de base permet à MAMA d’assurer une population souvent exclue des offres traditionnelles des grandes compagnies d’assurance.\r\n\r\nL’entreprise développe des partenariats solides avec des centres de santé locaux et des associations communautaires pour renforcer la proximité avec ses assurés. Grâce à son réseau étendu d’agents, elle couvre une grande partie du territoire national et parvient à maintenir un lien direct avec les communautés desservies.\r\n\r\nDans le cadre de sa démarche RSE, MAMA soutient des projets d’éducation, d’autonomisation des femmes et de reforestation. Elle organise également des campagnes de sensibilisation à la prévention des maladies, à la sécurité routière et à la gestion des risques en milieu rural.\r\n\r\nL’entreprise investit également dans la formation continue de ses agents et l’amélioration de l’expérience client, notamment à travers la digitalisation progressive de ses services. Une application mobile est en cours de développement pour faciliter la souscription et la gestion des contrats.\r\n\r\nAssurance MAMA reste fidèle à ses valeurs fondatrices : solidarité, simplicité, proximité. Elle entend continuer à évoluer dans un esprit d’innovation inclusive, avec pour objectif de rendre l’assurance accessible, compréhensible et utile à tous les Malgaches.', 'Santé, Agricole, Vie'),
(8, 'BNI Madagascar', 'bni@email.com', 'azerty', 'img/BNI.png', 88, 12, 85, 15, 80, 20, 78, 22, 'BNI Madagascar, branche assurantielle de la Banque Nationale d’Investissement, est un acteur de référence dans le secteur bancaire et assurantiel malgache. Alliant expertise financière et solutions d’assurance innovantes, BNI développe une offre cohérente autour des besoins concrets de sa clientèle. L’assurance santé \"Tomady\" offre une couverture élargie à des tarifs préférentiels, avec un accès facilité à un réseau de cliniques partenaires dans toutes les grandes villes. L’assurance \"Mahasoa\", dédiée à la prise en charge des accidents, couvre les dépenses imprévues liées aux blessures, à l’hospitalisation et à la rééducation, même pour les auto-entrepreneurs et les travailleurs informels. Le produit \"Miarina\", quant à lui, s’adresse aux familles souhaitant une couverture complète en cas de décès ou d’invalidité, avec un capital versé rapidement, des frais d’obsèques couverts, et un accompagnement administratif assuré. BNI mise aussi sur la digitalisation : les clients peuvent souscrire, modifier et résilier leurs contrats via leur espace en ligne, et consulter leur historique de remboursement. L’entreprise attache une importance particulière à la confidentialité des données et à la cybersécurité. Elle collabore régulièrement avec des écoles et universités pour promouvoir la culture assurantielle. Grâce à sa rigueur et sa vision de long terme, BNI Madagascar attire aussi les entreprises avec ses offres sur-mesure en assurance collective et prévoyance.', 'Santé (Tomady), Hospitalisation, Accident (Mahasoa), Décès/Invalidité (Miarina)'),
(10, 'Assurance AFAFI', 'afafi@email.com', 'azerty', 'img/AFAFI.gif', 70, 30, 65, 35, 62, 38, 48, 52, 'AFAFI Mutuelle est spécialisée dans la protection sociale, notamment pour les zones rurales. Elle offre des services médico-sociaux et un accompagnement dans l\'accès aux soins grâce à un réseau de prestataires conventionnés.', 'Mutuelle santé,Soins médico-sociaux,Accompagnement social'),
(12, 'Assurance FJKM', 'fjkm@email.com', 'azerty', 'img/FJKM.png', 77, 23, 68, 32, 66, 34, 57, 43, 'Assurance FJKM, étroitement liée à l\'Église protestante malgache, met l\'accent sur la solidarité et l\'entraide communautaire à travers ses offres d\'assurance santé, vie et scolaire.', 'Santé,Vie,Décès/Invalidité'),
(13, 'Assurance OTIV', 'otiv@email.com', 'azerty', 'img/OTIV.png', 74, 26, 60, 40, 63, 37, 52, 48, 'Assurance OTIV propose des solutions destinées aux structures mutualistes et aux micro-entreprises, avec une forte orientation sociale et solidaire. Elle accompagne les projets locaux et soutient les initiatives citoyennes.', 'Santé,Agricole,Responsabilité Civile'),
(14, 'Assurance CNaPS', 'cnaps@email.com', 'azerty', 'img/CNaPS.png', 79, 21, 0, 27, 67, 33, 56, 44, 'CNaPS est l\'organisme public de protection sociale à Madagascar. Il propose une couverture sociale complète incluant les allocations familiales, les indemnités d\'accident du travail, la retraite, et des actions sociales au bénéfice des assurés.', 'Prestations familiales,Accidents de travail,Maladies professionnelles,Retraite,Actions sanitaires'),
(15, 'Assurance APEM', 'apem@email.com', 'azerty', 'img/APEM.jpg', 72, 28, 64, 36, 61, 39, 49, 51, 'L\'Association pour l\'Épanouissement de la Population et de l\'Environnement de Madagascar (APEM) propose, en plus de ses services financiers, des assurances maladie et des services non financiers complémentaires destinés aux entrepreneurs et aux particuliers.', 'Santé,Scolaire,Responsabilité Civile'),
(16, 'Assurance OTIVTANA', 'oti@email.com', 'azerty', 'img/OTIVTana.jpg', 69, 31, 62, 38, 59, 41, 46, 54, 'OTIVTANA est une branche régionale d\'OTIV, centrée sur l\'assurance de proximité pour les zones rurales et les petites structures économiques. Elle favorise l\'accès à la protection sociale à travers une démarche solidaire.', 'Santé,Agricole,Responsabilité Civile'),
(17, 'Assurance SIPEM', 'sipem@email.com', 'azerty', 'img/SIPEM.webp', 76, 24, 69, 31, 64, 36, 55, 45, 'SIPEM, société de microfinance, propose également des produits d\'assurance santé et vie adaptés aux micro-entrepreneurs, avec un focus sur la proximité et l\'inclusion financière.', 'Découvert,Ligne de trésorerie,Épargne,Prêts,Retrait espèces'),
(21, 'Assurances ARO', 'aro@email.com', 'azerty', 'img/Aro.png', 87, 13, 82, 18, 78, 22, 75, 25, 'Assurances ARO est l\'une des plus anciennes compagnies malgaches. Elle propose une gamme étendue d\'assurances, incluant la prise en charge des funérailles, le rapatriement, ainsi que des couvertures auto, vie et habitation.', 'Funérailles,Rapatriement,Santé,Vie,Auto,Habitation'),
(23, 'SAMB\'A assurances', 'samba@email.com', 'azerty', 'img/SAMBA.png', 68, 32, 63, 37, 58, 42, 45, 55, 'SAMB\'A Assurances est une compagnie émergente orientée vers les jeunes et les professionnels. Elle propose des produits accessibles en ligne et des solutions simples adaptées à la mobilité des usagers.', 'Auto,Santé,Responsabilité Civile'),
(24, 'BOA assurance', 'boa@email.com', 'azerty', 'img/BOA.png', 84, 16, 79, 21, 74, 26, 71, 29, 'BOA Assurance, affiliée à la Banque of Africa, offre des produits d\'assurance adaptés aux particuliers et aux entreprises. Elle met l\'accent sur la complémentarité entre services bancaires et couverture d\'assurance.', 'Vie,Auto,Professionnelle'),
(28, 'BSA Madagascar Gras ', 'bsa@email.com', 'azerty', 'img/bsa.png', 75, 25, 70, 30, 65, 35, 55, 45, 'BSA Madagascar Gras Savoye est un cabinet de courtage d\'assurance proposant des solutions sur mesure pour les entreprises, notamment dans les secteurs de la construction, de l\'automobile et de la responsabilité civile.', 'Auto,Professionnelle,Responsabilité Civile'),
(31, 'Assurances Mitsinjo', 'mitsinjo@email.com', 'azerty', 'img/mitsinjo.jpg', 71, 29, 66, 34, 61, 39, 50, 50, 'Assurances Mitsinjo est une structure à vocation sociale qui développe des services d\'assurance de proximité pour les foyers modestes. Elle favorise l\'accès aux soins et à la couverture habitation.', 'Santé,Habitation,Responsabilité Civile'),
(34, 'BAOBAB Assurance', 'baobab@email.com', 'azerty', 'img/baobab.png', 85, 15, 80, 20, 76, 24, 72, 28, 'BAOBAB Assurance est une filiale d\'un groupe spécialisé dans la microfinance. Elle propose des produits d\'assurance santé, vie et professionnelle, adaptés aux besoins des entrepreneurs et PME.', 'Santé,Vie,Habitation,Professionnelle'),
(35, 'Assurance KOBABY', 'kobaby@email.com', 'azert', 'img/KOBABY.png', 65, 35, 60, 40, 55, 45, 40, 60, 'Assurance KOBABY est dédiée à la protection des familles malgaches à travers des solutions d\'assurance santé, scolaire et agricole accessibles, tout en mettant en avant la solidarité communautaire.', 'Santé,Scolaire,Agricole');

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
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `messages`
--

INSERT INTO `messages` (`id`, `expediteur_id`, `expediteur_type`, `destinataire_id`, `destinataire_type`, `date_envoi`, `message`) VALUES
(3, 1, 'user', 21, 'assurance', '2025-04-17 12:51:10', 'y a t il quelqu\'un?'),
(4, 1, 'user', 2, 'assurance', '2025-04-17 13:39:39', 'bonjour encore'),
(5, 2, 'user', 21, 'assurance', '2025-04-17 13:47:41', ''),
(6, 2, 'user', 1, 'assurance', '2025-04-17 13:47:41', ''),
(14, 21, 'assurance', 1, 'user', '2025-04-17 20:44:24', 'oui que puis - je faire?'),
(15, 2, 'assurance', 1, 'user', '2025-04-17 21:35:53', 'Bonjour je suis le représentant de l\'Assurance Ny Havana'),
(16, 1, 'user', 21, 'assurance', '2025-04-18 02:14:33', 'Plus de renseignements concernant la RSE'),
(17, 1, 'user', 2, 'assurance', '2025-04-18 04:41:18', 'bonjour c\'est quoi l\'impact local?'),
(18, 1, 'user', 2, 'assurance', '2025-04-18 04:43:51', 'et la RSE'),
(19, 2, 'assurance', 1, 'user', '2025-04-18 04:46:25', 'OK\r\n'),
(20, 2, 'assurance', 1, 'user', '2025-04-18 05:12:31', 'alors'),
(21, 2, 'user', 3, 'assurance', '2025-04-29 19:25:24', 'yo'),
(22, 3, 'assurance', 2, 'user', '2025-04-29 19:25:24', 'oui?'),
(23, 1, 'user', 21, 'assurance', '2025-04-30 04:35:40', 'yo'),
(24, 3, 'assurance', 2, 'user', '2025-04-30 04:36:40', 'donc...'),
(25, 2, 'assurance', 1, 'user', '2025-04-30 08:36:05', 'ohé'),
(26, 2, 'assurance', 1, 'user', '2025-04-30 08:36:22', 'gsgqks'),
(27, 1, 'user', 21, 'assurance', '2025-05-01 10:51:07', 'je vois'),
(28, 2, 'assurance', 1, 'user', '2025-05-01 10:51:26', 'oui'),
(29, 1, 'user', 2, 'assurance', '2025-05-01 10:51:55', 'bonjour'),
(30, 2, 'assurance', 1, 'user', '2025-05-01 11:00:28', 'salut'),
(31, 1, 'user', 2, 'assurance', '2025-05-01 11:05:00', 'quoi de neuf'),
(32, 1, 'user', 2, 'assurance', '2025-05-01 11:05:19', 'ça va?'),
(33, 2, 'assurance', 1, 'user', '2025-05-01 11:29:07', 'oui'),
(34, 1, 'user', 2, 'assurance', '2025-05-01 11:29:54', 'hein'),
(35, 2, 'assurance', 1, 'user', '2025-05-01 11:30:09', 'd&#39;accord'),
(36, 1, 'user', 2, 'assurance', '2025-05-01 11:35:52', 'je vous prie d\'aggréer mes salutation'),
(37, 2, 'assurance', 1, 'user', '2025-05-01 11:37:10', 'oui'),
(38, 1, 'user', 2, 'assurance', '2025-05-01 11:54:00', 'renseignements sur la RSE'),
(39, 2, 'assurance', 1, 'user', '2025-05-01 11:54:25', 'resposabilité'),
(40, 1, 'user', 2, 'assurance', '2025-05-01 12:07:01', '......'),
(41, 2, 'assurance', 1, 'user', '2025-05-01 13:06:33', 'je vois'),
(42, 1, 'user', 2, 'assurance', '2025-05-01 13:33:57', 'vous voyez'),
(44, 1, 'user', 2, 'assurance', '2025-05-01 13:40:50', 'a,kndvqcvajvfdavfdvezva,kndvqcvajvfdavfdvezva,kndvqcvajvfdavfdvezva,kndvqcvajvfdavfdvezva,kndvqcvajvfdavfdvezva,kndvqcvajvfdavfdvezva,kndvqcvajvfdavfdvezva,kndvqcvajvfdavfdvezva,kndvqcvajvfdavfdvezva,kndvqcvajvfdavfdvezva,kndvqcvajvfdavfdvezva,kndvqcvajvfdavfdvezva,kndvqcvajvfdavfdvezva,kndvqcvajvfdavfdvezv'),
(45, 2, 'assurance', 1, 'user', '2025-05-01 14:49:37', 'yo'),
(46, 2, 'assurance', 1, 'user', '2025-05-01 14:54:18', 'bonjour je suis...'),
(47, 1, 'user', 3, 'assurance', '2025-05-01 15:28:02', 'bonjour'),
(48, 1, 'user', 4, 'assurance', '2025-05-01 15:28:02', 'bonjour'),
(49, 1, 'user', 5, 'assurance', '2025-05-01 15:28:02', 'bonjour'),
(50, 1, 'user', 6, 'assurance', '2025-05-01 15:28:02', 'bonjour'),
(51, 1, 'user', 7, 'assurance', '2025-05-01 15:28:02', 'bonjour'),
(52, 1, 'user', 8, 'assurance', '2025-05-01 15:28:02', 'bonjour'),
(53, 1, 'user', 10, 'assurance', '2025-05-01 15:35:32', 'bonjour'),
(54, 1, 'user', 12, 'assurance', '2025-05-01 15:35:32', 'bonjour'),
(55, 1, 'user', 13, 'assurance', '2025-05-01 15:35:32', 'bonjour'),
(56, 1, 'user', 14, 'assurance', '2025-05-01 15:35:32', 'bojnjour'),
(57, 1, 'user', 15, 'assurance', '2025-05-01 15:35:32', 'bonjour'),
(58, 1, 'user', 16, 'assurance', '2025-05-01 15:35:32', 'bonjour'),
(59, 3, 'assurance', 1, 'user', '2025-05-01 15:37:06', 'Bonjour, voici le représentant de l\'assurance Allianz que puis-je faire pour vous?'),
(60, 1, 'user', 3, 'assurance', '2025-05-01 16:01:09', 'bkjgjhgvj'),
(61, 3, 'assurance', 1, 'user', '2025-05-01 16:01:27', 'oui'),
(62, 1, 'user', 3, 'assurance', '2025-05-01 16:11:56', 'alors'),
(63, 3, 'assurance', 1, 'user', '2025-05-01 16:12:07', 'ça va');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id_users` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
