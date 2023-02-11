with 
sz as (select max(step) step from t_ext_lab_02 where step = 9),
tot as (select count(1) cnt 
from t_ext_lab_02 d1
join t_ext_lab_02 d2 
	on d1.step = d2.step 
	and d1.group_text = d2.group_text 
	and d1.dnk_num = True 
	and d2.dnk_num = false
where 
	d1.step = (select step from sz)
)
select 
tot.cnt/
(
	(select count(1) cnt from t_ext_lab_02 d1 where step = (select step from sz) and d1.dnk_num = True)::float4
	+
	(select count(1) cnt from t_ext_lab_02 d1 where step = (select step from sz) and d1.dnk_num = False)::float4
	-tot.cnt
) Jak_koef
from tot