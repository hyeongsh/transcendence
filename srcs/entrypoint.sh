#!/bin/bash

cd /project

apt-get update && apt-get upgrade -y
apt-get install -y procps

pip install --no-cache-dir -r /home/requirements.txt
test -f manage.py || django-admin startproject mysite .
mkdir -p /logs
touch /logs/django.log
chmod 755 /logs/django.log

tail -f /logs/django.log

#python3 manage.py runserver 0.0.0.0:8000