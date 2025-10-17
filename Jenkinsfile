pipeline {
  agent any

  tools {
    maven 'M3'
    jdk 'JDK'
  }

  stages {
    // GitHub Clone
    stage('Git clone') {
          steps {
            git url: 'https://github.com/sjh4616/spring-petclinic.git/', branch: 'main'
          }
      }
    
      // Maven Build
      stage('Maven Build') {
        steps {
          sh 'mvn -Dmaven.test.failure.ignore=true clean package'
          
        }
      }

    // Docker Image 생성
    stage('Docker Image Build') {
      steps{
        dir("${env.WORKSPACE}") {
          sh """
          docker build -t wonkyulee21/spring-petclinic:$BUILD_NUMBER .
          docker tag wonkyulee21/spring-petclinic:$BUILD_NUMBER s4616/spring-petclinic:latest
  
      }
    }
  }
}
