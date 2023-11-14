pipeline {
    agent any

    environment {
        // Define environment variables for Git and Docker Hub credentials
        GIT_CREDENTIALS = credentials('jenkins')
        DOCKER_HUB_CREDENTIALS = credentials('dockerhub')
        // DOCKER_IMAGE_NAME = 'umair1999/cicd_12'
        // DOCKER_IMAGE_TAG = 'latest'
    }

    stages {
        stage('Clone Git Repository') {
            steps {
                script {
                    // Clone the Git repository
                    checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'CloneOption', credentialsId: GIT_CREDENTIALS]]])
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    // docker.build("${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}", "sh 'sudo docker build -t app/app.py .'")
                    sh 'echo "Umai123!!" | sudo -S docker build -t app/app.py .'
                }
            }
        }

        stage('Tag Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://hub.docker.com/repository/docker/umair1999/cicd_12/general', 'DOCKER_HUB_CREDENTIALS') {
                        // Tag the Docker image
                        docker.image("app/app.py").tag("latest")
        
                        // Push the tagged image to Docker Hub
                        docker.image("app/app.py").push("latest")
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline successfully executed!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
