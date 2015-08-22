##Introduction
The run_analysis.R is created as a project on Coursera’s Getting and Cleaning Data. This script will extract the scattered data on UCI HAR, and make a sub clean and tidy data that will be useful for analysis. In this script, the output will be “TidyData.txt”

##How to Use
1. Initially, this script will download and extract the data required, namely “UCI HAR Dataset”<br />
2. Make sure that this script is on the same parent directory of “UCI HAR Dataset”<br />
3. Once run, it may take several time to work, depending on the speed of your processor, and “TidyData.txt” will be extracted.

##Objectives
The project has 5 (five) main objectives:<br />
1. Merges the training and the test sets to create one data set.<br />
2. Extracts only the measurements on the mean and standard deviation for each measurement.<br />
3. Uses descriptive activity names to name the activities in the data set. <br />
4. Appropriately labels the data set with descriptive activity names. <br />
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##How it Works
1. Importing the data from the source on the Internet.
2. Study the instruction of the file to understand more about the scattered data, then merge the data. For each test and train is rbind()-ed. Then, among the x, y, and subject, all are cbind()-ed.
3. Selecting the mean and standard deviation subset, by using grep.
4. Extracting only the requested measurement, producing a new subData.
5. Importing the activity labels from "activity_labels.txt”, namely actLabels.
6. Generating the name of the activities from the 2nd column of the subData created from step 4.
7. Renaming the 2nd column of the subData with step 6.
8. Learning from the instruction on the data set. Rename any abbreviation in the variable using sub().
9. Use aggregation to extract the requested data, combining third column until the end, and group by the subData$subject and subData$activity, and apply mean function.
10. Use the write.table to make a .txt file from the data extracted from step 9.

##Library Needed
This script needs data.table package, already in the script