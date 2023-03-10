-- Switch to using the `kion` database.
USE kion;

SET @cmp_id = (SELECT id FROM customers WHERE name = 'ManTech');

-- Add some dummy records.
INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @cmp_id,
  '00',
  222.80,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);
INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @cmp_id,
  '01',
  472.0,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);
INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @cmp_id,
  '02',
  237.57,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);
INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @cmp_id,
  '03',
  491.83,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);
INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @cmp_id,
  '04',
  220.39,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);
INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @cmp_id,
  '05',
  90.5,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);
INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @cmp_id,
  '06',
  328.82,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);
INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @cmp_id,
  '07',
  230.75,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);
INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @cmp_id,
  '08',
  156.60,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);
INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @cmp_id,
  '09',
  163.13,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);
INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @cmp_id,
  '10',
  182.42,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);
INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @cmp_id,
  '11',
  179.51,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);
