#!/bin/bash

cd /project

RUN apt-get update && apt-get upgrade -y

pip install --no-cache-dir -r /home/requirements.txt
test -f manage.py || django-admin startproject app .

python3 manage.py runserver 0.0.0.0:8000
