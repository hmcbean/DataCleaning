# Load the required R Libraries
library(tidyr)
library(dplyr)
library(plyr)

# This script depends on the following:
#	1. The availabuility of a folder named "data" within the working folder on the user's computer
#	2. The folder "UCI_HAR_Dataset" containing the "unclean" data must be copied into the "data" folder
#	3. The R script file "run_analysis.R" must be placed in the working folder on the user's computer


# -------------------------------------------------------------------------------------------------
# Step B1
# Join the descriptive activity lables (activity_labels.txt) to the training lables (y_train.txt) 
# and test lables (y_test.txt)
# -------------------------------------------------------------------------------------------------
# Load the activity lables 
activitylable <- tbl_df(read.table("./data/UCI_HAR_Dataset/activity_labels.txt", header = FALSE, sep = ""))
# Add column names 
colnames(activitylable) <- c("activityid","activityname")

# Load the training lables
ytrain <- tbl_df(read.table("./data/UCI_HAR_Dataset/train/y_train.txt", header = FALSE))
# Add column name
colnames(ytrain) <- c("activityid")


# Load the test lables
ytest <- tbl_df(read.table("./data/UCI_HAR_Dataset/test/y_test.txt", header = FALSE))
# Add column name
colnames(ytest) <- c("activityid")

# Join the training lables and and activity lables tables on "activityid"
lables_ytrain <- join(ytrain, activitylable, by = "activityid")

# Join the test lables and and activity lables tables on V1
lables_ytest <- join(ytest, activitylable, by = "activityid")



# -------------------------------------------------------------------------------------------------
# Step B2
# Extract the descriptive feature names for use in the next step
# -------------------------------------------------------------------------------------------------
# Load the descriptive features names table
features <- tbl_df(read.table("./data/UCI_HAR_Dataset/features.txt", header = FALSE))

# Add column names
colnames(features) <- c("featureid", "featurename")

# Extract the descriptive features names as a character vector
vfeatures <- as.vector(features$featurename)



# -------------------------------------------------------------------------------------------------
# Step B3
# Merge the training subjects, the training lables and the training data.
# -------------------------------------------------------------------------------------------------
# Load the training subjects into a data-frame "subjecttrain" 
subjecttrain <- tbl_df(read.table("./data/UCI_HAR_Dataset/train/subject_train.txt", header = FALSE))
# Add column name
colnames(subjecttrain) <- c("subjectid")

# Add a column with a sequence of numbers for use as a merge key to the 
# training subjects data-frame "subjecttrain" and save as a new data-frame "seqsubjecttrain"
seqsubjecttrain <- subjecttrain
seqsubjecttrain$seq <- c(seq(1:nrow(subjecttrain)))


# Add a column with a sequence of numbers for use as a merge key to the 
# activity-training lables data-frame "lables_ytrain" and save as a new data-frame "seqlables_ytrain"
seqlables_ytrain <- lables_ytrain
seqlables_ytrain$seq <- c(seq(1:nrow(lables_ytrain)))

# Merge the training subjects to the training lables
subject_ytrain <- merge(seqsubjecttrain, seqlables_ytrain, by="seq")


# Load the training data 
xtrain <- tbl_df(read.table("./data/UCI_HAR_Dataset/train/X_train.txt", header = FALSE, sep = ""))
# Add column names 
colnames(xtrain) <- c(vfeatures)

# Add a column with a sequence of numbers for use as a merge key to the training data 
# data-frame "xtrain" and save as a new data-frame "seqxtrain"
seqxtrain <- xtrain
seqxtrain$seq <- c(seq(1:nrow(xtrain)))

# Merge the training subjects and training lables to the training data
seqsubject_y_xtrain <- merge(subject_ytrain, seqxtrain, by="seq")

# drop the "seq" and "activityid" columns
subject_y_xtrain <- seqsubject_y_xtrain[c(-1, -3)]



