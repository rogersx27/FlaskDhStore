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


def execute_stored_procedure(query, params: any) -> None:
    """
        Executes the stored procedure on the database.
        :param query: str
        :param params: any (tuple, list, dict)
    """
    try:
        print(f"Executing stored procedure...")
        print(f"Query: {query}")
        print(f"Params: {params}")
        with db.session() as session:
            session.execute(query, params)
            session.commit()
        print(f"Stored procedure executed successfully.")
    except Exception as e:
        db.session.rollback()
        raise e
    finally:
        print(f"The execution of <| {execute_stored_procedure.__name__} |> has finished.")
