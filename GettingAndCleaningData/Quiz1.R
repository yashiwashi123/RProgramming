## QUESTION 1
##The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:
  ## https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv
##and load the data into R. The code book, describing the variable names is here:
  ##  https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf
##How many properties are worth $1,000,000 or more?
  
  
## Solution ##
## you need the data.table package for this solution to work
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", "americancommunitysurvey.csv", method = "curl")
data <-read.csv(americancommunitysurvey.csv)
# puts the data into a data.table
DT <- data.table(data)
# subsets the data table using .N (the built in variable for number of instances) by VAL == 24, or,
# in plain english, when the property value is greater than 1,000,000
#this results in a table in which when VAL == TRUE, the cooresponding N value is 53
DT[, .N, by=VAL==24]

## QUESTION 3 ##
##Download the Excel spreadsheet on Natural Gas Aquisition Program here:
  ## https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx
##Read rows 18-23 and columns 7-15 into R and assign the result to a variable called: dat
##What is the value of: sum(dat$ZIP*dat$EXT, na.rm=T) ? 

## Solution ## 
##you need the xlsx package for this solution to work
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileURL, "NGAP.xlsx", method ="curl")
colIndex <- 7:15
rowIndex <- 18:23
#assign the colIndex and rowIndex params in read.xlsx to get desired rows and columns
dat<- read.xlsx("NGAP.xlsx", sheetIndex = 1, colIndex = colIndex, rowIndex = rowIndex)

## QUESTION 4 ## 
## Read the XML data on Baltimore restaurants from here:
   ## https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml
## How many restaurants have zipcode 21231?

## Solution ## 
## you need the XML package to run this
fileXML <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
#set useInternal to TRUE so you can use xpath 
doc <- xmlTreeParse(fileXML,useInternal = TRUE)
#set root node
rootNoe <- xmlRoot(doc)
#gets the sum of the zipcode values that are equal to 21231
sum(xpathSApply(xmlRoot, "//zipcode", xmlValue)== '21231')

## QUESTION 5## 
#The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv
#Using the fread() command load the data into an R object DT
#The following are ways to calculate the average value of the variable pwgtp15
#broken down by sex. Using the data.table package, which will deliver the fastest user time?
    #mean(DTpwgtp15,by=DTSEX)
    #mean(DT[DTSEX==1,]pwgtp15);mean(DT[DTSEX==2,]pwgtp15)
    #tapply(DTpwgtp15,DTSEX,mean)
    #DT[,mean(pwgtp15),by=SEX]
    #sapply(split(DTpwgtp15,DTSEX),mean)
    #rowMeans(DT)[DTSEX==1]; rowMeans(DT)[DT$SEX==2]$

## Solution ##
# you need the microbenchmark package to run this
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", "ACS.csv", method = "curl")
# csv means it's comma separated
DT <- fread("ACS.csv", sep = ",")
# test the speeds of each function 100 times
mbm = microbenchmark(
  v1 = mean(DTpwgtp15,by=DTSEX)
  v2 = mean(DT[DTSEX==1,]pwgtp15);mean(DT[DTSEX==2,]pwgtp15),
  v3 = tapply(DT$pwgtp15,DT$SEX,mean),
  v4 = DT[,mean(pwgtp15),by=SEX],
  v5 = sapply(split(DTpwgtp15,DTSEX),mean),
  v6 = rowMeans(DT)[DTSEX==1]; rowMeans(DT)[DT$SEX==2]$,
  times=100
)
mbm

