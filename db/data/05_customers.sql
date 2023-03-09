-- Switch to using the `kion` database.
USE kion;

-- Add some dummy records.
INSERT INTO customers (name, created, updated) VALUES (
  'UPS',
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);

INSERT INTO customers (name, created, updated) VALUES (
  'NASA',
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);

INSERT INTO customers (name, created, updated) VALUES (
  'Indeed',
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);

INSERT INTO customers (name, created, updated) VALUES (
  'ManTech',
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);