# -------------------------------------------------------------------------------------------------
# Step B4
# Merge the test subjects, the test lables and the test data.
# -------------------------------------------------------------------------------------------------
# Load the test subjects into a data-frame "subjecttest"
subjecttest <- tbl_df(read.table("./data/UCI_HAR_Dataset/test/subject_test.txt", header = FALSE))
# Add column name
colnames(subjecttest) <- c("subjectid")

# Add a column with a sequence of numbers for use as a merge key to the 
# test subjects data-frame "subjecttest" and save as a new data-frame "seqsubjecttest"
seqsubjecttest <- subjecttest
seqsubjecttest$seq <- c(seq(1:nrow(subjecttest)))


# Add a column with a sequence of numbers for use as a merge key to the 
# activity-training lables data-frame "lables_ytest" and save as a new data-frame "seqlables_ytest"
seqlables_ytest <- lables_ytest
seqlables_ytest$seq <- c(seq(1:nrow(lables_ytest)))

# Merge the test subjects to the test lables
subject_ytest <- merge(seqsubjecttest, seqlables_ytest, by="seq")


# Load the test data 
xtest <- tbl_df(read.table("./data/UCI_HAR_Dataset/test/X_test.txt", header = FALSE, sep = ""))
# Add column names 
colnames(xtest) <- c(vfeatures)

# Add a column with a sequence of numbers for use as a merge key to the test data 
# data-frame "xtest" and save as a new data-frame "seqxtest"
seqxtest <- xtest
seqxtest$seq <- c(seq(1:nrow(xtest)))

# Merge the testy subjects and test lables to the test data
seqsubject_y_xtest <- merge(subject_ytest, seqxtest, by="seq")

# Drop columns 1 (seq) and 3 (activityid).
subject_y_xtest <- seqsubject_y_xtest[c(-1, -3)]



# -------------------------------------------------------------------------------------------------
# Step B5
# Merge the training data with the test data into a new data-frame "alldata".
# -------------------------------------------------------------------------------------------------
# Merge the data-frames
alldata <- rbind(subject_y_xtrain, subject_y_xtest) 

# Write out the dataset
write.csv(alldata, file = "./data/alldata.csv", append = FALSE, quote = TRUE, sep = ",",
            eol = "\n", na = "NA", dec = ".", row.names = FALSE,
            col.names = TRUE, qmethod = "double")



# -------------------------------------------------------------------------------------------------
# Step B6
# Extract the mean and standard deviation for each measurement to a new data-frame "meanstd"
# -------------------------------------------------------------------------------------------------
# Get the columns numbers for the measurements on the mean and standard deviation, using the
# "features" data-frame and increase the column numbers by 2 to allow for the "subjectid" and 
# "activityname" columns in the "alldata" data-frame
extractcolnum <- (c(grep("mean()|std()", features$featurename)) + 2)

# Export columns to new data-frame "meanstd"
meanstd <- alldata[,c(1,2,extractcolnum)]

# Write out the dataset
write.csv(meanstd, file = "./data/meanstd.csv", append = FALSE, quote = TRUE, sep = ",",
            eol = "\n", na = "NA", dec = ".", row.names = FALSE,
            col.names = TRUE, qmethod = "double")



# -------------------------------------------------------------------------------------------------
# Step B7
# Create a second, independent tidy data set (named "summarized_meanstd") with the average of each 
# variable for each activity and each subject.
# -------------------------------------------------------------------------------------------------
# Summarize
summarized_meanstd <- meanstd %>% group_by(subjectid, activityname) %>% summarise_each(funs(mean(.,na.rm = TRUE))) 

# Write out the dataset
write.table(summarized_meanstd, file = "./data/summarized_data.txt", append = FALSE, quote = FALSE, sep = " ",
            eol = "\n", na = "NA", dec = ".", row.names = FALSE,
            col.names = TRUE, qmethod = c("escape", "double"))


