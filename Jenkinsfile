pipeline {
    agent any

    environment {
        DOCKER_HUB_USERNAME = 'subhikshasuresh1701'
        DOCKER_HUB_PASSWORD = 'Love170801'
        DOCKER_IMAGE_NAME = 'eureka-server'
        GIT_CREDENTIALS_ID = 'Eurekha_server_test'
        GIT_REPO_URL = 'https://github.com/subhisuresh17/eureka-server.git'
    }

    stages {
        stage('Clone Git Repository') {
            steps {
                git branch: 'main', credentialsId: GIT_CREDENTIALS_ID, url: GIT_REPO_URL
            }
        }
        stage('Build Docker Image') {
            steps {
                // Change directory to where your Dockerfile is located
                dir('/eureka-server/Dockerfile') {
                    // Build Docker image using your custom Dockerfile
                    sh "sudo docker build -t $DOCKER_IMAGE_NAME -f Dockerfile ."
                    sh "sudo docker tag $DOCKER_IMAGE_NAME $DOCKER_HUB_USERNAME/$DOCKER_IMAGE_NAME:latest"
                }
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
