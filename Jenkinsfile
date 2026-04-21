pipeline {
    agent any
    tools {
        jdk 'JDK21' 
        maven 'Maven3'
    }
    stages {
        stage('Build & Test') {
            steps {
                bat 'mvn clean test' 
            }
        }
        stage('Docker build and Run') {
			steps {
				bat 'docker build -t my-docker-app .'
				bat 'docker run my-docker-app'
			}
		}
    }
    post {
        always {
            junit '**/target/surefire-reports/*.xml'
            archiveArtifacts artifacts: 'target/site/jacoco/**', fingerprint: true
        }
    }
}