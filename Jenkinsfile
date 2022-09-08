pipeline {
    agent any
    options {
        // This is required if you want to clean before build
        skipDefaultCheckout(true)
    }
    stages {
        stage('Clone git code') {
            /* steps {
                git branch: "main",
                credentialsId: "github-credentials",
                url: "git@github.com:jpsiyyadri/demo-jenkins-git-pipeline.git"
            } */
            steps {
                // Clean before build
                cleanWs()
                // We need to explicitly checkout from SCM here
                checkout scm
                echo "Building ${env.JOB_NAME}..."
            }
        }
        stage('Copy code') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
