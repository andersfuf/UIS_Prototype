from flask import render_template, url_for, flash, redirect, request, Blueprint
from bank import app, conn
from bank.forms import TransferForm, DepositForm
from flask_login import current_user
from bank.models import Transfers, CheckingAccount, InvestmentAccount

Customer = Blueprint('Customer', __name__)

@Customer.route("/transfer", methods=['GET', 'POST'])
def transfer():
    if not current_user.is_authenticated:
        flash('Please Login.','danger')
        return redirect(url_for('Login.login'))
    form = TransferForm()
    if form.validate_on_submit():
        amount=form.amount.data
        cur = conn.cursor()
        sql = """
        UPDATE CheckingAccount
        SET amount = %s
        WHERE CPR_number = %s
        """ 
        cur.execute(sql, (amount, CPR_number))
        conn.commit()
        cur.close()
        flash('Transfer succeed!', 'success')
        return redirect(url_for('Login.home'))
    return render_template('transfer.html', title='Transfer', form=form)

@Customer.route("/deposit", methods=['GET', 'POST'])
def deposit():
    if not current_user.is_authenticated:
        flash('Please Login.','danger')
        return redirect(url_for('Login.login'))
    form = DepositForm()
    if form.validate_on_submit():
        amount=form.amount.data
        cur = conn.cursor() 
        sql = """
        UPDATE CheckingAccount
        SET amount = %s
        WHERE CPR_number = %s
        """ 
        cur.execute(sql, (amount, CPR_number))
        conn.commit()
        cur.close()
        flash('Succeed!', 'success')
        return redirect(url_for('Login.home'))
    return render_template('deposit.html', title='Deposit', form=form)

@Customer.route("/summary", methods=['GET', 'POST'])
def summary():
    if not current_user.is_authenticated:
        flash('Please Login.','danger')
        return redirect(url_for('Login.login'))
    if form.validate_on_submit():
        amount=form.amount.data
        cur = conn.cursor() 
        sql = """
        """ 
        cur.execute(sql, (amount, CPR_number))
        conn.commit()
        cur.close()
        flash('Succeed!', 'success')
        return redirect(url_for('Login.home'))
    return render_template('deposit.html', title='Deposit', form=form)


