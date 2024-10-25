pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'greet-app'
        DOCKER_TAG = 'latest'
        REGISTRY = 'your-docker-registry-url'
        REGISTRY_CREDENTIALS = 'your-credentials-id'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${DOCKER_IMAGE}:${DOCKER_TAG}")
                }
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    // Run container for testing
                    def app = docker.run("-d -p 8080:8080 ${DOCKER_IMAGE}:${DOCKER_TAG}")
                    
                    // Wait for the app to be ready
                    sleep 5

                    // Test /greet endpoint with a name
                    sh 'curl -f "http://localhost:8080/greet?name=TestUser" | grep "Hello TestUser!"'

                    // Test /greet endpoint without a name
                    sh 'curl -f "http://localhost:8080/greet" | grep "Now everyone can be a hero..."'

                    // Test /health endpoint
                    sh 'curl -f "http://localhost:8080/health" | grep "\"status\": \"ok\""'

                    // Stop the container
                    app.stop()
                }
            }
        }

        stage('Push to Docker Registry') {
            steps {
                script {
                    docker.withRegistry("https://${REGISTRY}", "${REGISTRY_CREDENTIALS}") {
                        docker.image("${DOCKER_IMAGE}:${DOCKER_TAG}").push()
                    }
                }
            }
        }
    }

    post {
        always {
            script {
                // Clean up any stopped containers
                sh "docker ps -a -q --filter 'status=exited' | xargs -r docker rm"
            }
        }
    }
}
