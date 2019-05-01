\i schema_drop.sql

CREATE TABLE IF NOT EXISTS Customers(
	CPR_number integer PRIMARY KEY,
	risk_type boolean default False,
	password varchar(120),
	name varchar(60),
	address text
);

CREATE TABLE IF NOT EXISTS Employees(
	id integer PRIMARY KEY,
    name varchar(20),
    password varchar(120)
);
-- Solving the accounts ISA Hierachy. 
-- (-)relational style. In this case every entity is implemented
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
	emp_cpr_number INTEGER NOT NULL REFERENCES employees(id),
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

-- transfers
CREATE TABLE IF NOT EXISTS Transfers(
	id SERIAL PRIMARY KEY,
	transfer_date date,
	amount INTEGER,
	from_account  INTEGER REFERENCES accounts(account_number),
	to_account    INTEGER REFERENCES accounts(account_number)
);

COMMENT ON COLUMN Transfers.from_account IS 'has origin';
COMMENT ON COLUMN Transfers.to_account   IS 'has destination';

-- checking accounts
CREATE TABLE IF NOT EXISTS Withdraws(
	id SERIAL PRIMARY KEY,
	account_number  INTEGER REFERENCES CheckingAccounts(account_number),
	amount integer,
	withdraw_date date
);

CREATE TABLE IF NOT EXISTS Deposits(
	id SERIAL PRIMARY KEY,
	account_number  INTEGER REFERENCES CheckingAccounts(account_number),
	amount integer,
	deposit_date date
);

-- investments
-- Solving the certificate ISA Hierachy. 
-- -relational style. In this case every entity is implemented
-- -objects atyle. In this case only typed objects.
-- (-)nulls style. In this case only one certificate entity set

CREATE TABLE IF NOT EXISTS Certificates_of_deposit(
	cd_number SERIAL PRIMARY KEY,
	account_number  INTEGER REFERENCES InvestmentAccounts(account_number),
	start_date date,
	amount integer,
	maturity_date date,
	rate integer    --at fixed rate certificated´s of deposite
);
COMMENT ON COLUMN Certificates_of_deposit.rate IS 'at fixed rate certificated´s of deposite';


CREATE OR REPLACE VIEW vw_cd_sum
AS
SELECT i.account_number, a.cpr_number, a.created_date
    , sum (amount) 
    FROM investmentaccounts i
    JOIN accounts a ON i.account_number = a.account_number
    JOIN certificates_of_deposit cd ON i.account_number = cd.account_number   
GROUP BY  i.account_number, a.cpr_number, a.created_date;
