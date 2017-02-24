Drop table measures_1;

create table measures_1 as 
SELECT
measure_ID,
measure_name,
 
CAST (
concat(substr(measure_start_date,7,4),'-',
substr(measure_start_date,1,2),'-',
substr(measure_start_date,4,2)) as date) 
as start_date

from measures;
