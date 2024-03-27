"""
This file is used to initialize the Flask application and the database.
The app object is created and configured with the config.py file.
"""

from flask import Flask
from flask_sqlalchemy import SQLAlchemy


app = Flask(__name__)
app.config.from_pyfile('config.py')
db = SQLAlchemy(app)