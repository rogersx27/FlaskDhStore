"""
This module is used to manage the data from the database.

Functions:
    - request_to_dataframe: (get_data) Extracts the data from the request object and converts it to a pandas DataFrame.
    - execute_stored_procedure: (set_data) Executes the stored procedure on the database.
    - insert_user: Inserts a new user into the database.
"""

from .DataInserts import insert_user
from .DataManage import request_to_dataframe as get_data
