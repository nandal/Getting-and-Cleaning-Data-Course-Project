# Run Analysis R Scirpt

# Set the working directory path
setwd("/home/rstudio/r-docker-tutorial/GettingAndCleaningData/Getting and Cleaning Data Course Project")

# Requirement 1:  Merges the training and the test sets to create one data set
# Reading X Train and Test Data Files
trainData <- read.table("./data/train/X_train.txt")
dim(trainData) # 7352x561
head(trainData)
testData <- read.table("./data/test/X_test.txt")
dim(testData) # 2947x561
head(testData)

# Reading Label Train and Test Data Files
trainLabel <- read.table("./data/train/y_train.txt")
dim(trainLabel) # 7352x1
table(trainLabel)
testLabel <- read.table("./data/test/y_test.txt") 
dim(testLabel) # 2947x1
table(testLabel)

# Read the Test and Train Subject files.
trainSubject <- read.table("./data/train/subject_train.txt")
dim(trainSubject) # 7352x1
testSubject <- read.table("./data/test/subject_test.txt")
dim(testSubject) # 2947x1

# Merge the training and the test sets
# by concatenating the data tables
joinData <- rbind(trainData, testData)
dim(joinData) # 10299*561
joinLabel <- rbind(trainLabel, testLabel)
dim(joinLabel) # 10299*1
joinSubject <- rbind(trainSubject, testSubject)
dim(joinSubject) # 10299*1


# Requirement 2:Extracts only the measurements on the mean and standard 
# deviation for each measurement.
features <- read.table("./data/features.txt")
dim(features)  # 561*2
meanStdIndices <- grep("mean\\(\\)|std\\(\\)", features[, 2])
length(meanStdIndices) # 66
joinData <- joinData[, meanStdIndices]
dim(joinData) # 10299*66

# remove "()"
names(joinData) <- gsub("\\(\\)", "", features[meanStdIndices, 2])

# capitalize M
names(joinData) <- gsub("mean", "Mean", names(joinData))

# capitalize S
names(joinData) <- gsub("std", "Std", names(joinData))

# remove "-" from columns
names(joinData) <- gsub("-", "", names(joinData)) # remove "-" in column names 


# Requirement 3: Uses descriptive activity names to name the activities in the data set 
activity <- read.table("./data/activity_labels.txt")

# replaceing "_" from values and lower casing
activity[, 2] <- tolower(gsub("_", "", activity[, 2]))
substr(activity[2, 2], 8, 8) <- toupper(substr(activity[2, 2], 8, 8))
substr(activity[3, 2], 8, 8) <- toupper(substr(activity[3, 2], 8, 8))
activityLabel <- activity[joinLabel[, 1], 2]
joinLabel[, 1] <- activityLabel
names(joinLabel) <- "activity"

# Requirement 4: Appropriately labels the data set with descriptive activity names.
names(joinSubject) <- "subject"
cleanedData <- cbind(joinSubject, joinLabel, joinData)
dim(cleanedData) # 10299*68
write.table(cleanedData, "merged_data.txt") # write out the 1st dataset

# Requirement 5: Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
subjectLen <- length(table(joinSubject)) # 30
activityLen <- dim(activity)[1] # 6
columnLen <- dim(cleanedData)[2]
result <- matrix(NA, nrow=subjectLen*activityLen, ncol=columnLen) 
result <- as.data.frame(result)
colnames(result) <- colnames(cleanedData)
row <- 1
for(i in 1:subjectLen) {
  for(j in 1:activityLen) {
    result[row, 1] <- sort(unique(joinSubject)[, 1])[i]
    result[row, 2] <- activity[j, 2]
    bool1 <- i == cleanedData$subject
    bool2 <- activity[j, 2] == cleanedData$activity
    result[row, 3:columnLen] <- colMeans(cleanedData[bool1&bool2, 3:columnLen])
    row <- row + 1
  }
}
head(result)
# write out the 2nd dataset
write.table(result, "data_with_means.txt") 

# confirming teh written dataset
data <- read.table("./data_with_means.txt")
data[1:12, 1:3]


