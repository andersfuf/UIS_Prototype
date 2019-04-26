CREATE TABLE IF NOT EXISTS Customers(
	CPR_number integer PRIMARY KEY,
	risk_type boolean default False,
	password varchar(120),
	name varchar(60),
	address text
);

CREATE TABLE IF NOT EXISTS Employees(
	CPR_number integer PRIMARY KEY,
    name varchar(20),
    password varchar(120)
);
-- Decision. 
-- YES relational style. No in this case every entity is implemented
-- NO objects atyle. In this case only typed objects
-- NO nulls style. in this case only accounts

-- Serial this is the account number across the system
-- NO with serial as is -> implement a type on manages
-- YES or implement the serial on accounts
/*
CREATE TABLE IF NOT EXISTS accounts(
	account_number SERIAL PRIMARY KEY,
	created_date date
);
*/

CREATE TABLE IF NOT EXISTS manages(
	emp_cpr_number INTEGER NOT NULL REFERENCES employees(cpr_number),
	account_number INTEGER NOT NULL, 
	account_type VARCHAR(20) NOT NULL CHECK (account_type IN ('CheckingAccount','InvestmentAccount'))
);

CREATE TABLE IF NOT EXISTS CheckingAccounts(
	account_number SERIAL PRIMARY KEY,
	created_date date,
	CPR_number integer  REFERENCES Customers(CPR_number)
);

CREATE TABLE IF NOT EXISTS InvestmentAccounts(
	account_number SERIAL PRIMARY KEY,
	created_date date,
	CPR_number integer REFERENCES Customers(CPR_number)
);

--

CREATE TABLE IF NOT EXISTS Transfers(
	id SERIAL PRIMARY KEY,
	transfer_date date,
	amount integer
);

CREATE TABLE IF NOT EXISTS Withdraws(
	amount integer,
	withdraw_date date
);

CREATE TABLE IF NOT EXISTS Deposits(
	amount integer,
	deposit_date date
);

CREATE TABLE IF NOT EXISTS Certificates_of_deposit(
	CD_number SERIAL PRIMARY KEY,
	start_date date,
	amount integer,
	maturity_date date
);