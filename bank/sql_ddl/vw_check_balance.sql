-- VW_checkingaccount_balance
CREATE OR REPLACE VIEW VW_check_balance
AS
SELECT ad.account_number account, ad.sumd, aw.sumw,ad.sumd - aw.sumw balance
FROM
  (SELECT account_number, SUM(amount)sumd FROM deposits GROUP BY account_number)  ad
, (SELECT account_number, SUM(amount) sumw FROM withdraws GROUP BY account_number) aw
WHERE ad.account_number = aw.account_number
;