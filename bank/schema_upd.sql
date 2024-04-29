
--
-- schema_upd.sql 20240420
--
\echo "schema_upd.sql 20240420"

-- student room
UPDATE public.customers SET name    = 'C-5005-Asbjørn Marco', address = 'AB Teori 2 Open for students, NEXS (DHL)' WHERE cpr_number IN (5005); 
--TA
UPDATE public.customers SET name    = 'C-5000-Maja'         , address = 'Auditorium Syd, NEXS (DHL)' WHERE cpr_number IN (5000); 
UPDATE public.customers SET name    = 'C-5001-Thomas'       , address = 'A105 (HCØ)' WHERE cpr_number IN (5001); 
UPDATE public.customers SET name    = 'C-5003-Sara'         , address = 'Auditorium Nord, NEXS (DHL)' WHERE cpr_number IN (5003);
UPDATE public.customers SET name    = 'C-5006-Mustafa'      , address = 'A106 (HCØ)' WHERE cpr_number IN (5006); 
UPDATE public.customers SET name    = 'C-5007-Naomi'        , address = 'A101 (HCØ)' WHERE cpr_number IN (5007); 
UPDATE public.customers SET name    = 'C-5009-Harald'       , address = 'A104 (HCØ)' WHERE cpr_number IN (5009); 
-- TA previously
UPDATE public.customers SET name    = 'C-5002-Karl'         , address = 'A102 (HCØ)' WHERE cpr_number IN (5002); 
UPDATE public.customers SET name    = 'C-5004-Jan'          , address = 'A107 (HCØ)' WHERE cpr_number IN (5004); 
UPDATE public.customers SET name    = 'C-5010-Andreas'      , address = 'A103 (HCØ)' WHERE cpr_number IN (5010); 
-- SUPER-TA, Lecturers
UPDATE public.customers SET name    = 'C-5008-Anders'       , address = 'HCØ, NEXS (DHL)' WHERE cpr_number IN (5008); 
UPDATE public.customers SET name    = 'C-5011-Panos'        , address = 'HCØ, NEXS (DHL)' WHERE cpr_number IN (5011); 
UPDATE public.customers SET name    = 'C-5012-Dmitriy'      , address = 'HCØ, NEXS (DHL)' WHERE cpr_number IN (5012); 

--



UPDATE public.employees SET name    = 'E-6000-Naomi' WHERE id IN (6000); 
UPDATE public.employees SET name    = 'E-6001-Dmitriy' WHERE id IN (6001); 
UPDATE public.employees SET name    = 'E-6002-Andreas' WHERE id IN (6002); 
UPDATE public.employees SET name    = 'E-6003-Mustafa' WHERE id IN (6003); 
UPDATE public.employees SET name    = 'E-6004-Harald' WHERE id IN (6004);
UPDATE public.employees SET name    = 'E-6005-Maja' WHERE id IN (6005); 
UPDATE public.employees SET name    = 'E-6006-Panos' WHERE id IN (6006); 
UPDATE public.employees SET name    = 'E-6007-Thomas' WHERE id IN (6007); 
UPDATE public.employees SET name    = 'E-6010-Sara' WHERE id IN (6010); 
UPDATE public.employees SET name    = 'E-6008-Jan' WHERE id IN (6008); 
UPDATE public.employees SET name    = 'E-6009-Anders' WHERE id IN (6009); 
UPDATE public.employees SET name    = 'E-6010-Karl' WHERE id IN (6010); 



-- Activating automatic login
--select direct, name from customers;
--UPDATE customers SET direct = TRUE WHERE name = 'C-5007-Cathy';

--select direct, name, cpr_number from customers;
UPDATE customers SET direct = TRUE WHERE cpr_number=5000;
UPDATE customers SET direct = TRUE WHERE cpr_number=5007;
--

INSERT INTO public.customers(cpr_number, risk_type, password, name, address) 
VALUES (5013, TRUE, '$2b$12$KFkp1IEMGT4QrWwjPGhE3ejOv6Z3pYhx/S4qOoFbanR2sMiZqgeJO', 'C-5013-Rafael'  , 'HCØ, NEXS (DHL)')
;

INSERT INTO public.Employees(id, name, password)
VALUES (6013, 'E-6013-Rafael'  ,  '$2b$12$KFkp1IEMGT4QrWwjPGhE3ejOv6Z3pYhx/S4qOoFbanR2sMiZqgeJO')
;

INSERT INTO public.manages(emp_cpr_number, account_number) VALUES (6006, 8022), (6011, 8005), (6007, 8040), (6013, 8000), (6013, 8008);
INSERT INTO public.manages(emp_cpr_number, account_number) VALUES (6006, 8017), (6011, 8033), (6007, 8041), (6013, 8001), (6013, 8009);
INSERT INTO public.manages(emp_cpr_number, account_number) VALUES (6005, 8039), (6006, 8036), (6007, 8042), (6013, 8025), (6013, 8003);

