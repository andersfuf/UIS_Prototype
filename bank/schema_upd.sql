


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

	



INSERT INTO public.Employees(id, name, password)
VALUES (6008, 'UIS-PD3-E-Rikke',  '$2b$12$KFkp1IEMGT4QrWwjPGhE3ejOv6Z3pYhx/S4qOoFbanR2sMiZqgeJO')
,      (6009, 'UIS-DB2-E-Pax'  ,  '$2b$12$KFkp1IEMGT4QrWwjPGhE3ejOv6Z3pYhx/S4qOoFbanR2sMiZqgeJO')
,      (6010, 'UIS-PD2-E-Nadja',  '$2b$12$KFkp1IEMGT4QrWwjPGhE3ejOv6Z3pYhx/S4qOoFbanR2sMiZqgeJO')
;

INSERT INTO public.accounts(account_number, created_date, cpr_number) 
VALUES (8016, '2018-06-01',5008), (8017, '2018-06-01',5008), (8018, '2018-06-01',5008)
,      (8019, '2018-06-01',5009), (8020, '2018-06-01',5009), (8021, '2018-06-01',5009)
,      (8022, '2018-06-01',5010), (8023, '2018-06-01',5010), (8024, '2018-06-01',5010)
;

INSERT INTO public.manages(emp_cpr_number, account_number) VALUES (6008, 8010), (6008, 8011), (6008, 8016), (6008, 8017), (6008, 8018);
INSERT INTO public.manages(emp_cpr_number, account_number) VALUES (6009, 8012), (6009, 8013), (6009, 8019), (6009, 8020), (6009, 8021);
INSERT INTO public.manages(emp_cpr_number, account_number) VALUES (6010, 8014), (6010, 8015), (6010, 8022), (6010, 8023), (6010, 8024);



INSERT INTO deposits (account_number, amount, deposit_date)
VALUES (8000, 40960, now()), (8001, 81920, now()), (8002, 163840, now()), (8003, 327696, now()), (8004, 655392, now()), (8005, 1310784, now()), (8006, 16394, now()), (8007, 3154, now())
,      (8000, 40960, now()), (8001, 81920, now()), (8002, 163840, now()), (8003, 327696, now()), (8004, 655392, now()), (8005, 1310784, now()), (8006, 16394, now()), (8007, 3154, now())
,      (8000, 40960, now()), (8001, 81920, now()), (8002, 163840, now()), (8003, 327696, now()), (8004, 655392, now()), (8005, 1310784, now()), (8006, 16394, now()), (8007, 3154, now())
;

INSERT INTO withdraws (account_number, amount, withdraw_date)
VALUES (8000, 40960, now()), (8001, 81920, now()), (8002, 163840, now()), (8003, 327696, now()), (8004, 655392, now()), (8005, 1310784, now()), (8006, 16394, now()), (8007, 3154, now())
,      (8000, 40960, now()), (8001, 81920, now()), (8002, 163840, now()), (8003, 327696, now()), (8004, 655392, now()), (8005, 1310784, now()), (8006, 16394, now()), (8007, 3154, now())
,      (8000, 40960, now()), (8001, 81920, now()), (8002, 163840, now()), (8003, 327696, now()), (8004, 655392, now()), (8005, 1310784, now()), (8006, 16394, now()), (8007, 3154, now())
;

INSERT INTO transfers (transfer_date, amount, from_account, to_account)
VALUES (now(), 5000, 8000, 8016), (now(), 5000, 8001, 8017), (now(), 5000, 8002, 8018), (now(), 5000, 8003, 8019), (now(), 5000, 8004, 8020), (now(), 5000, 8005, 8021), (now(), 5000, 8006, 8022), (now(), 5000, 8007, 8023)
;

INSERT INTO investmentaccounts (account_number)
VALUES (8016), (8019), (8022)
;



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

