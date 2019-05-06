# April 24, 2019 - MAY 1ST, 2019 DEVELOPMENT SPRINT

Reviewing the prioritized user stories. User stories to be picked. 

Our two target dates are: monday April 29th (choose not to meet if github works; stand by ) and Wednesday May 1st, when we meet for acceptance test. 

We consider this a sprint started. Lets be modest and see if we can get some done. In a normal workplace situation no user story should for example not take more that 20 hours.
 
## Rules:  

To pick: Add your name. Pick one at the time, (pick only several when you break the rule)

Update progress. 

Finalize ‘one at the time’. 

Commit to repository. 

## User stories:

### Customer role:

CUS-1: finished (ziming, 100%); CUS1: As a customer, I can log in and log out of the system, so that my information in the bank is only accessible to me.

Suspend authentication for other parts of the application (YES / NO ) - No action - defered.


CUS7(SPLIT): As a customer, I can transfer money from one of my accounts to another, so that I can make other operations with that money.

CUS7-1 (ziming, 100%): HTML finished version one; SPLIT; update not confirmed;  ; 

CUS7-3 (ziming, 100%): confirm update;

CUS7-2 (ziming+anders,100%): confirm dropdown;

CUS7-4 (anders, 100%, left): ER to relational part. deposit, transfer, withdraw;

CUS7-5 (anders+, 10%): must be logged in as employee part

CUS7-6 (name, ): restrict from_accounts to employees manages accounts

CUS4(SPLIT): As a customer, I can see the consolidated summary of my investments at a given date, so that I can see how much money I have invested and the current value of these investments. SPLIT current date (CUS4-1; date part (CUS4-2)

CUS4-1(anders, 60%): investment list; list of each and a total; one line for each investment account; at a given date; accounts.html with overview just start (5%); SPLIT; consolidate up to and including ‘dags dato’-current date.; ; SPLIT model part (CUS4-4).

CUS4-4(anders, 70%); model part of CUS4-1

CUS4-2(name); date part; consolidated view at point in time.

CUS4-3(anders, 100%, left): ER to relational part. certificates_of_deposit, investmentaccounts;


### Employee role:

EUS-CUS10 ((moved,SPLIT), 0%):  Move to employee as it is a employee/counter utility; Employee must chose the customer; CUS10: As a customer, I can deposit money to my checking account, so that I can have it in a safe place at the bank.-> EUS-CUS10 : As an employee, I can recieve money for deposit to a customer account, so that the customer can have it in a safe place at the bank.

EUS-CUS10-1: CUS10 moved to employee; status 0% but CUS7 can be used as start.

EUS-CUS10-2(name): Authentication part

EUS-CUS10-3(anders, 100%, left): ER to relational part.


EUS1(lasse, 100%) EUS1 is very similar to CUS1. 60% finished even though it is not started. EUS1: As a bank employee, I can log in and log out of the system, so that I can perform operations on behalf of customers securely. 

EUS1-2: (anders, 100%) ER to relational part. created table manages with account_type field. Need to fix manages

EUS3 (complex, SPLIT): Complex story. SPLIT, only employees should have acces to this story). EUS3: As a bank employee, I can add or delete customers and their accounts in the system, so that I can keep track of the my customers and the bank products they are using.

EUS3-1 (ziming, 100%) register page as is implements adding a customer

EUS3-2 (name) add and remove money accounts for customers

EUS3-3 (name) un-register page implements deleting a customer along with the accounts

EUS3-4 (name) authentication against employee of EUS3.

EUS3-5 (anders, 100%) ER to relational part.

EUS6 (name): As a bank employee, I can create a new CD for one of my customers and associate it to the customer's investment account, so that I can facilitate investments and attract money to the bank.

EUS6-2 (anders, 100%) ER to relational part.

### Tasks:

MVC1-1 (ziming, 100%) Move SQL

MVC1-2 (name, ) navigation

CM-1 (name, ) adjusting technical debt


## Requirements:
Run the code below to install the necessary modules.

>$ pip install -r requirements.txt

## Database init
1. set the database in __init__.py file.
2. run schema.sql, schema_ins.sql in your database.

