truncate table temp.test;

declare
count_rows int;
v_sql varchar(100);
begin
count_rows:=0;
for a in (select TABLE_NAME from dba_tables where owner='renji_syz' and TABLESPACE_NAME<>'TEMP')
loop
v_sql:='select count(*) from renji_syz.'||a.TABLE_NAME;
execute immediate v_sql into count_rows;
insert into temp.test(table_name, cnt) values(a.TABLE_NAME,count_rows);
end loop;
select table_name,cnt from temp.test;
end;