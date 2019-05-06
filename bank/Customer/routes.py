from flask import render_template, url_for, flash, redirect, request, Blueprint
from bank import app, conn, bcrypt
from bank.forms import DepositForm, InvestForm
from flask_login import current_user
from bank.models import CheckingAccount, InvestmentAccount, update_CheckingAccount
from bank.models import select_investments_with_certificates, select_investments, select_investments_certificates_sum
import sys, datetime

Customer = Blueprint('Customer', __name__)

@Customer.route("/invest", methods=['GET', 'POST'])
def invest():
    if not current_user.is_authenticated:
        flash('Please Login.','danger')
        return redirect(url_for('Login.login'))
    #form = InvestForm()
    #investments = select_investments(current_user.CPR_number)
    investment_certificates = select_investments_with_certificates(current_user.get_id())
    investment_sums = select_investments_certificates_sum(current_user.get_id())
    return render_template('invest.html', title='Investments', inv_cd_list=investment_certificates
    , inv_sums=investment_sums)
    

@Customer.route("/deposit", methods=['GET', 'POST'])
def deposit():
    if not current_user.is_authenticated:
        flash('Please Login.','danger')
        return redirect(url_for('Login.login'))
    form = DepositForm()
    if form.validate_on_submit():
        amount=form.amount.data
        CPR_number = form.CPR_number.data
        update_CheckingAccount(amount, CPR_number)
        flash('Succeed!', 'success')
        return redirect(url_for('Login.home'))
    return render_template('deposit.html', title='Deposit', form=form)

@Customer.route("/summary", methods=['GET', 'POST'])
def summary():
    if not current_user.is_authenticated:
        flash('Please Login.','danger')
        return redirect(url_for('Login.login'))
    if form.validate_on_submit():
        pass
        flash('Succeed!', 'success')
        return redirect(url_for('Login.home'))
    return render_template('deposit.html', title='Deposit', form=form)


