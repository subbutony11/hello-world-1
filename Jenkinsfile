#!/usr/bin/env groovy
pipeline {
  agent any
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
