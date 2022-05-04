# pglogical replication

This sets up logical replication for PostgreSQL using the pglogical extension.

Purpose is to not only practice logical replication setup, but also the migration to the newer Ubuntu and its newer libc with the [infamous collation change](https://postgresql.verite.pro/blog/2018/08/27/glibc-upgrade.html). We also enable data checksums on the new PG cluster. pglogical is also the requirement if migration to GCP Cloud SQL.
