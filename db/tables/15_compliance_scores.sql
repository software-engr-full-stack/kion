-- Switch to using the `kion` database.
USE kion;

-- Create a `compliance_scores` table.
CREATE TABLE IF NOT EXISTS compliance_scores (
  id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  customer_id int NOT NULL,
  total_checks INTEGER NOT NULL,
  completed INTEGER NOT NULL,
  created DATETIME NOT NULL,
  updated DATETIME NOT NULL
);

-- Add an index on the created column.
CREATE INDEX idx_compliance_scores_created ON compliance_scores(created);
