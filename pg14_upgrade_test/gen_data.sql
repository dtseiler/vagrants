CREATE TABLE orders(
  order_id      INT GENERATED ALWAYS AS IDENTITY,
  email         VARCHAR(40) NOT NULL,
  created_at    TIMESTAMP NOT NULL DEFAULT now()
) PARTITION BY RANGE (created_at);

CREATE INDEX orders_email_idx ON orders (email);
CREATE INDEX orders_created_at_idx ON orders (created_at);

SELECT partman.create_parent('public.orders', 'created_at', 'native', 'monthly', p_start_partition := '2016-01-01');

INSERT INTO orders(email, created_at)
SELECT
  'order_' || seq || '@' || (
    CASE (RANDOM() * 2)::INT
      WHEN 0 THEN 'gmail'
      WHEN 1 THEN 'hotmail'
      WHEN 2 THEN 'yahoo'
    END
  ) || '.com' AS email,
  timestamp '2016-01-10 20:00:00' +
       random() * (now() - timestamp '2016-01-10 20:00:00')
FROM GENERATE_SERIES(1, 1000000) seq;

