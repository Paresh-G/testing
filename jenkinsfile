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
        
                stage('clean'){
            steps {
                sh "mvn clean"
            }
        }
        
        stage('build'){
            steps {
                sh "mvn validate"
            }
        }
        
                stage('compile'){
            steps {
                sh "mvn compile"
            }
        }
        
                stage('test'){
            steps {
                sh "mvn test"
            }
        }
        
                stage('package'){
            steps {
                sh "mvn package"
            }
        }
    }
}
