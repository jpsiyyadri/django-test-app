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
                sh 'ssh -i "/Volumes/My Drive/codebases/projects/secrets/DevthJestAWS/my-aws-server-1-key-pair.pem" ec2-user@ec2-15-206-91-233.ap-south-1.compute.amazonaws.com < Volumes/My Drive/codebases/projects/secrets/DevthJestAWS/apps/demo_app/deploy.sh'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
    /*post {
        // Clean after build
        always {
            cleanWs(cleanWhenNotBuilt: false,
                    deleteDirs: true,
                    disableDeferredWipeout: true,
                    notFailBuild: true,
                    patterns: [[pattern: '.gitignore', type: 'INCLUDE'],
                            [pattern: '.propsfile', type: 'EXCLUDE']])
        }
    }*/
}
