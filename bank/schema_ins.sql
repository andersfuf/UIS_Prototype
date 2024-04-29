--
-- schema_ins.sql
-- Populate bank schema with data.
--
\echo Emptying the bank database. Deleting all tuples.
--
-- Dependency level 2
-- Referential integrity to level 1 and 0
--
DELETE FROM deposits;
DELETE FROM withdraws;
DELETE FROM checkingaccounts;
DELETE FROM certificates_of_deposit;
--
-- Dependency level 1
-- Referential integrity to level 0
--
DELETE FROM InvestmentAccounts;
DELETE FROM CheckingAccounts;
DELETE FROM manages;
DELETE FROM transfers;
--
-- Dependency level 0. 
-- No referential integrity constraints
--
DELETE FROM accounts;
DELETE FROM employees;
DELETE FROM customers;

\echo .
\echo
\echo Adding data:
INSERT INTO public.customers(cpr_number, risk_type, password, name, address) VALUES (5000, TRUE, '$2b$12$KFkp1IEMGT4QrWwjPGhE3ejOv6Z3pYhx/S4qOoFbanR2sMiZqgeJO', 'UIS-DB3-C-Lasse', 'aud Auditorium A, bygning 1, 1. sal Universitetsparken 15 (Zoo)');
INSERT INTO public.customers(cpr_number, risk_type, password, name, address) VALUES (5001, TRUE, '$2b$12$KFkp1IEMGT4QrWwjPGhE3ejOv6Z3pYhx/S4qOoFbanR2sMiZqgeJO', 'UIS-PD3-C-Anders', 'øv* Kursussal 1, bygning 3, 1.sal Universitetsparken 15 (Zoo)');
INSERT INTO public.customers(cpr_number, risk_type, password, name, address) VALUES (5002, TRUE, '$2b$12$KFkp1IEMGT4QrWwjPGhE3ejOv6Z3pYhx/S4qOoFbanR2sMiZqgeJO', 'UIS-DB2-C-Ziming', 'øv 4032, Ole Maaløes Vej 5 (Biocenter)');
INSERT INTO public.customers(cpr_number, risk_type, password, name, address) VALUES (5003, TRUE, '$2b$12$KFkp1IEMGT4QrWwjPGhE3ejOv6Z3pYhx/S4qOoFbanR2sMiZqgeJO', 'UIS-PD2-C-Hubert', 'øv Auditorium Syd, Nørre Alle 51');
INSERT INTO public.customers(cpr_number, risk_type, password, name, address) VALUES (5004, TRUE, '$2b$12$KFkp1IEMGT4QrWwjPGhE3ejOv6Z3pYhx/S4qOoFbanR2sMiZqgeJO', 'UIS-DB1-C-Jan', 'øv A112, Universitetsparken 5, HCØ');
INSERT INTO public.customers(cpr_number, risk_type, password, name, address) VALUES (5005, TRUE, '$2b$12$KFkp1IEMGT4QrWwjPGhE3ejOv6Z3pYhx/S4qOoFbanR2sMiZqgeJO', 'UIS-PD1-C-Marco', 'Aud 07, Universitetsparken 5, HCØ');
INSERT INTO public.customers(cpr_number, risk_type, password, name, address) VALUES (5006, TRUE, '$2b$12$KFkp1IEMGT4QrWwjPGhE3ejOv6Z3pYhx/S4qOoFbanR2sMiZqgeJO', 'UIS-LE1-C-Marcos', 'AUD 02 in the HCØ building (HCØ, Universitetsparken 5)');
INSERT INTO public.customers(cpr_number, risk_type, password, name, address) VALUES (5007, TRUE, '$2b$12$KFkp1IEMGT4QrWwjPGhE3ejOv6Z3pYhx/S4qOoFbanR2sMiZqgeJO', 'UIS-LE2-C-Finn', 'AUD 02 in the HCØ building (HCØ, Universitetsparken 5)');

INSERT INTO public.customers(cpr_number, risk_type, password, name, address) 
VALUES (5008, TRUE, '$2b$12$KFkp1IEMGT4QrWwjPGhE3ejOv6Z3pYhx/S4qOoFbanR2sMiZqgeJO', 'UIS-PD1-C-Rikke', 'AUD 08, Universitetsparken 5, HCØ')
,      (5009, TRUE, '$2b$12$KFkp1IEMGT4QrWwjPGhE3ejOv6Z3pYhx/S4qOoFbanR2sMiZqgeJO', 'UIS-DB1-C-Pax'  , 'AUD 05, Universitetsparken 5, HCØ')
,      (5010, TRUE, '$2b$12$KFkp1IEMGT4QrWwjPGhE3ejOv6Z3pYhx/S4qOoFbanR2sMiZqgeJO', 'UIS-PD2-C-Nadja', 'AUD 08, Universitetsparken 5, HCØ')
;

