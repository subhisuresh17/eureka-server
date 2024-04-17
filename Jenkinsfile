pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE_NAME = 'eureka-server'
        GIT_CREDENTIALS_ID = 'Eurekha_server_test'
        GIT_USERNAME = 'subhisuresh17'
        GIT_PASSWORD = 'Love170801*'
        GIT_REPO_URL = 'https://github.com/subhisuresh17/eureka-server.git'
    }
    
    stages {
        stage('Clone Git Repository') {
            steps {
                // Clone the Git repository using credentials
                git credentialsId: GIT_CREDENTIALS_ID, url: GIT_REPO_URL, branch: 'main'
            }
        }
        stage('Build Project') {
            steps {
                // Change directory to the cloned repository and build the project with Maven, skipping tests
                dir('eureka-server') {
                    sh './mvnw package -DskipTests'
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                // Build Docker image and tag it
                sh "sudo docker build -t $DOCKER_IMAGE_NAME ."
                sh "sudo docker tag $DOCKER_IMAGE_NAME $DOCKER_IMAGE_NAME:latest"
            }
        }
        stage('Run Docker Container') {
            steps {
                // Run the Docker container from the built image
                sh "sudo docker run -d -p 8761:8761 $DOCKER_IMAGE_NAME:latest"
            }
        }
    }
}
