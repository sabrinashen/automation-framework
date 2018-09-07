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
 				step([$class: 'DockerComposeBuilder', dockerComposeFile: 'docker-compose.yml', option: [$class: 'StartService', scale: 5, service: 'chrome'], useCustomDockerComposeFile: true])
 			}
 		}
        
        stage('run script') {
        		steps {
        			step([$class: 'DockerBuilderControl', option: <object of type com.nirima.jenkins.plugins.docker.builder.DockerBuilderControlOptionRun>])
				step([$class: 'DockerBuilderControl', option: [$class: 'DockerBuilderControlOptionStart', cloudName: '', containerId: 'selenium-hub']])
				
        		}
        }
        
        stage('selenium grid down') {
        		steps {
        			sh 'echo "shut down selenium grid"'
        			step([$class: 'DockerComposeBuilder', dockerComposeFile: 'docker-compose.yml', option: [$class: 'StopAllServices'], useCustomDockerComposeFile: true])
        		}
        
        }
    }
}