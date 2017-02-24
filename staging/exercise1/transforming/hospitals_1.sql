Drop table hospitals_1;

Create table hospitals_1 as select
provider_id,
hospital_name,
city,
state,
county_name county,
cast(hospital_overall_rating as int) overall_rating,
readmission_national_comparison readmission_compare,
patient_experience_national_comparison experience_compare

from hospitals;
