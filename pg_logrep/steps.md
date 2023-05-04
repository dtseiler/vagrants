```
psql "dbname=testdb replication=database"
CREATE_REPLICATION_SLOT testdb_sub02 LOGICAL pgoutput;
```

Keep that open and copy the `snapshot_name` and use in:

```
SNAPSHOT_NAME=<snapshot name here>
#pg_dump --snapshot=${SNAPSHOT_NAME} -a -d testdb -t public.pgbench_accounts > /tmp/pgbench_accounts.sql
pg_dump --snapshot=${SNAPSHOT_NAME} -a -d testdb -t public.pgbench_accounts > /tmp/pgbench_accounts.sql
```

Copy that file to /vagrant/pgbench_accounts.sql and then import it on the destination side:
```sql
\i /vagrant/pgbench_accounts.sql
```

Then import that into the subscriber. Then create the subscription and enable it:
```sql
CREATE SUBSCRIPTION testdb_sub02 CONNECTION 'host=192.168.60.184 port=5432 dbname=testdb user=replicator' 
    PUBLICATION testdb_pub02 with (slot_name = 'testdb_sub02', create_slot='false' , enabled='false', copy_data='false');

ALTER SUBSCRIPTION testdb_sub02 ENABLE;
```

pgbench -c 10 -j 2 -t 10000 testdb
pgbench -P 10 -r -T 18000 -c 1 -j 1 testdb