UPDATE public.customers SET address = 'AUD 08, Universitetsparken 5, HCØ' WHERE cpr_number IN (5001); 
UPDATE public.customers SET address = 'aud - Lille UP1 - 04-1-22, Universitetsparken 1-3, DIKU' WHERE cpr_number IN (5003, 5007); 
UPDATE public.customers SET address = 'online-zoom'      WHERE cpr_number IN (5006); 
UPDATE public.customers SET name    = 'UIS-DB2-C-Anders' WHERE cpr_number IN (5008); 
UPDATE public.customers SET name    = 'UIS-LE-C-Hubert'  WHERE cpr_number IN (5003); 

	



\echo ..

INSERT INTO public.Employees(id, name, password)
VALUES (6000, 'UIS-DB3-E-Lasse',  '$2b$12$KFkp1IEMGT4QrWwjPGhE3ejOv6Z3pYhx')
, (6001, 'UIS-PD3-E-Anders',  '$2b$12$KFkp1IEMGT4QrWwjPGhE3ejOv6Z3pYhx/S4qOoFbanR2sMiZqgeJO')
, (6002, 'UIS-DB2-E-Ziming',  '$2b$12$KFkp1IEMGT4QrWwjPGhE3ejOv6Z3pYhx/S4qOoFbanR2sMiZqgeJO')
, (6003, 'UIS-PD2-E-Hubert',  '$2b$12$KFkp1IEMGT4QrWwjPGhE3ejOv6Z3pYhx/S4qOoFbanR2sMiZqgeJO')
, (6004, 'UIS-DB1-E-Jan'   ,  '$2b$12$KFkp1IEMGT4QrWwjPGhE3ejOv6Z3pYhx/S4qOoFbanR2sMiZqgeJO')
, (6005, 'UIS-PD1-E-Marco' ,  '$2b$12$KFkp1IEMGT4QrWwjPGhE3ejOv6Z3pYhx/S4qOoFbanR2sMiZqgeJO')
, (6006, 'UIS-LE1-E-Marcos',  '$2b$12$KFkp1IEMGT4QrWwjPGhE3ejOv6Z3pYhx/S4qOoFbanR2sMiZqgeJO')
, (6007, 'UIS-LE2-E-Finn' ,  '$2b$12$KFkp1IEMGT4QrWwjPGhE3ejOv6Z3pYhx/S4qOoFbanR2sMiZqgeJO')
;

INSERT INTO public.Employees(id, name, password)
VALUES (6008, 'UIS-PD3-E-Rikke',  '$2b$12$KFkp1IEMGT4QrWwjPGhE3ejOv6Z3pYhx/S4qOoFbanR2sMiZqgeJO')
,      (6009, 'UIS-DB2-E-Pax'  ,  '$2b$12$KFkp1IEMGT4QrWwjPGhE3ejOv6Z3pYhx/S4qOoFbanR2sMiZqgeJO')
,      (6010, 'UIS-PD2-E-Nadja',  '$2b$12$KFkp1IEMGT4QrWwjPGhE3ejOv6Z3pYhx/S4qOoFbanR2sMiZqgeJO')
;

\echo ...
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



INSERT INTO public.accounts(account_number, created_date, cpr_number) 
VALUES (8016, '2018-06-01',5008), (8017, '2018-06-01',5008), (8018, '2018-06-01',5008)
,      (8019, '2018-06-01',5009), (8020, '2018-06-01',5009), (8021, '2018-06-01',5009)
,      (8022, '2018-06-01',5010), (8023, '2018-06-01',5010), (8024, '2018-06-01',5010)
;

\echo ....
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

INSERT INTO public.manages(emp_cpr_number, account_number) VALUES (6008, 8010), (6008, 8011), (6008, 8016), (6008, 8017), (6008, 8018);
INSERT INTO public.manages(emp_cpr_number, account_number) VALUES (6009, 8012), (6009, 8013), (6009, 8019), (6009, 8020), (6009, 8021);
INSERT INTO public.manages(emp_cpr_number, account_number) VALUES (6010, 8014), (6010, 8015), (6010, 8022), (6010, 8023), (6010, 8024);


