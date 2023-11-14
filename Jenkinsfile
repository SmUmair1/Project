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
                    docker.build("umair1999/cicd_12:latest", ".")
                }
            }
        }


        stage('Tag Docker Image') {
            steps {
                script {
                    echo 'Tagging Docker image...'
                    docker.image("umair1999/cicd_12:latest").tag("umair1999/cicd_12:1.0")
                }
            }
        }


        stage('Push Docker Image to Docker Hub') {
            steps {
                script {
                    echo 'Logging in to Docker Hub...'
                    withCredentials([usernamePassword(credentialsId: DOCKER_HUB_CREDENTIALS, usernameVariable: 'DOCKER_HUB_USERNAME', passwordVariable: 'DOCKER_HUB_PASSWORD')]) {
                        sh "docker login -u ${DOCKER_HUB_USERNAME} -p ${DOCKER_HUB_PASSWORD}"
                    }
        
                    echo 'Pushing Docker image to Docker Hub...'
                    docker.image("umair1999/cicd_12:latest").push()
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
