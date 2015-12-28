
# Codebook
* test_text: X_test
* train_text: X_train
* variable_names: features
* merge_data: X_test and X_train data merged by row
* mean_std_names_idx: index for where there are mean and std present
* merge_data_mean_std: merge_data with just the mean and std data
* activity_labels: activity labels 1-6
* test_activity: y_test
* train_activity: y_train
* activity_merge: merge of test and train activities, second column has descriptive 
activity
* merge_data_all: contains the mean_std merge data in addition to the activities and 
subject
* test_subject: test subjects
* train_subject: train subjects
* subject_merge: train and test merge
* by_activity: the merge_data_all split by activity and subject
* names_sanda: names of the elements in by_activity
* means_by_sanda: means of every variable for each element (an element is a subject
and activity)
