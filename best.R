#This function "best" takes state of the hospital and field of casuality as an input argument and 
# generates three kinds of output depending on input
#1. Checks whether state or casuality exists in the csv data base
#2. If yes, displays the hospital which has the highest casuality in the particular state
#3. In case of tie, it displays the name that comes first by alphabetical order


best=function(state, outcome)
{
  prime_dataset1=read.csv("outcome-of-care-measures.csv", colClasses = "character")
  prime_dataset1[,11]=as.numeric(prime_dataset1[,11])
  prime_dataset1[,17]=as.numeric(prime_dataset1[,17])
  prime_dataset1[,23]=as.numeric(prime_dataset1[,23])
  states_vector=unique(prime_dataset1[,7])
  if_state_exists =match(state,states_vector)
  
  outcome_vector= c('heart attack','heart failure','pneumonia')
  if_outcome_exists=match(outcome,outcome_vector)
  
  if (is.na(if_state_exists))
  {
    print("invalid state")
    break
  }
  
  else if (is.na(if_outcome_exists))
  {
    print("invalid outcome")
    break
  }
  else 
  {
    if(outcome=="heart attack") 
      {
      final1=subset(prime_dataset1,prime_dataset1$State==state & !is.na(prime_dataset1[,11]))
      x1=as.numeric(final1[,11])
        final2= which(x1 == min(x1))
      final3=sort(final1[final2,2])
      }
    else if(outcome=="heart failure") 
      {
       final1=subset(prime_dataset1,prime_dataset1$State==state & !is.na(prime_dataset1[,17]))
       x1=as.numeric(final1[,17])
       final2= which(x1 == min(x1))
       final3=sort(final1[final2,2])
      }
    else if(outcome=="pneumonia") 
      {
        final1=subset(prime_dataset1,prime_dataset1$State==state & !is.na(prime_dataset1[,23]))
        x1=as.numeric(final1[,23])
        final2= which(x1 == min(x1))
        final3=sort(final1[final2,2])
      }
  }
  final3[1]
}