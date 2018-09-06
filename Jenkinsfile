pipeline {
	environment {
        PATH = "$PATH:/usr/local/bin"
    }
    
    agent { label 'docker' }
    
    stages {

        stage('selenium grid up') {
            steps {
            		sh 'echo $PATH'
                sh 'echo "setup selenium grid"'
                sh 'docker-compose up -d'
                sh 'docker-compose scale chrome=4'
            }
        }
        
        stage('run script') {
        		steps {
        			sh 'bundle exec parallel_rspec test/'
        		}
        }
        
        stage('selenium grid down') {
        		steps {
        			sh 'echo "shut down selenium grid"'
        			sh 'docker-compose down'
        		}
        
        }
    }
}