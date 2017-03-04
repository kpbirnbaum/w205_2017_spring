--Correlation between actual scores and surveys
--Checks both overall_rating from hospitals table and ratings that I had created for solution 1

DROP TABLE solution_4;
CREATE TABLE solution_4 AS
SELECT 
CORR(h.overall_rating,s.dimension_score),
CORR(h.overall_rating,s.achievement_score),
CORR(h.overall_rating,s.performance_Rate),
CORR(a.overall_score,s.dimension_score),
CORR(a.overall_score,s.achievement_score),
CORR(a.overall_score,s.performance_rate),
CORR(a.compare,s.dimension_score),
CORR(a.compare,s.achievement_score),
CORR(a.compare,s.performance_rate)
FROM hospitals_1 h INNER JOIN survey_scores s
ON h.provider_ID = s.provider_ID
INNER JOIN solution_1_table a
ON a.provider_ID = s.provider_ID;



