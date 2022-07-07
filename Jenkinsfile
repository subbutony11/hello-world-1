def gv
pipeline {
  agent any
  tools {
    maven 'maven-3.6'
  }
  stages {
    stage('init') {
      steps {
        script {
          gv = load "script.groovy"
        }
      }
    }
    
    stage("build jar") {
      steps {
        script {
          gv.buildjar()
         }
      }
    }
    stage("build image") {
      steps {
        script {
          gv.buildimage()
        }
      }
    }
    stage("deploy") {
       steps {
        script {
         gv.deployapp()
          docker.withRegistry(
            'https://docker push 222882145299.dkr.ecr.ap-south-1.amazonaws.com/redis:latest',
            'ecr:ap-south-1:aws-credentials'){
              redis-1.1 = docker.build('subhashinikuruva/my-repo')
             redis-1.1.push('latest')
          }
        }
       }
    }
  }
}
