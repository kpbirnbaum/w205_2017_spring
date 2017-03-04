--Variability for effective_care
DROP TABLE solution_3;

CREATE TABLE solution_3 AS

SELECT m.measure_name, ms.measure_Id, STD(ms.avg_score) std, COUNT(DISTINCT ms.provider_ID) num_hosp
FROM measures_1 m INNER JOIN measure_scores ms ON m.measure_ID = ms.measure_ID
GROUP BY ms.measure_ID, m.measure_name
HAVING num_hosp > 100
ORDER BY std desc LIMIT 10;

--Variability for Readmissions (Kept out becasue the measure does not seem to 
--measure actual procedures and is difficult to interpret
--SELECT m.measure_name, r.measure_Id, STD(score) std, COUNT(DISTINCT r.provider_ID) num_hosp
--FROM measures_1 m INNER JOIN readmission_compare r ON m.measure_ID = r.measure_ID
--GROUP BY r.measure_ID, m.measure_name
--HAVING num_hosp > 100
--ORDER BY std;
