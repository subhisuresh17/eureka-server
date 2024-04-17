pipeline {
    agent any
    
    environment {
        DOCKER_HUB_USERNAME = 'subhikshasuresh1701'
        DOCKER_HUB_PASSWORD = 'Love170801'
        DOCKER_IMAGE_NAME = 'eurekha-server'
        GIT_USERNAME = 'subhisuresh17'
        GIT_PASSWORD = 'Love170801*'
        GIT_REPO_URL = 'https://github.com/subhisuresh17/eureka-server.git'
        GIT_CREDENTIALS_ID = 'Eurekha_server_test'
    }
    
    stages {
        stage('Clone Git Repository') {
            steps {
                // Clone the Git repository using credentialsId
                dir('eureka-server') {
                    git credentialsId: GIT_CREDENTIALS_ID, url: GIT_REPO_URL, branch: 'main'
                }
            }
        }
        stage('Build Project') {
            steps {
                // Change directory to the cloned repository and build the project with Maven
                dir('eureka-server') {
                    sh 'mvn clean package'
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                // Change directory to the cloned repository
                dir('eureka-server') {
                    // Build Docker image using your Dockerfile in the current directory
                    script {
                        def dockerBuild = sh(script: "sudo docker build -t $DOCKER_IMAGE_NAME .", returnStatus: true)
                        if (dockerBuild == 0) {
                            echo "Docker image built successfully."
                        } else {
                            error "Failed to build Docker image."
                        }
                    }
                }
            }
        }
      
      stage('Run Docker Container') {
            steps {
                // Run the Docker container from the built image
                sh "sudo docker run -d -p 8761:8761 $DOCKER_IMAGE_NAME:latest"
            }
        }
        stage('Push to Docker Hub') {
            steps {
                // Log in to Docker Hub and push the image
                sh "sudo docker login -u $DOCKER_HUB_USERNAME -p $DOCKER_HUB_PASSWORD"
                sh "sudo docker tag $DOCKER_IMAGE_NAME $DOCKER_HUB_USERNAME/$DOCKER_IMAGE_NAME"
                sh "sudo docker push $DOCKER_HUB_USERNAME/$DOCKER_IMAGE_NAME"
            }
        }
    }
}
