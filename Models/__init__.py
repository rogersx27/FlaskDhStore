"""
File who contains all models.
Models are classes that represent the structure of the database.

Models:
    - Administrador
    - Categorias
    - Cliente
    - Tipo_Identificacion
    - Detalle_Factura
    - Facturas
    - Logistico
    - Productos
    - Usuario
"""

from .Admins import Administrador
from .Categories import Categorias
from .Clients import Cliente
from .Identification_Type import TipoIdentificacion
from .Invoice_Details import Detalle_Factura
from .Invoices import Facturas
from .Logistic import Logistico
from .Products import Productos
from .Users import Usuario
