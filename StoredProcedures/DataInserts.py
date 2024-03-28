from Models import Usuario

# utilities
from .Utilities import flatten_data, generate_token, get_json_data

# database object
from __init__ import db


def insert_user(json_data: str) -> None:
    """
        Inserts a new user into the database.
    """
    try:
        keys = ["nombre", "apellido", "telefono", "email", "ciudad", "pais"]
        name, lastname, phone, email, city, country = flatten_data(get_json_data(json_data, keys))
        TOKEN = generate_token()
        password = get_json_data(json_data, ["password"])[0]

        new_user = Usuario(nombre=name, apellido=lastname, telefono=phone, email=email, ciudad=city, pais=country,
                           pssword=password, TOKEN=TOKEN)
        db.session.add(new_user)
        db.session.commit()
    except Exception as e:
        db.session.rollback()
        raise e
    finally:
        print(f"The execution of <| {insert_user.__name__} |> has finished.")
