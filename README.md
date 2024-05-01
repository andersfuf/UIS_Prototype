# Unfinished Bank Project: UIS_Prototype
## usage
The UIS_prototype is a website running Python and Flask library. It has evolved as an unfinished project with development flaws and serves as a starting point for adopting flask as a means of making your own prototype.
The schema of the database is banking and transfer of money between accounts, offering two roles, the employee role managing customer accounts and the customer role offering a customer login to customer accounts.
The Flask framework extends html with a { } - command set. SQL Datasets can be listed using loops and branching statements.

    git repository:  https://github.com/andersfuf/UIS_Prototype


## Requirements:
Run the code below to install the necessary modules.

    pip install -r requirements.txt


#### notes. When solving codepage problems 
For WINDOWS: Loading data into postgres using psql needs a codepage set. Invoking a cmd shell like this set the codepage: 

    cmd /c chcp 65001   

This makes a subshell with the codepage set to UTF8. 'cmd /c chcp 1252' makes a subshell with the codepage set to 1252. The requirements may have to be run again in the subshell. And you might also have to run the requirements again when invoking a virtual environment (see below). 

## Database init
1. set the database in __init__.py file.
2. run schema.sql, schema_ins.sql, schema_upd.sql in your database
3. run sql_ddl/ddl-customers-001-add.sql in your database.

Example: 

    psql -d{database} -U{user} -W -f schema.sql
   
#### notes
For Ubuntu add host (-h127.0.0.1) to psql: 

    psql -d{database} -U{user} -h127.0.0.1 -W -f schema.sql

## Running flask
### The python way

    python3 run.py

### The flask way.

    export FLASK_APP=run.py
    export FLASK_DEBUG=1           (Replaces export FLASK_ENV=development)
    export FLASK_RUN_PORT=5004     (Optional if you want to change port numbe4. Default port is port 5000.)
    flask run

#### notes
For Windows you may have to use the SET command instead of EXPORT. Ex set FLASK_APP=run.py; set FLASK_DEBUG=1; flask run. This worked for me. Also remeber to add the path to your postgres bin-directory in order to run (SQL interpreter) and other postgres programs in any shell.


### The flask way with a virual environment.

Set up virtual environment as specified in https://flask.palletsprojects.com/en/1.1.x/installation/ (OSX/WINDOWS)
vitualenv may be bundled with python.

#### OSX: 

    mkdir myproject
    cd myproject

Create virtual environment in folder

    python3 -m venv .venv

Activate virtual environment in folder

    . .venv/bin/activate

Install flask

    pip install Flask

Set environment variables and start flask

    export FLASK_APP=run.py
    export FLASK_DEBUG=1           (Replaces export FLASK_ENV=development)
    export FLASK_RUN_PORT=5000     (Optional if you want to change port number. Default port is port 5000.)
    flask run
 

#### WINDOWS:

Create virtual environment in folder

    mkdir myproject
    cd myproject
    py -3 -m venv .venv

Activate virtual environment in folder

    .venv\Script\activate
    pip install Flask

Set environment variables and start flask

    set FLASK_APP=run.py
    set FLASK_DEBUG=1           (Replaces export FLASK_ENV=development)
    set FLASK_RUN_PORT=5000     (Optional if you want to change port number. Default port is port 5000.)
    flask run

# Development
### Rules:  

1. To pick: Add your name. Pick one at the time, (pick only several when you break the rule). 
2. Update progress. 
3. Finalize ‘one at the time’.
4. Commit to repository.

## November 2023 DEVELOPMENT SPRINT (-APR2024)
CM-3 Staring with a backlog spice. It is not understandable.

### User stories:

#### Customer role:

##### Logging on

CUS-1-2-2022(anders, 100%): List users and authenticate using the list. Status: List part drafted in template. CUS-1-2-2022 split in a database part CUS-1-2-2022 and a python part CUS-1-3-2024 SPIKE.

CUS-1-3-2024(anders, 100%) python part of CUS-1-2-2022. Flask form direct (CUS-1-4-2024), Login class endpoint /direct, endpoint python code. SPIKE.

CUS-1-4-2024(anders, 100%) flask part of CUS-1-2-2022. ListLogin flask form (LL) direct.

#### Employee role:

#### Tasks
CM-2 (anders, ) Adding data to the database
CM-3 (anders) Spike Back-log consolidation. Making sense of the back-log. cm-log.md now logs sprints. 


## Back log of User stories (unfinished business).
There is a dilemma. You want the current state of existing user stories. However a back log is also a repository of unfinished business. Decission 20231107: Maintain a consolidated respository of userstories along with the tasks. Have a Back log of user stories as unifinished business.

