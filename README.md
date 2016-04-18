# Getting-Cleaning-Final-Project
Here you will find the script and additional info for Final Project - Getting and cleaning Cousera 
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

Second file "Summary_HAR_subject.txt" includes the following data:
=====================================
-Subject (from 1 to 30)
-Mean for MeanX,MeanY and MeanZ
-Mean for StdX,StdY,StdZ

Third file "Summary_HAR_activity.txt" includes the following data:
=====================================
-Activity (WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING & LAYING)
-Mean for MeanX,MeanY and MeanZ
-Mean for StdX,StdY,StdZ

The dataset includes the following files:
=========================================

- 'README.txt'
-  "Codebook_data_mean_std_XYZ.txt" 
- "HAR_data_mean_std_XYZ.txt" 
- "Summary_HAR_subject.txt" 
- "Summary_HAR_activity.txt"
-  R script "run_analysis.R"

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.



License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
