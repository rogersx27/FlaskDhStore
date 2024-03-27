from flask import render_template, request

from StoredProcedures import get_data
from StoredProcedures import insert_user

# Import the app object from the __init__.py file
from __init__ import app


@app.route('/')
def hello_world():  # put application's code here
    return 'Hello World!'


@app.route('/register', methods=['GET'])
def register():
    return render_template('register.html')


@app.route('/register', methods=['POST'])
def register_post():
    try:
        new_user = get_data(request).to_json(orient='records')
        insert_user(new_user)

        return "User registered successfully."
    except Exception as e:
        return str(e)

    """
    TODO: 
        - Delete all the data examples from the database.
        - Finish the implementation of the stored procedures.
        - Finish the routes for the application.
    """

if __name__ == '__main__':
    app.run()
