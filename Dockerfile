FROM python:3.8
#docker build -t nanobox .
#docker tag 7c793ead4dcd   maxiplux/nanobox
#docker push    maxiplux/nanobox
ENV PYTHONUNBUFFERED 1
ENV C_FORCE_ROOT true
RUN mkdir /src
WORKDIR /src
RUN mkdir static
ADD ./nanobox /src
RUN pip install -r requirements.pip
RUN python manage.py collectstatic --noinput
EXPOSE 80
#
CMD python manage.py migrate;python manage.py loaddata  db.json;python manage.py runserver 0.0.0.0:80
