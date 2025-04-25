pipeline {
    agent any

    environment {
        DOCKER_USER = 'fatimadiao20'
        BACKEND_IMAGE = "${DOCKER_USER}/image-back"
        FRONTEND_IMAGE = "${DOCKER_USER}/image-front"
        MIGRATE_IMAGE = "${DOCKER_USER}/projetfilrouge_migrate"
    }

    stages {
        stage('Cloner le dépôt') {
            steps {
                git branch: 'master',
                    url: 'https://github.com/FatouDiao01/projet-odc'
            }
        }
        stage('Build des images') {
            steps {
                bat 'docker build -t $BACKEND_IMAGE:latest ./Backend/odc'
                bat 'docker build -t $FRONTEND_IMAGE:latest ./Frontend'
                bat 'docker build -t $MIGRATE_IMAGE:latest ./Backend/odc'
            }
        }

        stage('Push des images sur Docker Hub') {
            steps {
                withDockerRegistry([credentialsId: 'tokendocker', url: '']) {
                    bat 'docker push $BACKEND_IMAGE:latest'
                    bat 'docker push $FRONTEND_IMAGE:latest'
                    bat 'docker push $MIGRATE_IMAGE:latest'
                }
            }
        }

        stage('Déploiement local avec Docker Compose') {
            steps {
                sh '''
                    docker-compose down || true
                    docker-compose pull
                    docker-compose up -d --build
                '''
            }
        }
    }

    post {
        success {
            mail to: 'fatihametdiao08@gmail.com',
                 subject: "reussite",
                 body: "L'application a été déployée."
        }
        failure {
            mail to: 'fatihametdiao08@gmail.com',
                 subject: "❌ Échec",
                 body: "Une erreur s’est produite"
        }
    }
}
