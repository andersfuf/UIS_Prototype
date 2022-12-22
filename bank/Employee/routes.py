from flask import render_template, url_for, flash, redirect, request, Blueprint
from bank import app, conn, bcrypt
from bank.forms import DepositForm, AddCustomerForm
from bank.forms import TransferForm
from flask_login import current_user
from bank.models import Transfers, CheckingAccount, InvestmentAccount,  transfer_account, insert_Customers
import sys, datetime

#202212
from bank import roles, mysession
from bank.models_e import select_emp_investments_with_certificates, select_emp_investments, select_emp_investments_certificates_sum


iEmployee = 1
iCustomer = 2 # bruges til transfer/

Employee = Blueprint('Employee', __name__)


@Employee.route("/investe", methods=['GET', 'POST'])
def investe():

    #202212
    # Her laves et login check
    if not current_user.is_authenticated:
        flash('Please Login.','danger')
        return redirect(url_for('Login.login'))

    #202212
    #customer
    # CUS4; CUS4-1, CUS4-4
    # done for employee
    # customer counterpart yet 
    if not mysession["role"] == roles[iEmployee]:  
        flash('Viewing investents is employee only.','danger')
        return redirect(url_for('Login.login'))
              
        
    mysession["state"]="invest"
    print(mysession)
    
    #202212
    # i think this view works for employee and customer but the 
    # view is different as employees have customers.
    # CUS4; CUS4-1, CUS4-4
    print(current_user.get_id())
    
    investments = select_emp_investments(current_user.get_id())
    investment_certificates = select_emp_investments_with_certificates(current_user.get_id())
    investment_sums = select_emp_investments_certificates_sum(current_user.get_id())
    print(investments)
    role =  mysession["role"]
    print('role: '+ role)
    
    return render_template('invest.html', title='Investments'
    , inv=investments, inv_cd_list=investment_certificates
    , inv_sums=investment_sums, role=role)



@Employee.route("/transfer", methods=['GET', 'POST'])
def transfer():
    if not current_user.is_authenticated:
        flash('Please Login.','danger')
        return redirect(url_for('Login.login'))
        
    # CUS7 is the customer transfer. Create new endpoint.
    # EUS10 is the employee transfer.
    # manageCustor/ er EUS!=
    # transfer/  må være CUS7
    # move to customer DONE
    # duplicate back and change database access here
    
    
    if not mysession["role"] == roles[iEmployee]:  
        flash('transfer money is customer only.','danger')
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


@Employee.route("/addcustomer", methods=['GET', 'POST'])
def addcustomer():
    
    if not current_user.is_authenticated:
        return redirect(url_for('Login.home'))
        
    #202212
    # employee only
    if not mysession["role"] == roles[iEmployee]:  
        flash('Adding customers is employee only.','danger')
        return redirect(url_for('Login.login'))

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
        
    # manageCustor/ må være EUS10
    # transfer/  må være CUS7

    if not mysession["role"] == roles[iEmployee]:  
        flash('Managing customers is employee only.','danger')
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


