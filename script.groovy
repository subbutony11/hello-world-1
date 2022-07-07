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
  echo "deploying the application..."
  docker.withRegistry(
            'aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 222882145299.dkr.ecr.ap-south-1.amazonaws.com',
            'docker push 222882145299.dkr.ecr.ap-south-1.amazonaws.com/redis:latest'){
            def subhashinikuruva/my-repo = docker.build('redis')
            subhashinikuruva/my-repo('docker tag redis:latest 222882145299.dkr.ecr.ap-south-1.amazonaws.com/redis:latest')
        }
  
} 
return this
