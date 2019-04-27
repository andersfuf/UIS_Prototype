\i schema_drop.sql

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
-- Solving the accounts ISA Hierachy. 
-- -relational style. In this case every entity is implemented
-- -objects atyle. In this case only typed objects. Implement a type on manages
-- -nulls style. In this case only accounts

-- Serial this is the account number across the system
-- 

CREATE TABLE IF NOT EXISTS Accounts(
	account_number SERIAL PRIMARY KEY,
	created_date date,
	CPR_number integer  REFERENCES Customers(CPR_number)
);


CREATE TABLE IF NOT EXISTS manages(
	emp_cpr_number INTEGER NOT NULL REFERENCES employees(cpr_number),
	account_number INTEGER NOT NULL REFERENCES accounts
);
ALTER TABLE manages ADD CONSTRAINT pk_manages
  PRIMARY KEY (emp_cpr_number, account_number)
  ;


CREATE TABLE IF NOT EXISTS CheckingAccounts(
	account_number INTEGER PRIMARY KEY
);

ALTER TABLE CheckingAccounts ADD CONSTRAINT fk_ChAcc_001 
  FOREIGN KEY (account_number) REFERENCES Accounts(account_number)
;

CREATE TABLE IF NOT EXISTS InvestmentAccounts(
	account_number SERIAL PRIMARY KEY
);
ALTER TABLE InvestmentAccounts ADD CONSTRAINT fk_InAcc_001 
  FOREIGN KEY (account_number) REFERENCES Accounts(account_number)
;

--

CREATE TABLE IF NOT EXISTS Transfers(
	id SERIAL PRIMARY KEY,
	transfer_date date,
	amount INTEGER,
	from_account  INTEGER REFERENCES accounts(account_number),
	to_account    INTEGER REFERENCES accounts(account_number)
);

COMMENT ON COLUMN Transfers.from_account IS 'has origin';
COMMENT ON COLUMN Transfers.to_account   IS 'has destination';

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