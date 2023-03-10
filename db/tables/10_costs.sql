-- Switch to using the `kion` database.
USE kion;

-- Create a `costs` table.
CREATE TABLE IF NOT EXISTS costs (
  id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  customer_id int NOT NULL,
  month_code TEXT NOT NULL,
  amount FLOAT NOT NULL,
  created DATETIME NOT NULL,
  updated DATETIME NOT NULL
);

-- Add an index on the created column.
CREATE INDEX idx_costs_created ON costs(created);
