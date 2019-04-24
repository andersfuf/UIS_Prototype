from datetime import datetime
from bank import conn, login_manager
from flask_login import UserMixin


@login_manager.user_loader
def load_user(user_id):
    cur = conn.cursor()
    sql = """
    SELECT * FROM Customers
    WHERE CPR_number = %s
    """
    cur.execute(sql, (int(user_id),))
    return Customers(cur.fetchone())


class Customers(tuple, UserMixin):
    def __init__(self, user_data):
        self.CPR_number = user_data[0]
        self.risktype = False
        self.password = user_data[2]
        self.name = user_data[3]
        self.address = user_data[4]

    def get_id(self):
       return (self.CPR_number)


class CheckingAccount(tuple):
    def __init__(self, user_data):
        self.id = user_data[0]
        self.create_date = user_data[1]
        self.CPR_number = user_data[2]
        self.amount = 0

class InvestmentAccount(tuple):
    def __init__(self, user_data):
        self.id = user_data[0]
        self.start_date = user_data[1]
        self.maturity_date = user_data[2]
        self.amount = 0

class Transfers(tuple):
    def __init__(self, user_data):
        self.id = user_data[0]
        self.amount = user_data[1]
        self.transfer_date = user_data[2]
