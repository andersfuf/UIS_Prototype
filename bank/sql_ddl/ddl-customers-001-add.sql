/*
* Bank project
*
*/

ALTER TABLE customers
ADD "direct"  BOOLEAN DEFAULT FALSE
;

-- SELECT * FROM customers order by 5;
-- UPDATE customers SET direct = TRUE;
-- UPDATE customers SET direct = FALSE;
--
-- COMMIT;
