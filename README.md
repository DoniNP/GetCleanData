##Introduction
The run_analysis.R is created as a project on Coursera’s Getting and Cleaning Data. This script will extract the scattered data on UCI HAR, and make a sub clean and tidy data that will be useful for analysis. In this script, the output will be “TidyData.txt”

##How to Use
1. Initially, this script will download and extract the data required, namely “UCI HAR Dataset”
2. Make sure that this script is on the same parent directory of “UCI HAR Dataset”
3. Once run, it may take several time to work, depending on the speed of your processor, and “TidyData.txt” will be extracted.

##Objectives
The project has 5 (five) main objectives:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##How it Works
The number below is the objective. The alphabet shows the steps needed to achieve the objective.
1.a. Importing the data from the source on the Internet
1.b. Study the instruction of the file to understand more about the scattered data, then merge the data.
2.a. Selecting the mean and standard deviation subset
2.b. Extracting only the requested measurement 
3.a. Importing the labels from "activity_labels.txt"
3.b. Generating the name of the activities from the 2nd column of the subData created from 2.b.
3.c. Renaming the 2nd column of the subData with 3.b.
4.a. Learning from the instruction on the data set. Rename any acronyms in the variable, and make it detailed. e.g. “t” is renamed into “time”.
5.a. Use aggregation to extract the requested data
5.b. Use the write.table to make a .txt file from the data extracted from 5.a.

##Library Needed
This script needs data.table package, already in the script