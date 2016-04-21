==================================================================
Human Activity Recognition Tidy Dataset
Coursera Final Project
Getting and Cleaning Data Course Project
Version 1.0
==================================================================
prepared by: Giovanny Perez
====================
Based on the data from: 

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The tidy data set annexed to this document is based on the raw data from the HAR project. 


First file "HAR_data_mean_std_XYZ.txt" includes the following data:
======================================

- Subject number (from 1 to 30)
- Activity label (belong to following activities: WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING & LAYING)
- Mean for X,Y and Z.
- Standard Deviation for X,Y and Z.

Second file "By_group_data_mean" includes the following data:
=====================================
-Subject (from 1 to 30)
-Activity (WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING & LAYING)
-Mean for all variables 

The dataset includes the following files:
=========================================

- 'README.txt'
-  "Codebook_data_mean_std_XYZ.txt" 
- "HAR_data_mean_std_XYZ.txt" 
- "By_group_data_mean.txt" 
-  R script "run_analysis.R"

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.




