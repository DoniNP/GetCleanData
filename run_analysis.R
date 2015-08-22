install.packages("data.table")

## Objective 1. Merges the training and the test sets to create one data set. ##
## 1.a. Importing the data from the source on the Internet ##
dir.create("UCI HAR Dataset")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "UCIHARDataset.zip", method = "curl")
unzip('./UCIHARDataset.zip')

## 1.b. Merging the training and test data set ##
## As we learn from the README, x is features data ##
xTrain <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
xTest <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
xFull <- rbind(xTrain, xTest)

## We need to give label the data in X from features.txt"
featureNames <- read.table("./UCI HAR Dataset/features.txt")
names(xFull) <- featureNames$V2

## As we learn from the README, y is activity ##
yTrain <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)
yTest <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)
yFull <- rbind(yTrain, yTest)
names(yFull) <- c("activity")

## As we learn from the README, subject is the volunteer ##
subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)
subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)
subjectFull <- rbind(subjectTrain, subjectTest)
names(subjectFull) <- c("subject")

tempCombine <- cbind(subjectFull, yFull)
fullData <- cbind(tempCombine, xFull)
## Here, fullData is the complete set, of which subject does which activity with how much measurement, in one big data frame##
## End of Objective 1 ##


## Objective 2. Extracts only the measurements on the mean and standard deviation for each measurement. ##
## 2.a. Selecting the mean and standard deviation subset
sub_features <- grep("-mean\\(\\)|-std\\(\\)", featureNames[, 2])

## 2.b. Extracting only the requested measurement ##
subData <- fullData[, sub_features]
## End of Objective 2 ##


## Objective 3. Uses descriptive activity names to name the activities in the data set. ##
## 3.a. Importing the labels from "activity_labels.txt"
actLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")

## 3.b. Generating the name of the activities from the 2nd column of the subData ##
actLabels[subData$activity,2]

## 3.c. Renaming the 2nd column of the subData with 3.b. ##
subData$activity <- actLabels[subData$activity,2]

## At this point the subData activities has been renamed according to those provided at activity_labels.txt ##
## End of Objective 3 ##


## Objective 4. Appropriately labels the data set with descriptive variable names. ##
## sub() is helpful in this part to find string and replace with new string.
## Checking at "features_info.txt", there are several abbreviation:
## "t" as prefix, stands for "time"
names(subData) <- sub("^t", "time", names(subData))

## "f" as prefix, stands for "frequency"
names(subData) <- sub("^f", "frequency", names(subData))

## "Acc" stands for "Accelerometer"
names(subData) <- sub("Acc", "Accelerometer", names(subData))

## "Gyro" stands for "Gyroscope"
names(subData) <- sub("Gyro", "Gyroscope", names(subData))

## "Mag" stands for "Magnitude"
names(subData) <- sub("Mag", "Magnitude", names(subData))

## "BodyBody" is redundant, better to replace it by "Body"
names(subData) <- sub("BodyBody", "Body", names(subData))
## End of Objective 4 ##

## Objective 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. ##
## 5.a For ease of use, I used aggregate, combining third column until the end, and group by the subData$subject and subData$activity

independentData <- aggregate(subData[, 3:ncol(subData)], by=list(subject = subData$subject, activity = subData$activity), mean)

## 5.b. Write down to a file ##
write.table(independentData, file = "TidyData.txt", row.names = FALSE)
## End of Objective 5 ##


