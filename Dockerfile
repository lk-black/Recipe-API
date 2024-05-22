FROM python:3.10-alpine

ENV PYTHONUNBUFFERED 1

COPY ./app /app

WORKDIR /app 

RUN python -m venv /venv && /venv/bin/pip install --upgrade pip && \
    apk add --update --no-cache postgresql-client jpeg-dev && \
    apk add --update --no-cache --virtual .tmp-build-deps \
        build-base postgresql-dev musl-dev zlib zlib-dev && \
    adduser \
        --disable-password \
        --no-create-home \
        django-user && \
    mkdir -p /vol/web/media && \
    mkdir -p /vol/web/static && \
    chow -R django-user:django-user /vol && \
    chown -R 755 /vol

COPY requirements.txt .
RUN pip install -r requirements.txt && \
    apk del .tmp-build-deps

CMD ["python3","manage.py","runserver"]