### User stories:

#### Customer role:


##### Transfer

CUS7: As a customer, I can transfer money from one of my accounts to another, so that I can make other operations with that money. CUS7-1 (100%); CUS7-3 (100%); CUS7-2 (100%); CUS7-4 (100%); CUS7-5 Moved to EUS-CUS7 (Employee manager) and EUS-CUS10 (selecting customer); CUS7-6 (0%)

CUS7-6 (name, ): restrict from_accounts to employees manages accounts

##### Investments

CUS4: As a customer, I can see the consolidated summary of my investments at a given date, so that I can see how much money I have invested and the current value of these investments. SPLIT current date (CUS4-1; date part (CUS4-2), ER-relational part (CUS4-3 100%). CUS4-1 (60%); CUS4-4 (100%); CUS4-2 (0%); CUS4-3 (100%). 

CUS4-1 (anders, 60%, SPLIT): investment list; list of each and a total; one line for each investment account; at a given date; accounts.html with overview just startt (5%); SPLIT; consolidate up to and including ‘dags dato’-current date.; SPLIT model part (CUS4-4 100%).

CUS4-2 (name, ); date part; consolidated view at point in time.

#### Checking account

CUS8: As a customer i want to see the balance and details of my checking account. SPLIT into CUS8-1-2023, CUS8-2-2023 ,CUS8-3-2023, CUS8-4-2023, CUS8-5-2023, CUS8-6-2023.

CUS8-1-2023 (name, %) checking account model-part (DML).

CUS8-2-2023 (name, %) checking account template.

CUS8-3-2023 (name, %) checking account controller-part.

CUS8-4-2023 (name, %) checking account detail-part model-part (SQL).

CUS8-5-2023 (name, %)  checking account detail-part template.

CUS8-6-2023 (name, %) detail-part controller-part.

##### Logging on

CUS1: As a customer, I can log in and log out of the system, so that my information in the bank is only accessible to me. CUS-1-1-2022 done; CUS-1-2-2022 started 10%.

CUS-1-2-2022(anders, 10%): List users and authenticate using the list. Status: List part drafted in template.


### Employee role:

#### Transfer

EUS-CUS7: As en employee i can transfer money between ccounts I manage, so in order to provide service managing accounts. EUS-CUS7-1. SQL part(100%). EUS-CUS7-2 (100%). Transfer between managed accounts. EUS-CUS7-3 Not started.

EUS-CUS7-3 (name). Customer based transfer (requires EUS-CUS10)

#### Chose customer

EUS-CUS10 : As an employee, I can recieve money for deposit to a customer account, so that the customer can have it in a safe place at the bank. Employee/counter utility; Employee must chose the customer. EUS-CUS10-1 (not started); EUS-CUS10-2 (not started); EUS-CUS10-3 (100%) ER to relational part. 

EUS-CUS10-1 (name): CUS10 moved to employee; status 0% but CUS7 can be used as start.

EUS-CUS10-2 (name): Authentication part

#### Add and delete customers
EUS3: As a bank employee, I can add or delete customers and their accounts in the system, so that I can keep track of the my customers and the bank products they are using.
EUS3 (complex, SPLIT, 5 parts 40%): Complex story. SPLIT. Only employees should have acces to this story).  EUS3-1 (100%) register page; EUS3-2(name) mmoney accounts; EUS3-3(name) unregister; EUS3-4(name) authenticate; EUS3-5(100%) ER to relational part.

EUS3-2 (name) add and remove money accounts for customers

EUS3-3 (name) un-register page implements deleting a customer along with the accounts

EUS3-4 (name) authentication against employee of EUS3.


#### Certificate of deposits

EUS6: As a bank employee, I can create a new CD (certificate of deposite) for one of my customers and associate it to the customer's investment account, so that I can facilitate investments and attract money to the bank. EUS6-1 (name); EUS6-2 (100%) ER to relational part.

EUS6-1 (name, 0%) Flask part

#### Accounts
EUS11: as an employee i have access to specific customer accounts, so the employee can manage the customer. Thoughts: SQL. The data model maps employees to customer accounts. The employee could be mapped to a customer.

EUS11-1 (name, 0%) Flask part

EUS11-2 (name, 0%) ER to relational part.


##### Logging on

#### Tasks:

MVC1-2 (name, ) navigation
CM-1 (name, ) adjusting technical debt
CM-2 (name, ) Adding data to the database
CM-3 (name, ) dokumentation spikes

