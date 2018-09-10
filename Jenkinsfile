pipeline {
  agent any
  environment {
    // docker path: /usr/local/bin
    // bundle path: /Users/ericyang/.rbenv/shims
    PATH = "$PATH:/usr/local/bin:/Users/ericyang/.rbenv/shims"
  }
    
  stages {
    stage('docker-compose up') {
      steps {
        //step([$class: 'DockerComposeBuilder', dockerComposeFile: 'docker-compose.yml', option: [$class: 'StartService', scale: 5, service: 'chrome'], useCustomDockerComposeFile: true])
      	sh 'sudo docker-compose up -d'
      	sh 'sudo docker-compose scale chrome=5'
      	sh 'sudo docker ps -a'
      }
    }
      
    stage('run script') {
      steps {
      	//catchError {
            sh 'bundle install'
        		sh 'bundle exec parallel_rspec test/'
        //}
        //echo currentBuild.result
      }
    }
    
     //stage('selenium grid down') {
       //steps {
         //sh 'echo "shut down selenium grid"'
   	     //sh 'sudo docker-compose down'
   	     ////step([$class: 'DockerComposeBuilder', dockerComposeFile: 'docker-compose.yml', option: [$class: 'StopAllServices'], useCustomDockerComposeFile: true])
       //}
     //}
  }
  
  post {
	always {
		echo 'selenium grid down'
		sudo docker-compose down
  	}
  }
}