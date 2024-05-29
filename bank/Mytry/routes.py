from flask import render_template, url_for, flash, redirect, request, Blueprint
from flask_login import current_user

from bank.forms import ListAccount
from bank import roles, mysession

from bank.models import select_check_balance

iEmployee = 1
iCustomer = 2


My_try = Blueprint('My_try', __name__)



@My_try.route("/my/checklist/<paccount>", methods=['GET', 'POST'])
def mychecklist(paccount):
    if not current_user.is_authenticated:
        flash('Please Login.','danger')
        return redirect(url_for('Login.login'))

    if not mysession["role"] == roles[iCustomer]:
        flash('account listing is customer mode.','danger')
        return redirect(url_for('Login.login'))


    CPR_number = current_user.get_id()
    print('my-AL2024-001', CPR_number, paccount)
    form = ListAccount()

    # call model function to get check-account-listing
    # Make stub document style

    stubRecords = [
        { 'no': '1009', 'dato': '2024-05-19', 'desc': 'second-deposit', 'debit': '230', 'credit': '0'},
        { 'no': '1010', 'dato': '2024-05-10', 'desc': 'first-withdraw', 'debit': '0', 'credit': '200'},
        { 'no': '1008', 'dato': '2024-05-8', 'desc': 'third-withdraw', 'debit': '0', 'credit': '43'},
        { 'no': '1007', 'dato': '2024-05-7', 'desc': 'last-deposit', 'debit': '4360', 'credit': '0'}
    ]
    print('MY-AL2024-001 records', stubRecords)

    # call model function to get summary information
    stubAccount=8004
    check_balance=select_check_balance(stubAccount)
    print('MY-AL2024-001 balance', check_balance)

    if form.validate_on_submit():
        print('AL2024-001', form.data)

        return redirect(url_for('Login.home'))

    return render_template('check_list.html', title='List Checking Account'
    , records=stubRecords, paccount=paccount, balance=check_balance, form=form)
