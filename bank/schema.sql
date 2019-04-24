CREATE TABLE Customers(
	CPR_number integer PRIMARY KEY,
	risk_type boolean default False,
	password varchar(120),
	name varchar(60),
	address text
);

CREATE TABLE CheckingAccounts(
	account_number SERIAL,
	created_date date,
	CPR_number integer REFERENCES Customers(CPR_number),
	FOREIGN KEY (account_number, CPR_number)
);

CREATE TABLE InvestmentAccounts(
	account_number SERIAL,
	created_date date,
	CPR_number integer REFERENCES Customers(CPR_number),
	FOREIGN KEY (account_number, CPR_number)
)


CREATE TABLE Employees(
	CPR_number integer PRIMARY KEY,
    name varchar(20),
    password varchar(120),
);

CREATE TABLE Transfers(
	id SERIAL PRIMARY KEY,
	transfer_date date,
	amount integer
)

CREATE TABLE Withdraws(
	amount integer,
	withdraw_date date
)

CREATE TABLE Deposits(
	amount integer,
	deposit date date
)

CREATE TABLE Certificates_of_deposit(
	CD_number SERIAL PRIMARY KEY,
	start_date date,
	amount integer,
	maturity_date date
)