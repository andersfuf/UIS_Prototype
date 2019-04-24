from flask import render_template, url_for, flash, redirect, request, Blueprint
from bank import app, conn
from bank.forms import TransferForm, DepositForm
from flask_login import current_user
from bank.models import Transfers, CheckingAccount, InvestmentAccount

Employee = Blueprint('Employee', __name__)

@Employee.route("/manageCustomer", methods=['GET', 'POST'])
def manageCustomer():
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
