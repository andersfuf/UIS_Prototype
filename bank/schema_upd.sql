


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

