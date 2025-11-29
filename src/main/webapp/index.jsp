<!DOCTYPE html>
<html>
<head>
    <title>Application DevOps Java</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            background-color: #f4f4f4;
        }
        .container {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
        }
        .feature {
            background: #e7f3ff;
            padding: 10px;
            margin: 10px 0;
            border-left: 4px solid #007bff;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>🚀 Application DevOps Java</h1>
    <p>Bienvenue sur notre application de démonstration CI/CD</p>

    <div class="feature">
        <h3>Fonctionnalités :</h3>
        <ul>
            <li>Interface web simple</li>
            <li>Intégration continue avec Jenkins</li>
            <li>Tests automatisés JUnit</li>
            <li>Analyse de sécurité SAST avec SonarQube</li>
            <li>Déploiement automatique sur Tomcat</li>
        </ul>
    </div>

    <p><strong>Version :</strong> 1.0.0</p>
    <p><strong>Date de déploiement :</strong> <%= new java.util.Date() %></p>
</div>
<!-- Ajouter cette section après la div .feature existante -->
<div class="feature" style="border-left-color: #28a745;">
    <h3>🆕 Nouvelle Fonctionnalité (new_feature) :</h3>
    <p>Cette section a été ajoutée dans la branche new_feature pour démontrer
        le processus de fusion (merge) dans le pipeline CI/CD.</p>
    <ul>
        <li>Amélioration de l'interface utilisateur</li>
        <li>Nouvelles couleurs et styles</li>
        <li>Meilleure expérience utilisateur</li>
    </ul>
</div>
</body>
</html>