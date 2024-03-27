from sqlalchemy import Column, Integer, String, ForeignKey
from sqlalchemy.orm import relationship

from __init__ import db
# Import the invoice model
from .Invoices import Facturas

class Cliente(db.Model):
    """
    Modelo de la tabla clientes

    Attributes
        - id_cliente: int
        - id_user_fk: int
        - id_identificacion_fk: int
        - num_identificacion: int
        - direccion: str
    """
    __tablename__ = 'cliente'

    id_cliente = Column(Integer, primary_key=True)
    id_user_fk = Column(Integer, ForeignKey('usuarios.id_user'))
    id_identificacion_fk  = Column(Integer, ForeignKey('tipo_identificacion.id_identificacion'))
    num_identificacion = Column(Integer)
    direccion = Column(String(250))

    facturas = relationship(Facturas, backref='cliente', lazy=True)

    def __repr__(self):
        return f"<Cliente(id={self.id_cliente}, nombre={self.usuarios.nombre}, apellido={self.usuarios.apellido}, documento={self.tipo_identificacion.tipo_identificacion})>"