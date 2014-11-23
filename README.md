The r script run\_analysis.md combines files from the UCI\_HAR\_DATASET to create a tidy dataset. The original data was generated from sensor measurements from a Samsung smartphone during 6 different activities of 30 different subjects. The sensor data consisted of 33 different measures of motion with a number of calculations applied to each.

The tidy dataset includes the following files:
=========================================

- 'README.md'

- 'codebook.md': Shows information about the variables used on the feature vector.

- 'run_analysis.R': The r script that takes the original data and produces the tidy data set. 

- 'tidy.txt': The tidy data set


Notes: 
======
- There is a row for each pair of subject and activity, resulting in 180 rows
- For each column the mean value corresponding to the subject/activity is recorded
- the data can be loaded into the tidy data frame in r via
```{r}
tidy <- read.table("tidy.txt", header=TRUE)
```

##Method:
### Part 1. Merging the training and test sets.

Training and Test data sets were created by reading the respective x, y and subject files into r and combining them using the cbind functions.

``` {r}
xtest <- read.table("test/X_test.txt");
ytest <- read.table("test/y_test.txt");
stest <- read.table("test/subject_test.txt");
testdata <- cbind(stest, ytest, xtest);

xtrain <- read.table("train/X_train.txt");
ytrain <- read.table("train/y_train.txt");
strain <- read.table("train/subject_train.txt");
traindata <- cbind(strain, ytrain, xtrain);
```

The training and test data sets were merged using the rbind function and the feature names were then applied to the data set to name the columns


``` {r}
dataset <- rbind(test_data, train_data)

features <- read.table("features.txt"); #column names 
names(dataset) <- c("subject", "activity", t(features[2]));

```

### Part 2. Remove unwanted data

The feature names were filtered so that only those that contained "mean()" or "std()" were retained. 
```{r}
cnames <- names(dataset[,grepl("mean\\(\\)|std\\(\\)",names(dataset))])
reducedDS <- dataset[,1:2] 
for (i in 3:ncol(dataset)) {
    if(names(dataset)[i] %in% cnames) reducedDS <-cbind(reducedDS, dataset[,i])
}

```

### Part 3. Apply descriptive activity names to the activities.

The activity labels were imported from the "activity_label.txt" file and applied to the activity column values using the factor function.

```{r}
activityTable <- read.table("activity_labels.txt")
levels <- unlist(activityTable[,1], use.names = FALSE)  #levels
labels <- unlist(activityTable[,2], use.names = FALSE)  #labels
reducedDS$activity <- factor(reducedDS$activity, levels = levels, labels = labels) 
```

###  Part 4. Label the columns

Column names were altered so only valid characters were used (make.names()) and some other alterations were made before applying to the data frame.
```{r}
cnames <- make.names(cnames) 
cnames <- gsub("\\.", "", cnames)
cnames <- sub("mean", "Mean", cnames)
cnames <- sub("std", "Std", cnames) 
names(reducedDS)[3:68] <- cnames
```

###  Part 5. Generate the tidy data file.

Loop through each of 66 variables and get the average value for each subject/activity combination.
- tapply separates the column into groups with common subject and activity and applies mean() to those values. 
- melt creates a dataframe from the generated matrix
- cbind combines the data into the tidy data frame
- write.table outputs the tidy data frame to a txt file

```{r}
tidy <- melt(with(reducedDS, tapply(reducedDS[,3], list(subject, activity), mean)))[,1:2]
for (i in 3:68) {
  tidy[i] <- melt(with(reducedDS, tapply(reducedDS[,i], list(subject, activity), mean)))[,3]
}
## rename the columns, as cbind doesn't transfer the names
names(tidy) <- c("subject", "activity", cnames)
## write out the file
write.table(tidy, file = "tidy.txt", row.name = F)
```