getdataProject
==============

#Course Project 

The r script run\_analysis.md combines files from the UCI\_HAR\_DATASET to create a tidy dataset. The original data was generated from sensor measurements from a Samsung smartphone during 6 different activities of 30 different subjects. The sensor data consisted of 33 different measures of motion with a number of calculations applied to each.

###The tidy dataset includes the following files:

- 'README.md'

- 'codebook.md': Shows information about the variables used on the feature vector.

- 'run_analysis.R': The r script that takes the original data and produces the tidy data set. 

- 'tidy.txt': The tidy data set


###Notes: 
- There is a row for each pair of subject and activity, resulting in 180 rows
- For each column the mean value corresponding to the subject/activity is recorded


##Method:
###Part 1. Merging the training and test sets.

Training and Test data sets were created by reading the respective x, y and subject files into r and combining them using the cbind functions.


The training and test data sets were merged using the rbind function

The feature names were then applied to the data set to name the columns

### Part 2. 

The feature names were filtered so that only those that contained "mean()" or "std()" were retained. 



### Part 3. Apply descriptive activity names to the activities.

activityTable <- read.table("activity_labels.txt")
levels <- unlist(activityTable[,1], use.names = FALSE)  #levels
labels <- unlist(activityTable[,2], use.names = FALSE)  #labels
dataset$activity <- factor(dataset$activity, levels = levels, labels = labels) 


###  Part 4. Label the variables with descriptive names

Remove invalid characters from the column names with make.name() function
Remove the '.' from the new column names and capitalize the mean and std with sub()

### Part 5. Make data tidy

The tidy data consists of a column for the subject and activity, and one for each of 66 variables. 


