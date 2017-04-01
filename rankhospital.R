#This function "rankhospital" takes state of the hospital, field of casuality, and rank as an input argument and 
# generates three kinds of output depending on input
#1. Checks whether state,casuality or rank is feasible as per the existing csv data base
#2. If yes, displays the hospital which has the required rank in the particular state
#3. In case of tie, it displays the name that comes first by alphabetical order


rankhospital=function(state, outcome, num="best")
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
    prime_dataset2=subset(prime_dataset1,prime_dataset1$State==state)
    num_check=ncol(prime_dataset2)
    
    (if (num == "best") { final_num=1}
    else if (num =="worst") {final_num=nrow(prime_dataset2)}
    else {final_num = num})
    
    if (final_num>num_check) 
       {
       print("num provided is greater than number of hospitals in the given state") 
       break
       }
          if(outcome=="heart attack") 
          { 
           final1=subset(prime_dataset1,prime_dataset1$State==state & !is.na(prime_dataset1[,11]))
           sort_final1=final1[order(final1[,11],final1[,2]),]
           if (num == "worst") {final_num =nrow(sort_final1)}
           final3=sort_final1[final_num,2]
          }
         else if(outcome=="heart failure") 
         {
           final1=subset(prime_dataset1,prime_dataset1$State==state & !is.na(prime_dataset1[,17]))
           sort_final1=final1[order(final1[,17],final1[,2]),]
           if (num == "worst") {final_num =nrow(sort_final1)}
           final3=sort_final1[final_num,2]
         }
         else if(outcome=="pneumonia") 
         {
           if (final_num ==nrow(prime_dataset2)) 
           {final_num =nrow(subset(prime_dataset2,!is.na(prime_dataset1[,23])))} 
           
           final1=subset(prime_dataset1,prime_dataset1$State==state & !is.na(prime_dataset1[,23]))
            sort_final1=final1[order(final1[,23],final1[,2]),]
            if (num == "worst") {final_num =nrow(sort_final1)}
           final3=sort_final1[final_num,2]
         }
  }
 final3
}