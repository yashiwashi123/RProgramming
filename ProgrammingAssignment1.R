pollutantmean <- function(directory, pollutant = "nitrate", id = 1:332){
  if(grep("specdata",directory) ==1) 
  {
    directory <- ("./specdata/")
  }
  file.list <- as.character(list.files(directory))
  file.paths <-paste(directory, file.list, sep = "")
  
  means.list <- c()
  for (i in id){
    data<- read.csv(file.paths[i], header = TRUE)
    #do the mean calculation
    remove.na <- data[!is.na(data[ ,pollutant]), pollutant]
    means.list <- c(means.list, remove.na)
   }
  mean.answer <-mean(means.list)
  mean.answer
}

complete <- function(directory, id = 1:332){
  if(grep("specdata", directory) == 1){
    directory <- ("./specdata/")
  }
  file.list <- as.character(list.files(directory))
  file.paths <- paste (directory, file.list, sep ="")
  result <- data.frame(id = numeric(0), nobs = numeric(0))
  
  for (i in id){
    data <-read.csv (file.paths[i], header = TRUE)
    good.data <- data[(!is.na(data$nitrate)), ]
    good.data <- data[(!is.na(data$sulfate)), ]
    nobs <-nrow(good.data)
    result <- rbind(result, data.frame(id = i, nobs = nobs))
    
  }
  result
}

corr <- function(directory, threshold =0) {
  if(grep("specdata", directory) == 1){
    directory <- ("./specdata/")
  }
  corralations <- numeric(0)
  completed <- complete(directory)
  completed <- completed[completed$nobs > threshold, ]
  file.list <- as.character(list.files(directory))
  file.path <- paste(directory, file.list, sep ="")
  
  if (nrow(completed)> 0) {
    for(i in completed$id){
      data <- read.csv(file.path[i])
      data <- na.omit(data)
      sulfate.data <- data["sulfate"]
      nitrate.data <- data ["nitrate"]
      corralations <- c(corralations, cor(sulfate.data, nitrate.data))
    }
  }else {return("no completely observed cases above threshhold")}
  corralations
}