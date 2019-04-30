from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, SubmitField, BooleanField, IntegerField, SelectField
from wtforms.validators import DataRequired, Length, EqualTo, ValidationError
class RegistrationForm(FlaskForm):
    username = StringField('Username',
                           validators=[DataRequired(), Length(min=2, max=20)])
    CPR_number = IntegerField('CPR_number',
                        validators=[DataRequired()])
    password = PasswordField('Password', validators=[DataRequired()])
    confirm_password = PasswordField('Confirm Password',
                                     validators=[DataRequired(), EqualTo('password')])
    submit = SubmitField('Sign Up')


class CustomerLoginForm(FlaskForm):
    id = IntegerField('CPR_number', validators=[DataRequired()])
    password = PasswordField('Password', validators=[DataRequired()])
    remember = BooleanField('Remember Me')
    submit = SubmitField('Login')

class EmployeeLoginForm(FlaskForm):
    id = IntegerField('Id', validators=[DataRequired()])
    password = PasswordField('Password', validators=[DataRequired()])
    remember = BooleanField('Remember Me')
    submit = SubmitField('Login')

class TransferForm(FlaskForm):
    amount = IntegerField('amount', 
                        validators=[DataRequired()])
    sourceAccount = IntegerField('From Account:', validators=[DataRequired()])
    targetAccount = IntegerField('Target Account:', validators=[DataRequired()])
    submit = SubmitField('Confirm')

class DepositForm(FlaskForm):
    amount = IntegerField('amount', 
                       validators=[DataRequired()])
    submit = SubmitField('Confirm')
    
class InvestForm(FlaskForm):
    submit = SubmitField('Confirm')