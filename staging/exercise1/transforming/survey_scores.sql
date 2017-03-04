Drop table Survey_scores;

Create Table Survey_Scores as Select

Provider_number as provider_ID,
cast(overall_rating_of_hospital_performance_rate as int) as performance_rate,

case
when length(Overall_Rating_of_Hospital_Achievement_Points)=12 then
cast(substr(Overall_Rating_of_Hospital_Achievement_Points,1,2) as int)
when length(Overall_Rating_of_Hospital_Achievement_Points)=11 then
cast(substr(Overall_Rating_of_Hospital_Achievement_Points,1,1) as int)
end as Achievement_Score,


case
when length(Overall_Rating_of_Hospital_Dimension_Score)=12 then
cast(substr(Overall_Rating_of_Hospital_Dimension_Score,1,2) as int)
when length(Overall_Rating_of_Hospital_Dimension_Score)=11 then
cast(substr(Overall_Rating_of_Hospital_Dimension_Score,1,1) as int)
end as Dimension_Score



from surveys;

