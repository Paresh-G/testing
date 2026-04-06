pipeline {
    agent any

    tools {
        maven 'maven-3.9.14'
        jdk 'java-21'
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
                sh "mvn clean install"
            }
        }
              stage('copy-artifact-and-run-application') {
                  steps {
                      sh '''# Optional: stop previous run if running
#!/bin/bash

sudo cp /var/lib/jenkins/workspace/my-01/target/my-demo-1.0-SNAPSHOT.jar


pkill -f *.jar || true


# Run JAR in background
nohup java -jar /opt/app/target/*.jar > /opt/app/app.log 2>&1 &'''
                  }
              }
    }
}
