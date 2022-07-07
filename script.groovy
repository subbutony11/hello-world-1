def buildjar() {
  echo "building the application..."
  sh 'mvn package'
}
def buildimage() {
  echo "building the docker image..."
   withCredentials([usernamePassword(credentialsId: 'docker-hub-repo', passwordVariable: 'PASS', usernameVariable: 'USER')]){
                       sh 'docker build -t subhashinikuruva/my-repo:redis-2.0 .'
                       sh "echo $PASS | docker login -u $USER --password-stdin"
                       sh 'docker push subhashinikuruva/my-repo:redis-2.0'
   }
}
def deployapp() {
  echo "deploying the application.."
  docker.withRegistry(
            'https://docker push 222882145299.dkr.ecr.ap-south-1.amazonaws.com/redis:latest',
            'ecr:ap-south-1:aws-credentials'){
             subhashinikuruva/my-repo = docker.build('redis')
             subhashinikuruva/my-repo.push('redis-1.1')
          }
  
} 
return this
