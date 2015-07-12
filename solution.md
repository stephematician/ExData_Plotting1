## Exploratory Data Analysis Course Project 1

### Data

Data is downloaded and unzipped into the ./data subdirectory via the R script
CP1_data_extract.R

CP1_data_extract.R generates a data file which contains only two days of data,
from 01/02/2007 until 02/02/2007, as per the assignment. It converts the date
into the standard date format using as.Date()

### Generate plots

After running the extraction script, the plots are generated by 
plot1.R, plot2.R, plot3.R and plot4.R

This process is wrapped together in the bash script 'generate_all', which should
be called from the location of plot1.R, plot2.R, ...