CREATE ROLE replicator REPLICATION LOGIN PASSWORD 'replication123';
CREATE DATABASE dts;
\c dts

CREATE SCHEMA partman;
CREATE EXTENSION pg_partman SCHEMA partman;
CREATE SCHEMA dts;
GRANT USAGE ON SCHEMA dts TO replicator;
ALTER DEFAULT PRIVILEGES IN SCHEMA dts
    GRANT SELECT ON TABLES TO replicator;

CREATE TABLE dts.foo(foo_id bigint, toi timestamp with time zone) PARTITION BY RANGE (toi);
CREATE TABLE dts.foo_template ( LIKE dts.foo INCLUDING ALL );
ALTER TABLE dts.foo_template ADD PRIMARY KEY (foo_id);
