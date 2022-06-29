#!/usr/share/maven groovy
pipeline {
  agent any
  tools {
    maven 'Maven'
  stages {
    stage('build') {
      steps {
      script {
        echo 'building the app'
        sh 'mvn package'
      }
    }
  }stage('deploy') {
      steps {
      script {
        echo 'deploying the app'
      }
    }
  }
  }
}
}
