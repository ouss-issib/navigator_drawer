# 🌦️ Flutter Drawer App avec Authentification et Météo

Ce dépôt contient une **application mobile Flutter** avec système d’**authentification simple**, un **menu drawer personnalisable**, et une **affichage météo** récupérée via l’API **OpenWeatherMap**.  
Ce projet a été réalisé pour apprendre la gestion d’état avec `Provider`, la navigation, et la consommation d’API externes.Il s’inscrit dans le cadre du module de **Développement Mobile Multiplatforme** encadré par **Mr JAMAL MAWANE**.


---

## 🎯 Objectifs du projet

- 🔐 Gérer l’authentification utilisateur (login/logout)
- 🗂️ Implémenter un menu drawer dynamique avec navigation
- 🌍 Afficher la météo sur 5 jours pour une ville donnée via OpenWeatherMap
- 🎨 Créer une UI propre et fluide avec Material Design

---

## 📂 Structure du projet Flutter
├── lib/
│ ├── main.dart # Point d’entrée et routing
│ ├── providers/
│ │ └── auth_provider.dart # Gestion auth avec Provider
│ ├── widgets/
│ │ ├── my_drawer.dart # Menu drawer personnalisé
│ │ ├── weather.dart # Widget affichage météo
│ │ └── weather_form.dart # Formulaire de saisie ville
│ ├── pages/
│ │ └── login.page.dart # Page de connexion
│ │ └── counter.page.dart # Page de counter app
│ │ └── gallery.page.dart # Gellerie d'images
│ │ └── contacts.page.dart # Liste des contacts
│ │ └── home.page.dart # Page d'acceuil
│ │ └── meteo.page.dart # Page de météo
│ └── global/
│ └── global_parameters.dart # Menus & routes
