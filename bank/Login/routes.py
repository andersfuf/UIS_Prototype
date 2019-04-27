from flask import render_template, url_for, flash, redirect, request, Blueprint
from bank import app, conn, bcrypt
from bank.forms import RegistrationForm, LoginForm
from flask_login import login_user, current_user, logout_user, login_required
from bank.models import Customers, insert_Customers, select_Customers

Login = Blueprint('Login', __name__)

posts = [{}]


@Login.route("/")
@Login.route("/home")
def home():
    return render_template('home.html', posts=posts)


@Login.route("/about")
def about():
    return render_template('about.html', title='About')


@Login.route("/register", methods=['GET', 'POST'])
def register():
    if current_user.is_authenticated:
        return redirect(url_for('Login.home'))
    form = RegistrationForm()
    if form.validate_on_submit():
        hashed_password = bcrypt.generate_password_hash(form.password.data).decode('utf-8')
        name=form.username.data
        CPR_number=form.CPR_number.data
        password=hashed_password
        insert_Customers(name, CPR_number, password)
        flash('Your account has been created! You are now able to log in', 'success')
        return redirect(url_for('Login.login'))
    return render_template('register.html', title='Register', form=form)


@Login.route("/login", methods=['GET', 'POST'])
def login():
    if current_user.is_authenticated:
        return redirect(url_for('Login.home'))
    form = LoginForm()
    if form.validate_on_submit():
        user = select_Customers(form.CPR_number.data)
        if user and bcrypt.check_password_hash(user[2], form.password.data):
            login_user(user, remember=form.remember.data)
            flash('Login successful.','success')
            next_page = request.args.get('next')
            return redirect(next_page) if next_page else redirect(url_for('Login.home'))
        else:
            flash('Login Unsuccessful. Please check CPR_number and password', 'danger')
    return render_template('login.html', title='Login', form=form)


@Login.route("/logout")
def logout():
    logout_user()
    return redirect(url_for('Login.home'))


@Login.route("/account")
@login_required
def account():
    return render_template('account.html', title='Account')
