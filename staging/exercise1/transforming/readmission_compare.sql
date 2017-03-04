Drop table readmission_compare;

Create Table readmission_compare as select
r.Provider_ID,
r.measure_ID,
avg(cast(r.National_Comparison as decimal)) National_comparison,
avg(r.score) score


FROM
(select
Provider_ID,
State,
measure_ID,
cast(score as decimal(3,1)) score,
case
when Compared_To_National = 'No Different than the National Rate' then 0
when Compared_To_National = 'Better than the National Rate' then 1
when Compared_To_National = 'Worse than the National Rate' then -1
else NULL
end as National_Comparison

from readmissions) r

where r.National_Comparison IS NOT NULL
and r.score IS NOT NULL

GROUP BY r.State, r.Provider_ID, r.Measure_ID;
