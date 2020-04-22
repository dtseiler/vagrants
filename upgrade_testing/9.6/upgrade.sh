/usr/lib/postgresql/12/bin/pg_upgrade \
  --old-datadir=/var/lib/postgresql/9.6/main \
  --new-datadir=/var/lib/postgresql/12/main \
  --old-bindir=/usr/lib/postgresql/9.6/bin \
  --new-bindir=/usr/lib/postgresql/12/bin \
  --old-options '-c config_file=/etc/postgresql/9.6/main/postgresql.conf' \
  --new-options '-c config_file=/etc/postgresql/12/main/postgresql.conf' \
  --link

echo "Change ports and start DB now"
