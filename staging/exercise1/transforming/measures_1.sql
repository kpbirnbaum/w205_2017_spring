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

INSERT INTO TABLE measures_1 
SELECT DISTINCT 
measure_id,
measure_name,
CAST (
concat(substr(measure_start_date,7,4),'-',
substr(measure_start_date,1,2),'-',
substr(measure_start_date,4,2)) as date) 
as start_date

FROM effective_care WHERE measure_name LIKE '%influenza vaccination%'
