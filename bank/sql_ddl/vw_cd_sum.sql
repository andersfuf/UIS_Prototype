CREATE OR REPLACE VIEW vw_cd_sum
AS
SELECT i.account_number, a.cpr_number, a.created_date
    , sum (amount) 
    FROM investmentaccounts i
    JOIN accounts a ON i.account_number = a.account_number
    JOIN certificates_of_deposit cd ON i.account_number = cd.account_number   
GROUP BY  i.account_number, a.cpr_number, a.created_date;
