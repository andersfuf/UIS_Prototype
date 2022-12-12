DROP VIEW IF EXISTS vw_tdw;
DROP VIEW IF EXISTS vw_invest_accounts;
DROP VIEW IF EXISTS vw_cd_sum;
DROP VIEW IF EXISTS vw_invest_certificates;

--

DROP TABLE IF EXISTS Withdraws;
DROP TABLE IF EXISTS Deposits;
DROP TABLE IF EXISTS Certificates_of_deposit;
-- ROLLBACK; commit;

DROP TABLE IF EXISTS InvestmentAccounts;
DROP TABLE IF EXISTS CheckingAccounts;
--
DROP TABLE IF EXISTS Transfers;
DROP TABLE IF EXISTS Manages;
--
DROP TABLE IF EXISTS Accounts;
--
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Customers;
