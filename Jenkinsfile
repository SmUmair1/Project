pipeline {
    agent any

    environment {
        // Define environment variables for Git and Docker Hub credentials
        GIT_CREDENTIALS = credentials('jenkins')
        DOCKER_HUB_CREDENTIALS = credentials('dockerhub')
        DOCKER_IMAGE_NAME = 'umair1999/cicd_12'
        DOCKER_IMAGE_TAG = 'latest'
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
                    //docker.build("${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}", "sh 'sudo docker build -t app/app.py .")
                     sh 'echo "Umai123!!" | sudo -S docker build -t umair1999/cicd_12 .'
             
                }
            }
        }

        stage('Tag Docker Image') {
            steps {
                script {
                    // Tag the Docker image
                    docker.image("${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}").tag("${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}")
                }
            }
        }

        stage('Push Docker Image to Docker Hub') {
            steps {
                script {
                    // Log in to Docker Hub
                    docker.withRegistry('https://registry.hub.docker.com', "${DOCKER_HUB_CREDENTIALS}") {
                        // Push the Docker image to Docker Hub
                        docker.image("${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}").push()
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
