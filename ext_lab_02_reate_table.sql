create table t_ext_lab_02
(
step integer,-- size of k
dnk_num boolean,-- defines if it is a first or second list
group_text varchar)--DNK slice


create extension  file_fdw;

create server csv_log foreign data wrapper file_fdw;

create  foreign table DNK1_csv (
dnk_slice varchar
) server csv_log
options (filename '/var/lib/postgresql/Genome_1-1.txtres', delimiter ' ', format 'csv');

create  foreign table DNK2_csv (
dnk_slice varchar
) server csv_log
options (filename '/var/lib/postgresql/Genome_2-1.txtres', delimiter ' ', format 'csv');


insert into t_ext_lab_02
select 2, True, dnk_slice from DNK1_csv
insert into t_ext_lab_02
select 2, False, dnk_slice from DNK2_csv

--process files 
insert into t_ext_lab_02
select 5, True, dnk_slice from DNK1_csv
insert into t_ext_lab_02
select 5, False, dnk_slice from DNK2_csv

--process files
insert into t_ext_lab_02
select 9, True, dnk_slice from DNK1_csv
insert into t_ext_lab_02
select 9, False, dnk_slice from DNK2_csv
