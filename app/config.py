import os

class Config:
    SECRET_KEY = os.environ.get('SECRET_KEY') or 'Angulo73202647'
    SQLALCHEMY_DATABASE_URI = os.environ.get('DATABASE_URL') or \
        'postgresql://rangulot:plg-cmms-2024@localhost/flasktest'
    SQLALCHEMY_TRACK_MODIFICATIONS = False