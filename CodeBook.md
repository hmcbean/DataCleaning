# Data Cleaning Code Book

A. Folder and Files Setup
-------------------------

1.	Create a working folder on your computer.

2.	Copy the "data" folder and all its contents from this repo to your working 
    folder. the "data" folder contains a sub folder "UCI_HAR_Dataset" which 
    contains the "unclean" data. (Note the underscores and no spaces in the 
    folder name) 
    
3.	Copy the R script file "run_analysis.R" from this repo to your working folder.

4.	Run the script. 


B. Running the script "run_analysis.R"
------------------------------------- 

Running the script "run_analysis.R" produces three data sets that satisfy the 
following requirements: 

1.	Merges the training and the test sets to create one data set.

2.	Extracts only the measurements on the mean and standard deviation for each 
    measurement. 
    
3.	Uses descriptive activity names to name the activities in the data set.

4.	Appropriately labels the data set with descriptive variable names. 

5.	From the data set in step 4, creates a second, independent tidy data set with 
    the average of each variable for each activity and each subject.


C. Steps in The Data Cleaning and Analysis
------------------------------------------
(This step corresponds to section numbering in the script file "run_analysis.R"):

1.	The descriptive activity labels (activity_labels.txt) are joined to the 
    training labels (y_train.txt) and test labels (y_test.txt) to create 
    data-frames "labels_ytrain" and "labels_ytest" respectively.  These data-frame 
    contains descriptive activity names.
    
2.	The descriptive feature names are extracted from "features.txt" to a vector 
    "vfeatures" for use in the next step. 
    
3.	Descriptive column names are added to the training data. Then, the training 
    subjects from "subject_train.txt" are merged with the training labels and the 
    training data and saved as a data-frame "subjecttrain".  This data-frame 
    contains descriptive activity names and descriptive column names. 
    
4.	Descriptive column names are added to the test data. Then, the test subjects
    from "subject_test.txt" are merged with the test labels and the test data and 
    saved as a data-frame "subjecttest".  This data-frame contains descriptive 
    activity names and descriptive column names.
    
5.	The training data is merged with the test data into a new data-frame "alldata" 
    containing the merged training and test data and written to the output file 
    "/data/alldata.csv".  This data-frame contains descriptive activity names and 
    descriptive column names.
    
6.	The mean and standard deviation for each measurement are extracted to a new 
    data-frame "meanstd" and written to the output file "/data/meanstd.csv".  
    This data-frame contains descriptive activity names and descriptive column 
    names.
    
7.	A second, independent tidy data set (named " summarized_meanstd ") is created 
    with the average of each variable for each activity and each subject and 
    written to the output file "/data/ summarized_meanstd.csv".  This data-frame 
    contains descriptive activity names and descriptive column names.


D. Raw Data Files
-----------------

For a listing and description of the raw data files please refer to the following 
files in the  “data\ UCI_HAR_Dataset” folder:

1.	README.txt

2.	features_info.txt

The raw data files may also be downloaded from this link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Additional information about the data may be obtained from this link:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 


E. Clean Data File
------------------

Three data file (listed below) are created when the "run_analysis.R" script 
is successfully run.  All three files are saved in the “data/” folder:

The file “summarized_data.txt “ is the clean data file.
------------------------------------------------------- 

1.	alldata.csv:  

    a.  description: This dataset contains the merger training and test data and 
        includes descriptive activity names and descriptive column names. 
    
    b.	Size: 10299 records x 563 columns 
    
2.	meanstd.csv:  
    a.  description: This dataset contains the extracted measurements on the mean 
        and standard deviation for each measurement and includes descriptive 
        activity names and descriptive column names. 
        
    b.	Size: 10299 records x 81 columns 
    
3.	summarized_data.txt: 
 
    a.	description: This data set contains the average of each variable for each 
        activity and each subject and includes descriptive activity names and 
        descriptive column names. 
        
    b.	Size: 180 records x 81 columns 


For each of the three data files mentioned above, the first column contains the 
subject id (column name = “subjected”)  obtained from the  “subject_train.txt” and 
“subject_test.txt” files included with the raw data.

