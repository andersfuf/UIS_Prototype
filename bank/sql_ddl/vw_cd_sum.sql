CREATE OR REPLACE VIEW vw_cd_sum
AS
SELECT m.emp_cpr_number, i.account_number, a.cpr_number, a.created_date
    , sum (amount) 
    FROM investmentaccounts i
    JOIN accounts a ON i.account_number = a.account_number
    JOIN certificates_of_deposit cd ON i.account_number = cd.account_number
    JOIN manages m ON m.account_number = a.account_number
    JOIN employees e ON e.id = m.emp_cpr_number
GROUP BY  m.emp_cpr_number, i.account_number, a.cpr_number, a.created_date;
