# CourseProject
# This script works by taking the in the test and training data of 30 subjects, from 
# X-test and X-train.txt. The variable names are taken from a separate file, features.txt
# Next, the test data and train data is merged and the column names are attached to the
# the merge_data

# Next the grepl function was used to search for where mean and std are present in all of
# the column names. Using the indices, it was possibile to determine where the mean and 
# std are present. 

# The program uses the descriptive activity names to name the activities in the data
# set. The activity labels and the test and train activity are read and merged. A column 
# is added to the activity_merge to place the corresponding activity in the second column
# Using a for loop, the program loops through each activity label and a TRUE/FALSE index
# is used to label the activity merge in bulk if the numbers in the activity _merge match
# what's in the activity_labels table. 

# Afterwords the activity_merge is added to the merge_data_mean_std with a column bind 
# function. The subject data is also read in and merged and attached to the merge_data_all
# table. Using a split function, the merge data is split with respect to the subject and
# the activity. A for loop then goes through the names of each element, converts them to
# a matrix and calculates the column means of every variables for all 180 elements. 

# All data is written to a table called mean_by_sub_act.txt.




# Codebook
# test_text: X_test
# train_text: X_train
# #variable_names: features
# merge_data: X_test and X_train data merged by row
# mean_std_names_idx: index for where there are mean and std present
# merge_data_mean_std: merge_data with just the mean and std data
# activity_labels: activity labels 1-6
# test_activity: y_test
# train_activity: y_train
# activity_merge: merge of test and train activities, second column has descriptive 
# activity
# merge_data_all: contains the mean_std merge data in addition to the activities and 
# subject
# test_subject: test subjects
# train_subject: train subjects
# subject_merge: train and test merge
# by_activity: the merge_data_all split by activity and subject
# names_sanda: names of the elements in by_activity
# means_by_sanda: means of every variable for each element (an element is a subject
# and activity)
