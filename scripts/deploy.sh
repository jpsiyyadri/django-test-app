# ssh -i "/Volumes/My Drive/codebases/projects/secrets/DevthJestAWS/my-aws-server-1-key-pair.pem" ec2-user@ec2-15-206-91-233.ap-south-1.compute.amazonaws.com <<"ENDSSH"
ssh -i "/Users/jaiprakash/.jenkins/workspace/aws_keys/my-aws-server-1-key-pair.pem" ec2-user@ec2-15-206-91-233.ap-south-1.compute.amazonaws.com "rm -r /home/ec2-user/apps/demo-mbp-django-app_main"
scp -i "/Users/jaiprakash/.jenkins/workspace/aws_keys/my-aws-server-1-key-pair.pem" -r /Users/jaiprakash/.jenkins/workspace/demo-mbp-django-app_main ec2-user@ec2-15-206-91-233.ap-south-1.compute.amazonaws.com:/home/ec2-user/apps
cd apps/demo_app
sudo pkill -f manage.py
sudo nohup python3 manage.py runserver 0.0.0.0:80 > output.log &
