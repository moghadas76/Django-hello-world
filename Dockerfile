FROM python:3.6-slim

MAINTAINER seyed

ADD . /usr/src/app

WORKDIR /usr/src/app

COPY requirements.txt ./
#RUN pip3 install --upgrade pip
# Get pip to download and install requirements:
RUN pip3 install --default-timeout=3000 --no-cache-dir -r requirements.txt
# Expose ports
EXPOSE 8000
# default command to execute    
CMD exec gunicorn djangoapp.wsgi:application --bind 0.0.0.0:8000 --workers 3

