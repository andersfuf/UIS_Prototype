# Development
cm-log/cm-log.md Consolidated log from the sprints.

### Rules:  

To pick: Add your name. Pick one at the time, (pick only several when you break the rule)

Update progress.

Finalize ‘one at the time’.

Commit to repository.

## log

### may 2023 DEVELOPMENT SPRINTS

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

### June 2022 , 2022 DEVELOPMENT SPRINTS
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
