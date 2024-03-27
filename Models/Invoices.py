from datetime import datetime

from sqlalchemy import Column, Integer, DateTime, ForeignKey
from sqlalchemy.orm import relationship

from __init__ import db
# Import the detail invoice model
from .Invoice_Details import DetalleFactura


class Facturas(db.Model):
    """
    Modelo de la tabla facturas

    Attributes
        - id_factura: int
        - id_cliente_fk: int
        - fecha_compra: datetime
    """
    __tablename__ = 'facturas'

    id_factura = Column(Integer, primary_key=True)
    id_cliente_fk = Column(Integer, ForeignKey('cliente.id_cliente'))
    fecha_compra = Column(DateTime, default=datetime.now())

    detalle_factura = relationship(DetalleFactura, backref='facturas', lazy=True)

    def __repr__(self):
        return f"<Factura(id={self.id_factura}, id_cliente={self.id_cliente_fk}, fecha={self.fecha_compra}, cedula={self.cliente.num_identificacion})>"