\echo .....
INSERT INTO checkingaccounts(account_number) 
VALUES (8000),(8001),(8002),(8003),(8004),(8005),(8006),(8007);
\echo ......
INSERT INTO InvestmentAccounts(account_number) 
VALUES (8008),(8009),(8010),(8011),(8012),(8013),(8014),(8015);

INSERT INTO investmentaccounts (account_number)
VALUES (8016), (8019), (8022)
;

\echo ........
-- contraints missing on transfers

INSERT INTO transfers (transfer_date, amount, from_account, to_account) VALUES (now(), 10, 8000, 8001);
INSERT INTO transfers (transfer_date, amount, from_account, to_account) VALUES (now(), 20, 8009, 8008);
INSERT INTO transfers (transfer_date, amount, from_account, to_account) VALUES (now(), 40, 8005, 8006);
INSERT INTO transfers (transfer_date, amount, from_account, to_account) VALUES (now(), 80, 8003, 8011);
INSERT INTO transfers (transfer_date, amount, from_account, to_account) VALUES (now(), 160, 8002, 8003);
INSERT INTO transfers (transfer_date, amount, from_account, to_account) VALUES (now(), 320, 8004, 8012);

INSERT INTO transfers (transfer_date, amount, from_account, to_account)
VALUES (now(), 5000, 8000, 8016), (now(), 5000, 8001, 8017), (now(), 5000, 8002, 8018), (now(), 5000, 8003, 8019), (now(), 5000, 8004, 8020), (now(), 5000, 8005, 8021), (now(), 5000, 8006, 8022), (now(), 5000, 8007, 8023)
;

\echo .........
-- contraints missing on withdraws

INSERT INTO withdraws ( amount, withdraw_date) VALUES (20480, now())
, (10240, now()), (5120, now()), (2560, now()), (1280, now()), (640, now());

INSERT INTO withdraws (account_number, amount, withdraw_date)
VALUES (8000, 40960, now()), (8001, 81920, now()), (8002, 163840, now()), (8003, 327696, now()), (8004, 655392, now()), (8005, 1310784, now()), (8006, 16394, now()), (8007, 3154, now())
,      (8000, 40960, now()), (8001, 81920, now()), (8002, 163840, now()), (8003, 327696, now()), (8004, 655392, now()), (8005, 1310784, now()), (8006, 16394, now()), (8007, 3154, now())
,      (8000, 40960, now()), (8001, 81920, now()), (8002, 163840, now()), (8003, 327696, now()), (8004, 655392, now()), (8005, 1310784, now()), (8006, 16394, now()), (8007, 3154, now())
;

\echo ..........
-- contraints missing on deposits
INSERT INTO deposits ( amount, deposit_date) VALUES (40960, now())
, (81920, now()), (163840, now()), (327696, now()), (655392, now()), (1310784, now());

INSERT INTO deposits (account_number, amount, deposit_date)
VALUES (8000, 40960, now()), (8001, 81920, now()), (8002, 163840, now()), (8003, 327696, now()), (8004, 655392, now()), (8005, 1310784, now()), (8006, 16394, now()), (8007, 3154, now())
,      (8000, 40960, now()), (8001, 81920, now()), (8002, 163840, now()), (8003, 327696, now()), (8004, 655392, now()), (8005, 1310784, now()), (8006, 16394, now()), (8007, 3154, now())
,      (8000, 40960, now()), (8001, 81920, now()), (8002, 163840, now()), (8003, 327696, now()), (8004, 655392, now()), (8005, 1310784, now()), (8006, 16394, now()), (8007, 3154, now())
;

\echo ...........

-- new certificate
INSERT INTO public.certificates_of_deposit(start_date, amount, maturity_date,account_number) VALUES (now(), 10000, now(), 8014);
INSERT INTO public.certificates_of_deposit(start_date, amount, maturity_date,account_number) VALUES (now(), 20000, now(), 8014);
INSERT INTO public.certificates_of_deposit(start_date, amount, maturity_date,account_number) VALUES (now(), 40000, now(), 8014);
INSERT INTO public.certificates_of_deposit(start_date, amount, maturity_date,account_number) VALUES (now(),  1000, now(), 8014);
INSERT INTO public.certificates_of_deposit(start_date, amount, maturity_date,account_number) VALUES (now(),  2000, now(), 8014);
\echo ............
-- cd_number given
INSERT INTO public.certificates_of_deposit(cd_number, start_date, amount, maturity_date,account_number) VALUES (7000, now(), 10000, now(),8015);
-- new certificate fixed rate 4 percent
INSERT INTO public.certificates_of_deposit(start_date, amount, maturity_date,account_number, rate) VALUES (now(), 10000, now(), 8013, 4);
-- cd_number given fixed rate 5 percent
INSERT INTO public.certificates_of_deposit(cd_number, start_date, amount, maturity_date,account_number, rate) VALUES (7001, now(), 10000, now(),8012, 5);
\echo .............


