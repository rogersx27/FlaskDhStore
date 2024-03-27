from sqlalchemy import Column, Integer, ForeignKey

from __init__ import db


class Administrador(db.Model):
    """
    Modelo de la tabla administradores

    Attributes
        - id_admin: int
        - id_user_fk: int
    """
    __tablename__ = 'administradores'

    id_user_fk = Column(Integer, ForeignKey('usuarios.id_user'))
    id_admin = Column(Integer, primary_key=True)

    def __repr__(self):
        return f"<Administrador(id={self.id_admin}, id_user_fk={self.id_user_fk})>"
