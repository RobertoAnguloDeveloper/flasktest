import os

class Config:
    SQLALCHEMY_DATABASE_URI = os.environ.get('DATABASE_URL') or \
        'postgresql://postgres:plg-cmms-2024@localhost/flasktest'
    SQLALCHEMY_TRACK_MODIFICATIONS = False