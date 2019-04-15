---
title: "CodeBook"
author: "Sandeep Nandal"
date: "15/04/2019"
output: pdf_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

### R Markdown - It describes the variables, the data and any transformations work that have been performed to clean up the data.

### Data Source
Data Source:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Website - from which data obtained
Website - from which data obtained
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### The run_analysis.R script performs the following steps to clean the data:

- i.  **Reading training data**
Store data into trainData, trainLabel and trainSubject by reading X_train.txt, y_train.txt and subject_train.txt data files from train data set folder respectively

- i.  **Reading test data**
Store data into testData, testLabel and testSubject by reading X_test.txt, y_test.txt and subject_test.txt data files from test data set folder respectively

- iii.	**Concatenate test dataset to training dataset**
Concatenate trainData, trainLabel and trainSubject to testData, testLabel and testSubject to generate joinData, joinLabel and joinSubject respectively

- iv. **Read the features file**
Read the features.txt file data to features data object

- v. **Clean the activity names**
Clean the activity names in the second column of activity.

- vii. **Tranform the values of joinLabel**

- ix. **Combine the joinSubject, joinLabel ad joinData**

- x. **write tidy dataset**
Write clean data to "merged_data.txt"

- xi. **Generate independent tidy data set for mean of each measurements**
Generate data for mean of each measurements

- xii. **Write the result to "data_with_means.txt"
Write the result to "data_with_means.txt"



