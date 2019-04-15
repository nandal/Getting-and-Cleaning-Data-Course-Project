---
title: "Getting and Cleaning Data Course Project - README"
author: "Sandeep Nandal"
date: "15/04/2019"
output: html_document
---
## README File for run_analysis.R script working  details.

## Download and unzip the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and rename the folder as "data" in the working director
Make sure the folder "data"" and the run_analysis.R script are both in the current working directory.

## Run the run_analysis.R script by using source("run_analysis.R") command in RStudio.

## merged_data.txt and data_with_means.txt files are generated in the current working directory:
merged_data.txt (7.9 Mb): it contains a data frame called cleanedData with 10299*68 dimension.
data_with_means.txt (220 Kb): it contains a data frame called result with 180*68 dimension.

## Finally, use data <- read.table("data_with_means.txt") command in RStudio to read the file. Since we are required to get the average of each variable for each activity and each subject, and there are 6 activities in total and 30 subjects in total, we have 180 rows with all combinations for each of the 66 features.