FROM postgres:15.1

WORKDIR /code

RUN mkdir /backups

RUN apt-get update -y && apt-get install -y python3.10 pip

COPY requirements.txt .

RUN apt-get install -y --reinstall libpq-dev
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY . .

EXPOSE 5432

CMD ["python3", "backup.py"]