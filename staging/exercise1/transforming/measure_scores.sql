Drop table Measure_Scores;

Create Table Measure_Scores as Select

ms.Provider_ID,
ms.State,
ms.Measure_ID,
avg(ms.score) avg_score,
sum(ms.sample) sample_sum

from 

(select Provider_ID,
State,
Measure_ID,
cast(score as decimal(3,1)) as score,
cast(sample as int) sample
from effective_care) ms

where
ms.score IS NOT NULL
and ms.sample IS NOT NULL

GROUP BY ms.State, ms.Provider_ID, ms.Measure_ID;
