

## Getting and Cleaning Data Course Project Instructions
1. Merges the training and the test sets to create one data set
2. Extracts only the measurements on the mean (mean()) and standard deviation (std()) of each measurement
3. User descriptive activtity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4. create a second, independent tidy data set with the average of each variable for each activity and each subject


#####Step 1 Merges the training and the test sets to create one data set

1.Getting raw data
+Getting and examining raw data
Create a local directory "gcdCourseProject" as working directory.
Download project raw data from zip file URL and extract it under working directory "gcdCourseProject"
Studied and examined all download files.
+ Construct R raw dataframe
created "run_analysis.R" script under working directory Using R studio
load R libraries (dplyr,stringr,data.table,reshaper2,tidyr)

**NOTE:** * code example * in italic style

# load libraries
*library(dplyr)*
....

Stored text files under "test" and "train" directories into their corresponding dataframe using function "read.table"
##
## Collection of the raw data
##
x_testDatadf <- read.table('./UCI HAR Dataset/test/X_test.txt', fill=TRUE, header =FALSE)
...

Merged raw dataframe into one dataframe (raw_df) with R funcions "rbind" (insert row data) and cbind (insert column data)
##
## Create the tidy datafile
##

## Merge rows and set column names
# -- combine test and train x data
x_allDatadf<- rbind(x_trainDatadf,x_testDatadf)
# -- column label from feature.txt
names(x_allDatadf) <- features[,2]
# combine test and train data
y_allDatadf<- rbind(y_trainDatadf,y_testDatadf)
# -- assign column lable "activity
names(y_allDatadf) <- c("activity")
# -- combine test and train subject data
subjectdf <- rbind(trainSubjectdf,testSubjectdf)
# -- assign column name "subject"
names(subjectdf) <- c("subject")

## Merge columns 
# combine all columns (subject, activity, all features columns in x data
raw_df <- cbind(subjectdf,y_allDatadf)
raw_df <- cbind(raw_df,x_allDatadf)

Step 1 Merges the train and test data to create one data set (raw_df) is completed
NOTE: function "str()", "head()", names()" had been used to verify data integrality of merged data frame (raw_df)

Step 2) Extracts only the measurements on the mean (mean()) and standard deviation (std()) of each measurement.
The assignement only focus on measurement of mean (mean()) and standard deviation (std()) of each measurement. 
We need to extract all measurements in the feature list contain pattern "mean()" and "std()". There are mutliplet duplicate columns in the feature list which do not have "mean()" and "std()" can be ingored. Anothe issue to remove duplicate columns is because some R functions won't work for data frame has duplicate columns. R function "duplicated " is used to remove duplicate column from raw_df. This is part of tidy data process by cleaning raw data.

## remove duplicated columns -- there are neither mean() nor std() anyway
raw_df <- raw_df[,!duplicated(colnames(raw_df))]

package "dplyr" select function is used to filter out not needed columns. We need to convert raw_df to data frame table object (raw_tbl) to use "select" function. 
##
## Load into  data frame table for dplyr and extracts the subject, activity, Mean and std columns 
##
NOTE: Step 3 code is executed before raw_df convert to raw_tbl (see step 3 for implementation detail).

raw_tbl <- tbl_df(raw_df)
raw_tbl <- select(raw_tbl,grep("activity|subject|mean\\(\\)|std\\(\\)",colnames(raw_tbl)))

Step 2 is completed.

Step 3 User descriptive activtity names to name the activities in the data set
activityLabel data frame (data from activitylabel.txt). The raw_df 2nd column content (raw_df[,2]) is used as map activity label in activtiyLabels data frame and is replaced raw_df activity column. 

## uses decriptive activity names to name the activities in the data set
raw_df[,2] <- activityLabels[raw_df[,2],2]

Step 3 is done

Step 4) Appropriately labels the data set with descriptive variable names.
There are some discussion in David's personal course project FAQ thread under Forums/Course Project (https://class.coursera.org/getdata-015/forum/thread?thread_id=26) "Should I decompose the variable names". I agree with David most of signal measurement are confusion but from my point of view sensors ( gyroscope and accelerometer) and estimated (mean and std) are well defined and should be separated from signal measurement column. The following are how I did it.  

##
## Cleaning the tidy datafile
##
Transform all "signal measurement" types and their numeric data into "variable" and "value" column use reshape2 package function "melt" and keep columns "subject" and "activity" as is. The result is assigned to data frame tidy_t

tidy_t <- melt(raw_tbl, id.var= c("subject","activity"))

Assumption: All columns (subject, activity, variable, value) have data,i.e. no N/A or "". Verifcation: I checked each column use unique(tidy_t$<column name>) to verify all columns have values and column "variable" content.
I examined the variable content pattern. There are two groups 1) xxx-xxx-xxx and 2) xxx-xxx. Package "stringr" function str_split_fixed is used to splite variable column content use "-" as separator and created 3 columns (if there is only one "-" the 3rd column is set to ""). Here are some of pattern examples tBodyAcc-mean()-X, tBodyAcc-std()-Y, fGavityAcc-mean()-Z, fBodyBodyAccJerkMag-mean(). The objective is remove mean() and std() from the content and concated "-XYZ" to signal type such as tBodyAcc. That is transfer "tBodyAcc-std()-Y" to "tBodyAcc-Y" and "std()". A new column "sensor" is added to tidy_t for sensor type (Acc: accelerometer or Gyro: gyroscope). This decomposion is to break column "variable" into to three columns (sensor, signal, and estimated). This break down components have the same row number so pattern search for "Acc" and "Gyro" used to identify the their corresponding row number and assign properated 1) sensor data (Acc or Gyro) 2) estimated (mean or std) and signal (such as tBodyAcc-X or tGarvityAcc-Z)) There are a couple of package stringr functions are used str_detect to detect the pattern is matched or not. paste() to combine "tBodyAcc" and "-X" to "tBodyAcc-X". and str_sub() to remove the "()" from mean() and std(). The column variable is removed after these three new columns were created.

#--- Break down variables by "-" t3 is a char matrix
t3 <- str_split_fixed(tidy_t$variable, "-",3)
tidy_t$sensor[str_detect(t3[,1],"Acc")] <- "Acc"
tidy_t$sensor[str_detect(t3[,1],"Gyro")] <- "Gyro"
## --- remove mean and std
tidy_t$signal <- paste(t3[,1],t3[,3],sep="-")
tidy_t$estimated <- str_sub(t3[,2],1,-3)
## -- drop variable column
tidy_t$variable <- NULL

Step 4 is completed.

Step 5) From the data set in step 4. create a second, independent tidy data set with the average of each variable for each activity and each subject
package tidyr function group_by was called to group data frame by subject,activity,sensor,signal, and estimated. The result was assigned to a new dataframe (tidy_group). summarize function with function mean(value) to calculate average of all groups in the tidy_group. The final step export the final result to local text file.

## -- group by subject,activity,sensor,signal,estimated
tidy_group <- group_by(tidy_t,subject,activity,sensor,signal,estimated)
## -- summarize group by by their mean
tidy_report <- summarize(tidy_group,mean(value))
## -- write to a text file
write.table(tidy_report,file="./cjlinTidy.txt",row.name=F)

Step 5 is done.

The script "run_analysis.R" starts with raw data collection (step 1), data clean up and tidy process (step 2,3,4). The tidy data frame (tidy_t) was used to generate data report. It meets all 5 steps of project instructions. 





