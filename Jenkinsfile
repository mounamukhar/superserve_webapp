pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building Gradle Project..'
		sh './gradlew build'
            }
        }
        stage('Test') {
            steps {
                echo 'Unit Testing with Gradle..'
		sh './gradlew task compileTestJava'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}

