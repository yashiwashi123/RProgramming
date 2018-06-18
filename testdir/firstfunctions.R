#myfristRfunctions

add2 <- function(x, y) {
  x + y
}
#in any r fuction it returns what the last expersion was

above10 <- function(x) {
  #create a logical vector with all  elements of x >10
  use <- x > 10
  #subset x with 'use' to return x with all elements greater than 10
  x[use]
}

above <- function(x, n = 10) {
  use <- x > n
  x[use]
}

columnmean <- function(x, removeNA = TRUE) {
  #hold number of columns
  nc <- ncol(x)
  #create numeric vector with the length of the columns
  means <- numeric(nc)
  #loop over each column
  for(i in 1:nc) {
    #get the mean of each column with the mean() function and set na.rm to true to remove missing data
    means[i] <- mean(x[,i], na.rm = removeNA)
  }
  #returns means vector
  means
}