pipeline {
  agent any

  tools {
    maven '602-maven'
    jdk '602-java'
  }

  environment {
    DOCKER_PASSWORD = credentials('602-docker')
    GIT_PASSWORD = credentials('602-git')
  }



  stages {
    stage('Git clone') {
          steps {
            git url: 'https://github.com/WonKyuLee21/spring-petclinic.git/',
            branch: 'main',
            credentialsId: '602-git'
          }
      }
    
      stage('Maven Build') {
        steps {
          sh 'mvn -Dmaven.test.failure.ignore=true clean package'          
        }
      }

    
    stage('Docker Image Build') {
  steps {
    dir("${env.WORKSPACE}") {
      sh """
        docker build --no-cache -t wonkyulee21/spring-petclinic:${BUILD_NUMBER} .
        docker push wonkyulee21/spring-petclinic:${BUILD_NUMBER}
      """
    }
  }
}

    stage ('Docker Login') {
      steps {
        sh """
        echo $DOCKER_PASSWORD_PSW | docker login -u $DOCKER_PASSWORD_USR --password-stdin
        docker push wonkyulee21/spring-petclinic:${BUILD_NUMBER}
        """
      }
    }

    stage('k8s deploy') {
  steps {
    withKubeConfig([credentialsId: '602-kube']) {
      sh """
      cd was
      kubectl apply -f deployment.yaml
      """
    }
  }
}  

    stage ('Docker Image Remove') {
      steps {
        sh """
        docker images
        docker rmi wonkyulee21/spring-petclinic:${BUILD_NUMBER}
        """          
      }
    }
  }
}

