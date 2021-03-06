sudo rm /etc/nginx/sites-enabled/default
sudo rm /etc/nginx/sites-enabled/test.conf
sudo ln -s /home/box/web/etc/nginx.conf /etc/nginx/sites-enabled/test.conf
sudo /etc/init.d/nginx restart

sudo rm /etc/gunicorn.d/test
sudo rm /etc/gunicorn.d/ask
sudo ln -s /home/box/web/etc/gunicorn_ask.conf /etc/gunicorn.d/ask
sudo /etc/init.d/gunicorn restart

sudo /etc/init.d/mysql start
mysql -uroot -e "create database if not exists qa"

sudo /home/box/web/ask/manage.py makemigrations qa
sudo /home/box/web/ask/manage.py migrate
