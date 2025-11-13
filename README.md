---
title: "Group Project ReadMe"
author: "Robert Janish Jr."
date: "`r Sys.Date()`"
output: html_document
---

## R Markdown

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.


This file should explain how scripts run and how they are connected and any other relevant details pertaining to the project.

	Project Title: 
		Group Project: Data Cleaning and Tidy Data Preparation

	Dataset: 
		Human Activity Recognition Using Smartphones

	Objective: 
		The purpose of this project is to demonstrate the ability to collect, work with, and clean a dataset. The goal is to prepare tidy data that can be used for any further analysis.

	Files:
1.	Codebook.md includes the following:
			-Data Overview
			-Variable Description
			-Missing Data Handling 				
			-Data Processing
			-Code Instructions
			-Analysis Description

2.	GroupWork.R is the script used to process this data information, which can also be found in the GroupWork repository on GitHub. 

3.	The Final_Tidy_Data file was created by summarizing Tidy_Data, grouped by subject and activity and summarizing each column and calculating the mean of each variable.

4.  Final_Tidy_Data.txt is our independent file with the average of each variable for each subject and activity

	Libraries and packages required to run code:
		Library(Dplyr)
		Library(data.table)	
