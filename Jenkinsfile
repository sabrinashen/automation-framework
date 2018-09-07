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
        sh 'echo "run script - null steps"'
        // sh 'bundle install'
        // sh 'bundle exec parallel_rspec test/'
      }
    }
    
    // stage('selenium grid down') {
    //   steps {
    //     sh 'echo "shut down selenium grid"'
    //     step([$class: 'DockerComposeBuilder', dockerComposeFile: 'docker-compose.yml', option: [$class: 'StopAllServices'], useCustomDockerComposeFile: true])
    //   }
    // }
  }
}