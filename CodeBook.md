## Getting and Cleaning data course project CodeBook

###Data Set Information:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

### Data Set table

##### Column: Subject

__Description:__ volunteer ID for a group of 30 experiment volunteers within an age bracket of 19-48 years.

__Format:__ Numeric

__Value:__ 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30

__Missing data:__ N/A

##### Column: Activity

__Description:__ Volunteers performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.

__Format:__ Character

__Value:__ 
* LAYING : data is collect when volunteers were laying
* SITTING : data is collect when volunteers were sitting
* STANDING : data is collect when volunteers were standing
* WALKING : data is collect when volunteers were walking           
* WALKING_DOWNSTAIRS : data is collect when volunteers were walking downstairs
* WALKING_UPSTAIRS : data is collect when volunteers were walking upstairs

__Missing data:__ N/A

##### Column: sensor

__Description:__ Sensors embedded in the smartphone weared by volunteers 

__Format:__ Character

__Value:__ 
* Acc : accelerometer
* Gyro : gyroscope

__Missing data:__ N/A

##### Column: signal

__Description:__ The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. We captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 

f: frequency domain signals
t: time domain signals
Body: body motion
Gravity: gravity motion
Acc: accelerometer
Gyro: gyroscope
Jerk: The body linear acceleration and angular velocity were derived in time to obtain Jerk signals 
Mag: The magnitude of these three-dimensional signals were calculated using the Euclidean norm.
-X: motion direction is X
-Y: motion direction is Y
-Z: motion direction is Z

__Format:__ Character

__Value:__ 
* fBodyAcc-X : accelerometer signal of frequency domain/body motion/moved in X direction 
* fBodyAcc-Y : accelerometer signal of frequency domain/body motion/moved in Y direction
* fBodyAcc-Z  : accelerometer signal of frequency domain/body motion/moved in Z direction         
* fBodyAccJerk-X : accelerometer Jerk signal of frequency domain/body motion/moved in X direction 
* fBodyAccJerk-Y : accelerometer Jerk signal of frequency domain/body motion/moved in Y direction
* fBodyAccJerk-Z : accelerometer Jerk signal of frequency domain/body motion/moved in Z direction     
* fBodyAccMag : magnitude of accelerometer signal of frequency domain/body motion
* fBodyBodyAccJerkMag- : magnitude of accelerometer jerk signal of frequency domain/body motion
* fBodyBodyGyroJerkMag- : magnitude of gyroscope jerk signal of frequency domain/body motion
* fBodyBodyGyroMag- : magnitude of gyroscope signal of frequency domain/body motion
* fBodyGyro-X : gyroscope signal of frequency domain/body motion/moved in X direction
* fBodyGyro-Y : gyroscope signal of frequency domain/body motion/moved in Y direction        
* fBodyGyro-Z : gyroscope signal of frequency domain/body motion/moved in Z direction
* tBodyAcc-X : accelerometer signal of time domain/body motion/moved in X direction 
* tBodyAcc-Y : accelerometer signal of time domain/body motion/moved in Y direction       
* tBodyAcc-Z : accelerometer signal of time domain/body motion/moved in Z direction 
* tBodyAccJerk-X : accelerometer Jerk signal of time domain/body motion/moved in X direction
* tBodyAccJerk-Y : accelerometer Jerk signal of time domain/body motion/moved in Y direction     
* tBodyAccJerk-Z : accelerometer Jerk signal of time domain/body motion/moved in Z direction
* tBodyAccJerkMag- : magnitude of accelerometer jerk signal of time domain/body motion
* tBodyAccMag- : magnitude of accelerometer signal of time domain/body motion      
* tBodyGyro-X : gyroscope signal of time domain/body motion/moved in X direction
* tBodyGyro-Y : gyroscope signal of time domain/body motion/moved in Y direction
* tBodyGyro-Z : gyroscope signal of time domain/body motion/moved in Z direction         
* tBodyGyroJerk-X : gyroscope Jerk signal of time domain/body motion/moved in X direction
* tBodyGyroJerk-Y : gyroscope Jerk signal of time domain/body motion/moved in Y direction
* tBodyGyroJerk-Z : gyroscope Jerk signal of time domain/body motion/moved in Z direction     
* tBodyGyroJerkMag- : magnitude of gyroscope jerk signal of time domain/body motion
* tBodyGyroMag- : magnitude of gyroscope signal of time domain/body motion 
* tGravityAcc-X : accelerometer signal of frequency domain/gravity motion/moved in X direction        
* tGravityAcc-Y : accelerometer signal of frequency domain/gravity motion/moved in Y direction
* tGravityAcc-Z : accelerometer signal of frequency domain/gravity motion/moved in Z direction
* tGravityAccMag- : magnitude of gyroscope jerk signal of time domain/gravity motion  

__Missing data:__ N/A

##### Column: estimated

__Description:__ 

__Format:__ Character

__Value:__ 
* mean : Mean value
* std : Standard deviation

__Missing data:__ N/A


##### Column: mean(value)

__Description:__ The average of experiement result data of each variable for each activity and each subject.

__Format:__ numeric

__Value:__ The average of experiement result data grouped by subject, activity,sensor,signal and estimated.

__Missing data:__ N/A
