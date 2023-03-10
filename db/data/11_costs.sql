-- Switch to using the `kion` database.
USE kion;

SET @cmp_id = (SELECT id FROM customers WHERE name = 'NASA');

-- Add some dummy records.
INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @cmp_id,
  '00',
  334.11,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);
INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @cmp_id,
  '01',
  195.43,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);
INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @cmp_id,
  '02',
  125.0,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);
INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @cmp_id,
  '03',
  492.6,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);
INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @cmp_id,
  '04',
  302.42,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);
INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @cmp_id,
  '05',
  317.80,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);
INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @cmp_id,
  '06',
  398.62,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);
INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @cmp_id,
  '07',
  367.86,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);
INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @cmp_id,
  '08',
  310.23,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);
INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @cmp_id,
  '09',
  337.56,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);
INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @cmp_id,
  '10',
  183.37,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);
INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @cmp_id,
  '11',
  395.54,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);
