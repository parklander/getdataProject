#Feature Selection 

The features retained from the original data set are listed at the bottom on this document. Values in the tidy.txt file are means of the means and means of the standard deviations. Details from the original codebook follows:

### Original description of data.
The features selected for the database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag


### The set of variables that were retained from the original dataset are:

- mean(): Mean value
- std(): Standard deviation


### The variables that were removed:

- mad(): Median absolute deviation 
- max(): Largest value in array
- min(): Smallest value in array
- sma(): Signal magnitude area
- energy(): Energy measure. Sum of the squares divided by the number of values. 
- iqr(): Interquartile range 
- entropy(): Signal entropy
- arCoeff(): Autorregresion coefficients with Burg order equal to 4
- correlation(): correlation coefficient between two signals
- maxInds(): index of the frequency component with largest magnitude
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
- skewness(): skewness of the frequency domain signal 
- kurtosis(): kurtosis of the frequency domain signal 
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.

These variables were also dropped as there were no standard deviations associated with the means: 
angle(): Angle between to vectors.
- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean


## Tidy Data
For each of the 66 variables the mean values were tabulated and recorded in the file tidy.txt.
The values are now the mean of the means and the mean of the standard deviations.

### Complete list of 66 variables retained in the tidy data set.

- "tBodyAccMeanX"       
- "tBodyAccMeanY"           
- "tBodyAccMeanZ"       
- "tBodyAccStdX"            
- "tBodyAccStdY"        
- "tBodyAccStdZ"            
- "tGravityAccMeanX"        
- "tGravityAccMeanY"        
- "tGravityAccMeanZ"
- "tGravityAccStdX"         
- "tGravityAccStdY"          
- "tGravityAccStdZ"         
- "tBodyAccJerkMeanX"        
- "tBodyAccJerkMeanY"       
- "tBodyAccJerkMeanZ"        
- "tBodyAccJerkStdX"        
- "tBodyAccJerkStdY"         
- "tBodyAccJerkStdZ"        
- "tBodyGyroMeanX"           
- "tBodyGyroMeanY"          
- "tBodyGyroMeanZ"           
- "tBodyGyroStdX"           
- "tBodyGyroStdY"
- "tBodyGyroStdZ"           
- "tBodyGyroJerkMeanX"       
- "tBodyGyroJerkMeanY"      
- "tBodyGyroJerkMeanZ"       
- "tBodyGyroJerkStdX"       
- "tBodyGyroJerkStdY"        
- "tBodyGyroJerkStdZ"       
- "tBodyAccMagMean"          
- "tBodyAccMagStd"          
- "tGravityAccMagMean"       
- "tGravityAccMagStd"       
- "tBodyAccJerkMagMean"      
- "tBodyAccJerkMagStd"      
- "tBodyGyroMagMean"         
- "tBodyGyroMagStd"         
- "tBodyGyroJerkMagMean"     
- "tBodyGyroJerkMagStd"     
- "fBodyAccMeanX"            
- "fBodyAccMeanY"           
- "fBodyAccMeanZ"            
- "fBodyAccStdX"            
- "fBodyAccStdY"             
- "fBodyAccStdZ"            
- "fBodyAccJerkMeanX"        
- "fBodyAccJerkMeanY"       
- "fBodyAccJerkMeanZ"        
- "fBodyAccJerkStdX"        
- "fBodyAccJerkStdY"         
- "fBodyAccJerkStdZ"        
- "fBodyGyroMeanX"           
- "fBodyGyroMeanY"          
- "fBodyGyroMeanZ"           
- "fBodyGyroStdX"           
- "fBodyGyroStdY"            
- "fBodyGyroStdZ"           
- "fBodyAccMagMean"          
- "fBodyAccMagStd"          
- "fBodyBodyAccJerkMagMean"  
- "fBodyBodyAccJerkMagStd"  
- "fBodyBodyGyroMagMean"     
- "fBodyBodyGyroMagStd"     
- "fBodyBodyGyroJerkMagMean"  
- "fBodyBodyGyroJerkMagStd" 
