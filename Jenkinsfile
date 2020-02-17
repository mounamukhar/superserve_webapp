pipeline {
    environment {
    	registry = "mounamukhar/edureka-mouna"
    	registryCredential = 'docker-hub'
    	dockerImage = ''
    } 
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
		sh 'docker build -t mounamukhar/edureka-mouna:$BUILD_NUMBER .'
		sh 'docker run -d -p 5000:8888 mounamukhar/edureka-mouna:$BUILD_NUMBER'
	    }
        }
	stage('Test Deployment') {	   
	   when {
           expression { sh script: '''if [ netstat -an | grep 5000 ]; then true; else false; fi''', returnStatus: true }
           }
           steps {
               echo 'Deployment successful!'
           }
	}
	stage ('UAT'){
	    steps {
		echo 'Starting UAT Selenium script execution...'
	    	build job: '/finalProject-UAT'
	    }	
	  
	}
	stage('Deploy Image') {
      steps{
        script {
		
          docker.withRegistry( '', registryCredential ) {
		dockerImage = "mounamukhar/edureka-mouna" + ":$BUILD_NUMBER"
            	dockerImage.push()
          }
        }
      }
    }
        stage('Clean up') {
            steps {
                echo 'Clean up being done....'
		sh 'docker rmi mounamukhar/edureka-mouna:$BUILD_NUMBER'
                cleanWs()
            }
        }
    }
}
    
