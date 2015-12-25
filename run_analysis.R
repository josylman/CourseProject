# setwd("~/Desktop/Data Science Specialization/Getting and Cleaning Data/Course Project")
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile = "./data/data.zip", method = "curl") #downloads data in a file called data
unzip("./data/data.zip")

test_text <- read.table("./data/UCI HAR Dataset/test/X_test.txt", header=FALSE,  sep="")
train_text <- read.table("./data/UCI HAR Dataset/train/X_train.txt", header=FALSE,  sep="")
variable_names <- read.table("./data/UCI HAR Dataset/features.txt")
variable_names <- variable_names[,2]
merge_data <- rbind(test_text, train_text)
colnames(merge_data) <- variable_names

# subset the data with mean and std
#use the grepl function with sapply to go through variable_names to find which contain words
# mean and std
mean_std_names_idx <- sapply(c("mean()","std()"), grepl, variable_names) 
combined <- (mean_std_names_idx[,1]==TRUE | mean_std_names_idx[,2]==TRUE)
merge_data_mean_std <- merge_data[combined]

# Use descriptive activity names to name activities in data set
activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
test_activity <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
train_activity <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
activity_merge <- rbind(test_activity, train_activity)

activity_merge <- cbind(activity_merge, V2 = factor(x = nrow(activity_merge), levels = activity_labels$V2))

for (i in 1:nrow(activity_labels)) {
      idx <- activity_merge$V1==i
      activity_merge$V2[idx] <- activity_labels$V2[i]
   
}

# Appropriately label the datasets with descriptive variables
# from previous steps, the datasets were already labeled 
merge_data_mean_std
merge_data_all <- cbind(merge_data_mean_std, activity_merge$V2 )

#From the data set in step 4, creates a second, independent tidy data set with the average 
#of each variable for each activity and each subject.
# First need to add a column identifying all the subjects
test_subject <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
train_subject <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
subject_merge <- rbind(test_subject, train_subject)
merge_data_all <- cbind(merge_data_all, subject_merge )

library(dplyr)
by_activity <- split(merge_data_all,list(merge_data_all$`activity_merge$V2`,merge_data_all$V1))
                   
names_sanda <- names(by_activity)

means_by_sanda = list()
for (name in names_sanda) {
      df <- by_activity[[name]][1:79] 
      df <- as.matrix(df)
      means_by_sanda[[name]] <- colMeans(df) 
}


write.table(means_by_sanda,"./data/UCI HAR Dataset/mean_by_sub_act.txt", row.name = FALSE)
