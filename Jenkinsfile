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
            'aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 222882145299.dkr.ecr.ap-south-1.amazonaws.com',
            'docker push 222882145299.dkr.ecr.ap-south-1.amazonaws.com/redis:latest'){
            def subhashinikuruva/my-repo = docker.build('redis')
            subhashinikuruva/my-repo('docker tag redis:latest 222882145299.dkr.ecr.ap-south-1.amazonaws.com/redis:latest')
          }
        }
       }
    }
  }
}
