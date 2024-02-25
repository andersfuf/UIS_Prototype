from flask import render_template, url_for, flash, redirect, request, Blueprint
from bank import app, conn, bcrypt
from bank.forms import CustomerLoginForm, EmployeeLoginForm, DirectCustomerLoginForm
from flask_login import login_user, current_user, logout_user, login_required
from bank.models import select_Employee
from bank.models import Customers, select_Customer, select_customer_direct
from bank.models import select_cus_accounts, select_customers_direct
from bank import roles, mysession

Login = Blueprint('Login', __name__)

posts = [{}]


@Login.route("/")
@Login.route("/home")
def home():
    #202212
    mysession["state"]="home or /"
    print(mysession)
    #202212
    role =  mysession["role"]
    print('role: '+ role)

    return render_template('home.html', posts=posts, role=role)


@Login.route("/about")
def about():
    mysession["state"]="about"
    print(mysession)
    return render_template('about.html', title='About')


@Login.route("/direct", methods=['GET', 'POST'])
def direct():

    mysession["state"]="direct"
    print("L1", mysession)
    role=None

    if current_user.is_authenticated:
        return redirect(url_for('Login.home'))
    
    print("L1", request.args.get('is_employee') )
    #print("L1", request.form('p') )
    
    is_employee = True if request.args.get('is_employee') == 'true' else False
    form = DirectCustomerLoginForm()

    # Først bekræft, at inputtet fra formen er gyldigt... 
    if form.validate_on_submit():
        
        user = select_customer_direct(form.p.data)
        print("L2 user", user)

        # Derefter tjek om hashet af adgangskoden passer med det fra databasen...
        # Her checkes om der er logget på
        
        if user != None:

            print("L3 role:" + user.role)
            mysession["role"] = roles[2] #customer
            mysession["id"] = form.p.data
            print("L3", mysession)
            print("L3", roles)

            login_user(user, remember=form.remember.data)
            flash('Login successful.','success')
            next_page = request.args.get('next')
            return redirect(next_page) if next_page else redirect(url_for('Login.home'))
        else:
            flash('Login Unsuccessful. Please check identifier and password', 'danger')
 
    direct_users = select_customers_direct()
    print("L2 direct", direct_users)

    #Get lists of employees and customers
    teachers = [{"id": str(6234), "name":"anders. teachers with 6."}, {"id": str(6214), "name":"simon"},
                {"id": str(6862), "name":"dmitry"}, {"id": str(6476), "name":"finn"}]
    parents =  [{"id": str(4234), "name":"parent-anders. parents with 4.", "address":"address 1"}
              , {"id": str(5002), "name":"parent-simon", "address":"address 2"}
              , {"id": str(4862), "name":"parent-dmitry", "address":"address 3"}
              , {"id": str(5010), "name":"parent-finn", "address":"address 4"}]
    students = [{"id": str(5002), "name":"student-anders. students with 5."}, {"id": str(5214), "name":"student-simon"},
                {"id": str(5010), "name":"student-dmitry"}, {"id": str(5476), "name":"student-finn"}]

    return render_template('direct.html', title='Direct Login', is_employee=is_employee, form=form
    , students=students, radio_direct=direct_users, role=role
    )






@Login.route("/login", methods=['GET', 'POST'])
def login():

    mysession["state"]="login"
    print(mysession)
    role=None

    if current_user.is_authenticated:
        return redirect(url_for('Login.home'))

    is_employee = True if request.args.get('is_employee') == 'true' else False
    form = EmployeeLoginForm() if is_employee else CustomerLoginForm()

    # Først bekræft, at inputtet fra formen er gyldigt... 
    if form.validate_on_submit():

        #
        # her checkes noget som skulle være sessionsvariable, men som er en GET-parameter
        # implementeret af AL. Ideen er at teste på om det er et employee login
        # eller om det er et customer login.
        # betinget tildeling. Enten en employee - eller en customer instantieret
        # Skal muligvis laves om. Hvad hvis nu user ikke blir instantieret
        #
        user = select_Employee(form.id.data) if is_employee else select_Customer(form.id.data)

        # Derefter tjek om hashet af adgangskoden passer med det fra databasen...
        # Her checkes om der er logget på
        
        if user != None and bcrypt.check_password_hash(user[2], form.password.data):

            print("role:" + user.role)
            if user.role == 'employee':
                mysession["role"] = roles[1] #employee
            elif user.role == 'customer':
                mysession["role"] = roles[2] #customer
            else:
                mysession["role"] = roles[0] #ingen

            mysession["id"] = form.id.data
            print(mysession)
            print(roles)

            login_user(user, remember=form.remember.data)
            flash('Login successful.','success')
            next_page = request.args.get('next')
            return redirect(next_page) if next_page else redirect(url_for('Login.home'))
        else:
            flash('Login Unsuccessful. Please check identifier and password', 'danger')

    return render_template('login.html', title='Login', is_employee=is_employee, form=form
    , role=role
    )

@Login.route("/logout")
def logout():
    #202212
    mysession["state"]="logout"
    print(mysession)

    logout_user()
    return redirect(url_for('Login.home'))


@Login.route("/account")
@login_required
def account():
    mysession["state"]="account"
    print(mysession)
    role =  mysession["role"]
    print('role: '+ role)

    accounts = select_cus_accounts(current_user.get_id())
    print(accounts)
    return render_template('account.html', title='Account'
    , acc=accounts, role=role
    )
