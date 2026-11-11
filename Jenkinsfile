
pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                echo 'Downloading HTML source code'
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo 'Checking HTML project files'
                sh '''
                    echo "Checking project directory..."
                    pwd
                    ls -la

                    echo "Checking HTML files..."
                    find . -maxdepth 2 -name "*.html" -o -name "*.htm"
                '''
            }
        }

        stage('Docker Build') {
            steps {
                echo 'Building Docker image'
                sh '''
                    docker --version
                    docker build -t html-ci-cd:latest .
                '''
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying HTML application'

                sh '''
                    docker stop html-container || true
                    docker rm html-container || true

                    docker run -d \
                      --name html-container \
                      -p 8081:80 \
                      html-ci-cd:latest

                    docker ps
                '''
            }
        }
    }

    post {
        success {
            echo 'Deployment completed successfully!'
        }

        failure {
            echo 'Deployment failed. Check the console output.'
        }
    }
}
