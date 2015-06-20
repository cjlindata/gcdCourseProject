# gcdCourseProject
Getting and Cleaning Data Course Project Assignment

Bold >> Project Instructions
1) Merges the training and the test sets to create one data set
2) Extracts only the measurements on the mean (mean()) and standard deviation (std()) of each measurement
3) User descriptive activtity names to name the activities in the data set
4) Appropriately labels the data set with descriptive variable names.
5) From the data set in step 4. create a second, independent tidy data set with the average of each variable for each activity and each subject

Getting raw data
- Getting and examining raw data
Create a local directory "gcdCourseProject" as working directory.
Download project raw data from zip file URL and extract it under working directory "gcdCourseProject"
Studied and examined all download files.
- Construct R raw dataframe
created "run_analysis.R" script under working directory Using R studio
load R libraries (dplyr,stringr,data.table,reshaper2,tidyr)

* code example *
##
## load libraries
##
library(dplyr)
....

Stored text files under "test" and "train" directories into their corresponding dataframe using function "read.table"
##
## Collection of the raw data
##
x_testDatadf <- read.table('./UCI HAR Dataset/test/X_test.txt', fill=TRUE, header =FALSE)
...

Merged raw dataframe into one dataframe with R funcions "rbind" (insert row data) and cbind (insert column data)
##
## Create the tidy datafile
##





