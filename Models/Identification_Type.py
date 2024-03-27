from sqlalchemy import Column, Integer, String
from sqlalchemy.orm import relationship

from __init__ import db
# Import the client model
from .Clients import Cliente

class Tipo_Identificacion(db.Model):
    """
    Modelo de la tabla tipo_identificacion

    Attributes
        id_tipo_identificacion: int
        tipo_identificacion: str
    """
    __tablename__ = 'tipo_identificacion'

    id_identificacion = Column(Integer, primary_key=True)
    tipo_identificacion = Column(String(10))

    clientes = relationship(Cliente, backref='tipo_identificacion', lazy=True)

    def __repr__(self):
        return f"<Tipo_Identificacion(Tipo={self.tipo_identificacion}, id={self.id_identificacion})>"
