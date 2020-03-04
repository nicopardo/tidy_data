---
title: "Codebook"
author: "nicopardo"
date: "4 3 2020"
output: html_document
---


```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```
## Description

This section explains how the script "run_analysis.R" works.

First it downloads the .zip file and unzips it. It then reads the relevant files into r. Next it merges the files to create the id and activity names for the training and test set. Then it merges both datasets into one as required in the instructions.

The script then selects only the variables containing the mean and standard deviations, and then changes the names of the variables, so that they are readable and understandable.

Finally it creates a new dataset with the average of each variable for each activity and each subject, and saves that dataset to a .txt file.


## Codebook


here is the Codebook for the varibles, also available in the separate file "Codebook.md". Each variables contains the average of each variable for each activity and each subject. Here is some additional information about the variables.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals time_accelerometer-XYZ and time_gyroscope-XYZ. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (time_bodyaccelerometer-XYZ and time_gravityaccelerometer-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (time_bodyaccelerometer_jerk-XYZ and time_bodygyroscope_jerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (time_bodyaccelerometereuclidean, time_gravityaccelerometereuclidean, time_bodyaccelerometerjerkeuclidean, time_bodygyroscopeeuclidean, time_bodygyroscopejerkeuclidean). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing frequencz_bodyaccelerometer-XYZ with its corresponding variations, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

here is the list of the variables

[1] "id"                                                     
 [2] "activity"                                               
 [3] "time_bodyaccelerometer_average_X"                       
 [4] "time_bodyaccelerometer_average_X.1"                     
 [5] "time_bodyaccelerometer_average_Y"                       
 [6] "time_bodyaccelerometer_average_Z"                       
 [7] "time_bodyaccelerometer_stdev_X"                         
 [8] "time_bodyaccelerometer_stdev_Y"                         
 [9] "time_bodyaccelerometer_stdev_Z"                         
[10] "time_gravityaccelerometer_average_X"                    
[11] "time_gravityaccelerometer_average_Y"                    
[12] "time_gravityaccelerometer_average_Z"                    
[13] "time_gravityaccelerometer_stdev_X"                      
[14] "time_gravityaccelerometer_stdev_Y"                      
[15] "time_gravityaccelerometer_stdev_Z"                      
[16] "time_bodyaccelerometer_jerk_average_X"                  
[17] "time_bodyaccelerometer_jerk_average_Y"                  
[18] "time_bodyaccelerometer_jerk_average_Z"                  
[19] "time_bodyaccelerometer_jerk_stdev_X"                    
[20] "time_bodyaccelerometer_jerk_stdev_Y"                    
[21] "time_bodyaccelerometer_jerk_stdev_Z"                    
[22] "time_bodygyroscope_average_X"                           
[23] "time_bodygyroscope_average_Y"                           
[24] "time_bodygyroscope_average_Z"                           
[25] "time_bodygyroscope_stdev_X"                             
[26] "time_bodygyroscope_stdev_Y"                             
[27] "time_bodygyroscope_stdev_Z"                             
[28] "time_bodygyroscope_jerk_average_X"                      
[29] "time_bodygyroscope_jerk_average_Y"                      
[30] "time_bodygyroscope_jerk_average_Z"                      
[31] "time_bodygyroscope_jerk_stdev_X"                        
[32] "time_bodygyroscope_jerk_stdev_Y"                        
[33] "time_bodygyroscope_jerk_stdev_Z"                        
[34] "time_bodyaccelerometereuclidean_average.."              
[35] "time_bodyaccelerometereuclidean_stdev.."                
[36] "time_gravityaccelerometereuclidean_average.."           
[37] "time_gravityaccelerometereuclidean_stdev.."             
[38] "time_bodyaccelerometer_jerkeuclidean_average.."         
[39] "time_bodyaccelerometer_jerkeuclidean_stdev.."           
[40] "time_bodygyroscopeeuclidean_average.."                  
[41] "time_bodygyroscopeeuclidean_stdev.."                    
[42] "time_bodygyroscope_jerkeuclidean_average.."             
[43] "time_bodygyroscope_jerkeuclidean_stdev.."               
[44] "frequency_bodyaccelerometer_average_X"                  
[45] "frequency_bodyaccelerometer_average_Y"                  
[46] "frequency_bodyaccelerometer_average_Z"                  
[47] "frequency_bodyaccelerometer_stdev_X"                    
[48] "frequency_bodyaccelerometer_stdev_Y"                    
[49] "frequency_bodyaccelerometer_stdev_Z"                    
[50] "frequency_bodyaccelerometer_jerk_average_X"             
[51] "frequency_bodyaccelerometer_jerk_average_Y"             
[52] "frequency_bodyaccelerometer_jerk_average_Z"             
[53] "frequency_bodyaccelerometer_jerk_stdev_X"               
[54] "frequency_bodyaccelerometer_jerk_stdev_Y"               
[55] "frequency_bodyaccelerometer_jerk_stdev_Z"               
[56] "frequency_bodygyroscope_average_X"                      
[57] "frequency_bodygyroscope_average_Y"                      
[58] "frequency_bodygyroscope_average_Z"                      
[59] "frequency_bodygyroscope_stdev_X"                        
[60] "frequency_bodygyroscope_stdev_Y"                        
[61] "frequency_bodygyroscope_stdev_Z"                        
[62] "frequency_bodyaccelerometereuclidean_average.."         
[63] "frequency_bodyaccelerometereuclidean_stdev.."           
[64] "frequency_bodybodyaccelerometer_jerkeuclidean_average.."
[65] "frequency_bodybodyaccelerometer_jerkeuclidean_stdev.."  
[66] "frequency_bodybodygyroscopeeuclidean_average.."         
[67] "frequency_bodybodygyroscopeeuclidean_stdev.."           
[68] "frequency_bodybodygyroscope_jerkeuclidean_average.."    
[69] "frequency_bodybodygyroscope_jerkeuclidean_stdev.."      





