from sqlalchemy import Column, Integer, String
from sqlalchemy.orm import relationship

from __init__ import db
# Import the Products model
from .Products import Productos


class Categorias(db.Model):
    """
    Modelo de la tabla categorias

    Attributes
        id_categoria: int
        nom_categoria: str
    """
    __tablename__ = 'categorias'

    id_categoria = Column(Integer, primary_key=True, autoincrement=False)
    nom_categoria = Column(String(100))

    productos = relationship(Productos, backref='categorias', lazy=True)

    def __repr__(self):
        return f"<Categoria(id={self.id_categoria}, nombre={self.nom_categoria})>"
