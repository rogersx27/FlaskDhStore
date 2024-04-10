import pandas as pd
from flask import Request
from pandas import DataFrame

# database object
from __init__ import db


def request_to_dataframe(server_request: Request) -> DataFrame:
    """
        Extracts the data from the request object and converts it to a pandas DataFrame.
        :return: DataFrame
    """
    try:
        request_data = server_request.form.to_dict()
        df = pd.DataFrame([request_data])

        return df
    except Exception as e:
        raise e
