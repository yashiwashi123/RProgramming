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
  
  
  result <- data.frame(id = numeric(0), nobs = numeric(0))
  
  for (i in id){
    path <- paste(getwd(), "/", directory, "/", sprintf("%03d", i), ".csv", sep = "")
    data <- read.csv(path)
    #data <-read.csv (file.paths[i], header = TRUE)
    good.data <- data[(!is.na(data$nitrate)), ]
    good.data <- data[(!is.na(data$sulfate)), ]
    nobs <-nrow(good.data)
    result <- rbind(result, data.frame(id = i, nobs = nobs))
    
  }
  result
}

corr <- function(directory, threshold = 0){

  cor_results <- numeric(0)
  complete_cases <- complete(directory)
  complete_cases <- complete_cases[complete_cases$nobs >= threshold, ]

  if(nrow(complete_cases)>0){
    for(monitor in complete_cases$id){
      path <- paste(getwd(), "/", directory, "/", sprintf("%03d", monitor), ".csv", sep = "")
      #print(path)
      data <- read.csv(path)
      #print(monitor_data)
      good_data <- data[(!is.na(data$sulfate)), ]
      good_data <- good_data[(!is.na(good_data$nitrate)), ]
      sulfate_data <- good_data["sulfate"]
      nitrate_data <- good_data["nitrate"]
      cor_results <- c(cor_results, cor(sulfate_data, nitrate_data))
    }
  }
  cor_results
}