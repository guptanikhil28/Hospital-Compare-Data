
#This function reads a file and generates a historgram for the particular column


histogram=function(){
  dataset1=read.csv("outcome-of-care-measures.csv", colClasses = "character")
  dataset1[, 11] = as.numeric(dataset1[, 11])
  hist(dataset1[,11])
}