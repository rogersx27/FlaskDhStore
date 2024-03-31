from flask import render_template, request, redirect, url_for, flash
from flask_login import login_user, login_required, logout_user, current_user

from StoredProcedures import get_data
from StoredProcedures import insert_user

from Models import Usuario

# Import the initialized app and login_manager
from __init__ import app, login_manager

@login_manager.user_loader
def load_user(user_id):
    return Usuario.query.get(int(user_id))

@app.route('/')
def index():
    return render_template('views/index.html')

@app.route('/dashboard')
@login_required
def dashboard():
    return render_template('views/dashboard.html', user=current_user), 200

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        user_email = request.form['email']
        user_password = request.form['password']
        user = Usuario.query.filter_by(email=user_email).first()
        if user and user.check_password(user_password):
            login_user(user)
            next_page = request.args.get('next')
            return redirect(next_page or url_for('dashboard'))
        else:
            flash('Usuario o contraseña incorrectos', 'error')
    return render_template('views/login.html')

@app.route('/logout')
@login_required
def logout():
    logout_user()
    return redirect(url_for('login'))

@app.route('/register', methods=['GET'])
def register():
    return render_template('views/register.html'), 200


@app.route('/register', methods=['POST'])
def register_post():
    try:
        new_user = get_data(request).to_json(orient='records')
        insert_user(new_user)
        return redirect('/register'), 201
    except Exception as e:
        return str(e)

@app.errorhandler(404)
def page_not_found(e):
    return render_template('404.html'), 404

    """
    TODO: 
        - Finish the implementation of the stored procedures.
        - Finish the routes for the application.
    """

if __name__ == '__main__':
    app.run()
