CREATE TABLE IF NOT EXISTS Customers(
	CPR_number integer PRIMARY KEY,
	risk_type boolean default False,
	password varchar(120),
	name varchar(60),
	address text
);
DELETE FROM public.customers;
INSERT INTO public.customers(cpr_number, risk_type, password, name, address) VALUES (5000, TRUE, 'UIS', 'UIS-DB3-Lasse', 'aud Auditorium A, bygning 1, 1. sal Universitetsparken 15 (Zoo)');
INSERT INTO public.customers(cpr_number, risk_type, password, name, address) VALUES (5001, TRUE, 'UIS', 'UIS-PD3-Anders', 'øv* Kursussal 1, bygning 3, 1.sal Universitetsparken 15 (Zoo)');
INSERT INTO public.customers(cpr_number, risk_type, password, name, address) VALUES (5002, TRUE, 'UIS', 'UIS-DB2-Ziming', 'øv 4032, Ole Maaløes Vej 5 (Biocenter)');
INSERT INTO public.customers(cpr_number, risk_type, password, name, address) VALUES (5003, TRUE, 'UIS', 'UIS-PD2-Hubert', 'øv Auditorium Syd, Nørre Alle 51');
INSERT INTO public.customers(cpr_number, risk_type, password, name, address) VALUES (5004, TRUE, 'UIS', 'UIS-DB1-Jan', 'øv A112, Universitetsparken 5, HCØ');
INSERT INTO public.customers(cpr_number, risk_type, password, name, address) VALUES (5005, TRUE, 'UIS', 'UIS-PD1-Marco', 'Aud 07, Universitetsparken 5, HCØ');
INSERT INTO public.customers(cpr_number, risk_type, password, name, address) VALUES (5006, TRUE, 'UIS', 'UIS-LE1-Marcos', 'AUD 02 in the HCØ building (HCØ, Universitetsparken 5)');
INSERT INTO public.customers(cpr_number, risk_type, password, name, address) VALUES (5007, TRUE, 'UIS', 'UIS-LE2-Finn', 'AUD 02 in the HCØ building (HCØ, Universitetsparken 5)');


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