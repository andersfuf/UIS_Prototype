from flask import render_template, url_for, flash, redirect, request, Blueprint
from bank import app, conn
from bank.forms import TransferForm, DepositForm
from flask_login import current_user
from bank.models import Transfers, CheckingAccount, InvestmentAccount, select_emp_cus_accounts

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


@Employee.route("/transfer", methods=['GET', 'POST'])
def transfer():
    if not current_user.is_authenticated:
        flash('Please Login.','danger')
        return redirect(url_for('Login.login'))
    CPR_number = current_user.get_id()
    print(CPR_number)
    #drop_accounts = select_emp_cus_accounts(current_user.cpr_number)
    drop_accounts = select_emp_cus_accounts(current_user.get_id())
    #print(drop_accounts)
    form = TransferForm()
    if form.validate_on_submit():
        date = datetime.date.today()
        amount = form.amount.data
        from_account = form.sourceAccount.data
        to_account = form.targetAccount.data
        transfer_account(date, amount, from_account, to_account)
        flash('Transfer succeed!', 'success')
        return redirect(url_for('Login.home'))
    return render_template('transfer.html', title='Transfer', form=form)
