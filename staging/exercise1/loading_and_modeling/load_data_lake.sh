#!/bin/bash

# Save where the current directory is
MY_CWD=$(pwd)

# Create staging directories

mkdir ~/staging
mkdir ~/staging/exercise_1

# Move into exercise_1 directory
cd ~/staging/exercise_1

# Get the URL for the files
MY_URL="https://data.medicare.gov/views/bg9k-emty/files/6c902f45-e28b-42f5-9f96-ae9d1e583472?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zip"

wget "$MY_URL" -O medicare_data.zip

# Unzip the files
unzip medicare_data.zip

# Remove first line of files and rename
OLD_FILE="Hospital General Information.csv"
NEW_FILE="hospitals.csv"

tail -n +2 "$OLD_FILE" > $NEW_FILE

OLD_FILE1="Timely and Effective Care - Hospital.csv"
NEW_FILE1="effective_care.csv"

tail -n +2 "$OLD_FILE1" > $NEW_FILE1

OLD_FILE2="Readmissions and Deaths - Hospital.csv"
NEW_FILE2="readmission.csv"

tail -n +2 "$OLD_FILE2" > $NEW_FILE2

OLD_FILE3="Measure Dates.csv"
NEW_FILE3="Measures.csv"

tail -n +2 "$OLD_FILE3" > $NEW_FILE3

OLD_FILE4="hvbp_hcahps_11_10_2016.csv"
NEW_FILE4="survey_responses.csv"

tail -n +2 "$OLD_FILE4" > $NEW_FILE4 

# create HDFS directory
hdfs dfs -mkdir /user/w205/hospital_compare

# create a directory for each file and copy each file to hdfs

hdfs dfs -mkdir /user/w205/hospital_compare/hospitals
hdfs dfs -mkdir /user/w205/hospital_compare/effective_care
hdfs dfs -mkdir /user/w205/hospital_compare/readmissions
hdfs dfs -mkdir /user/w205/hospital_compare/measures
hdfs dfs -mkdir /user/w205/hospital_compare/surveys

# Copy files to HDFS
hdfs dfs -put $NEW_FILE /user/w205/hospital_compare/hospitals
hdfs dfs -put $NEW_FILE1 /user/w205/hospital_compare/effective_care
hdfs dfs -put $NEW_FILE2 /user/w205/hospital_compare/readmissions
hdfs dfs -put $NEW_FILE3 /user/w205/hospital_compare/measures
hdfs dfs -put $NEW_FILE4 /user/w205/hospital_compare/surveys





# remove the first line of files and rename

# Change directory back to the original

cd $MY_CWD

exit
