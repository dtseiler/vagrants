# logical replica

This sets up logical replication for PostgreSQL 14 between the primary on Ubuntu 18.04 LTS and a replica on Ubuntu 20.04 LTS.

Purpose is to not only practice logical replication setup, but also the migration to the newer Ubuntu and its newer libc with the [infamous collation change](https://postgresql.verite.pro/blog/2018/08/27/glibc-upgrade.html). We also enable data checksums on the new PG cluster.
