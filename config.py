"""
Here we define the configuration of the application

- SQLALCHEMY_DATABASE_URI:  This is the URI that points to the database. In this case, we are using a SQL Server database.
                            The URI is in the format mssql+pyodbc://username:password@server/database?driver=ODBC+Driver+17+for+SQL+Server.
                            The driver parameter is the ODBC driver that we are using to connect to the database. In this case, we are using the ODBC Driver 17 for SQL Server.
"""

SQLALCHEMY_DATABASE_URI = 'mssql+pyodbc://soporte:123@localhost/DhStoreNEW?driver=ODBC+Driver+17+for+SQL+Server'