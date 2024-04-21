
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
UPDATE public.customers SET name    = 'C-5011-Panagiotis'   , address = 'HCØ, NEXS (DHL)' WHERE cpr_number IN (5011); 
UPDATE public.customers SET name    = 'C-5012-Dmitriy'      , address = 'HCØ, NEXS (DHL)' WHERE cpr_number IN (5012); 

--



UPDATE public.employees SET name    = 'E-Naomi' WHERE id IN (6000); 
UPDATE public.employees SET name    = 'E-Dmitriy' WHERE id IN (6001); 
UPDATE public.employees SET name    = 'E-Andreas' WHERE id IN (6002); 
UPDATE public.employees SET name    = 'E-Mustafa' WHERE id IN (6003); 
UPDATE public.employees SET name    = 'E-Harald' WHERE id IN (6004); --JAN
UPDATE public.employees SET name    = 'E-Maja' WHERE id IN (6005); 
UPDATE public.employees SET name    = 'E-Panagiotis' WHERE id IN (6006); --Marco
UPDATE public.employees SET name    = 'E-Thomas' WHERE id IN (6007); 
UPDATE public.employees SET name    = 'E-Sara' WHERE id IN (6010); 
UPDATE public.employees SET name    = 'E-Jan' WHERE id IN (6008); 
UPDATE public.employees SET name    = 'E-Anders' WHERE id IN (6009); 
UPDATE public.employees SET name    = 'E-Karl' WHERE id IN (6010); 



-- Activating automatic login
--select direct, name from customers;
--UPDATE customers SET direct = TRUE WHERE name = 'C-5007-Cathy';

--select direct, name, cpr_number from customers;
--UPDATE customers SET direct = TRUE WHERE cpr_number=5000;
--



