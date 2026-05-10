FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y python3.6 python3-pip
WORKDIR /app
COPY . .

RUN pip3 install -r requirements.txt

EXPOSE 8000

CMD python3.6 manage.py makemigrations && \
    python3.6 manage.py migrate && \
    python3.6 manage.py runserver 0.0.0.0:8000
