Human Activity Recognition Using Smartphones - Data cleansing
==============================================================
Author: Marwan Ismael  
Created: 14-10-2015  
Version: 1.0  



Input Data Definitions:
=========================================

### [/test/x_test.txt] and [train/x_train.txt]:

        The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
        
        Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
        
        Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
        
        These signals were used to estimate variables of the feature vector for each pattern:  
        '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
        
        tBodyAcc-XYZ
        tGravityAcc-XYZ
        tBodyAccJerk-XYZ
        tBodyGyro-XYZ
        tBodyGyroJerk-XYZ
        tBodyAccMag
        tGravityAccMag
        tBodyAccJerkMag
        tBodyGyroMag
        tBodyGyroJerkMag
        fBodyAcc-XYZ
        fBodyAccJerk-XYZ
        fBodyGyro-XYZ
        fBodyAccMag
        fBodyAccJerkMag
        fBodyGyroMag
        fBodyGyroJerkMag
        
        The set of variables that were estimated from these signals are: 
        
        mean(): Mean value
        std(): Standard deviation
        mad(): Median absolute deviation 
        max(): Largest value in array
        min(): Smallest value in array
        sma(): Signal magnitude area
        energy(): Energy measure. Sum of the squares divided by the number of values. 
        iqr(): Interquartile range 
        entropy(): Signal entropy
        arCoeff(): Autorregresion coefficients with Burg order equal to 4
        correlation(): correlation coefficient between two signals
        maxInds(): index of the frequency component with largest magnitude
        meanFreq(): Weighted average of the frequency components to obtain a mean frequency
        skewness(): skewness of the frequency domain signal 
        kurtosis(): kurtosis of the frequency domain signal 
        bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
        angle(): Angle between to vectors.
        
        Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
        
        gravityMean
        tBodyAccMean
        tBodyAccJerkMean
        tBodyGyroMean
        tBodyGyroJerkMean
        
        The complete list of variables of each feature vector is available in '/features.txt'

### [/test/subject_test.txt] and [train/subject_train.txt]

        Data sets are lists of Subjects for both Train and Test main data sets. Data sets are having a signle variable each: 
        Subject_ID which is a numerical representation of Subjects from 1 to 30
        
### [/test/y_test.txt] and [train/y_train.txt]

        Data sets are lists of Activities for both Train and Test main data sets. Data sets are having a signle variable each: 
        Activity_ID which is a numerical representation of Activities from 1 to 6.


### [/Activity_Label.txt]

        Data set is a master list of Activity IDs and Names. Data set is having 2 variables: 
        
        - Activity_ID which is a numerical representation of activities from 1 to 6.
        - Activity_Name which is a description of the activity.



### [/features.txt]

        Data set is a list of variable names for both Train and Test data sets.


Output Data Definitions:
=========================================


### [/Data_Mean.txt]:

        Main output data as per assessment requirements. Data set is showing mean for each mean and STD variables from input data set grouped by Activity and Subject.
        Data set is having 82 variables, 79 of which are the mean and STD variables coming from main input data set. Other three variables are he associated Activity IDs & Names and Subjects IDs from the [/test/y_test.txt], [train/y_train.txt], [/test/subject_test.txt], [train/subject_train.txt] and [/Activity_Label.txt] data sets.


Transformations summary:
=========================================

The Analysis process went through following steps:

        1. Download the data zip file and unzip it into the R working directory (Manual process).
        
        2. based on instructions from Data set readme file and explanation from the assessment page, data provided are stored as following:
        
                a. Test sub data set: with three files for Subject IDs, Activities IDs and the Test data itself.
                
                b. Train sub data set: with three files for Subject IDs, Activities IDs and the Train data itself.  
                
                c. Master list of Activities with IDS and names.  
                
                d. list of measures/variables in Test & training data.  
                
        3. For both Test and Training 3 files are read into data frames.
        
        4. Reading the Feature text file. Data from Feature is used to name variables in Test and Train data sets.
        
        5. For both Training and Test, the three files are joined (cbind) as following: data_Subject_activity
        
        6. The output of step 5 are concatenated (rbind), so the test and training data are in one data set.
        
        7. mean and std measures are kept in new data set while other variables are discarded from it.
        
        8. By joining with [activity_labels.txt] the a descriptive activity names is added to the data set.
        
        9. Using the data.table pacake (installed earlier), the mean for all measure variables are calculated grouped by the Subject and
        Activity.
        
        10. Output of the process is saved in text file [Data_Mean.txt] in the Repo.

 
Packages used:
======================================
        - data.table package. 
        