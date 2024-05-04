from flask import render_template, url_for, flash, redirect, request, Blueprint
from bank import app, conn, bcrypt
from bank.forms import DepositForm, InvestForm
from bank.forms import TransferForm, ListAccount
from flask_login import current_user
from bank.models import CheckingAccount, InvestmentAccount, update_CheckingAccount
from bank.models import select_cus_investments_with_certificates, select_cus_investments, select_cus_investments_certificates_sum
from bank.models import select_cus_accounts,  transfer_account

import sys, datetime
from bank import roles, mysession

iEmployee = 1
iCustomer = 2


Customer = Blueprint('Customer', __name__)

@Customer.route("/check/list/<paccount>", methods=['GET', 'POST'])
def checklist(paccount):
    if not current_user.is_authenticated:
        flash('Please Login.','danger')
        return redirect(url_for('Login.login'))

#    if not mysession["role"] == roles[iCustomer]:
#        flash('account listing is customer mode.','danger')
#        return redirect(url_for('Login.login'))


    CPR_number = current_user.get_id()
    print('AL2024-001', CPR_number, paccount)
    dropdown_accounts=[]
    form = ListAccount()

    # call model function to get check-account-listing
    # Make stub document style

    stubRecords = [
        { 'no': '1009', 'dato': '2024-05-19', 'desc': 'second-deposit', 'debit': '230', 'credit': '0'},
        { 'no': '1010', 'dato': '2024-05-10', 'desc': 'first-withdraw', 'debit': '0', 'credit': '200'},
        { 'no': '1008', 'dato': '2024-05-8', 'desc': 'third-withdraw', 'debit': '0', 'credit': '43'},
        { 'no': '1007', 'dato': '2024-05-7', 'desc': 'last-deposit', 'debit': '4360', 'credit': '0'}
    ]
    print('AL2024-001', stubRecords)

    # call model function to get summary information

    if form.validate_on_submit():
        print('AL2024-001', form.data)

        return redirect(url_for('Login.home'))

    return render_template('check_list.html', title='List Checking Account'
    , records=stubRecords, paccount=paccount, drop_cus_acc=dropdown_accounts, form=form)


@Customer.route("/transfer", methods=['GET', 'POST'])
def transfer():
    if not current_user.is_authenticated:
        flash('Please Login.','danger')
        return redirect(url_for('Login.login'))

    if not mysession["role"] == roles[iCustomer]:
        flash('transfer money customer mode.','danger')
        return redirect(url_for('Login.login'))


    CPR_number = current_user.get_id()
    print(CPR_number)
    dropdown_accounts = select_cus_accounts(current_user.get_id())
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



@Customer.route("/invest", methods=['GET', 'POST'])
def invest():

    # Her laves et login check
    if not current_user.is_authenticated:
        flash('Please Login.','danger')
        return redirect(url_for('Login.login'))

    #202212
    #customer
    # CUS4; CUS4-1, CUS4-4
    # TODO-CUS There us no customer counterpart
    if not mysession["role"] == roles[iCustomer]:
        flash('Viewing investents is customer only.','danger')
        return redirect(url_for('Login.login'))


    mysession["state"]="invest"
    print(mysession)

    # i think this view works for employee and customer but the
    # view is different as employees have customers.
    # CUS4; CUS4-1, CUS4-4
    print(current_user.get_id())

    investments = select_cus_investments(current_user.get_id())
    investment_certificates = select_cus_investments_with_certificates(current_user.get_id())
    investment_sums = select_cus_investments_certificates_sum(current_user.get_id())
    return render_template('invest.html', title='Investments', inv=investments
    , inv_cd_list=investment_certificates
    , inv_sums=investment_sums)


"""
 # 202405
 # Technical dept - remove
# Maybe deposit was ment to be employee deposit to an account...

@Customer.route("/deposit", methods=['GET', 'POST'])
def deposit():
    if not current_user.is_authenticated:
        flash('Please Login.','danger')
        return redirect(url_for('Login.login'))


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
    
    
    """
