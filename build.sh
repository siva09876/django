#!/bin/basj
# Build the project

echo "Building the project..."
python3.9 -m pip install -r requirements.txt

echo "Collect Static..."
python3.9 manage.py collectstatic --noinput --clear

echo "Make Migrations..."
python3.9 manage.py makemigrations --noinput
python3.9 manage.py migrate --noinput



gunicorn student.wsgi:application --bind 0.0.0.0:$PORT
