# Data Cleaning


A. Folder and Files Setup:

1.	Create a working folder on your computer.
2.	Copy the "data" folder and all its contents from this repo to your working folder. the "data" folder contains a sub folder "UCI_HAR_Dataset" which contains the "unclean" data. (Note the underscores and no spaces in the folder name) 
3.	Copy the R script file "run_analysis.R" from this repo to your working folder.
4.	Run the script. 



B. Steps in The Data Cleaning and Analysis (Corresponds to section numbering in the script file "run_analysis.R"):

1.	The descriptive activity labels (activity_labels.txt) are joined to the training labels (y_train.txt) and test labels (y_test.txt) to create data-frames "labels_ytrain" and "labels_ytest" respectively.  These data-frame contains descriptive activity names.
2.	The descriptive feature names are extracted from "features.txt" to a vector "vfeatures" for use in the next step. 
3.	Descriptive column names are added to the training data. Then, the training subjects from "subject_train.txt" are merged with the training labels and the training data and saved as a data-frame "subjecttrain".  This data-frame contains descriptive activity names and descriptive column names. 
4.	Descriptive column names are added to the test data. Then, the test subjects from "subject_test.txt" are merged with the test labels and the test data and saved as a data-frame "subjecttest".  This data-frame contains descriptive activity names and descriptive column names.
5.	The training data is merged with the test data into a new data-frame "alldata" containing the merged training and test data and written to the output file "/data/alldata.csv".  This data-frame contains descriptive activity names and descriptive column names.
6.	The mean and standard deviation for each measurement are extracted to a new data-frame "meanstd" and written to the output file "/data/meanstd.csv".  This data-frame contains descriptive activity names and descriptive column names.
7.	A second, independent tidy data set (named "summarized_meanstd") is created with the average of each variable for each activity and each subject and written to the output file "/data/summarized_meanstd.txt".  This data-frame contains descriptive activity names and descriptive column names.
