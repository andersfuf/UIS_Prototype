--
DELETE FROM InvestmentAccounts;
DELETE FROM CheckingAccounts;
DELETE FROM manages;
--
DELETE FROM accounts;
DELETE FROM employees;
DELETE FROM customers;

INSERT INTO public.customers(cpr_number, risk_type, password, name, address) VALUES (5000, TRUE, 'UIS', 'UIS-DB3-C-Lasse', 'aud Auditorium A, bygning 1, 1. sal Universitetsparken 15 (Zoo)');
INSERT INTO public.customers(cpr_number, risk_type, password, name, address) VALUES (5001, TRUE, 'UIS', 'UIS-PD3-C-Anders', 'øv* Kursussal 1, bygning 3, 1.sal Universitetsparken 15 (Zoo)');
INSERT INTO public.customers(cpr_number, risk_type, password, name, address) VALUES (5002, TRUE, 'UIS', 'UIS-DB2-C-Ziming', 'øv 4032, Ole Maaløes Vej 5 (Biocenter)');
INSERT INTO public.customers(cpr_number, risk_type, password, name, address) VALUES (5003, TRUE, 'UIS', 'UIS-PD2-C-Hubert', 'øv Auditorium Syd, Nørre Alle 51');
INSERT INTO public.customers(cpr_number, risk_type, password, name, address) VALUES (5004, TRUE, 'UIS', 'UIS-DB1-C-Jan', 'øv A112, Universitetsparken 5, HCØ');
INSERT INTO public.customers(cpr_number, risk_type, password, name, address) VALUES (5005, TRUE, 'UIS', 'UIS-PD1-C-Marco', 'Aud 07, Universitetsparken 5, HCØ');
INSERT INTO public.customers(cpr_number, risk_type, password, name, address) VALUES (5006, TRUE, 'UIS', 'UIS-LE1-C-Marcos', 'AUD 02 in the HCØ building (HCØ, Universitetsparken 5)');
INSERT INTO public.customers(cpr_number, risk_type, password, name, address) VALUES (5007, TRUE, 'UIS', 'UIS-LE2-C-Finn', 'AUD 02 in the HCØ building (HCØ, Universitetsparken 5)');

INSERT INTO public.Employees(cpr_number, name, password) 
VALUES (6000, 'UIS-DB3-C-Lasse',  'UIS')
, (6001, 'UIS-PD3-E-Anders',  'UIS')
, (6002, 'UIS-DB2-E-Ziming',  'UIS')
, (6003, 'UIS-PD2-E-Hubert',  'UIS')
, (6004, 'UIS-DB1-E-Jan'   ,  'UIS')
, (6005, 'UIS-PD1-E-Marco' ,  'UIS')
, (6006, 'UIS-LE1-E-Marcos',  'UIS')
, (6007, 'UIS-LE2-E-Finn' ,  'UIS')
;

INSERT INTO public.accounts(account_number, created_date, cpr_number) VALUES (8000, '2018-06-01',5000);
INSERT INTO public.accounts(account_number, created_date, cpr_number) VALUES (8001, '2018-07-01',5000);
INSERT INTO public.accounts(account_number, created_date, cpr_number) VALUES (8002, '2018-08-01',5001);
INSERT INTO public.accounts(account_number, created_date, cpr_number) VALUES (8003, '2018-09-01',5001);
INSERT INTO public.accounts(account_number, created_date, cpr_number) VALUES (8004, '2018-10-01',5002);
INSERT INTO public.accounts(account_number, created_date, cpr_number) VALUES (8005, '2018-11-01',5002);
INSERT INTO public.accounts(account_number, created_date, cpr_number) VALUES (8006, '2018-12-01',5003);
INSERT INTO public.accounts(account_number, created_date, cpr_number) VALUES (8007, '2018-02-01',5003);
INSERT INTO public.accounts(account_number, created_date, cpr_number) VALUES (8008, '2018-03-01',5004);
INSERT INTO public.accounts(account_number, created_date, cpr_number) VALUES (8009, '2018-04-01',5004);
INSERT INTO public.accounts(account_number, created_date, cpr_number) VALUES (8010, '2018-05-01',5005);
INSERT INTO public.accounts(account_number, created_date, cpr_number) VALUES (8011, '2018-06-01',5005);
INSERT INTO public.accounts(account_number, created_date, cpr_number) VALUES (8012, '2018-07-01',5006);
INSERT INTO public.accounts(account_number, created_date, cpr_number) VALUES (8013, '2018-08-01',5006);
INSERT INTO public.accounts(account_number, created_date, cpr_number) VALUES (8014, '2018-09-01',5007);
INSERT INTO public.accounts(account_number, created_date, cpr_number) VALUES (8015, '2018-10-01',5007);

