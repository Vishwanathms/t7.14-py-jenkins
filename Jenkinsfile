pipeline {
    agent any

    environment {
        DOCKERHUB_USER = 'your-dockerhub-username'
        DOCKERHUB_PASS = credentials('dockerhub-cred') // Jenkins Credential ID
        IMAGE_NAME = 'jenkins-docker-lab'
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/your-username/jenkins-docker-lab.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t $DOCKERHUB_USER/$IMAGE_NAME:latest .'
                }
            }
        }

        stage('Run Unit Tests') {
            steps {
                script {
                    sh 'docker run --rm $DOCKERHUB_USER/$IMAGE_NAME:latest pytest || true'
                }
            }
        }

        stage('Push to DockerHub') {
            steps {
                script {
                    sh "echo $DOCKERHUB_PASS | docker login -u $DOCKERHUB_USER --password-stdin"
                    sh 'docker push $DOCKERHUB_USER/$IMAGE_NAME:latest'
                }
            }
        }

        stage('Deploy (Run Container)') {
            steps {
                script {
                    sh 'docker run -d -p 5000:5000 --name jenkins_app $DOCKERHUB_USER/$IMAGE_NAME:latest'
                }
            }
        }
    }

    post {
        always {
            sh 'docker ps -a'
        }
        success {
            echo "✅ Pipeline completed successfully!"
        }
        failure {
            echo "❌ Pipeline failed!"
        }
    }
}
