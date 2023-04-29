CREATE TABLE IF NOT EXISTS orders (
  order_id      INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  --order_id      VARCHAR(36) NOT NULL PRIMARY KEY,
  email         VARCHAR(40) NOT NULL,
  created_at    TIMESTAMP NOT NULL DEFAULT now()
);

/*
INSERT INTO orders(order_id, email, created_at)
SELECT
  uuid_in(md5(random()::text || clock_timestamp()::text)::cstring),
*/
INSERT INTO orders(email, created_at)
SELECT
  'order_' || seq || '@' || (
    CASE (RANDOM() * 3)::INT
      WHEN 0 THEN 'gmail'
      WHEN 1 THEN 'hotmail'
      WHEN 2 THEN 'yahoo'
      WHEN 3 THEN 'protonmail'
    END
  ) || '.com' AS email,
  timestamp '2016-01-10 20:00:00' +
       random() * (now() - timestamp '2016-01-10 20:00:00')
FROM GENERATE_SERIES(1, 1000000) seq;

CREATE INDEX IF NOT EXISTS orders_email_idx ON orders (email);
CREATE INDEX IF NOT EXISTS orders_created_at_idx ON orders (created_at);

-- Sort Test Data
CREATE TABLE IF NOT EXISTS test_data AS SELECT x FROM (values ('a'), ('$a'), ('a$'), ('b'), ('$b'), ('b$'), ('A'), ('B')) AS l(x);
ALTER TABLE test_data ADD PRIMARY KEY (x);
--CREATE INDEX test_data_idx ON test_data(x);

CREATE TABLE IF NOT EXISTS test_data2 AS SELECT x FROM (values ('"0102"'), ('0102')) AS x(x);
ALTER TABLE test_data2 ADD PRIMARY KEY (x);
--CREATE INDEX test_data2_idx ON test_data2(x);
