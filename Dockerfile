FROM python:3.7-alpine
LABEL name Serhan

ENV PYTHONUNBUFFERED 1
COPY ./requirements.txt /requirements.txt

RUN apk update
RUN apk add postgresql-dev gcc python3-dev musl-dev jpeg-dev zlib-dev
RUN pip install --upgrade pip
RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D user   
USER user