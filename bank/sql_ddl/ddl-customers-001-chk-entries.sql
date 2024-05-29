-- CheckEntries could be called AccountEntries
-- but consistent choices should be made
-- For now check entries
--
DROP TABLE IF EXISTS checkEntries;

CREATE TABLE IF NOT EXISTS CheckEntries(
	id SERIAL PRIMARY KEY,
	account_number INTEGER NOT NULL REFERENCES CheckingAccounts(account_number),
    did INTEGER REFERENCES Deposits(id),
    wid INTEGER REFERENCES Deposits(id),
	created_date DATE DEFAULT CURRENT_DATE,
    emp INTEGER
    );

COMMENT ON TABLE CheckEntries IS ' -- CheckEntries could be called AccountEntries but consistent choices should be made. For now check entries';
COMMENT ON COLUMN CheckEntries.id   IS 'Entry ID';
COMMENT ON COLUMN CheckEntries.did   IS 'Deposit Entry ID When given';
COMMENT ON COLUMN CheckEntries.wid   IS 'Withdraw Entry ID When given';

