# usage
The UIS_prototype is a website running Python and Flask library. It has evolved as an unfinished project with development flaws and serves as a starting point for adopting flask as a means of making your own prototype.
The schema of the database is banking and transfer of money between accounts, offering two roles, the employee role managing customer accounts and the customer role offering a customer login to customer accounts.
The Flask framework extends html with a { } - command set. SQL Datasets can be listed using loops and branching statements.

## Requirements:
Run the code below to install the necessary modules.

>$ pip install -r requirements.txt

## Database init
1. set the database in __init__.py file.
2. run schema.sql, schema_ins.sql, schema_upd.sql, schema_upd_2.sql in your database.

## Running flask
### The python way

$ python3 run.py

### The flask way.

$ export FLASK_APP=run.py

$ export FLASK_DEBUG=1           (Replaces export FLASK_ENV=development)

$ export FLASK_RUN_PORT=5004     (Optional if you want to change port numbe4. Default port is port 5000.)

$ flask run


For Windows you may have to use the SET command instead of EXPORT. Ex set FLASK_APP=run.py; set FLASK_DEBUG=1; flask run. This worked for me. Also remeber to add the path to your postgres bin-directory in order to run (SQL interpreter) and other postgres programs in any shell.


### The flask way with a virual environment.

Set up virtual environment as specified in https://flask.palletsprojects.com/en/1.1.x/installation/ (OSX/WINDOWS)

OSX:

Create virtual environment in folder

$ mkdir myproject

$ cd myproject

$ python3 -m venv .venv

Activate virtual environment in folder

$ . .venv/bin/activate

Install flask

$ pip install Flask



Set environment variables and start flask

$ export FLASK_APP=run.py

$ export FLASK_DEBUG=1           (Replaces export FLASK_ENV=development)

$ export FLASK_RUN_PORT=5000     (Optional if you want to change port number. Default port is port 5000.)

$ flask run

# Development
### Rules:  

To pick: Add your name. Pick one at the time, (pick only several when you break the rule)

Update progress.

Finalize ‘one at the time’.

Commit to repository.

## 2023 DEVELOPMENT SPRINTS

Some enhancements

### User stories:

#### Customer role:

CUS7-8-2023 (anders, 100%):Transfer. Fix SQL selecting customers accounts based on customer id.

CUS7-3-2023 (anders, 100%): confirm update (insert into transfer). Customer/route.py must import transfer_account() from models.py

Account

CUS9-2023 As a customer i want a list of my accounts to find find out which are managed and by who.

CUS9-2023-1 (anders, 100%) Initial listing. Use of sel_cus-accounts() adjusting template



Checking account

CUS8-2023 (name, %) As a customer i want to see the balance and details of my checking account. SPLIT into CUS8-1-2023, CUS8-2-2023 ,CUS8-3-2023, CUS8-4-2023, CUS8-5-2023, CUS8-6-2023.

CUS8-1-2023 (name, %) checking account model-part (DML).

CUS8-2-2023 (name, %) checking account template.

CUS8-3-2023 (name, %) checking account controller-part.

CUS8-4-2023 (name, %) checking account detail-part model-part (SQL).

CUS8-5-2023 (name, %)  checking account detail-part template.

CUS8-6-2023 (name, %) detail-part controller-part.


#### Employee role:

EUS-CUS7-2023 Transfer currently disabled in the templates. Could be enabled and debugged

Accounts EUS-11
EUS-11 as an emplee i have access to specific customer accounts, so the employee can manage the customer. Thoughts: SQL. The data model maps employees to customer accounts. The employee could be mapped to a customer.

#### Tasks:

CM-2 (anders, 100%): Adding data to the database.
CM-2 (anders, 100%): Revisiting the about template.

CM-1 (name, was ok, defer) adjusting technical debt. (Remove underscore folders from git from python compilations.)
CM-1 (name, 0%) adjusting technical debt. CUS7-8-2023. models.select_cus_accounts() does not need employees
     Remove employee from SQL.



## Back log of User stories.
There is a dilemma. You want the current state of existing user stories. However a back log is also a repository of unfinished business.

#### Customer role:


Transfer

CUS7(SPLIT, 6 parts, 4 done): As a customer, I can transfer money from one of my accounts to another, so that I can make other operations with that money.

CUS7-1 (ziming, 100%): HTML finished version one; SPLIT; update not confirmed;  ;

CUS7-3 (ziming, 100%): confirm update;

CUS7-2 (ziming+anders,100%): confirm dropdown;

CUS7-4 (anders, 100%, left): ER to relational part. deposit, transfer, withdraw;

CUS7-5 (anders+, Moved): must be logged in as employee part. Moved to EUS-CUS7 (Employee manager) and EUS-CUS10 (selecting customer).

CUS7-6 (name, ): restrict from_accounts to employees manages accounts

Investments

