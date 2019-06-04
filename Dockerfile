FROM python:3.7

RUN apt-get update
RUN apt-get install -y --no-install-recommends \
        libatlas-base-dev gfortran nginx supervisor

RUN pip3 install uwsgi

COPY ./requirements.txt /home/host/requirements.txt

RUN pip3 install -r /home/host/requirements.txt

RUN useradd --no-create-home nginx

RUN rm /etc/nginx/sites-enabled/default
RUN rm -r /root/.cache

COPY nginx.conf /etc/nginx/
COPY flask-site-nginx.conf /etc/nginx/conf.d/
COPY uwsgi.ini /etc/uwsgi/
COPY supervisord.conf /etc/supervisor/conf.d/

COPY . /home/host

WORKDIR /home/host

CMD ["sh","-c", "/usr/bin/supervisord && 'while :; do sleep 6h & wait $${!}; nginx -s reload; done'"]
