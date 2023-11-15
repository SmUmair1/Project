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
                    sh 'docker build -t umair1999/pythonapp1:latest .'
                }
            }
        }

        // stage('Tag Docker Image') {
        //     steps {
        //         script {
        //             // Tag the Docker image with a version
        //             sh 'docker tag pyhtonapp1:latest pythonapp1:1.0'
        //         }
        //     }
        // }

        stage('Push to Docker Hub') {
            steps {
                script {
                    // Log in to Docker Hub
                    withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh 'docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD'
                    }
        
                    // Push the Docker image to Docker Hub
                    sh 'docker push umair1999/pythonapp1:latest'
                   // sh 'docker push umair1999/app:1.0'

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
