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
The number below is the objective. The alphabet shows the steps needed to achieve the objective.<br />
1.a. Importing the data from the source on the Internet<br />
1.b. Study the instruction of the file to understand more about the scattered data, then merge the data.<br />
2.a. Selecting the mean and standard deviation subset. <br />
2.b. Extracting only the requested measurement. <br />
3.a. Importing the labels from "activity_labels.txt" <br />
3.b. Generating the name of the activities from the 2nd column of the subData created from 2.b.
3.c. Renaming the 2nd column of the subData with 3.b.<br />
4.a. Learning from the instruction on the data set. Rename any acronyms in the variable, and make it detailed. e.g. “t” is renamed into “time”. <br />

5.a. Use aggregation to extract the requested data.<br />
5.b. Use the write.table to make a .txt file from the data extracted from 5.a.<br />

##Library Needed
This script needs data.table package, already in the script.