from sqlalchemy import Column, Integer, String, ForeignKey
from sqlalchemy.orm import relationship

from __init__ import db
# Import the detail invoice model
from .Invoice_Details import Detalle_Factura


class Productos(db.Model):
    """
    Modelo de la tabla productos

    Attributes
        - cod_product: str
        - producto: str
        - id_categoria_fk: int
        - precio_unitario: float
        - imgURL: str
    """
    __tablename__ = 'productos'

    cod_producto = Column(String(50), primary_key=True, autoincrement=False)
    producto = Column(String(50))
    id_categoria_fk = Column(Integer, ForeignKey('categorias.id_categoria'))
    precio_unitario = Column(Integer)
    imgURL = Column(String(250))

    detalle_factura = relationship(Detalle_Factura, backref='productos', lazy=True)

    def __repr__(self):
        return f"<Producto(id={self.cod_producto}, nombre={self.producto}, id_categoria={self.id_categoria_fk})>"
