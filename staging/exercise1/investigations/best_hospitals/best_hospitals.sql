--QUERY TO CHECK HOW HOSPITALS DO IN TERMS OF READMISSION RATE 
--GROUPS TOGETHER ALL PROCEDURES AND SHOWS LOWEST READMISSION RATE
DROP TABLE readmit_weights;
DROP TABLE w_ave_readmit;

CREATE TABLE readmit_weights AS
SELECT
measure_ID,
count(provider_ID)/41680 weight --41680 is the sum of the total count of provider_ID's
FROM
readmission_compare
GROUP BY
measure_ID;

CREATE TABLE w_ave_readmit AS

SELECT
r.provider_ID,
h.hospital_name,
h.state,
AVG(r.national_comparison) compare,
COUNT(r.provider_ID),
SUM(w.weight*(100-r.score)) sum_weights --Important to have this since lower scores 
--would otherwise be better and weighted average would award hospitals with fewer measures
FROM readmission_compare r
INNER JOIN readmit_weights w
ON w.measure_id = r.measure_id
INNER JOIN hospitals_1 h
ON r.provider_ID = h.provider_ID
GROUP BY r.provider_ID, h.hospital_name, h.state
;

--QUERY TO GET TOP HOSPITALS ACCORDING TO WEIGHTED AVERAGE OF MEASURES 
--ACCORDING TO HOW MANY HOSPITALS DO THAT PROCEDURE
DROP TABLE measure_weights;
DROP TABLE w_ave_measure_score;

CREATE TABLE measure_weights AS
SELECT
measure_ID,
count(provider_ID)/36501 weight --36501 is the sum of the total count of provider_ID's
FROM
measure_scores
GROUP BY
measure_ID;

CREATE TABLE w_ave_measure_score AS

SELECT
ms.provider_ID,
h.hospital_name,
h.state,
COUNT(ms.provider_ID),
SUM(w.weight*ms.avg_score) sum_weights
FROM measure_scores ms
INNER JOIN measure_weights w
ON w.measure_id = ms.measure_id
INNER JOIN hospitals_1 h
ON ms.provider_ID = h.provider_ID
GROUP BY ms.provider_ID, h.hospital_name, h.state
;



DROP TABLE solution_1_table;
CREATE TABLE solution_1_table AS

SELECT

mw.provider_ID, 
mw.hospital_name, 
--Looked up ave and std with simple SELECT std(sum_weights), avg(sum_weights) from w_ave_readmit(and w_ave_measure_score);
--so I can standardize and then sum scores on the same scale
((mw.sum_weights-31.49598)/12.67841)+((rw.sum_weights-64.29589)/22.96175) AS Overall_score,
h.overall_rating,
rw.compare

FROM w_ave_measure_score mw
INNER JOIN w_ave_readmit rw
ON mw.provider_ID = rw.provider_ID
INNER JOIN hospitals_1 h
ON mw.provider_ID = h.provider_ID;


DROP TABLE solution_1;

CREATE TABLE solution_1 AS
SELECT * FROM solution_1_table
ORDER BY Overall_score desc LIMIT 10;
--Kept hospital overall rating in table. I checked and saw there
--is actually is a negative correlation between overall hospital rating 
--and the rating I created for the measures which obviously is not ideal
