--DROP TABLE IF EXISTS Customers;

CREATE TABLE IF NOT EXISTS Customers(
	CPR_number integer PRIMARY KEY,
	risk_type boolean default False,
	password varchar(120),
	name varchar(60),
	address text
);
--
DELETE FROM InvestmentAccounts;
DELETE FROM CheckingAccounts;
--
DELETE FROM public.customers;
DELETE FROM employees;

INSERT INTO public.customers(cpr_number, risk_type, password, name, address) VALUES (5000, TRUE, 'UIS', 'UIS-DB3-C-Lasse', 'aud Auditorium A, bygning 1, 1. sal Universitetsparken 15 (Zoo)');
INSERT INTO public.customers(cpr_number, risk_type, password, name, address) VALUES (5001, TRUE, 'UIS', 'UIS-PD3-C-Anders', 'øv* Kursussal 1, bygning 3, 1.sal Universitetsparken 15 (Zoo)');
INSERT INTO public.customers(cpr_number, risk_type, password, name, address) VALUES (5002, TRUE, 'UIS', 'UIS-DB2-C-Ziming', 'øv 4032, Ole Maaløes Vej 5 (Biocenter)');
INSERT INTO public.customers(cpr_number, risk_type, password, name, address) VALUES (5003, TRUE, 'UIS', 'UIS-PD2-C-Hubert', 'øv Auditorium Syd, Nørre Alle 51');
INSERT INTO public.customers(cpr_number, risk_type, password, name, address) VALUES (5004, TRUE, 'UIS', 'UIS-DB1-C-Jan', 'øv A112, Universitetsparken 5, HCØ');
INSERT INTO public.customers(cpr_number, risk_type, password, name, address) VALUES (5005, TRUE, 'UIS', 'UIS-PD1-C-Marco', 'Aud 07, Universitetsparken 5, HCØ');
INSERT INTO public.customers(cpr_number, risk_type, password, name, address) VALUES (5006, TRUE, 'UIS', 'UIS-LE1-C-Marcos', 'AUD 02 in the HCØ building (HCØ, Universitetsparken 5)');
INSERT INTO public.customers(cpr_number, risk_type, password, name, address) VALUES (5007, TRUE, 'UIS', 'UIS-LE2-C-Finn', 'AUD 02 in the HCØ building (HCØ, Universitetsparken 5)');


CREATE TABLE IF NOT EXISTS CheckingAccounts(
	account_number SERIAL,
	created_date date,
	CPR_number integer  REFERENCES Customers(CPR_number)
	--FOREIGN KEY (account_number, CPR_number) REFERENCES (account_number, CPR_number)
);
INSERT INTO public.checkingaccounts(created_date, cpr_number) VALUES (now(),5000);
INSERT INTO public.checkingaccounts(created_date, cpr_number) VALUES (now(),5000);
INSERT INTO public.checkingaccounts(created_date, cpr_number) VALUES (now(),5001);
INSERT INTO public.checkingaccounts(created_date, cpr_number) VALUES (now(),5001);
INSERT INTO public.checkingaccounts(created_date, cpr_number) VALUES (now(),5002);
INSERT INTO public.checkingaccounts(created_date, cpr_number) VALUES (now(),5002);
INSERT INTO public.checkingaccounts(created_date, cpr_number) VALUES (now(),5003);
INSERT INTO public.checkingaccounts(created_date, cpr_number) VALUES (now(),5003);
INSERT INTO public.checkingaccounts(created_date, cpr_number) VALUES (now(),5004);
INSERT INTO public.checkingaccounts(created_date, cpr_number) VALUES (now(),5004);
INSERT INTO public.checkingaccounts(created_date, cpr_number) VALUES (now(),5005);
INSERT INTO public.checkingaccounts(created_date, cpr_number) VALUES (now(),5005);
INSERT INTO public.checkingaccounts(created_date, cpr_number) VALUES (now(),5006);
INSERT INTO public.checkingaccounts(created_date, cpr_number) VALUES (now(),5006);
INSERT INTO public.checkingaccounts(created_date, cpr_number) VALUES (now(),5007);
INSERT INTO public.checkingaccounts(created_date, cpr_number) VALUES (now(),5007);
--INSERT INTO public.checkingaccounts(account_number, created_date, cpr_number) VALUES (NULL, now(),5000);

