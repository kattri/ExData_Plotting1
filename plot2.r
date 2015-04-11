################################################################################
# Exploratory Data Analysis
# April 2015
# Using the data found here 
#https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_
##consumption.zip 
# The function plot1.r does the following. 
# 1. Extracts Data regarding Global Consumption of Power for the 1st and Second 
##February 2007
# 2. Plot the Daily Consumption as a Histogram
# 3. Appropriately labels the data set with descriptive variable names.
# 4.  Save the plot as PNG format file as PNG file plot1.png
# 5.
#################################################################################
     setwd("~/data-science/ExData_Plotting1")
##   download and unzip datasets
     
     fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
     
     download.file(fileUrl, destfile ="./dataset.zip")
     unzip("./dataset.zip")
     
     # Get DATA
     testData <- read.table("./household_power_consumption.txt",
                            header=TRUE,stringsAsFactors=FALSE,sep=";")                       
##   Limit Data to the Dates of Interest
     testData<-testData[testData$Date =="1/2/2007"|testData$Date =="2/2/2007",]
##Plotting Second Graph
##change Date to Date Format
     testData[,"Date"]<-as.Date(testData$Date,"%d/%m/%Y")
## Add an additional Date Time Field
     library(lubridate)
     testData$datetime<-as.POSIXct(paste(testData$Date,testData$Time))
##Line plot for the Active Power 
     with(testData,plot(datetime,Global_active_power, xlab=" ",
                   ylab="Global Active Power(kilowatts)",
                   type ="l"))
##Save Graph to plot2.png
          dev.copy(png, file = "./plot2.png")
          dev.off()
