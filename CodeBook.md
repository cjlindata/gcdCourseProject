### Getting and Cleaning data course project CodeBook

####Data Set Information:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


#### Data Set table
Column Names | Column Format
-----------------------------
Subject      | Numeric
Activity     | Char
Sensor       | Char
Signal       | Char
Estimated    | Char
mean(value)  | Numeric


#######Column: Subject

__Description:__ A group of 30 experiment volunteers within an age bracket of 19-48 years.

__Format:__ Numeric

__Value:__ 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30

#######Column: Activity

__Description:__ 

__Format:__ Character

__Value:__ 
* LAYING
* SITTINGSTANDING
* WALKING           
* WALKING_DOWNSTAIRS
* WALKING_UPSTAIRS

#######Column: sensor

__Description:__ 

__Format:__ Character

__Value:__ 
* Acc
* Gyro

#######Column: signal

__Description:__ 

__Format:__ Character

__Value:__ 
* fBodyAcc-X
* fBodyAcc-Y
* fBodyAcc-Z           
* fBodyAccJerk-X
* fBodyAccJerk-Y
* fBodyAccJerk-Z       
* fBodyAccMag-
* fBodyBodyAccJerkMag-
* fBodyBodyGyroJerkMag-
* fBodyBodyGyroMag-
* fBodyGyro-X
* fBodyGyro-Y          
* fBodyGyro-Z
* tBodyAcc-X
* tBodyAcc-Y         
* tBodyAcc-Z
* tBodyAccJerk-X
* tBodyAccJerk-Y     
* tBodyAccJerk-Z
* tBodyAccJerkMag-
* tBodyAccMag-       
* tBodyGyro-X
* tBodyGyro-Y
* tBodyGyro-Z         
* tBodyGyroJerk-X
* tBodyGyroJerk-Y
* tBodyGyroJerk-Z     
* tBodyGyroJerkMag-
* tBodyGyroMag-
* tGravityAcc-X        
* tGravityAcc-Y
* tGravityAcc-Z
* tGravityAccMag-  


#######Column: estimated

__Description:__ 

__Format:__ Character

__Value:__ 
* mean
* std


#######Column: mean(value)

__Description:__ 

__Format:__ numeric

__Value:__ 
