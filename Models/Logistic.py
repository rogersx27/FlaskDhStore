from sqlalchemy import Column, Integer, ForeignKey

from __init__ import db


class Logistico(db.Model):
    """
    Modelo de la tabla logisticos


    """
    __tablename__ = 'logisticos'

    id_user_fk = Column(Integer, ForeignKey('usuarios.id_user'))
    id_logistico = Column(Integer, primary_key=True)

    def __repr__(self):
        return f"<Administrador(id={self.id_admin}, id_user_fk={self.id_user_fk})>"
