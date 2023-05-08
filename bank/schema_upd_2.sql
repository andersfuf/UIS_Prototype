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
,      (6012, 'DS-E-Theo',  '$2b$12$KFkp1IEMGT4QrWwjPGhE3ejOv6Z3pYhx/S4qOoFbanR2sMiZqgeJO')
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