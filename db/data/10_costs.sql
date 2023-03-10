-- Switch to using the `kion` database.
USE kion;

SET @cmp_id = (SELECT id FROM customers WHERE name = 'UPS');

-- Add some dummy records.
INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @cmp_id,
  '00',
  321.65,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);
INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @cmp_id,
  '01',
  334.84,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);
INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @cmp_id,
  '02',
  401.68,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);
INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @cmp_id,
  '03',
  182.17,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);
INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @cmp_id,
  '04',
  230.76,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);
INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @cmp_id,
  '05',
  456.94,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);
INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @cmp_id,
  '06',
  183.12,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);
INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @cmp_id,
  '07',
  393.90,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);
INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @cmp_id,
  '08',
  395.51,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);
INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @cmp_id,
  '09',
  421.34,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);
INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @cmp_id,
  '10',
  155.50,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);
INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @cmp_id,
  '11',
  244.25,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);
