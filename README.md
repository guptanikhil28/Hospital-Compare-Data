# Hospital-Compare-Data
This repository consists of functional analysis about the quality of care at over 4,000 Medicare-certified hospitals in the U.S


-Function Hist.R reads the outcome-of-care-measures.csv, and generates a histogram of heart attack of mortality rates due to heart attack in the entire set of hospitals of US

-Function Best.R reads the outcome-of-care-measures.csv, while taking state of the hospital and field of casuality as an input argument & 
generates three kinds of output depending on input-
 
#1. Checks whether state or casuality exists in the csv data base
#2. If yes, displays the hospital which has the highest casuality in the particular state
#3. In case of tie, it displays the name that comes first by alphabetical order
