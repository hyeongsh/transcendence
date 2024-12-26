# Python 이미지 설정
FROM python:3.11-slim

# 작업 디렉터리 설정
WORKDIR /project

# 의존성 복사 및 설치
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 포트 오픈
EXPOSE 8000

# 기본 명령어 (프로젝트 없으면 생성)
CMD ["sh", "-c", "test -f manage.py || django-admin startproject test_app . && python manage.py runserver 0.0.0.0:8000"]
