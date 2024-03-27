from Models import Categorias
from Models import Cliente
from Models import DetalleFactura
from Models import Facturas
from Models import Productos
from Models import TipoIdentificacion
from Models import Usuario
# App
from __init__ import app, db


# Functions to interact with the database
# These functions are used to test the models and the database
# They are not used in the app, they are just for testing purposes.

def create_user(name, last_name, phone, email, city, country, password, token):
    nuevo_usuario = Usuario(nombre=name, apellido=last_name, telefono=phone, email=email, ciudad=city, pais=country,
                            pssword=password, TOKEN=token)
    db.session.add(nuevo_usuario)
    db.session.commit()
    print("Usuario creado con éxito", nuevo_usuario)


def get_all_users():
    usuarios = Usuario.query.all()
    for usuario in usuarios:
        print(usuario)


def delete_user(user_id):
    usuario = Usuario.query.filter_by(id_user=user_id).first()
    if usuario:
        db.session.delete(usuario)
        db.session.commit()
        print("Usuario eliminado con éxito")


def create_client(id_user_fk, id_identificacion_fk, num_identificacion, direccion):
    nuevo_cliente = Cliente(id_user_fk=id_user_fk, id_identificacion_fk=id_identificacion_fk,
                            num_identificacion=num_identificacion, direccion=direccion)
    db.session.add(nuevo_cliente)
    db.session.commit()
    print("Cliente creado con éxito", nuevo_cliente)


def get_all_clients():
    clientes = Cliente.query.all()
    for cliente in clientes:
        print(cliente)


def create_identification_type(identification_type):
    nuevo_tipo_identificacion = TipoIdentificacion(tipo_identificacion=identification_type)
    db.session.add(nuevo_tipo_identificacion)
    db.session.commit()
    print("Tipo de identificación creado con éxito", nuevo_tipo_identificacion)


def get_all_identification_types():
    tipos_identificacion = TipoIdentificacion.query.all()
    for tipo in tipos_identificacion:
        print(tipo)


def create_category(category_id, category_name):
    nueva_categoria = Categorias(id_categoria=category_id, nom_categoria=category_name)
    db.session.add(nueva_categoria)
    db.session.commit()
    print("Categoría creada con éxito", nueva_categoria)


def get_all_categories():
    categorias = Categorias.query.all()
    for categoria in categorias:
        print(categoria)


def delete_category(category_id):
    categoria = Categorias.query.filter_by(id_categoria=category_id).first()
    if categoria:
        db.session.delete(categoria)
        db.session.commit()
        print("Categoría eliminada con éxito")


def create_product(product_code, product_name, category_id, unit_price):
    nuevo_producto = Productos(cod_producto=product_code, producto=product_name, id_categoria_fk=category_id,
                               precio_unitario=unit_price,
                               imgURL=f'url/{product_name}.jpg')
    db.session.add(nuevo_producto)
    db.session.commit()
    print("Producto creado con éxito", nuevo_producto)


def get_all_products():
    productos = Productos.query.all()
    for producto in productos:
        print(producto)


def create_invoice(client_id):
    nueva_factura = Facturas(id_cliente_fk=client_id)
    db.session.add(nueva_factura)
    db.session.commit()
    print("Factura creada con éxito", nueva_factura)


def get_all_invoices():
    facturas = Facturas.query.all()
    for factura in facturas:
        print(factura)


def delete_invoice(invoice_id):
    factura = Facturas.query.filter_by(id_factura=invoice_id).first()
    if factura:
        db.session.delete(factura)
        db.session.commit()
        print("Factura eliminada con éxito")


def create_invoice_detail(invoice_id, product_id, quantity, total_price):
    nuevo_detalle_factura = Detalle_Factura(id_factura_fk=invoice_id, cod_producto_fk=product_id, cantidad=quantity,
                                            precio_total=total_price)
    db.session.add(nuevo_detalle_factura)
    db.session.commit()
    print("Detalle de factura creado con éxito", nuevo_detalle_factura)


if __name__ == '__main__':
    # We use 'with' to create a context in which we can interact with the database
    # This is necessary because we are not running the app in the normal way
    # and we need to create a context in which we can interact with the database
    # This is a common .py file that is run in the terminal, not in the app.
    # -> Just for testing purposes, again <-
    with app.app_context():
        # ----------------------------------------------
        # | ↓ here we can interact with the database ↓ |
        # ---------------------------------------------
        pass