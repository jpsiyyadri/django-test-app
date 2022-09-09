cd apps/demo-mbp-django-app_main
npm install
sudo pkill -f manage.py
sudo nohup python3 manage.py runserver 0.0.0.0:80 > output.log & 
