# Tidy Data Project
Coursera's Final Project (Getting &amp; Cleaning Data)

The R script presented in this repo reshapes data collected from recolected by Samsung Galaxy S accelerometers. It combines test and train data into an organized data frame. The second data frame created in this script shows how can one apply an operation to the organized data. The details of how the script works are enlisted below:

1. The run_analysis.R script first loads the library "dplyr".

2. All the data should be saved in a file called "SamsungData" so it can be read into R. 

3. The script reads the subject, activity and features data from the test and train files. All are stored in different variables. All this "read" is done using the "read.table()" function. Some of the column names are modified using the function mentioned.

4. After all the data is read, the reshaping starts. First, the features column names are replaced with the complete variable name. This is done using the colnames() function and assigning the data stored in the features_names variable.

5. All the train and test data are merged into two separate data frames. The first two columns of each mentioned data frame are the Subject's label and Activity's label (initially) respectively. All the other columns correspond to the features data. All of this binding is done bind_cols function. 

6. The train and test dataframes are merged together by rows and the Activity's labels are replaced by each corresponding activity. This is done using the bind_rows function with the dataframes created in step 5.

7. Using an indexing method activity labels are replaced with activity names.

8. Using the function str_replace_all the "t" and "f" variables are replaced with "Time" and "Frequency" to be a bit more descriptive.

8. The merged data (now called tidy_data1) is arranged by subject (ascending from 1).  This is done using the arrange() function.

9. Finally, the dataframe is grouped by subject and activity in order to apply the mean operation to each column and obtaining the second and last dataframe (tidy_data2). This is done by using piping (%>%) and the functions group_by() and summarise_each() and then applying the mean() function.

10. In the end, every other variable used (aside from tidy_data1, tidy_data2) is removed from R's enviroment.

Any recommendation on how this could be done more efficiently (or how can I improve the readme file) would be appreciated.
