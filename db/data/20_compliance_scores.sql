-- Switch to using the `kion` database.
USE kion;

SET @ups_id = (SELECT id FROM customers WHERE name = 'UPS');

-- Add some dummy records.
INSERT INTO compliance_scores (customer_id, total_checks, completed, created, updated) VALUES (
  @ups_id,
  100,
  50,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);
