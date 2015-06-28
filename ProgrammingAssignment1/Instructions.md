# Data

The zip file contains 332 comma-separated-value (CSV) files containing pollution monitoring data for fine particulate matter (PM) air pollution at 332 locations in the United States. Each file contains data from a single monitor and the ID number for each monitor is contained in the file name. For example, data for monitor 200 is contained in the file "200.csv". Each file contains three variables: 

* Date: the date of the observation in YYYY-MM-DD format (year-month-day)
* sulfate: the level of sulfate PM in the air on that date (measured in micrograms per cubic meter)
* nitrate: the level of nitrate PM in the air on that date (measured in micrograms per cubic meter)

## Part 1

Write a function named 'pollutantmean' that calculates the mean of a pollutant (sulfate or nitrate) across a specified list of monitors. The function 'pollutantmean' takes three arguments: 'directory', 'pollutant', and 'id'. Given a vector monitor ID numbers, 'pollutantmean' reads that monitors' particulate matter data from the directory specified in the 'directory' argument and returns the mean of the pollutant across all of the monitors, ignoring any missing values coded as NA.

**Example outputs**

	source("pollutantmean.R")
	pollutantmean("specdata", "sulfate", 1:10)
	## [1] 4.064 

	pollutantmean("specdata", "nitrate", 70:72)
	## [1] 1.706 

	pollutantmean("specdata", "nitrate", 23)
	## [1] 1.281 

## Part 2 

Write a function that reads a directory full of files and reports the number of completely observed cases in each data file. The function should return a data frame where the first column is the name of the file and the second column is the number of complete cases.

**Example outputs**

	source("complete.R")
	complete("specdata", 1)
	##   id nobs
	## 1  1  117

	complete("specdata", c(2, 4, 8, 10, 12))
	##   id nobs
	## 1  2 1041
	## 2  4  474
	## 3  8  192
	## 4 10  148
	## 5 12   96

	complete("specdata", 30:25)
	##   id nobs
	## 1 30  932
	## 2 29  711
	## 3 28  475
	## 4 27  338
	## 5 26  586
	## 6 25  463

	complete("specdata", 3)
	##   id nobs
	## 1  3  243
