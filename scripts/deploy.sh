# ssh -i "/Volumes/My Drive/codebases/projects/secrets/DevthJestAWS/my-aws-server-1-key-pair.pem" ec2-user@ec2-15-206-91-233.ap-south-1.compute.amazonaws.com <<"ENDSSH"

cd apps/demo_app
sudo pkill -f manage.py
sudo nohup python3 manage.py runserver 0.0.0.0:80 > output.log &
