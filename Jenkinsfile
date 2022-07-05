pipeline {
  agent any
  tools {
    maven 'maven-3.6'
  }
  stages {
    stage("build jar") {
      steps {
        script {
          echo "building the application.."
          sh 'mvn package'
        }
      }
    }
    stage("build image") {
      steps {
        script {
          echo "building the docker image.."
          withCredentials([usernamePassword(credentialsId: '2d13e999-f0d8-44c3-bc24-e360ced7d2e7', passwordVariable: 'PASS', usernameVariable: 'USER')]){
                       sh 'docker build -t subhashinikuruva/my-repo:redis-2.0 .'
                       sh "echo $PASS | docker login -u $USER --password-stdin"
                       sh 'docker push subhashinikuruva/my-repo:redis-2.0'
          }
        }
      }
    }
    stage("deploy") {
       steps {
        script {
         echo "Deploying the application.."
        }
       }
    }
  }
}
