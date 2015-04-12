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

##Plotting Third Graph onto the PNG Device
     #change Date to Date Format
     testData[,"Date"]<-as.Date(testData$Date,"%d/%m/%Y")
     ## Add an additional Date Time Field
     library(lubridate)
     testData$datetime<-as.POSIXct(paste(testData$Date,testData$Time))
     
     png(file = "./plot3.png")
     ylower=min(testData$Sub_metering_1,
                testData$Sub_metering_2,
                testData$Sub_metering_3)
     yupper =max(testData$Sub_metering_1,
                 testData$Sub_metering_2,
                 testData$Sub_metering_3)
     with(testData,plot(datetime,Sub_metering_1,ylim =c(as.numeric(ylower),
                                                       1.1*as.numeric(yupper)),
                        col="magenta",ylab="Energy sub Metering",
                        xlab="",type='l'))
     with(testData,points(datetime,Sub_metering_2,type='l',col='red'))
     with(testData,points(datetime,Sub_metering_3,type='l',col='blue'))
     legend("topright", lty=c("solid","solid","solid"), 
       col = c("magenta", "red","blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2",
                  "Sub_metering_3"))
     dev.off()
