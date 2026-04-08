pipeline {
    agent any

    tools {
        maven 'maven-3.9.14'
        jdk 'java-17'
    }

    stages {
        stage('scm checkout') {
            steps {
                // Get some code from a GitHub repository
                // git 'https://github.com/jglick/simple-maven-project-with-tests.git'
                
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Paresh-G/testing.git']])
            }
        }
        
                stage('build'){
            steps {
                sh "mvn clean package"
            }
        }

                        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('sonar') {
                        sh """
                          mvn sonar:sonar \
                         -Dsonar.projectKey=maven-project \
                         -Dsonar.host.url=http://52.66.109.101:9000 \
                         -Dsonar.login=sqp_797027cace899304759e4e01ca652fe7ca55e22f
                       """
                }
            }
        }

        
       stage('artifact-repository') {
           steps {
               sh '''
                 aws s3 cp target/*.jar s3://sayli-paresh/my-demo-${BUILD_NUMBER}.jar
              '''
          }
       }
    }
}
