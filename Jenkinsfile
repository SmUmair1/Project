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
                    sh 'echo "Umai123!!" | sudo -S docker build -t umair1999/cicd_12:latest .'
                }
            }
        }
        stage('Tag Docker Image') {
            steps {
                script {
                    // Tag the Docker image with the version or any other identifier
                    echo 'Tagging Docker image...'
                    sh 'sudo -S docker tag umair1999/cicd_12:latest umair1999/cicd_12:1.0'
                }
            }
        }

        stage('Push Docker Image to Docker Hub') {
            steps {
                script {
                    // Log in to Docker Hub
                    echo 'Logging in to Docker Hub...'
                    sh 'sudo -S docker login -u umair1999 -p Umai123!!'

                    // Push the Docker image to Docker Hub
                    echo 'Pushing Docker image to Docker Hub...'
                    sh 'sudo -S docker push umair1999/cicd_12:latest'
                   // sh 'sudo -S docker push umair1999/cicd_12:1.0'
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
