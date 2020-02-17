pipeline {
    agent any

    stages {
	stage('Clean up') {
            steps {
                echo 'Clean up being done....'
                docker stop $(docker ps -a -q)
                docker rm $(docker ps -a -q)
                cleanWs()
            }
        }
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
        }
	stage('Test Deployment') {	   
	   when {
	   sleep 15
           expression { sh script: '''if [ netstat -an | grep 5000 ]; then true; else false; fi''', returnStatus: true }
           }
           steps {
               echo 'Deployment successful!'
           }
	}
	
    }
}
    

