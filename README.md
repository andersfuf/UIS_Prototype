# April 24, 2019 - MAY 1ST, 2019 DEVELOPMENT SPRINT

Reviewing the prioritized user stories. User stories to be picked. 

Our two target dates are: monday April 29th (choose not to meet if github works; stand by ) and Wednesday May 1st, when we meet for acceptance test. 

We consider this a sprint started. Lets be modest and see if we can get some done. In a normal workplace situation no user story should for example not take more that 20 hours.
 
## Rules:  

To pick: Add your name. 

Update progress. 

Finalize ‘one at the time’. 

Commit to repository. 

## User Stories:

CUS-1: finished (100%);

Suspend authentication for other parts of the application (YES / NO ) - No action - defered.

CUS4-1(name, 5%): investment list; list of each and a total; one line for each investment account; at a given date; accounts.html with overview just start (5%); SPLIT; consolidate up to and including ‘dags dato’-current date. 

CUS4-2(name); date part; consolidated view at point in time.

CUS7-1 (100%): HTML finished version one; SPLIT; update not confirmed;  ; 

CUS7-3 (name): confirm update;

CUS7-2 (name): confirm dropdown;

EUS-CUS10 (name, 0%):  Move to employee as it is a employee/counter utility; employee must chose the customer; CUS10: As a customer, I can deposit money to my checking account, so that I can have it in a safe place at the bank.- EUS-CUS10 : As an employee, I can recieve money for deposit to a customer account, so that the customer can have it in a safe place at the bank.

CUS10 moved to employee; status 0% but CUS7 can be used as start.

EUS1(name, 60%)  is very similar to CUS1. 60% finished even though it is not started.

EUS3 Complex story. SPLIT only employees should have acces to this story. 
EUS3-1a (name) register page as is implements adding a customer

EUS3-1b (name) add and remove money accounts for customers

EUS3-1c (name) un-register page implements deleting a customer along with the accounts

EUS3-2 (name) authentication against employee of EUS3.

EUS6 (name) Whats a CD(Certificates of deposit)?


## Requirements:

ModuleNotFoundError: No module named 'flask_bcrypt'

$ pip install flask_bcrypt

ModuleNotFoundError: No module named 'flask_login'

$ pip install flask_login

psycopg2.OperationalError: FATAL: database "test" does not exist
create database test;
psql -h localhost -d test -U postgres -W

ModuleNotFoundError: No module named 'flask_wtf'
$ pip install flask_wtf

no default user - register

psycopg2.ProgrammingError: relation "customers" does not exist
LINE 2:         INSERT INTO Customers(name, CPR_number, password)

psql -h localhost -d test -U postgres -W -f schema.sql