CUS4(SPLIT, SPLIT): As a customer, I can see the consolidated summary of my investments at a given date, so that I can see how much money I have invested and the current value of these investments. SPLIT current date (CUS4-1; date part (CUS4-2), ER-relational part (CUS4-3 done)

CUS4-1(anders, 60%, SPLIT): investment list; list of each and a total; one line for each investment account; at a given date; accounts.html with overview just start (5%); SPLIT; consolidate up to and including ‘dags dato’-current date.; ; SPLIT model part (CUS4-4).

CUS4-4(anders, 100%); model part of CUS4-1

CUS4-2(name); date part; consolidated view at point in time.

CUS4-3(anders, 100%, left): ER to relational part. certificates_of_deposit, investmentaccounts;


Logging on

CUS-1: finished (ziming, 100%); CUS1: As a customer, I can log in and log out of the system, so that my information in the bank is only accessible to me. Suspend authentication for other parts of the application (YES / NO ) - No action - defered. CUS-1-2022(anders, 100%):  (reopend, SPLIT); CUS1: I can log in and log out of the system, so that my information in the bank is only accessible to me (CUS-1 -> CUS-1-1, EMP-1-1).

CUS-1-1-2022(anders, 100%): Customer-part Carry authencication to all customer related endpoints: As an autheticated customer i only have functions concerning my data, so customers have integrity.

CUS-1-2-2022(anders, 10%): SPIKE. List users and authenticate using the list. Status: List part drafted in template.




### Employee role:

Transfer.

EUS-CUS7. As en employee i can transfer money between ccounts I manage, so in order to provide service managing accounts. EUS-CUS7-1. SQL part(100%). EUS-CUS7-2 (100%). Transfer between managed accounts. EUS-CUS7-3. Customer based transfer (requires EUS-CUS10)

Chose customer.

EUS-CUS10 ((moved,SPLIT), 0%):  Move to employee as it is a employee/counter utility; Employee must chose the customer; CUS10: As a customer, I can deposit money to my checking account, so that I can have it in a safe place at the bank.-> EUS-CUS10 : As an employee, I can recieve money for deposit to a customer account, so that the customer can have it in a safe place at the bank.

EUS-CUS10-1: CUS10 moved to employee; status 0% but CUS7 can be used as start.

EUS-CUS10-2(name): Authentication part

EUS-CUS10-3(anders, 100%, left): ER to relational part.



Add and delete customers.

EUS3 (complex, SPLIT, 5 parts 40%): Complex story. SPLIT, only employees should have acces to this story). EUS3: As a bank employee, I can add or delete customers and their accounts in the system, so that I can keep track of the my customers and the bank products they are using.

EUS3-1 (ziming, 100%) register page as is implements adding a customer

EUS3-2 (name) add and remove money accounts for customers

EUS3-3 (name) un-register page implements deleting a customer along with the accounts

EUS3-4 (name) authentication against employee of EUS3.

EUS3-5 (anders, 100%) ER to relational part.


Certificate of deposits.

EUS6 (name): As a bank employee, I can create a new CD (certificate of deposite) for one of my customers and associate it to the customer's investment account, so that I can facilitate investments and attract money to the bank.

EUS6-2 (anders, 100%) ER to relational part.


Logging on.

EUS1(lasse, 100%) Log in. EUS1 is very similar to CUS1. 60% finished even though it is not started. EUS1: As a bank employee, I can log in and log out of the system, so that I can perform operations on behalf of customers securely. EMP-1-1-2022(22, anders, 100%): Employee-part Carry authencication to all employee related endpoints: As an authenticated employee i have employee functions.

EUS1-2: (anders, 100%) ER to relational part. created table manages with account_type field. Need to fix manages


#### Tasks:

MVC1-2 (name, ) navigation

CM-1 (name, ) adjusting technical debt

CM-2 (name, : Adding data to the database

## log

## June 2022 , 2022 DEVELOPMENT SPRINTS
Some enhancements

CUS-1-2022(anders, 100%):  (reopend, SPLIT); CUS1: I can log in and log out of the system, so that my information in the bank is only accessible to me (CUS-1 -> CUS-1-1, EMP-1-1).
CUS-1-1-2022(anders, 100%): Customer-part Carry authencication to all customer related endpoints: As an autheticated customer i only have functions concerning my data, so customers have integrity.

EMP-1-1-2022(22, anders, 100%): Employee-part Carry authencication to all employee related endpoints: As an authenticated employee i have employee functions.

#### Tasks:

CM-2 (pax+anders,100%): Adding data to the database


### April 24, 2019 - MAY 1ST, 2019 DEVELOPMENT SPRINTS
Reviewing the prioritized user stories. User stories to be picked.
Our two target dates are: monday April 29th (choose not to meet if github works; stand by ) and Wednesday May 1st, when we meet for acceptance test.
We consider this a sprint started. Lets be modest and see if we can get some done. In a normal workplace situation no user story should for example not take more that 20 hours.


CUS-1: finished (ziming, 100%); CUS1: As a customer, I can log in and log out of the system, so that my information in the bank is only accessible to me.
Suspend authentication for other parts of the application (YES / NO ) - No action - defered.
CUS7-1 (ziming, 100%): HTML finished version one; SPLIT; update not confirmed;  ;
CUS7-3 (ziming, 100%): confirm update;
CUS7-2 (ziming+anders,100%): confirm dropdown;
CUS7-4 (anders, 100%, left): ER to relational part. deposit, transfer, withdraw;
CUS7-5 (anders+, 10%): must be logged in as employee part
CUS4-1(anders, 60%): investment list; list of each and a total; one line for each investment account; at a given date; accounts.html with overview just start (5%); SPLIT; consolidate up to and including ‘dags dato’-current date.; ; SPLIT model part (CUS4-4)CUS4-4(anders, 70%); model part of CUS4-1
CUS4-3(anders, 100%, left): ER to relational part. certificates_of_deposit, investmentaccounts;

EUS-CUS10-3(anders, 100%, left): ER to relational part.
EUS1(lasse, 100%) EUS1 is very similar to CUS1. 60% finished even though it is not started. EUS1: As a bank employee, I can log in and log out of the system, so that I can perform operations on behalf of customers securely.
EUS1-2: (anders, 100%) ER to relational part. created table manages with account_type field. Need to fix manages
EUS3-1 (ziming, 100%) register page as is implements adding a customer
EUS3-5 (anders, 100%) ER to relational part.
EUS6-2 (anders, 100%) ER to relational part.

#### Tasks:

MVC1-1 (ziming, 100%) Move SQL
