# Utiliser l'image de base Node.js
FROM node:16

# Définir le répertoire de travail
WORKDIR /app

# Copier les fichiers du projet
COPY . .

# Installer les dépendances
RUN npm install

# Exposer le port sur lequel l'app tourne
EXPOSE 3000

# Démarrer l'application
CMD ["npm", "start"]
