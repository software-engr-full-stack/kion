-- Switch to using the `kion` database.
USE kion;

SET @cmp_id = (SELECT id FROM customers WHERE name = 'Indeed');

-- Add some dummy records.
INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @cmp_id,
  '00',
  345.60,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);
INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @cmp_id,
  '01',
  417.1,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);
INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @cmp_id,
  '02',
  158.66,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);
INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @cmp_id,
  '03',
  201.15,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);
INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @cmp_id,
  '04',
  443.70,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);
INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @cmp_id,
  '05',
  325.36,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);
INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @cmp_id,
  '06',
  283.57,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);
INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @cmp_id,
  '07',
  464.77,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);
INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @cmp_id,
  '08',
  462.39,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);
INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @cmp_id,
  '09',
  352.74,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);
INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @cmp_id,
  '10',
  455.16,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);
INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @cmp_id,
  '11',
  237.50,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);
