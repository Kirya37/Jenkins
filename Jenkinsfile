node{
    echo 'Jenkins stores only the last 7 builds and does not allow to run 2 jobs at a time!'
    properties([buildDiscarder(logRotator(artifactNumToKeepStr: '7', numToKeepStr: '7')), disableConcurrentBuilds()])
    stage('SCM Checkout'){
        echo '1 - Github Check'
      git credentialsId: 'Git-key', url: 'https://github.com/Kirya37/Jenkins'
      echo '2 - Github is available'
   }
    stage('Build Docker Image'){
        echo '3 - Build Docker Image'
        sh 'docker build -t 37kirya/site:v1 .'
        echo '4 - Docker Image has created'
   }
    stage('Push Docker Image'){
        echo '5 - Push Docker Image'
        withCredentials([string(credentialsId: 'DockerHub-key', variable: 'DockerHubPwd')]) {
        sh "docker login -u 37kirya -p ${DockerHubPwd}"
        echo '6 - Docker Image has pushed to a Docker Hub Service'
     }
     sh 'docker push 37kirya/site:v1'
   }
   stage('Run Container on Staging Server'){
       echo '7 - Run Container on Staging Server'
       sshagent(['AWS-key3']) {
       sh "ssh -o StrictHostKeyChecking=no ubuntu@172.31.44.226 \'docker run -d -p 0:80 37kirya/site:v1 && wget -qO- eth0.me\'"
       echo '8 - Enter this IP address and the port you selected'
       }
   }
 }
