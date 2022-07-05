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
        }
       }
    }
  }
}
