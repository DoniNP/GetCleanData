Getting and Cleaning Data Codebook

## Data Source
* Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Files Provided
1. Main 561-feature vector with time and frequency domain variables
  * ’train/X_train.txt': Training set.
  * ’test/X_test.txt': Test set.
2. Activity labels
  * ’train/y_train.txt': Training labels.
  * ’test/y_test.txt': Test labels.
3. An identifier of the subject who carried out the experiment.
  * ’train/subject_train.txt': Each row identifies the subject who performed the activity.
  * ’test/subject_test.txt'
4. List of all features.
  * ’features.txt'
5. Links the class labels with their activity name.
  * ’activity_labels.txt'>

## Variables
There are basically 66 columns, consisting of 2 variable labels: subject and activities, and the rest are measurement features.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals timeAccelerometer-XYZ and timeGyroscope-XYZ. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (timeBodyAccelerometer-XYZ and timeGravityAccelerometer-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (timeBodyAccelerometerJerk-XYZ and timeBodyGyroscopeJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (timeBodyAccelerometerMagnitude, timeGravityAccelerometerMagnitude, timeBodyAccelerometerJerkMagnitude, timeBodyGyroscopeMagnitude, timeBodyGyroscopeJerkMagnitude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing frequencyBodyAccelerometer-XYZ, frequencyBodyAccelerometerJerk-XYZ, frequencyBodyGyroscope-XYZ, fBodyAccelerometerJerkMag, frequencyBodyGyroscopeMagnitude, frequencyBodyGyroscopeJerkMagnitude.

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

## Works to Clean up Data
1.a. Importing the data from the source on the Internet<br />
1.b. Study the instruction of the file to understand more about the scattered data, then merge the data. For each test and train is rbind()-ed. Then, among the x, y, and subject, all are cbind()-ed<br />
2.a. Selecting the mean and standard deviation subset, by using grep.<br />
2.b. Extracting only the requested measurement, producing a new subData.<br />
3.a. Importing the activity labels from "activity_labels.txt”, namely actLabels.<br />
3.b. Generating the name of the activities from the 2nd column of the subData created from 2.b.<br />
3.c. Renaming the 2nd column of the subData with 3.b.<br />
4.a. Learning from the instruction on the data set. Rename any abbreviation in the variable using sub()<br />
  * ”t” as prefix, stands for "time"
  * ”f” as prefix, stands for "frequency"
  * "Acc" stands for "Accelerometer"
  * ”Gyro" stands for "Gyroscope"
  * ”Mag" stands for "Magnitude"
  * "BodyBody" is redundant, better to replace it by "Body"<br />
5.a. Use aggregation to extract the requested data,combining third column until the end, and group by the subData$subject and subData$activity, and apply mean function.<br />
5.b. Use the write.table to make a .txt file from the data extracted from 5.a.<br />

## Result
The result is a TidyData.txt, combination of subject and activity, followed with the mean and standard deviation of all variables.

 [1] "subject"   
There are 30 volunteers for the experiment within the age bracket of 19-48 years.
                                        
 [2] "activity"
Each volunteer performed 6 different activities:<br />
	1 WALKING<br />
	2 WALKING_UPSTAIRS<br />
	3 WALKING_DOWNSTAIRS<br />
	4 SITTING<br />
	5 STANDING<br />
	6 LAYING<br />

 [3] "timeBodyAccelerometer-mean()-X"                    
 [4] "timeBodyAccelerometer-mean()-Y"                    
 [5] "timeBodyAccelerometer-mean()-Z"                    
 [6] "timeBodyAccelerometer-std()-X"                     
 [7] "timeBodyAccelerometer-correlation()-X,Z"           
 [8] "timeBodyAccelerometer-correlation()-Y,Z"           
 [9] "timeGravityAccelerometer-mean()-X"                 
[10] "timeGravityAccelerometer-mean()-Y"                 
[11] "timeGravityAccelerometer-mean()-Z"                 
[12] "timeGravityAccelerometer-std()-X"                  
[13] "timeGravityAccelerometer-correlation()-X,Z"        
[14] "timeGravityAccelerometer-correlation()-Y,Z"        
[15] "timeBodyAccelerometerJerk-mean()-X"                
[16] "timeBodyAccelerometerJerk-mean()-Y"                
[17] "timeBodyAccelerometerJerk-mean()-Z"                
[18] "timeBodyAccelerometerJerk-std()-X"                 
[19] "timeBodyAccelerometerJerk-correlation()-X,Z"       
[20] "timeBodyAccelerometerJerk-correlation()-Y,Z"       
[21] "timeBodyGyroscope-mean()-X"                        
[22] "timeBodyGyroscope-mean()-Y"                        
[23] "timeBodyGyroscope-mean()-Z"                        
[24] "timeBodyGyroscope-std()-X"                         
[25] "timeBodyGyroscope-correlation()-X,Z"               
[26] "timeBodyGyroscope-correlation()-Y,Z"               
[27] "timeBodyGyroscopeJerk-mean()-X"                    
[28] "timeBodyGyroscopeJerk-mean()-Y"                    
[29] "timeBodyGyroscopeJerk-mean()-Z"                    
[30] "timeBodyGyroscopeJerk-std()-X"                     
[31] "timeBodyGyroscopeJerk-correlation()-X,Z"           
[32] "timeBodyGyroscopeJerk-correlation()-Y,Z"           
[33] "timeBodyAccelerometerMagnitude-arCoeff()3"         
[34] "timeBodyAccelerometerMagnitude-arCoeff()4"         
[35] "timeGravityAccelerometerMagnitude-arCoeff()3"      
[36] "timeGravityAccelerometerMagnitude-arCoeff()4"      
[37] "timeBodyAccelerometerJerkMagnitude-arCoeff()3"     
[38] "timeBodyAccelerometerJerkMagnitude-arCoeff()4"     
[39] "timeBodyGyroscopeMagnitude-arCoeff()3"             
[40] "timeBodyGyroscopeMagnitude-arCoeff()4"             
[41] "timeBodyGyroscopeJerkMagnitude-arCoeff()3"         
[42] "timeBodyGyroscopeJerkMagnitude-arCoeff()4"         
[43] "frequencyBodyAccelerometer-mean()-X"               
[44] "frequencyBodyAccelerometer-mean()-Y"               
[45] "frequencyBodyAccelerometer-mean()-Z"               
[46] "frequencyBodyAccelerometer-std()-X"                
[47] "frequencyBodyAccelerometer-bandsEnergy()-1,24"     
[48] "frequencyBodyAccelerometer-bandsEnergy()-25,48"    
[49] "frequencyBodyAccelerometerJerk-mean()-X"           
[50] "frequencyBodyAccelerometerJerk-mean()-Y"           
[51] "frequencyBodyAccelerometerJerk-mean()-Z"           
[52] "frequencyBodyAccelerometerJerk-std()-X"            
[53] "frequencyBodyAccelerometerJerk-bandsEnergy()-1,24" 
[54] "frequencyBodyAccelerometerJerk-bandsEnergy()-25,48"
[55] "frequencyBodyGyroscope-mean()-X"                   
[56] "frequencyBodyGyroscope-mean()-Y"                   
[57] "frequencyBodyGyroscope-mean()-Z"                   
[58] "frequencyBodyGyroscope-std()-X"                    
[59] "frequencyBodyGyroscope-bandsEnergy()-1,24"         
[60] "frequencyBodyGyroscope-bandsEnergy()-25,48"        
[61] "frequencyBodyAccelerometerMagnitude-skewness()"    
[62] "frequencyBodyAccelerometerMagnitude-kurtosis()"    
[63] "frequencyBodyAccelerometerJerkMagnitude-skewness()"
[64] "frequencyBodyAccelerometerJerkMagnitude-kurtosis()"
[65] "frequencyBodyGyroscopeMagnitude-skewness()"        
[66] "frequencyBodyGyroscopeMagnitude-kurtosis()" 


From the column 3 - 66, here is the explanation on the mathematical function:
mean(): Mean value
std(): Standard deviation
energy(): Energy measure. Sum of the squares divided by the number of values. 
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
