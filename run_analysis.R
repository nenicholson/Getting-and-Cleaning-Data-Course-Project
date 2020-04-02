setwd('/Users/NatashaNicholson/Documents/R/UCI HAR Dataset')

features <-read.table('./features.txt', header=FALSE, sep=" ")
activities <-read.table('./activity_labels.txt', header=FALSE, sep=" ")
colnames(activities) <- c("activityNo", "activity")

subject_train <- read.table('./train/subject_train.txt', header=FALSE)
x_train <- read.table('./train/X_train.txt', header=FALSE)
y_train <- read.table('./train/Y_train.txt', header=FALSE)

subject_test <- read.table('./test/subject_test.txt', header=FALSE)
x_test <- read.table('./test/X_test.txt', header=FALSE)
y_test <- read.table('./test/Y_test.txt', header=FALSE)

# 1. Merges the training and the test sets to create one data set.

x_set <- bind_rows(x_train, x_test)
subject_set <- bind_rows(subject_train, subject_test)
colnames(subject_set) <- "subject"
  
# 4. Appropriately label the data set with descriptive variable names.

colnames(x_set) <- features[,2]
x_set <- x_set[!duplicated(as.list(x_set))]

# 2. Extract only the measurements on the mean and standard deviation for each measurement.

mean_std <- select(x_set, matches("(mean|std)"))

# 3. Use descriptive activity names to name the activities in the data set

y_set <- bind_rows(y_train, y_test)
colnames(y_set) <- "activity"
data_set <- bind_cols(mean_std, y_set)
activity_name <- recode(data_set$activity, '1'='Walking', '2'='Walking upstairs', '3'='Walking downstairs', '4'='Sitting', '5'='Standing', '6'='Laying')
data_set$activity <- activity_name

# 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.

data_set <- bind_cols(data_set, subject_set)
avg_set <- group_by(data_set, activity, subject) %>% summarise_all(funs(mean))

# Write to txt file
write.table(avg_set, "dataset.txt", row.names = FALSE)