--
-- from schema_upd.sql 20231112
--
\echo "from schema_upd.sql 20231112"


-- 202212
-- Investment accounts for 6001-6003. Mangage own accounts 
INSERT INTO public.accounts(account_number, created_date, cpr_number) 
VALUES (8025, '2018-06-01',5001), (8028, '2018-06-01',5002), (8031, '2018-06-01',5003)
,      (8026, '2018-06-01',5001), (8029, '2018-06-01',5002), (8032, '2018-06-01',5003)
,      (8027, '2018-06-01',5001), (8030, '2018-06-01',5002), (8033, '2018-06-01',5003)
;

INSERT INTO public.manages(emp_cpr_number, account_number) 
VALUES (6001, 8025), (6001, 8026), (6001, 8027)
,      (6002, 8028), (6002, 8029), (6002, 8030)
,      (6003, 8031), (6003, 8032), (6003, 8033);

INSERT INTO investmentaccounts (account_number)
VALUES (8025), (8026), (8027)
,      (8028), (8029), (8030)
,      (8031), (8032), (8033)
;


-- new certificate fixed rate 4 percent
INSERT INTO public.certificates_of_deposit(start_date, amount, maturity_date,account_number, rate) VALUES (now(), 140000, now(), 8025, 4);
INSERT INTO public.certificates_of_deposit(start_date, amount, maturity_date,account_number, rate) VALUES (now(), 130000, now(), 8025, 5);
INSERT INTO public.certificates_of_deposit(start_date, amount, maturity_date,account_number, rate) VALUES (now(), 120000, now(), 8026, 4);
INSERT INTO public.certificates_of_deposit(start_date, amount, maturity_date,account_number, rate) VALUES (now(), 110000, now(), 8026, 5);
INSERT INTO public.certificates_of_deposit(start_date, amount, maturity_date,account_number, rate) VALUES (now(), 100000, now(), 8026, 4);
INSERT INTO public.certificates_of_deposit(start_date, amount, maturity_date,account_number, rate) VALUES (now(),  90000, now(), 8027, 5);
INSERT INTO public.certificates_of_deposit(start_date, amount, maturity_date,account_number, rate) VALUES (now(),  80000, now(), 8027, 6);

INSERT INTO public.certificates_of_deposit(start_date, amount, maturity_date,account_number, rate) VALUES (now(), 140000, now(), 8008, 4);
INSERT INTO public.certificates_of_deposit(start_date, amount, maturity_date,account_number, rate) VALUES (now(), 130000, now(), 8009, 5);
INSERT INTO public.certificates_of_deposit(start_date, amount, maturity_date,account_number, rate) VALUES (now(), 120000, now(), 8010, 4);
INSERT INTO public.certificates_of_deposit(start_date, amount, maturity_date,account_number, rate) VALUES (now(), 110000, now(), 8008, 5);
INSERT INTO public.certificates_of_deposit(start_date, amount, maturity_date,account_number, rate) VALUES (now(), 100000, now(), 8010, 4);
INSERT INTO public.certificates_of_deposit(start_date, amount, maturity_date,account_number, rate) VALUES (now(),  90000, now(), 8009, 5);
INSERT INTO public.certificates_of_deposit(start_date, amount, maturity_date,account_number, rate) VALUES (now(),  80000, now(), 8008, 6);
INSERT INTO public.certificates_of_deposit(start_date, amount, maturity_date,account_number, rate) VALUES (now(),   2000, now(), 8016, 6);
INSERT INTO public.certificates_of_deposit(start_date, amount, maturity_date,account_number, rate) VALUES (now(),  80030, now(), 8019, 6);
INSERT INTO public.certificates_of_deposit(start_date, amount, maturity_date,account_number, rate) VALUES (now(),   4000, now(), 8022, 6);
INSERT INTO public.certificates_of_deposit(start_date, amount, maturity_date,account_number, rate) VALUES (now(),  80400, now(), 8022, 2);
INSERT INTO public.certificates_of_deposit(start_date, amount, maturity_date,account_number, rate) VALUES (now(),   6000, now(), 8030, 6);
INSERT INTO public.certificates_of_deposit(start_date, amount, maturity_date,account_number, rate) VALUES (now(),  85000, now(), 8019, 2);
INSERT INTO public.certificates_of_deposit(start_date, amount, maturity_date,account_number, rate) VALUES (now(),   8000, now(), 8031, 6);
INSERT INTO public.certificates_of_deposit(start_date, amount, maturity_date,account_number, rate) VALUES (now(),   8000, now(), 8022, 6);
INSERT INTO public.certificates_of_deposit(start_date, amount, maturity_date,account_number, rate) VALUES (now(),   8000, now(), 8032, 6);
INSERT INTO public.certificates_of_deposit(start_date, amount, maturity_date,account_number, rate) VALUES (now(),   6500, now(), 8012, 3);

