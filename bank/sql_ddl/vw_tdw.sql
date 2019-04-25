CREATE OR REPLACE VIEW vw_tdw
AS
SELECT 'T', transfer_date, amount FROM transfers
UNION
SELECT 'D', deposit_date, amount FROM deposits
UNION
SELECT 'W', withdraw_date, amount FROM withdraws
;