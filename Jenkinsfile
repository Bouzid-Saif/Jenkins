pipeline {
    agent any

    stages {
        stage('Cloner le dépôt') {
            steps {
                // Cloner le dépôt Git
                git branch: 'main', url: 'https://github.com/Bouzid-Saif/Jenkins.git'
            }
        }

        stage('Installer les dépendances') {
            steps {
                // Installer les dépendances avec npm
                sh 'npm install'
            }
        }

        stage('Construire le projet') {
            steps {
                // Construire l'application avec npm (si applicable)
                sh 'npm run build'
            }
        }

        stage('Tester le projet') {
            steps {
                // Exécuter les tests automatisés
                sh 'npm test'
            }
        }

        stage('Docker Build and Run') {
            steps {
                // Construire l'image Docker
                sh 'docker build -t my-notes-app .'
                // Lancer le conteneur Docker (optionnel)
                sh 'docker run -d -p 3000:3000 my-notes-app'
            }
        }

        stage('Archiver les résultats') {
            steps {
                // Archiver les résultats des tests et le build
                archiveArtifacts artifacts: 'build/**', fingerprint: true
            }
        }
    }

    post {
        success {
            echo 'Pipeline exécuté avec succès.'
        }
        failure {
            echo 'Le pipeline a échoué. Consultez les logs pour plus de détails.'
        }
    }
}
