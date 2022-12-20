from flask import render_template, url_for, flash, redirect, request, Blueprint
from bank import app, conn, bcrypt
from bank.forms import DepositForm, InvestForm
from flask_login import current_user
from bank.models import CheckingAccount, InvestmentAccount, update_CheckingAccount
from bank.models import select_investments_with_certificates, select_investments, select_investments_certificates_sum
import sys, datetime

#202212
from bank import roles, mysession

iEmployee = 1
iCustomer = 2


Customer = Blueprint('Customer', __name__)

@Customer.route("/invest", methods=['GET', 'POST'])
def invest():

    #202212
    # Her laves et login check
    if not current_user.is_authenticated:
        flash('Please Login.','danger')
        return redirect(url_for('Login.login'))

    #202212
    #customer
    # CUS4; CUS4-1, CUS4-4
    # There us no employee counterpart yet (invest overview)
    if not mysession["role"] == roles[iCustomer]:  
        flash('Viewing investents is customer only.','danger')
        return redirect(url_for('Login.login'))
              
        
    mysession["state"]="invest"
    print(mysession)
    
    #202212
    # i think this view works for employee and customer but the 
    # view is different as employees have customers.
    # CUS4; CUS4-1, CUS4-4
    
    investments = select_investments(current_user.get_id())
    investment_certificates = select_investments_with_certificates(current_user.get_id())
    investment_sums = select_investments_certificates_sum(current_user.get_id())
    return render_template('invest.html', title='Investments', inv=investments, inv_cd_list=investment_certificates
    , inv_sums=investment_sums)


@Customer.route("/deposit", methods=['GET', 'POST'])
def deposit():
    if not current_user.is_authenticated:
        flash('Please Login.','danger')
        return redirect(url_for('Login.login'))
        
        
    #202212
    #EUS-CUS10
    # move to customer object
    if not mysession["role"] == roles[iEmployee]:  
        flash('Deposit is employee only.','danger')
        return redirect(url_for('Login.login'))              
        
    mysession["state"]="deposit"
    print(mysession)


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


