
## Back log of User stories (Consolidation effort).
There is a dilemma. You want the current state of existing user stories. However a back log is also a repository of unfinished business.

#### Customer role:
##### Transfer

CUS7: As a customer, I can transfer money from one of my accounts to another, so that I can make other operations with that money. CUS7-1 (100%); CUS7-3 (100%); CUS7-2 (100%); CUS7-4 (100%); CUS7-5 Moved to EUS-CUS7 (Employee manager) and EUS-CUS10 (selecting customer); CUS7-6 (0%); CUS7-3-2023(100%)

CUS7-1 (ziming, 100%): HTML finished version one; SPLIT; update not confirmed; 

CUS7-3 (ziming, 100%): confirm update;
CUS7-3-2023 (anders, 100%): confirm update (insert into transfer). Customer/route.py must import transfer_account() from models.py

CUS7-2 (ziming+anders,100%): confirm dropdown;

CUS7-4 (anders, 100%, left): ER to relational part. deposit, transfer, withdraw;

CUS7-5 (anders+, Moved): must be logged in as employee part. Moved to EUS-CUS7 (Employee manager) and EUS-CUS10 (selecting customer).

CUS7-6 (name, ): restrict from_accounts to employees manages accounts

CUS7-8-2023 (anders, 100%):Transfer. Fix SQL selecting customers accounts based on customer id.




##### Investments

CUS4: As a customer, I can see the consolidated summary of my investments at a given date, so that I can see how much money I have invested and the current value of these investments. SPLIT current date (CUS4-1; date part (CUS4-2), ER-relational part (CUS4-3 done). CUS4-1 60%; CUS4-4 done; CUS4-2 not started; CUS4-3 done. 

CUS4-1(anders, 60%, SPLIT): investment list; list of each and a total; one line for each investment account; at a given date; accounts.html with overview just start (5%); SPLIT; consolidate up to and including ‘dags dato’-current date.; ; SPLIT model part (CUS4-4).

CUS4-4(anders, 100%); model part of CUS4-1

CUS4-2(name); date part; consolidated view at point in time.

CUS4-3(anders, 100%, left): ER to relational part. certificates_of_deposit, investmentaccounts;

#### Checking account

CUS8 (name, %) As a customer i want to see the balance and details of my checking account. SPLIT into CUS8-1-2023, CUS8-2-2023 ,CUS8-3-2023, CUS8-4-2023, CUS8-5-2023, CUS8-6-2023.

CUS8-1-2023 (name, %) checking account model-part (DML).

CUS8-2-2023 (name, %) checking account template.

CUS8-3-2023 (name, %) checking account controller-part.

CUS8-4-2023 (name, %) checking account detail-part model-part (SQL).

CUS8-5-2023 (name, %)  checking account detail-part template.

CUS8-6-2023 (name, %) detail-part controller-part.

#### Accounts

CUS9-2023 As a customer i want a list of my accounts to find find out which are managed and by who. CUS9-1-2023 (100%).

CUS9-1-2023 (anders, 100%) Initial listing. Use of sel_cus-accounts() adjusting template


##### Logging on

CUS1: As a customer, I can log in and log out of the system, so that my information in the bank is only accessible to me. CUS-1-1-2022 done; CUS-1-2-2022 started 10%.

CUS1: finished (ziming, 100%); CUS1: As a customer, I can log in and log out of the system, so that my information in the bank is only accessible to me. Suspend authentication for other parts of the application (YES / NO ) - No action - defered. CUS-1-2022(anders, 100%):  (reopend, SPLIT); CUS1: I can log in and log out of the system, so that my information in the bank is only accessible to me (CUS-1 -> CUS-1-1, EMP-1-1).

CUS1-1-2022(anders, 100%): Customer-part Carry authencication to all customer related endpoints: As an autheticated customer i only have functions concerning my data, so customers have integrity.

CUS1-2-2022(anders, 10%): SPIKE. List users and authenticate using the list. Status: List part drafted in template.



### Employee role:

#### Transfer.

EUS-CUS7. As en employee i can transfer money between ccounts I manage, so in order to provide service managing accounts. EUS-CUS7-1(100%) SQL part; EUS-CUS7-2 (100%) Transfer between managed accounts.; EUS-CUS7-3 (name). Customer based transfer (requires EUS-CUS10).
Transfer currently disabled in the templates (EUS-CUS7-2023). Could be enabled and debugged.

 EUS-CUS7-1 (100%). SQL part. 
 
 EUS-CUS7-2 (100%). Transfer between managed accounts. 
 
 EUS-CUS7-3 (name). Customer based transfer (requires EUS-CUS10)

 EUS-CUS7-2023 (100%) Transfer currently disabled in the templates. Could be enabled and debugged


#### Chose customer.

EUS-CUS10:  Move to employee as it is a employee/counter utility; Employee must chose the customer; CUS10: As a customer, I can deposit money to my checking account, so that I can have it in a safe place at the bank.-> EUS-CUS10 : As an employee, I can recieve money for deposit to a customer account, so that the customer can have it in a safe place at the bank. EUS-CUS10-1 (name); EUS-CUS10-2 (name); EUS-CUS10-3 (100%).

EUS-CUS10-1(name): CUS10 moved to employee; status 0% but CUS7 can be used as start.

EUS-CUS10-2(name): Authentication part

EUS-CUS10-3(anders, 100%, left): ER to relational part.



#### Add and delete customers.

EUS3: As a bank employee, I can add or delete customers and their accounts in the system, so that I can keep track of the my customers and the bank products they are using. EUS3 (complex, SPLIT, 5 parts 40%): Complex story. SPLIT, only employees should have acces to this story).  EUS3-1 (100%); EUS3-2(name); EUS3-3(name); EUS3-4(name) EUS3-5(100%)

EUS3-1 (ziming, 100%) register page as is implements adding a customer

EUS3-2 (name) add and remove money accounts for customers

EUS3-3 (name) un-register page implements deleting a customer along with the accounts

EUS3-4 (name) authentication against employee of EUS3.

EUS3-5 (anders, 100%) ER to relational part.


#### Certificate of deposits.

EUS6: As a bank employee, I can create a new CD (certificate of deposite) for one of my customers and associate it to the customer's investment account, so that I can facilitate investments and attract money to the bank. EUS6-1 (name); EUS6-2 (100%).

EUS6-1 (name, 0%) Flask part

EUS6-2 (anders, 100%) ER to relational part.

#### Accounts
EUS11: as an employee i have access to specific customer accounts, so the employee can manage the customer. Thoughts: SQL. The data model maps employees to customer accounts. The employee could be mapped to a customer.

EUS11-1 (name, 0%) Flask part

EUS11-2 (name, 0%) ER to relational part.


##### Logging on.

EUS1: As a bank employee, I can log in and log out of the system, so that I can perform operations on behalf of customers securely. 
EUS1 (lasse, 100%) Log in. EUS1 is very similar to CUS1. 60% finished even though it is not started.

EUS-1-1-2022(anders, 100%): Employee-part Carry authencication to all employee related endpoints: As an authenticated employee i have employee functions.

EUS1-2: (anders, 100%) ER to relational part. Created table manages with account_type field. Need to fix manages.


#### Tasks:

MVC1-2 (name, ) navigation
CM-1 (name, ) adjusting technical debt
CM-2 (name, : Adding data to the database
CM-3 Spike Back-log consolidation

