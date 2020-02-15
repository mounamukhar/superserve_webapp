pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building Gradle Project..'
		sh './gradlew clean build -x test'
            }
        }
        stage('Test') {
            steps {
                echo 'Unit Testing with Gradle..'
		sh './gradlew task test'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
	stage('Clean up') {
	    steps {
		echo 'Clean up being done....'
		sh 'cleanWs()'	
	    }
	}
    }
}

