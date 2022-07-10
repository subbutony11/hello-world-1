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
  withEnv (["AWS_ACCESS_KEY_ID=${env.AWS_ACCESS_KEY_ID}","AWS_SECRET_ACCESS_KEY=${env.AWS_SECRET_ACCESS_KEY}", "AWS_DEFAULT_REGION=${env.AWS_DEFAULT_REGION}"]){
            sh 'docker login -u dXNlcm5hbWU AWS -p cGFzc3dvcmQ  $(aws ecr get-login-password --region ap-south-1)  222882145299.dkr.ecr.ap-south-1.amazonaws.com' 
            sh 'docker build -t redis .'
            sh 'docker tag redis:latest:""$BUILD_ID""'
            sh 'docker push 222882145299.dkr.ecr.ap-south-1.amazonaws.com/redis:""$BUILD_ID""latest'
            }
  
}
return this