INSERT INTO public.manages(emp_cpr_number, account_number) VALUES (6000, 8000);
INSERT INTO public.manages(emp_cpr_number, account_number) VALUES (6000, 8001);
INSERT INTO public.manages(emp_cpr_number, account_number) VALUES (6001, 8002);
INSERT INTO public.manages(emp_cpr_number, account_number) VALUES (6001, 8003);
INSERT INTO public.manages(emp_cpr_number, account_number) VALUES (6002, 8004);
INSERT INTO public.manages(emp_cpr_number, account_number) VALUES (6002, 8005);
INSERT INTO public.manages(emp_cpr_number, account_number) VALUES (6003, 8006);
INSERT INTO public.manages(emp_cpr_number, account_number) VALUES (6003, 8007);
INSERT INTO public.manages(emp_cpr_number, account_number) VALUES (6004, 8008);
INSERT INTO public.manages(emp_cpr_number, account_number) VALUES (6004, 8009);
INSERT INTO public.manages(emp_cpr_number, account_number) VALUES (6005, 8010);
INSERT INTO public.manages(emp_cpr_number, account_number) VALUES (6005, 8011);
INSERT INTO public.manages(emp_cpr_number, account_number) VALUES (6006, 8012);
INSERT INTO public.manages(emp_cpr_number, account_number) VALUES (6006, 8013);
INSERT INTO public.manages(emp_cpr_number, account_number) VALUES (6007, 8014);
INSERT INTO public.manages(emp_cpr_number, account_number) VALUES (6007, 8015);



INSERT INTO checkingaccounts(account_number) 
VALUES (8000),(8001),(8002),(8003),(8004),(8005),(8006),(8007);

INSERT INTO InvestmentAccounts(account_number) 
VALUES (8008),(8009),(8010),(8011),(8012),(8013),(8014),(8015);

--\set @my_account 0
--INSERT INTO public.accounts(created_date, cpr_number)VALUES (now(),5000) RETURNING account_number AS :'my_account';
/*
INSERT INTO public.checkingaccounts(account_number) VALUES (:'my_account');
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
*/

-- contraints missing on transfers

INSERT INTO transfers (transfer_date, amount) VALUES (now(), 10);
INSERT INTO transfers (transfer_date, amount) VALUES (now(), 20);
INSERT INTO transfers (transfer_date, amount) VALUES (now(), 40);
INSERT INTO transfers (transfer_date, amount) VALUES (now(), 80);
INSERT INTO transfers (transfer_date, amount) VALUES (now(), 160);
INSERT INTO transfers (transfer_date, amount) VALUES (now(), 320);

-- contraints missing on withdraws

INSERT INTO withdraws ( amount, withdraw_date) VALUES (20480, now())
, (10240, now()), (5120, now()), (2560, now()), (1280, now()), (640, now());

-- contraints missing on deposits
INSERT INTO deposits ( amount, deposit_date) VALUES (40960, now())
, (81920, now()), (163840, now()), (327696, now()), (655392, now()), (1310784, now());

DELETE FROM certificates_of_deposit;
INSERT INTO public.certificates_of_deposit(start_date, amount, maturity_date)
VALUES (now(), 10000, now());
INSERT INTO public.certificates_of_deposit(cd_number, start_date, amount, maturity_date)
VALUES (7000, now(), 10000, now());