best <- function(state, outcome) {
  # Read outcome data
  data <- read.csv("outcome-of-care-measures.csv")
  
  # Check that state and outcome are valid
  states <- levels(data[, 7])[data[, 7]]
  state_flag <- FALSE
  for (i in 1:length(states)) {
    if (state == states[i]) {
      state_flag <- TRUE
    }
  }
  if (!state_flag) {
    stop ("invalid state")
  } 
  if (!((outcome == "heart attack") | (outcome == "heart failure")
        | (outcome == "pneumonia"))) {
    stop ("invalid outcome")
  }
  
  # Return hospital name in that state with lowest 30-day death rate
  col <- if (outcome == "heart attack") {
    11
  } else if (outcome == "heart failure") {
    17
  } else {
    23
  }
  #removes NA values
  data[, col] <- suppressWarnings(as.numeric(levels(data[, col])[data[, col]]))
  #sets hospital names to characters
  data[, 2] <- as.character(data[, 2])
  #finds the states
  statedata <- data[grep(state, data$State), ]
  #orders the states by the 30-day death rate first then the hospital name
  orderdata <- statedata[order(statedata[, col], statedata[, 2], na.last = NA), ]
  #returns the first row
  orderdata[1, 2]
}
