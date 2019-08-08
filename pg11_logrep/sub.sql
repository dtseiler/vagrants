SELECT partman.create_parent('dts.foo', 'toi', 'native', 'weekly', p_premake := 52, p_template_table := 'dts.foo_template');
CREATE SUBSCRIPTION dts_foo_sub CONNECTION 'host=192.168.3.16 port=5432 dbname=dts user=replicator password=replication123' PUBLICATION dts_foo_pub;
