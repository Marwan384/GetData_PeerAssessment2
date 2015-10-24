# GetData_PeerAssessment2
This is the Peer Assessment # 2 for Getting and Cleaning Data Course


==================================================================  
Human Activity Recognition Using Smartphones Analysis Code 1.0  
==================================================================  
Author: Marwan Ismael  
==================================================================  

Summary:
=========================================


The Analysis process went through following steps:

1. Download the data zip file and unzip it into the R working directory.

2. based on the Data set readme file and explanation from the assessment page, data provided are stored as following:

        a. Test sub data set: with three files for Subject IDs, Activities IDs and the Test data itself.
        
        b. Train sub data set: with three files for Subject IDs, Activities IDs and the Train data itself.  
        
        c. Master list of Activities with IDS and names.  
        
        d. list of measures/variables in Test & training data.  
        
3. For both Test and Training 3 files are read into data frames.

4. Reading the Feature text file, the variables names in Test and Train data sets are named

5. For each training and Test, the three files are joined (cbind) as following: data_Subject_activity

6. The output of step 5 are concatenated (rbind), so the test and training data are in one data set.

7. mean and std measures are kept in the data set while other variables are discarded from data set.

8. By joining with [activity_labels.txt] the a descriptive activity names is added to the data set

9. Using the data.table pacake (installed earlier), the mean for all measure columns are calculated grouped by the Subject and
Activity.

10. Output of the process is saved in text file [Data_Mean.txt] in the Repo.

 

The Repo includes the following files:
=========================================

- 'README.md'

- 'Data_Mean.txt': Which is the final output of the Analysis as per assessments requirements. Showing the mean of all measures grouped by Activity and Subject

- 'run_analysis.R': R Code used to analyze the data as per requirements. The code is broken into 5 main sections.

For each record in the output dataset:
======================================
- A 561-feature vector with time and frequency domain variables.   
- Its activity label and ID.   
- An identifier of the subject who carried out the experiment.
