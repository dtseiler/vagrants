insert into dts.foo (foo_id, toi) values (1, now());
update dts.foo set toi = now() where foo_id = 1;
