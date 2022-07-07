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
          withEnv (["AWS_ACCESS_KEY-ID-$(env.AWS_ACCESS_KEY_ID)",AWS_SECRET_ACESS_KEY-$(env.AWS_SECRET_ACCESS_KEY)", AWS_DEFAULT_REGION-${env.AWS_DEFAULT_REGION}"]){
            sh 'aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 222882145299.dkr.ecr.ap-south-1.amazonaws.com'
            sh 'docker build -t redis .'
            sh 'docker tag redis:latest 222882145299.dkr.ecr.ap-south-1.amazonaws.com/redis:latest'
            sh 'docker push 222882145299.dkr.ecr.ap-south-1.amazonaws.com/redis:latest'
          }
        }
       }
    }
  }
}
