---
title: "README, Getting and Cleaning Data Course Project"
author: "Meryem Sah"
date: "Sunday, December 21, 2014"
output: html_document
---

### Information about the Data

The values shown are mean calculations on a selected set of variables from the Human Activity Recognition Using Smartphones Dataset Version 1.0.

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The original data are accelerometer and gyroscope data, captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. This data was collected for 30 test subjects during 6 different possible activities.

From the original data a subset of mean and standard deviation values were chosen for all subjects and activities. The mean was subsequently calculated on the subset and grouped by subject and activity.

The run_analysis script outputs a tab delimited text file that transforms the original data into the selected tidy one. The unzipped data files from the original study must be inside the local folder.


###Files

- `CodeBook.md` describes the variables, the data, and any transformations or work that was performed to clean up the data

- `run_analysis.R` contains all the code to perform the analyses 
