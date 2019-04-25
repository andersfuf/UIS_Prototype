CREATE TABLE IF NOT EXISTS Customers(
	CPR_number integer PRIMARY KEY,
	risk_type boolean default False,
	password varchar(120),
	name varchar(60),
	address text
);

CREATE TABLE IF NOT EXISTS CheckingAccounts(
	account_number SERIAL,
	created_date date,
	CPR_number integer  REFERENCES Customers(CPR_number)
	--FOREIGN KEY (account_number, CPR_number) REFERENCES (account_number, CPR_number)
);

CREATE TABLE IF NOT EXISTS InvestmentAccounts(
	account_number SERIAL,
	created_date date,
	CPR_number integer REFERENCES Customers(CPR_number)
	--FOREIGN KEY (account_number, CPR_number)
);


CREATE TABLE IF NOT EXISTS Employees(
	CPR_number integer PRIMARY KEY,
    name varchar(20),
    password varchar(120)
);

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