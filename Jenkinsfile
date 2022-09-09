pipeline {
    agent any
    options {
        // This is required if you want to clean before build
        skipDefaultCheckout(true)
    }
    environment {
        WORKSPACE_DIR = "/Users/jaiprakash/.jenkins/workspace"
        AWS_SECRET_KEY = "aws_keys/my-aws-server-1-key-pair.pem"
        HOST_USER = "ec-2"
        HOST = "ec2-15-206-91-233.ap-south-1.compute.amazonaws.com"
        DESTINATION_FOLDER = "/home/ec2-user/apps"

    }
    stages {
        stage('Build') {
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
                sh 'ssh -i "${WORKSPACE_DIR}/${AWS_SECRET_KEY}" ec2-user@ec2-15-206-91-233.ap-south-1.compute.amazonaws.com "if [ -f ${DESTINATION_FOLDER}/demo-mbp-django-app_main ]; then rm -r ${DESTINATION_FOLDER}/demo-mbp-django-app_main fi"'
                sh 'scp -i "${WORKSPACE_DIR}/${AWS_SECRET_KEY}" -r ${WORKSPACE_DIR}/demo-mbp-django-app_main ${HOST_USER}@${HOST}:${DESTINATION_FOLDER}'
                sh 'chmod +x ${WORKSPACE_DIR}/demo-mbp-django-app_main/scripts/deploy.sh'
                sh 'ssh -i "${WORKSPACE_DIR}/${AWS_SECRET_KEY}" ec2-user@ec2-15-206-91-233.ap-south-1.compute.amazonaws.com < ${WORKSPACE_DIR}/demo-mbp-django-app_main/scripts/deploy.sh &'
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
