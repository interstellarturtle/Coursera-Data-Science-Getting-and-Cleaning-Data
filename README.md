# Coursera Data Science Specialization: Getting and Cleaning Data
This is a project submitted for the Getting and Cleaning Data course on Coursera. The aim of this project is to to collect, work with, and clean a data set. The analysed data set is taken from the UCI Machine Learning Repository and its full description can be read here: [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). The data set can be found here: [
Smartphone-Based Recognition of Human Activities and Postural Transitions Data Set](http://archive.ics.uci.edu/ml/datasets/Smartphone-Based+Recognition+of+Human+Activities+and+Postural+Transitions).

## Files in this repository
* [run_analysis.R](https://github.com/interstellarturtle/Coursera-Data-Science-Getting-and-Cleaning-Data/blob/master/run_analysis.R) is an R script that:
   * reads the data
   * merges it into one single data set
   * subsets the data set to extract only the means and standard deviations for each measurement
   * modifies the description of activites in the data set from IDs to descriptive names
   * labels the data set with descriptive variable names
   * creates a second, independent tidy data set with the average of each variable for each activity and each subject
* [TidyData.txt](https://github.com/interstellarturtle/Coursera-Data-Science-Getting-and-Cleaning-Data/blob/master/TidyData.txt) is the final output of the process described above.
* [Code-Book.pdf](https://github.com/interstellarturtle/Coursera-Data-Science-Getting-and-Cleaning-Data/blob/master/Code-Book.pdf) is a document written with R Markdown, processed and generated as a PDF file.
