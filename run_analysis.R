## Preliminary step: Read the data
## Features & Activity Labels
features <- read.table("features.txt", col.names = c("index", "measures"))
activityLabels <- read.table("activity_labels.txt", col.names = c("id", "activity"))

## Train Data
trainSubjects <- read.table(".\\train\\subject_train.txt", col.names = "subjects") 
trainX <- read.table(".\\train\\X_train.txt", col.names = features$measures)
trainY <- read.table(".\\train\\y_train.txt", col.names = "id")

## Test Data
testSubjects <- read.table(".\\test\\subject_test.txt", col.names = "subjects") 
testX <- read.table(".\\test\\X_test.txt", col.names = features$measures)
testY <- read.table(".\\test\\y_test.txt", col.names = "id")

## Step 1: Merge the training and the test sets to create one data set
dataX <- rbind(trainX, testX)
dataY <- rbind(trainY, testY)
dataSubjects <- rbind(trainSubjects, testSubjects)
mergedSet <- cbind(dataX, dataY, dataSubjects)
  
## Step 2: Extract only the measurements on the mean and standard deviation for each measurement
selectedSet <- mergedSet %>% 
  select(subjects, id, contains("mean"), contains("std") )

## Step 3: Use descriptive activity names to name the activities in the data set
selectedSetId <- activityLabels[selectedSet$id, 2]

## Step 4: Appropriately label the data set with descriptive variable names
names(selectedSet)[2] = "activity"
names(selectedSet) <- gsub("^f", "Frequency", names(selectedSet))
names(selectedSet) <- gsub("^t", "Time", names(selectedSet))
names(selectedSet) <- gsub("Acc", "Accelerometer", names(selectedSet))
names(selectedSet) <- gsub("BodyBody", "Body", names(selectedSet))
names(selectedSet) <- gsub("Gyro", "Gyroscope", names(selectedSet))
names(selectedSet) <- gsub("Mag", "Magnitude", names(selectedSet))
names(selectedSet) <- gsub("tBody", "TimeBody", names(selectedSet))
names(selectedSet) <- gsub("-mean()", "Mean", names(selectedSet))
names(selectedSet) <- gsub("-std()", "Standard Deviation", names(selectedSet))
names(selectedSet) <- gsub("-freq()", "Frequency", names(selectedSet))

## Step 5: From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject

tidyData2 <- selectedSet %>%
  group_by(subjects, activity) %>%
  summarise_all(mean)

## Save the output
write.table(tidyData2, "TidyData.txt", row.name=FALSE)