\echo ..............



--
-- from schema_upd_2.sql 20231112
--
\echo "from schema_upd_2.sql 20231112"


UPDATE public.customers SET name    = 'C-5000-Theo'        , address = '3-0-25, UP 1 (DIKU)' WHERE cpr_number IN (5000); 
UPDATE public.customers SET name    = 'C-5001-Lennard'     , address = 'Kursussal 4A, UP 15 (ZOO)' WHERE cpr_number IN (5001); 
UPDATE public.customers SET name    = 'C-5002-Karl'        , address = '4-0-24, Biocenter' WHERE cpr_number IN (5002); 
UPDATE public.customers SET name    = 'C-5003-Christian M' , address = 'Lundbeck Auditoriet, Biocenter' WHERE cpr_number IN (5003);
--JAN 
UPDATE public.customers SET name    = 'C-5004-Jan'          , address = 'AB Teori 2, NEXS (DHL)' WHERE cpr_number IN (5004); 
UPDATE public.customers SET name    = 'C-5005-Asbjørn Marco', address = 'Auditorium A, UP 15 (ZOO)' WHERE cpr_number IN (5005); 
UPDATE public.customers SET name    = 'C-5006-Christian A'  , address = 'Aud 01, UP 5 (HCØ)' WHERE cpr_number IN (5006); 
UPDATE public.customers SET name    = 'C-5007-Cathy'        , address = '4-0-05, Biocenter' WHERE cpr_number IN (5007); 
--Anders
UPDATE public.customers SET name    = 'C-5008-Anders'       , address = 'AB Teori 2(DHL),Aud 01(HCØ),3-0-25(DIKU)' WHERE cpr_number IN (5008); 
UPDATE public.customers SET name    = 'C-5009-Axel'         , address = 'Lundbeck Auditoriet, Biocenter' WHERE cpr_number IN (5009); 
UPDATE public.customers SET name    = 'C-5010-Andreas'      , address = '4-0-10, Biocenter' WHERE cpr_number IN (5010); 
--
INSERT INTO public.customers(cpr_number, risk_type, password, name, address) 
VALUES (5011, TRUE, '$2b$12$KFkp1IEMGT4QrWwjPGhE3ejOv6Z3pYhx/S4qOoFbanR2sMiZqgeJO', 'C-5011-Ana'     , 'Auditorium A (ZOO), Kursussal 4A (ZOO),4-0-24, Biocenter')
,      (5012, TRUE, '$2b$12$KFkp1IEMGT4QrWwjPGhE3ejOv6Z3pYhx/S4qOoFbanR2sMiZqgeJO', 'C-5012-Dmitri'  , 'Lundbeck Auditoriet, 4-0-05,4-0-10  Biocenter')
;


--  delete from public.customers where cpr_number in (5011, 5012);

UPDATE public.employees SET password    = '$2b$12$KFkp1IEMGT4QrWwjPGhE3ejOv6Z3pYhx/S4qOoFbanR2sMiZqgeJO' WHERE id IN (6000); 



UPDATE public.employees SET name    = 'DIS-E-Ana' WHERE id IN (6000); 
UPDATE public.employees SET name    = 'LE-E-Dmitri' WHERE id IN (6001); 
UPDATE public.employees SET name    = 'DS-E-Andreas' WHERE id IN (6002); 
UPDATE public.employees SET name    = 'DS-E-Asbjørn Marco' WHERE id IN (6003); 
UPDATE public.employees SET name    = 'DS-E-Axel' WHERE id IN (6004); --JAN
UPDATE public.employees SET name    = 'DIS-E-Cathy' WHERE id IN (6005); 
UPDATE public.employees SET name    = 'DS-E-Christian Arboe' WHERE id IN (6006); --Marco
UPDATE public.employees SET name    = 'DS-E-Christian M' WHERE id IN (6007); 
UPDATE public.employees SET name    = 'DS-E-Karl' WHERE id IN (6010); 
UPDATE public.employees SET name    = 'DIS-E-Jan' WHERE id IN (6008); 
UPDATE public.employees SET name    = 'UIS-E-Anders' WHERE id IN (6009); 
UPDATE public.employees SET name    = 'DS-E-Karl' WHERE id IN (6010); 


