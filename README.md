# DataCleaning


A. Setup:

1. Create a working folder on your computer.
2. Copy the "data" folder and all its contents from this repo to your working folder. the "data" folder contains a sub folder "UCI_HAR_Dataset" witgh the "unclean" data.
3. Copy the R script file "run_analysis.R" from this repo to your working folder.
4. Run the script. 



B. Steps in the data cleaning and analysis:

1. The descriptive activity lables (activity_labels.txt) are joined to the training lables (y_train.txt) and test lables (y_test.txt).
2. The descriptive feature names are extracted for use in the next step.
3. The training subjects are merged to the training lables and the training data.
4. The test subjects and test lables are merged to the test data.
5. The training data is merged with the test data into a new data-frame "alldata" and writted to the output file "/data/alldata.csv".
6. The mean and standard deviation for each measurement are extracted to a new data-frame "meanstd" and writted to the output file "/data/meanstd.csv".
7. A second, independent tidy data set (named "average_alldata") is created with the average of each variable for each activity and each subject and writted to the output file "/data/summarized_data.csv".
