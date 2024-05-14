FROM python:3.10-alpine

ENV PYTHONUNBUFFERED 1

COPY ./app /app
WORKDIR /app
RUN python3 -m venv ./ && pip install --upgrade pip 

COPY requirements.txt .

RUN pip install -r requirements.txt
CMD ["python3","manage.py","runserver"]