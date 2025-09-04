pipeline {
    agent any

    environment {
        DOCKERHUB_USER = 'vishwacloudlab'
        DOCKERHUB_cred = credentials('dockerhub-cred') // Jenkins Credential ID
        IMAGE_NAME = 'jenkins-docker-lab'
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main',
                    url: 'git@github.com:Vishwanathms/t7.14-py-jenkins.git', credentialsId: 'github_cred_key'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker rm  jenkins_app -f || true'
                    sh 'docker image rmi $DOCKERHUB_USER/$IMAGE_NAME:latest || true' 
                    sh 'docker build -t $DOCKERHUB_USER/$IMAGE_NAME:latest .'
                }
            }
        }
        stage('Push to DockerHub') {
            steps {
                script {
                    sh "echo $DOCKERHUB_cred_PSW | docker login -u $DOCKERHUB_USER --password-stdin"
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
        stage('Deploy to minikube') {
            steps {
                script {
                    sh ' kubectl delete python-deploy.yaml || true'
                   sh ' kubectl apply -f python-deploy.yaml'
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
