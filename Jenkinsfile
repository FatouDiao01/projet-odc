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
                sh 'docker build -t $BACKEND_IMAGE:latest ./Backend/odc'
                sh 'docker build -t $FRONTEND_IMAGE:latest ./Frontend'
                sh 'docker build -t $MIGRATE_IMAGE:latest ./Backend/odc'
            }
        }

        stage('Push des images sur Docker Hub') {
            steps {
                withDockerRegistry([credentialsId: 'tokendocker', url: '']) {
                    sh 'docker push $BACKEND_IMAGE:latest'
                    sh 'docker push $FRONTEND_IMAGE:latest'
                    sh 'docker push $MIGRATE_IMAGE:latest'
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
            mail to: 'votre email@gmail.com',
                 subject: "reussite",
                 body: "L'application a été déployée."
        }
        failure {
            mail to: 'votre@gmail.com',
                 subject: "❌ Échec",
                 body: "Une erreur s’est produite"
        }
    }
}
