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
        stage('Deploy') {
            steps {
                sh 'ssh -i "/Users/jaiprakash/.jenkins/workspace/aws_keys/my-aws-server-1-key-pair.pem" ec2-user@ec2-15-206-91-233.ap-south-1.compute.amazonaws.com "rm -r /home/ec2-user/apps/demo-mbp-django-app_main"'
                sh 'scp -i "/Users/jaiprakash/.jenkins/workspace/aws_keys/my-aws-server-1-key-pair.pem" -r /Users/jaiprakash/.jenkins/workspace/demo-mbp-django-app_main ec2-user@ec2-15-206-91-233.ap-south-1.compute.amazonaws.com:/home/ec2-user/apps'
                sh 'chmod +x /Users/jaiprakash/.jenkins/workspace/demo-mbp-django-app_main/scripts/deploy.sh'
                sh 'nohup ssh -i "/Users/jaiprakash/.jenkins/workspace/aws_keys/my-aws-server-1-key-pair.pem" ec2-user@ec2-15-206-91-233.ap-south-1.compute.amazonaws.com < /Users/jaiprakash/.jenkins/workspace/demo-mbp-django-app_main/scripts/deploy.sh &'
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
