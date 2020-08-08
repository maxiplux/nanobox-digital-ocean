FROM python:3.8-slim
#docker build -t nanobox .
ENV PYTHONUNBUFFERED 1
ENV C_FORCE_ROOT true
RUN mkdir /src
RUN mkdir /static
WORKDIR /src
ADD ./nanobox /src
RUN pip install -r requirements.pip
EXPOSE 8000
CMD python manage.py collectstatic --no-input:python manage.py  loaddata  db.json;python manage.py migrate; gunicorn nanobox.wsgi -b 0.0.0.0:8000