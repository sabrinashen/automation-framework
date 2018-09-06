pipeline {
    agent { label 'docker' }
    stages {
    		stage('set docker compose path') {
            withEnv(["PATH=$PATH:~/.local/bin"]){
                    sh "bash test.sh"
                }
        }   
        
        stage('selenium grid up') {
            steps {
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