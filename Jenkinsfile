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
  }
}   
