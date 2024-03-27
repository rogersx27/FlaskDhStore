from datetime import datetime

from sqlalchemy import Column, Integer, String, DateTime
from sqlalchemy.orm import relationship

from __init__ import db
# Import the models that have a relationship with the User
from .Admins import Administrador
from .Logistic import Logistico
from .Clients import Cliente


class Usuario(db.Model):
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

    administradores = relationship(Administrador, backref='usuarios', lazy=True)
    logisticos = relationship(Logistico, backref='usuarios', lazy=True)
    clientes = relationship(Cliente, backref='usuarios', lazy=True)

    def __repr__(self):
        return f"<Usuario(id={self.id_user}, nombre={self.nombre}, apellido={self.apellido})>"
