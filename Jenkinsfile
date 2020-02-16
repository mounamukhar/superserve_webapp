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
		sh 'docker build -t edureka-devop-finalproject-$BUILD_NUMBER .'
		sh 'docker run -d -p 5000:8888 edureka-devop-finalproject-$BUILD_NUMBER'
            }
	   when {
           expression { sh script: '''if [ netstat -an | grep 5000 ]; then true; else false; fi''', returnStatus: true } 
           }
           steps {
               echo 'Deployment successful!'
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
    

