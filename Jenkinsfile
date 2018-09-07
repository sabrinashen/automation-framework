//variables
def network='jenkins-${BUILD_NUMBER}'
def seleniumHub='selenium-hub-${BUILD_NUMBER}'
def chrome='chrome-${BUILD_NUMBER}'
def firefox='firefox-${BUILD_NUMBER}'
def containertest='conatinertest-${BUILD_NUMBER}'

pipeline {
    agent { label 'docker' && 'docker-compose' }
    
    environment {
        PATH = "$PATH:/usr/local/bin:/Users/ericyang/.rbenv/shims"
    }
    
    stages {
    		stage('setup selenium grid') {
    			sh "docker network create ${network}"
    			sh "docker run -d -p 4444:4444 --name ${seleniumHub} --network ${network} selenium/hub"
    			sh "docker run -d -e HUB_PORT_4444_TCP_ADDR=${seleniumHub} -e HUB_PORT_4444_TCP_PORT=4444 --network ${network} --name ${chrome} selenium/node-chrome"
    			sh "docker run -d -e HUB_PORT_4444_TCP_ADDR=${seleniumHub} -e HUB_PORT_4444_TCP_PORT=4444 --network ${network} --name ${firefox} selenium/node-firefox"
    		}
        
        stage('run script') {
        		steps {
        			sh 'bundle install'
        			sh 'bundle exec parallel_rspec test/'
        		}
        }
        
        stage('selenium grid down') {
        		steps {
        			sh "docker rm -vf ${chrome}"
             	sh "docker rm -vf ${firefox}"
             	sh "docker rm -vf ${seleniumHub}"
             	sh "docker network rm ${network}"
        		}
        
        }
    }
}