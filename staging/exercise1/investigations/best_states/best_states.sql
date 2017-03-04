DROP TABLE solution_2_table;
CREATE TABLE solution_2_table as

SELECT

h.state,
count(h.state) num_states, 
avg(((mw.sum_weights-31.49598)/12.67841)+((rw.sum_weights-64.29589)/22.96175)) AS Overall_score,
avg(h.overall_rating) overall_rating,
avg(rw.compare) compare

FROM w_ave_measure_score mw
INNER JOIN w_ave_readmit rw
ON mw.provider_ID = rw.provider_ID
INNER JOIN hospitals_1 h
ON mw.provider_ID = h.provider_ID
GROUP BY h.state
HAVING num_states >10;

DROP TABLE solution_2;

CREATE TABLE solution_2 AS
SELECT * FROM solution_2_table
ORDER BY Overall_score desc LIMIT 10;
