Human Activity Recognition Using Smartphones - Data cleansing
==============================================================
Author: Marwan Ismael  
Created: 14-10-2015  
Version: 1.0  

Summary:
==================================================================  

This application was executed on data set downloaded from following URL (on 24-10-2015 13:21:00):
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


Purpose of application is to prepare a clean and tidy data set that can used for further analysis, using R language. The [Human Activity Recognition Using Smartphones] data which is the source data for the application is split into two sub data sets: Test and Train. each is having three files:

 - "/test/x_test" and "/train/x_train": Data sets.
 - "/test/subject_test" and "/train/subject_train": List of subjects, range from 1:30 within an age bracket of 19-48 years. 
 - "/test/y_test" and "/train/y_train": List of Activity codes range from 1:6.
 
There are 2 additional data files common between the Train and Test data sets:  
 - "/Activity_Label": master list of the activity IDs and names.  
 - "/features": list of the measures/variables in data sets.
 

Analysis steps:
==================================================================  
 
Following is a summary of steps taken in the application and description of different code chunks. Further Details can be found in CodeBook.md located in Repo main directory:

 1. Download files from given URL and unzip the file, this step is completed manually and the unzipped files are placed in R working directory.
 2. Read different files using the read.table function.
 3. Use [features.txt] to name variables in both Test and Train data sets.
 4. Merge data sets into one data set.
 5. subset only mean and STD variables from data set and omit other measures.
 6. Add activity name from [activity_labels.txt] file to main data set.
 7. Generate summary data set, as mean of all variables grouped by the activity and subject.
 8. Writing summary data set to Repo main directory as [Data_Mean.txt]
 
Each of the above mentioned steps uses the output of the previous one.


The Repo includes the following files:
=========================================

- 'README.md'

- 'Data_Mean.txt': Which is the final output of the application as per assessments requirements. Showing the mean of all mean & STD measures/variables grouped by Activity and Subject.

- 'run_analysis.R': R Code used to cleanse the data as per requirements. The code is broken into 5 main sections with proper comments.

- 'CodeBook.md': Contains a description of all variables in input/output data sets and transformations & packages used in application.


Note:
======================================
For more information on Input data set, please visit following URL:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


Environment Specifications:
======================================
Following are the details of the environment in which the application was executed to give output data:


R version 3.2.1 (2015-06-18)
Platform: x86_64-w64-mingw32/x64 (64-bit)
Running under: Windows 8 x64 (build 9200)

locale:
[1] LC_COLLATE=English_United Kingdom.1252  LC_CTYPE=English_United Kingdom.1252    LC_MONETARY=English_United Kingdom.1252
[4] LC_NUMERIC=C                            LC_TIME=English_United Kingdom.1252    

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base     

other attached packages:
[1] data.table_1.9.6

loaded via a namespace (and not attached):
[1] rsconnect_0.4.1.4 htmltools_0.2.6   tools_3.2.1       rmarkdown_0.8.1   digest_0.6.8      chron_2.3-47
