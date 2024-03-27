from sqlalchemy import Column, Integer, Float, String, ForeignKey

from __init__ import db


class DetalleFactura(db.Model):
    """
    Modelo de la tabla detalle_factura

    Attributes
        - id_detalle: int
        - id_factura_fk: int
        - cod_producto_fk: int
        - cantidad: int
    """
    __tablename__ = 'detalle_factura'

    id_detalle = Column(Integer, primary_key=True)
    id_factura_fk = Column(Integer, ForeignKey('facturas.id_factura'))
    cod_producto_fk = Column(String(50), ForeignKey('productos.cod_producto'))
    cantidad = Column(Integer)
    precio_total = Column(Float)

    def __repr__(self):
        return f"<Detalle_Factura(id={self.id_detalle}, id_factura={self.id_factura_fk}, id_producto={self.cod_producto_fk}, cantidad={self.cantidad})>"
