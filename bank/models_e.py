# write all your SQL queries in this file.
from datetime import datetime
from bank import conn, login_manager
from flask_login import UserMixin
from psycopg2 import sql


def select_emp_cus_accounts(emp_cpr_number):
    # employee id is parameter
    cur = conn.cursor()
    sql = """
    SELECT
      e.name employee
    , c.name customer 
    , cpr_number
    , account_number 
    FROM manages m
      NATURAL JOIN accounts  
      NATURAL JOIN customers c
      JOIN employees e ON m.emp_cpr_number = e.id
	WHERE emp_cpr_number = %s 
    ;
    """
    cur.execute(sql, (emp_cpr_number,))
    tuple_resultset = cur.fetchall()
    cur.close()
    return tuple_resultset

def select_emp_investments(emp_cpr_number):
    # employee id is parameter
    cur = conn.cursor()
    sql = """
    SELECT i.account_number, a.cpr_number, a.created_date 
    FROM investmentaccounts i
    JOIN accounts a ON i.account_number = a.account_number
    JOIN manages m ON m.account_number = a.account_number
    JOIN employees e ON e.id = m.emp_cpr_number
    WHERE e.id = %s
    """
    cur.execute(sql, (emp_cpr_number,))
    tuple_resultset = cur.fetchall()
    cur.close()
    return tuple_resultset

def select_emp_investments_with_certificates(emp_cpr_number):
    # employee id is parameter
    cur = conn.cursor()
    sql = """
    SELECT i.account_number, a.cpr_number, a.created_date
    , cd.cd_number, start_date, maturity_date, rate, amount 
    FROM investmentaccounts i
    JOIN accounts a ON i.account_number = a.account_number
    JOIN certificates_of_deposit cd ON i.account_number = cd.account_number    
    JOIN manages m ON m.account_number = a.account_number
    JOIN employees e ON e.id = m.emp_cpr_number
    WHERE e.id = %s
    ORDER BY 1
    """
    cur.execute(sql, (emp_cpr_number,))
    tuple_resultset = cur.fetchall()
    cur.close()
    return tuple_resultset

def select_emp_investments_certificates_sum(emp_cpr_number):
    # employee id is parameter
    cur = conn.cursor()
    sql = """
    SELECT account_number, cpr_number, created_date, sum
    FROM vw_cd_sum
    WHERE emp_cpr_number = %s
    ORDER BY 2,1
    """
    cur.execute(sql, (emp_cpr_number,))
    tuple_resultset = cur.fetchall()
    cur.close()
    return tuple_resultset
