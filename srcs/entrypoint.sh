#!/bin/bash

cd /project

pip install --no-cache-dir -r /home/requirements.txt
test -f manage.py || django-admin startproject app .

python3 manage.py runserver 0.0.0.0:8000
