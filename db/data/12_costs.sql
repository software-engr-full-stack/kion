-- Switch to using the `kion` database.
USE kion;

SET @ups_id = (SELECT id FROM customers WHERE name = 'Indeed');

-- Add some dummy records.
INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @ups_id,
  0,
  50.1,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);

INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @ups_id,
  1,
  22.3,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);

INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @ups_id,
  2,
  7.3,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);

INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @ups_id,
  3,
  9,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);

INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @ups_id,
  4,
  6,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);

INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @ups_id,
  5,
  8.2,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);

INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @ups_id,
  6,
  2.5,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);

INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @ups_id,
  7,
  1.5,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);

INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @ups_id,
  8,
  8.5,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);

INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @ups_id,
  9,
  7.5,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);

INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @ups_id,
  10,
  6.5,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);

INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
  @ups_id,
  11,
  7.5,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);
