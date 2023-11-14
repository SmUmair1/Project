pipeline {
    agent any

    stages {
        stage('Clone from Git') {
            steps {
                script {
                    // Clean workspace before cloning
                    deleteDir()

                    // Clone the repository
                    checkout scm
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image using the Dockerfile in the repository
                    sh 'docker build -t app:latest .'
                }
            }
        }

        stage('Tag Docker Image') {
            steps {
                script {
                    // Tag the Docker image with a version
                    sh 'docker tag app:pythonapp:1.0'
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    // Log in to Docker Hub
                    withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'umair1999', passwordVariable: 'Umai123!!')]) {
                        sh 'docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD'
                    }

                    // Push the Docker image to Docker Hub
                    sh 'docker push app:latest'
                    sh 'docker push app:1.0'
                }
            }
        }
    }
}
