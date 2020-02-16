pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Compile Gradle Project..'
		sh './gradlew task compileJava'
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
		sh 'docker build -t edureka-devop-finalproject .'
		sh 'docker run -d -p 5000:8888 deploy-container-$BUILD_NUMBER'
            }
        }
	stage('Clean up') {
	    steps {
		echo 'Clean up being done....'
		cleanWs()	
	    }
	}
    }
}
    