The second column contains the descriptive activity name 
(column name = “activityname”) obtained from the “activity_labels.txt” file 
included with the raw data.

The names for the remaining columns were obtained directly or extracted from the 
“features.txt” file as described in section C of this document. A description of 
the descriptive column names can be obtained from the “features_info.txt” files 
included with the raw data.

The column names for the "summarized_data.txt" file are in the numbered list below. 
1	subjectid
2	activityname
3	tBodyAcc-mean()-X
4	tBodyAcc-mean()-Y
5	tBodyAcc-mean()-Z
6	tBodyAcc-std()-X
7	tBodyAcc-std()-Y
8	tBodyAcc-std()-Z
9	tGravityAcc-mean()-X
10	tGravityAcc-mean()-Y
11	tGravityAcc-mean()-Z
12	tGravityAcc-std()-X
13	tGravityAcc-std()-Y
14	tGravityAcc-std()-Z
15	tBodyAccJerk-mean()-X
16	tBodyAccJerk-mean()-Y
17	tBodyAccJerk-mean()-Z
18	tBodyAccJerk-std()-X
19	tBodyAccJerk-std()-Y
20	tBodyAccJerk-std()-Z
21	tBodyGyro-mean()-X
22	tBodyGyro-mean()-Y
23	tBodyGyro-mean()-Z
24	tBodyGyro-std()-X
25	tBodyGyro-std()-Y
26	tBodyGyro-std()-Z
27	tBodyGyroJerk-mean()-X
28	tBodyGyroJerk-mean()-Y
29	tBodyGyroJerk-mean()-Z
30	tBodyGyroJerk-std()-X
31	tBodyGyroJerk-std()-Y
32	tBodyGyroJerk-std()-Z
33	tBodyAccMag-mean()
34	tBodyAccMag-std()
35	tGravityAccMag-mean()
36	tGravityAccMag-std()
37	tBodyAccJerkMag-mean()
38	tBodyAccJerkMag-std()
39	tBodyGyroMag-mean()
40	tBodyGyroMag-std()
41	tBodyGyroJerkMag-mean()
42	tBodyGyroJerkMag-std()
43	fBodyAcc-mean()-X
44	fBodyAcc-mean()-Y
45	fBodyAcc-mean()-Z
46	fBodyAcc-std()-X
47	fBodyAcc-std()-Y
48	fBodyAcc-std()-Z
49	fBodyAcc-meanFreq()-X
50	fBodyAcc-meanFreq()-Y
51	fBodyAcc-meanFreq()-Z
52	fBodyAccJerk-mean()-X
53	fBodyAccJerk-mean()-Y
54	fBodyAccJerk-mean()-Z
55	fBodyAccJerk-std()-X
56	fBodyAccJerk-std()-Y
57	fBodyAccJerk-std()-Z
58	fBodyAccJerk-meanFreq()-X
59	fBodyAccJerk-meanFreq()-Y
60	fBodyAccJerk-meanFreq()-Z
61	fBodyGyro-mean()-X
62	fBodyGyro-mean()-Y
63	fBodyGyro-mean()-Z
64	fBodyGyro-std()-X
65	fBodyGyro-std()-Y
66	fBodyGyro-std()-Z
67	fBodyGyro-meanFreq()-X
68	fBodyGyro-meanFreq()-Y
69	fBodyGyro-meanFreq()-Z
70	fBodyAccMag-mean()
71	fBodyAccMag-std()
72	fBodyAccMag-meanFreq()
73	fBodyBodyAccJerkMag-mean()
74	fBodyBodyAccJerkMag-std()
75	fBodyBodyAccJerkMag-meanFreq()
76	fBodyBodyGyroMag-mean()
77	fBodyBodyGyroMag-std()
78	fBodyBodyGyroMag-meanFreq()
79	fBodyBodyGyroJerkMag-mean()
80	fBodyBodyGyroJerkMag-std()
81	fBodyBodyGyroJerkMag-meanFreq()
