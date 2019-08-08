CREATE PUBLICATION dts_foo_pub;
SELECT partman.create_parent('dts.foo', 'toi', 'native', 'weekly', p_premake := 52, p_template_table := 'dts.foo_template', p_publications := ARRAY['dts_foo_pub']);
