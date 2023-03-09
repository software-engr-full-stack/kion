-- Switch to using the `kion` database.
USE kion;

SET @ups_id = (SELECT id FROM customers WHERE name = 'Indeed');

-- Add some dummy records.
INSERT INTO compliance_scores (customer_id, total_checks, completed, created, updated) VALUES (
  @ups_id,
  100,
  50,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);

INSERT INTO compliance_scores (customer_id, total_checks, completed, created, updated) VALUES (
  @ups_id,
  100,
  20,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);

INSERT INTO compliance_scores (customer_id, total_checks, completed, created, updated) VALUES (
  @ups_id,
  685,
  580,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);

INSERT INTO compliance_scores (customer_id, total_checks, completed, created, updated) VALUES (
  @ups_id,
  332,
  93,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);

INSERT INTO compliance_scores (customer_id, total_checks, completed, created, updated) VALUES (
  @ups_id,
  475,
  65,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);

INSERT INTO compliance_scores (customer_id, total_checks, completed, created, updated) VALUES (
  @ups_id,
  532,
  84,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);

INSERT INTO compliance_scores (customer_id, total_checks, completed, created, updated) VALUES (
  @ups_id,
  623,
  525,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);

INSERT INTO compliance_scores (customer_id, total_checks, completed, created, updated) VALUES (
  @ups_id,
  735,
  715,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);

INSERT INTO compliance_scores (customer_id, total_checks, completed, created, updated) VALUES (
  @ups_id,
  358,
  85,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);

INSERT INTO compliance_scores (customer_id, total_checks, completed, created, updated) VALUES (
  @ups_id,
  369,
  75,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);

INSERT INTO compliance_scores (customer_id, total_checks, completed, created, updated) VALUES (
  @ups_id,
  110,
  65,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);

INSERT INTO compliance_scores (customer_id, total_checks, completed, created, updated) VALUES (
  @ups_id,
  511,
  475,
  UTC_TIMESTAMP(),
  UTC_TIMESTAMP()
);
