#clear environment
rm(list = ls())

#download and unzip the zip file
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
              destfile = "course_project.zip")
unzip("course_project.zip")

# 1. merge the training and test sets to create one data set
#read the files and put all parts of the datasets together

features <- read.table("UCI HAR Dataset/features.txt")
columns <- as.character(features[,2])
act_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

#training set
train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = columns)

activity_codes <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "activity_code")

id <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "id")

activities <- merge(activity_codes, act_labels, by.x = "activity_code", by.y = "V1")

names(activities)[2] <- "activity"

train <- cbind(id, activities, train)

rm(id, activities, features, activity_codes)


#test set
test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = columns)

activity_codes <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "activity_code")

id <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "id")

activities <- merge(activity_codes, act_labels, by.x = "activity_code", by.y = "V1")

names(activities)[2] <- "activity"

test <- cbind(id, activities, test)

rm(id, activities, activity_codes, act_labels, columns)


#merge training and test set
merged <- rbind(train, test)
merged$activity_code <- NULL

# 2. Extract only the measurements on the mean and standard deviation for each measurement.
names <- names(merged)
#selected <- grep("[[:punct:]]mean[[:punct:]]|[[:punct:]]std[[:punct:]]", names, value = T)
selected_names <- grep("[[:punct:]]mean[[:punct:]]|[[:punct:]]std[[:punct:]]", names)

selected_data <- merged[c(1, 2, 3, selected_names)]

# 3. Uses descriptive activity names to name the activities in the data set
# -----> already done in lines 14, 23, 25.
# put all activity names in lower case

selected_data$activity <- tolower(selected_data$activity)

# 4. appropriately labels the data set with descriptive variable names
column_names <- names(selected_data)
new_names <- gsub("^t", "time_", column_names)
new_names <- gsub("Body", "body", new_names)
new_names <- gsub("Acc", "accelerometer", new_names)
new_names <- gsub("Gyro", "gyroscope", new_names)
new_names <- gsub("Gravity", "gravity", new_names)
new_names <- gsub("Jerk", "_jerk", new_names)
new_names <- gsub("Mag", "euclidean", new_names)
new_names <- gsub("^f", "frequency_", new_names)
new_names <- gsub(".mean", "_average", new_names)
new_names <- gsub(".std", "_stdev", new_names)
new_names <- gsub("\\.\\.\\.", "_", new_names)

names(selected_data) <- new_names

# 5. From the data set in step 4, creates a second, independent tidy data set
#with the average of each variable for each activity and each subject.

library(dplyr)
converted <- tbl_df(selected_data)

new_dataset <- group_by(converted, id, activity) %>% summarize_all(mean)

rm(converted, test, train, column_names, names, new_names, selected_names)

### save dataset for submission
write.table(new_dataset, file = "dataset_for_submission.txt", row.names = FALSE)






