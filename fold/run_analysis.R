## This R script produces the tidy data file from the data set 
### 

##Part 1: Merge training and test data sets

## load test data
xtest <- read.table("test/X_test.txt");
ytest <- read.table("test/y_test.txt");
stest <- read.table("test/subject_test.txt");

## column bind test data into a single data frame
testdata <- cbind(stest, ytest, xtest);

## load training data
xtrain <- read.table("train/X_train.txt");
ytrain <- read.table("train/y_train.txt");
strain <- read.table("train/subject_train.txt");

## column bind training data into a single data frame
traindata <- cbind(strain, ytrain, xtrain);


## row bind test and training data together
dataset <- rbind(testdata, traindata);

## label the columns

features <- read.table("features.txt"); #column names 
names(dataset) <- c("subject", "activity", t(features[2])); 


## Part 2: reduce the columns to the variable means and std dev. 
## i.e. those columns that have 'mean()' or 'sd()' in their names

##create a vector of valid column names
cnames <- names(dataset[,grepl("mean\\(\\)|std\\(\\)",names(dataset))])

## create a new data set, rds, that only includes the desired variables
## copy the subject and activity columns over to reduced data set
reducedDS <- dataset[,1:2] 

## loop through all the variable columns checking for desired variables
### and copy those over to reduced data set, reducedDS 
for (i in 3:ncol(dataset)) {
    if(names(dataset)[i] %in% cnames) reducedDS <-cbind(reducedDS, dataset[,i])
}


## Part 3. convert activity numbers (1:6) to activity labels

activityTable <- read.table("activity_labels.txt")
levels <- unlist(activityTable[,1], use.names = FALSE)  #levels
labels <- unlist(activityTable[,2], use.names = FALSE)  #labels
reducedDS$activity <- factor(reducedDS$activity, levels = levels, labels = labels) 


## Part 4. label the columns

#remove invalid characters
cnames <- make.names(cnames) 

## remove "." and change "mean" to "Mean" and "std" to "Std"
cnames <- gsub("\\.", "", cnames)
cnames <- sub("mean", "Mean", cnames)
cnames <- sub("std", "Std", cnames) 

## rename the columns
names(reducedDS)[3:68] <- cnames 


## Part 5. find the mean each variable for each subject/activity pair (180 pairs)

library(reshape2) # required for melt

## grab the first subject and activity id variables, probably a better way to get these
tidy <- melt(with(reducedDS, tapply(reducedDS[,3], list(subject, activity), mean)))[,1:2]

## loop through all 66 variables
## use tapply to calculate mean of a variable for each subject/activity pair
## melt the matrix into a dataframe, extract the 3rd column and column bind to tidy data frame
for (i in 3:68) {
  tidy[i] <- melt(with(reducedDS, tapply(reducedDS[,i], list(subject, activity), mean)))[,3]
}

##rename the tidy data column names
names(tidy) <- c("subject", "activity", cnames)

## write the tidy data frame to the file "tidy.txt"
write.table(tidy, file = "tidy.txt", row.name = F)
