DROP TABLE hospitals;

CREATE EXTERNAL TABLE hospitals
(
  provider_id string,
  hospital_name string,
  address string,
  city string,
  state string,
  zip_code string,
  county_name string,
  phone_number string,
  hospital_type string,
  hospital_ownership string,
  emergency_services string,
  meets_criteria string,
  hospital_overall_rating string,
  hospital_overall_footnote string,
  mortaility_national_comparison string,
  mortality_national_comparison_footnote string,
  safety_of_care_national_comparison string,
  safety_of_care_national_comparison_footnote string,
  readmission_national_comparison string,
  readmission_national_comparison_footnote string,
  patient_experience_national_comparison string,
  patient_experience_national_comparison_footnote string,
  effectiveness_of_care_national_comparison string,
  effectiveness_of_care_national_comparison_footnote string,
  timeliness_of_care_national_comparison string,
  timeliness_of_care_national_comparison_footnote string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
  "separatorChar"=',',
  "quoteChar"='"',
  "escapeChar"='\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/hospitals'

;


DROP TABLE effective_care;

CREATE EXTERNAL TABLE effective_care
(
  Provider_ID string,
Hospital_Name string,
Address string,
City string,
State string,
ZIP_Code string,
County_Name string,
Phone_Number string,
Condition string,
Measure_ID string,
Measure_Name string,
Score string,
Sample string,
Footnote string,
Measure_Start_Date string,
Measure_End_Date string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
  "separatorChar"=',',
  "quoteChar"='"',
  "escapeChar"='\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/effective_care' 
;



DROP TABLE readmissions;

CREATE EXTERNAL TABLE readmissions
(
Provider_ID string,
Hospital_Name string,
Address string,
City string,
State string,
ZIP_Code string,
County_Name string,
Phone_Number string,
Measure_Name string,
Measure_ID string,
Compared_to_National string,
Denominator string,
Score string,
Lower_Estimate string,
Higher_Estimate string,
Footnote string,
Measure_Start_Date string,
Measure_End_Date string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
  "separatorChar"=',',
  "quoteChar"='"',
  "escapeChar"='\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/readmissions' 
;


DROP TABLE measures;

CREATE EXTERNAL TABLE measures
(
Measure_Name string,
Measure_ID string,
Measure_Start_Quarter string,
Measure_Start_Date string,
Measure_End_Quarter string,
Measure_End_Date string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
  "separatorChar"=',',
  "quoteChar"='"',
  "escapeChar"='\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/measures' 
;

DROP TABLE surveys;

CREATE EXTERNAL TABLE surveys
(
Provider_Number string,
Hospital_Name string,
Address string,
City string,
State string,
ZIP_Code string,
County_Name string,
Communication_with_Nurses_Floor string,
Communication_with_Nurses_Achievement_Threshold string,
Communication_with_Nurses_Benchmark string,
Communication_with_Nurses_Baseline_Rate string,
Communication_with_Nurses_Performance_Rate string,
Communication_with_Nurses_Achievement_Points string,
Communication_with_Nurses_Improvement_Points string,
Communication_with_Nurses_Dimension_Score string,
Communication_with_Doctors_Floor string,
Communication_with_Doctors_Achievement_Threshold string,
Communication_with_Doctors_Benchmark string,
Communication_with_Doctors_Baseline_Rate string,
Communication_with_Doctors_Performance_Rate string,
Communication_with_Doctors_Achievement_Points string,
Communication_with_Doctors_Improvement_Points string,
Communication_with_Doctors_Dimension_Score string,
Responsiveness_of_Hospital_Staff_Floor string,
Responsiveness_of_Hospital_Staff_Achievement_Threshold string,
Responsiveness_of_Hospital_Staff_Benchmark string,
Responsiveness_of_Hospital_Staff_Baseline_Rate string,
Responsiveness_of_Hospital_Staff_Performance_Rate string,
Responsiveness_of_Hospital_Staff_Achievement_Points string,
Responsiveness_of_Hospital_Staff_Improvement_Points string,
Responsiveness_of_Hospital_Staff_Dimension_Score string,
Pain_Management_Floor string,
Pain_Management_Achievement_Threshold string,
Pain_Management_Benchmark string,
Pain_Management_Baseline_Rate string,
Pain_Management_Performance_Rate string,
Pain_Management_Achievement_Points string,
Pain_Management_Improvement_Points string,
Pain_Management_Dimension_Score string,
Communication_about_Medicines_Floor string,
Communication_about_Medicines_Achievement_Threshold string,
Communication_about_Medicines_Benchmark string,
Communication_about_Medicines_Baseline_Rate string,
Communication_about_Medicines_Performance_Rate string,
Communication_about_Medicines_Achievement_Points string,
Communication_about_Medicines_Improvement_Points string,
Communication_about_Medicines_Dimension_Score string,
Cleanliness_and_Quietness_of_Hospital_Environment_Floor string,
Cleanliness_and_Quietness_of_Hospital_Environment_Achievement_Threshold string,
Cleanliness_and_Quietness_of_Hospital_Environment_Benchmark string,
Cleanliness_and_Quietness_of_Hospital_Environment_Baseline_Rate string,
Cleanliness_and_Quietness_of_Hospital_Environment_Performance_Rate string,
Cleanliness_and_Quietness_of_Hospital_Environment_Achievement_Points string,
Cleanliness_and_Quietness_of_Hospital_Environment_Improvement_Points string,
Cleanliness_and_Quietness_of_Hospital_Environment_Dimension_Score string,
Discharge_Information_Floor string,
Discharge_Information_Achievement_Threshold string,
Discharge_Information_Benchmark string,
Discharge_Information_Baseline_Rate string,
Discharge_Information_Performance_Rate string,
Discharge_Information_Achievement_Points string,
Discharge_Information_Improvement_Points string,
Discharge_Information_Dimension_Score string,
Overall_Rating_of_Hospital_Floor string,
Overall_Rating_of_Hospital_Achievement_Threshold string,
Overall_Rating_of_Hospital_Benchmark string,
Overall_Rating_of_Hospital_Baseline_Rate string,
Overall_Rating_of_Hospital_Performance_Rate string,
Overall_Rating_of_Hospital_Achievement_Points string,
Overall_Rating_of_Hospital_Improvement_Points string,
Overall_Rating_of_Hospital_Dimension_Score string,
HCAHPS_Base_Score string,
HCAHPS_Consistency_Score string

)

ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
  "separatorChar"=',',
  "quoteChar"='"',
  "escapeChar"='\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/surveys' 
;

