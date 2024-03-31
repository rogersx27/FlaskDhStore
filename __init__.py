"""
This file is used to initialize the Flask application and the database.
The app object is created and configured with the config.py file.
"""

from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_login import LoginManager

# Create the Flask app and configure it with the config.py file.
app = Flask(__name__)
# Configure the app with the config.py file.
app.config.from_pyfile('config.py')
app.secret_key = 'superSecretKey123'
app.debug = True

# Create the SQLAlchemy object
db = SQLAlchemy(app)

# Create the login manager object
login_manager = LoginManager(app)
# Configure the login manager messages and the login view.
login_manager.login_view = 'login'
login_manager.login_message = 'Necesitas iniciar sesión para acceder a esta página.'
login_manager.login_message_category = 'error'
