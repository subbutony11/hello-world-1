#!/usr/bin/env groovy
pipeline {
  agent any
  tools {
    mvn 'Maven'
  }
  stages {
    stage('test') {
      steps {
      script {
        echo 'testing the app'
      }
    }
  }stage('build') {
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
