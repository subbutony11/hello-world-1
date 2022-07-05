def gv
pipeline {
  agent any
  parameters {
    choice(name: 'VERSION', choices: ['1.1.0', '1.2.0', '1.3.0'], description: '')
    booleanParam(name: 'executeTests', defaultValue: 'true', description: '')
  }
  stages {
    stage('init') {
      steps {
        script {
          gv = load "script.groovy"
        }
      }
    }
    stage('build') {
      steps {
        script {
          gv.buildapp()
        }
      }
    }
  stage('test') {
    when {
      expression {
        params.executeTests
      }
    }
    steps {
      script {
        gv.testapp()
      }
    }
  }
  stage('deploy') {
    steps {
      script {
        env.ENV = input message: "Select the environment to deploy to", ok: "done", parameters:  choice (name: "ENV", choices: ['dev', 'staging', 'prod'], description:'')
        gv.deployapp()
        echo "deploying to ${ENV}"
        }
    }
  }
}
}


