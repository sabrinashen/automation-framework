pipeline {
    agent { label 'docker' && 'docker-compose' }
    
    environment {
        PATH = "$PATH:/usr/local/bin"
    }
    
    stages {
    		stage('Restart docker-compose with new version'){
            steps{
                script {
                    sh 'docker-compose --version'
                }
            }
        }
		
		stage('docker-compose up') {
			step([$class: 'DockerComposeBuilder', dockerComposeFile: 'docker-compose.yml', option: [$class: 'StartAllServices'], useCustomDockerComposeFile: true])
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