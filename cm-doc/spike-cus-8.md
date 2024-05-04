# spike checking account CUS8

An account listing is called from a list of account. An account listing list the account information above. Then, the account entries are listed with two columns Debit and Credit to denote deposits and with drawals.


## Form / template list account

Take the account number and formatted account listing along with the balance and list the account.
Template name: accountlist.html
Form class in forms.py: 

## SQL on the account balance part


    CREATE OR REPLACE VIEW VW_check_balance
    AS
    SELECT ad.account_number account, ad.sumd, aw.sumw,ad.sumd - aw.sumw balance
    FROM
      (SELECT account_number, SUM(amount)sumd FROM deposits GROUP BY account_number)  ad
    , (SELECT account_number, SUM(amount) sumw FROM withdraws GROUP BY account_number) aw
    WHERE ad.account_number = aw.account_number
    ;

## Relational algebra on the details part


The relational algebra  below is one idea to rename deposits and withdraws and organize by date. This could be implemented as a view.

    D2(id,acc1, pdate, desc, debit, kredit) = symbol_phi id, account, deposit_date, “D”, amount, 0 (Deposits)                 ; Prepare D for union with W
    W2(id,acc1, pdate, desc, debit, kredit) = symbol_phi id, account, withdraw_date, “W”, 0, amount (Withdraws)       ; Prepare W for union with D

    P2                                                                 = D2 U W2                                                                                ; a relation with deposits and withdraws is created

    ACA1(cpr,acc1)             = symbol_phi cpr_number, account_number (Account symbol_natural_join Checkingaccount)       
    ; The customer cpr is natural joined from Account.

    Answer(cpr, account, pdate, desc, debit, kredit)  = symbol_phi cpr, acc1, pdate, desc, debit, kredit (symbol_sort pdate, id (ACA1 symbol_natural_join P2))
    ; join for cpr, sort on date and id


The SQL 

