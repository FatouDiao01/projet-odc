pipeline {
    agent any

    environment {
        DOCKER_USER = 'fatimadiao20'
        BACKEND_IMAGE = "${DOCKER_USER}/image-back"
        FRONTEND_IMAGE = "${DOCKER_USER}/image-front"
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
                bat '''
                    set DOCKER_API_VERSION=1.41
                    docker build -f Backend/dockerfile -t %BACKEND_IMAGE%:latest Backend
                    docker build -t %FRONTEND_IMAGE%:latest Frontend
                '''
            }
        }

        stage('Push des images sur Docker Hub') {
            steps {
                withDockerRegistry([credentialsId: 'docker-hub-credentials', url: '']) {
                    bat '''
                        docker push %BACKEND_IMAGE%:latest
                        docker push %FRONTEND_IMAGE%:latest
                    '''
                }
            }
        }

        stage('Déploiement local avec Docker Compose') {
            steps {
                bat '''
                    docker-compose down || exit 0
                    docker-compose pull
                    docker-compose up -d --build
                '''
            }
        }

        stage('Déploiement Kubernetes via Terraform') {
            steps {
                dir('terraform') {
                    bat 'terraform init'
                    bat 'terraform validate'
                    bat 'terraform apply -auto-approve'
                }
            }
        }
    }
}
