update pg_database set datistemplate = FALSE where datname = 'template1';
drop database template1;
update pg_database set datistemplate = TRUE where datname = 'template1';
update pg_database set encoding = pg_char_to_encoding('UTF8') where datname = 'test';
