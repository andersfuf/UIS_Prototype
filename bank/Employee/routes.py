from flask import render_template, url_for, flash, redirect, request, Blueprint
from bank import app, conn, bcrypt
from bank.forms import TransferForm, DepositForm, AddCustomerForm
from flask_login import current_user
from bank.models import Transfers, CheckingAccount, InvestmentAccount, select_emp_cus_accounts, transfer_account, insert_Customers
import sys, datetime

Employee = Blueprint('Employee', __name__)

@Employee.route("/addcustomer", methods=['GET', 'POST'])
def addcustomer():
    #if current_user.is_authenticated:
    #    return redirect(url_for('Login.home'))
    form = AddCustomerForm()
    if form.validate_on_submit():
        hashed_password = bcrypt.generate_password_hash(form.password.data).decode('utf-8')
        name=form.username.data
        CPR_number=form.CPR_number.data
        password=hashed_password
        insert_Customers(name, CPR_number, password)
        flash('Account has been created! The customer is now able to log in', 'success')
        return redirect(url_for('Login.home'))
    return render_template('addcustomer.html', title='Add Customer', form=form)


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


@Employee.route("/transfer", methods=['GET', 'POST'])
def transfer():
    if not current_user.is_authenticated:
        flash('Please Login.','danger')
        return redirect(url_for('Login.login'))
    CPR_number = current_user.get_id()
    print(CPR_number)
    dropdown_accounts = select_emp_cus_accounts(current_user.get_id())
    drp_accounts = []
    for drp in dropdown_accounts:
        drp_accounts.append((drp[3], drp[1]+' '+str(drp[3])))
    print(drp_accounts)
    form = TransferForm()
    form.sourceAccount.choices = drp_accounts    
    form.targetAccount.choices = drp_accounts    
    if form.validate_on_submit():
        date = datetime.date.today()
        amount = form.amount.data
        from_account = form.sourceAccount.data
        to_account = form.targetAccount.data
        transfer_account(date, amount, from_account, to_account)
        flash('Transfer succeed!', 'success')
        return redirect(url_for('Login.home'))
    return render_template('transfer.html', title='Transfer', drop_cus_acc=dropdown_accounts, form=form)
