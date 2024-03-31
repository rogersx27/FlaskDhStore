from datetime import datetime

from sqlalchemy import Column, Integer, String, DateTime
from sqlalchemy.orm import relationship

# User session management for Flask
from flask_login import UserMixin

# Import the db object
from __init__ import db

# Import the models that have a relationship with the User
from .Admins import Administrador
from .Clients import Cliente
from .Logistic import Logistico


class Usuario(db.Model, UserMixin):
    """
    Modelo de la tabla usuarios

    Attributes
        - id_user: int
        - nombre: str
        - apellido: str
        - telefono: str
        - email: str
        - fecha_creacion: datetime
        - ciudad: str
        - pais: str
        - pssword: str
        - TOKEN: str
    """
    __tablename__ = 'usuarios'

    id_user = Column(Integer, primary_key=True)
    nombre = Column(String(50))
    apellido = Column(String(50))
    telefono = Column(String(20))
    email = Column(String(100))
    fecha_creacion = Column(DateTime, default=datetime.now())
    ciudad = Column(String(50))
    pais = Column(String(50))
    pssword = Column(String(50))
    TOKEN = Column(String(250))

    # Relationships
    administradores = relationship(Administrador, backref='usuarios', lazy=True)
    logisticos = relationship(Logistico, backref='usuarios', lazy=True)
    clientes = relationship(Cliente, backref='usuarios', lazy=True)

    # Methods
    def check_password(self, password):
        return self.pssword == password
    def get_id(self):
        return self.id_user

    def is_authenticated(self):
        return True

    def is_active(self):
        return True

    def is_anonymous(self):
        return False

    def __repr__(self):
        return f"<Usuario(id={self.id_user}, nombre={self.nombre}, apellido={self.apellido})>"