CREATE TABLE IF NOT EXISTS InvestmentAccounts(
	account_number SERIAL,
	created_date date,
	CPR_number integer REFERENCES Customers(CPR_number)
	--FOREIGN KEY (account_number, CPR_number)
);

INSERT INTO public.InvestmentAccounts(created_date, cpr_number) 
VALUES (now(),5000),(now(),5000),(now(),5000),(now(),5000)
      ,(now(),5001),(now(),5001),(now(),5001),(now(),5001)
      ,(now(),5002),(now(),5002),(now(),5002),(now(),5002)
      ,(now(),5003),(now(),5003),(now(),5003),(now(),5003)
      ,(now(),5004),(now(),5004),(now(),5004),(now(),5004)
      ,(now(),5005),(now(),5005),(now(),5005),(now(),5005)
      ,(now(),5006),(now(),5006),(now(),5006),(now(),5006)
      ,(now(),5007),(now(),5007),(now(),5007),(now(),5007)
;



CREATE TABLE IF NOT EXISTS Employees(
	CPR_number integer PRIMARY KEY,
    name varchar(20),
    password varchar(120)
);
INSERT INTO public.Employees(cpr_number, name, password) 
VALUES (6000, 'UIS-DB3-C-Lasse',  'UIS')
, (6001, 'UIS-PD3-C-Anders',  'UIS')
, (6002, 'UIS-DB2-C-Ziming',  'UIS')
, (6003, 'UIS-PD2-C-Hubert',  'UIS')
, (6004, 'UIS-DB1-C-Jan'   ,  'UIS')
, (6005, 'UIS-PD1-C-Marco' ,  'UIS')
, (6006, 'UIS-LE1-C-Marcos',  'UIS')
, (6007, 'UIS-LE2-C-Finn' ,  'UIS')
;


-- contraints missing
CREATE TABLE IF NOT EXISTS Transfers(
	id SERIAL PRIMARY KEY,
	transfer_date date,
	amount integer
);

INSERT INTO transfers (transfer_date, amount) VALUES (now(), 10);
INSERT INTO transfers (transfer_date, amount) VALUES (now(), 20);
INSERT INTO transfers (transfer_date, amount) VALUES (now(), 40);
INSERT INTO transfers (transfer_date, amount) VALUES (now(), 80);
INSERT INTO transfers (transfer_date, amount) VALUES (now(), 160);
INSERT INTO transfers (transfer_date, amount) VALUES (now(), 320);

-- contraints missing
CREATE TABLE IF NOT EXISTS Withdraws(
	amount integer,
	withdraw_date date
);
INSERT INTO withdraws ( amount, withdraw_date) VALUES (20480, now())
, (10240, now()), (5120, now()), (2560, now()), (1280, now()), (640, now());

-- contraints missing
CREATE TABLE IF NOT EXISTS Deposits(
	amount integer,
	deposit_date date
);
INSERT INTO deposits ( amount, deposit_date) VALUES (40960, now())
, (81920, now()), (163840, now()), (327696, now()), (655392, now()), (1310784, now());

CREATE TABLE IF NOT EXISTS Certificates_of_deposit(
	CD_number SERIAL PRIMARY KEY,
	start_date date,
	amount integer,
	maturity_date date
);

INSERT INTO public.certificates_of_deposit(start_date, amount, maturity_date)
VALUES (now(), 10000, now());
INSERT INTO public.certificates_of_deposit(cd_number, start_date, amount, maturity_date)
VALUES (7000, now(), 10000, now());