INSERT INTO public.Employees(id, name, password)
VALUES (6011, 'DIS-E-Lennard'  ,  '$2b$12$KFkp1IEMGT4QrWwjPGhE3ejOv6Z3pYhx/S4qOoFbanR2sMiZqgeJO')
,      (6012, 'DS-E-Theo'      ,  '$2b$12$KFkp1IEMGT4QrWwjPGhE3ejOv6Z3pYhx/S4qOoFbanR2sMiZqgeJO')
;



INSERT INTO public.accounts(account_number, created_date, cpr_number) 
VALUES (8034, '2018-06-01',5011), (8037, '2018-06-01',5011), (8040, '2018-06-01',5011)
,      (8035, '2018-06-01',5012), (8038, '2018-06-01',5012), (8041, '2018-06-01',5012)
,      (8036, '2018-06-01',5005), (8039, '2018-06-01',5004), (8042, '2018-06-01',5000)
;

-- select name, cpr_number, count (account_number) from customers natural join accounts group by name, cpr_number order by 2;
-- select emp_cpr_number, account_number, cpr_number from manages natural join accounts order by 3,1;

INSERT INTO public.manages(emp_cpr_number, account_number) VALUES (6011, 8034), (6011, 8037), (6011, 8040), (6004, 8000), (6000, 8008);
INSERT INTO public.manages(emp_cpr_number, account_number) VALUES (6012, 8035), (6012, 8038), (6012, 8041), (6004, 8001), (6000, 8009);
INSERT INTO public.manages(emp_cpr_number, account_number) VALUES (6005, 8036), (6004, 8039), (6000, 8042), (6000, 8025), (6000, 8003);

-- deposits must be to checking accounts.
INSERT INTO checkingaccounts (account_number) VALUES (8034), (8035), (8036), (8037), (8038), (8039),(8040), (8041);
INSERT INTO deposits (account_number, amount, deposit_date)
VALUES (8034, 34951, now()), (8035, 17560, now()), (8036, 14290, now()), (8037, 20280, now()), (8038, 40680, now()), (8039, 44560, now()), (8040, 9021, now()), (8041, 44431, now())
,      (8034, 14290, now()), (8035, 34951, now()), (8036, 17560, now()), (8037, 40680, now()), (8038, 44560, now()), (8039, 20280, now()), (8040, 10350, now()), (8041, 9021, now())
,      (8034, 17560, now()), (8035, 14290, now()), (8036, 34951, now()), (8037, 44560, now()), (8038, 20280, now()), (8039, 40680, now()), (8040, 44431, now()), (8041, 10350, now())
;

INSERT INTO withdraws (account_number, amount, withdraw_date)
VALUES (8034, 30771, now()), (8035, 30771, now()), (8036, 30771, now()), (8037, 20644, now()), (8038, 20644, now()), (8039, 20644, now()), (8040, 43090, now()), (8041, 43090, now())
,      (8034, 42623, now()), (8035, 42623, now()), (8036, 42623, now()), (8037, 35051, now()), (8038, 35051, now()), (8039, 35051, now()), (8040, 8690, now()), (8041, 8690, now())
,      (8034, 37736, now()), (8035, 37736, now()), (8036, 37736, now()), (8037, 11137, now()), (8038, 11137, now()), (8039, 11137, now()), (8040, 5085, now()), (8041, 5085, now())
;

INSERT INTO transfers (transfer_date, amount, from_account, to_account)
VALUES (now(), 3827, 8000, 8042), (now(), 3827, 8001, 8042), (now(), 3827, 8002, 8042), (now(), 3827, 8003, 8042), (now(), 3827, 8004, 8042), (now(), 3827, 8005, 8042), (now(), 3827, 8006, 8042), (now(), 3827, 8007, 8042)
;


INSERT INTO investmentaccounts (account_number)
VALUES (8035), (8038), (8041)
;
\echo ...............
\echo done
