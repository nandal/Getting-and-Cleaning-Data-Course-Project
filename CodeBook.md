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
Concatenate testData to trainData to generate a 10299x561 data frame, joinData; concatenate testLabel totrainLabel to generate a 10299x1 data frame, joinLabel; concatenate testSubject to trainSubject to generate a 10299x1 data frame, joinSubject.


