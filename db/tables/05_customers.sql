-- Switch to using the `kion` database.
USE kion;

-- Create a `customers` table.
CREATE TABLE IF NOT EXISTS customers (
  id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  created DATETIME NOT NULL,
  updated DATETIME NOT NULL,
  CONSTRAINT UC_customers UNIQUE (name)
);

-- Add an index on the created column.
CREATE INDEX idx_customers_created ON customers(created);
