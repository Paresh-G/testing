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
    }
}
