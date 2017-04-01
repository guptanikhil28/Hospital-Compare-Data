#This function "rankall" takes field of casuality, and rank as an input argument and 
# generates three kinds of output depending on input
#1. Checks whether casuality or rank is feasible as per the existing csv data base
#2. If yes, displays the hospital with the mentioned rank & each state in the form of 2-column matrix 
#3. In case of tie, it displays the name that comes first by alphabetical order


rankall=function(outcome, num="best")
{
  prime_dataset1=read.csv("outcome-of-care-measures.csv", colClasses = "character")
  prime_dataset1[,11]=as.numeric(prime_dataset1[,11])
  prime_dataset1[,17]=as.numeric(prime_dataset1[,17])
  prime_dataset1[,23]=as.numeric(prime_dataset1[,23])
  states_vector=unique(prime_dataset1[,7])
  
  outcome_vector= c('heart attack','heart failure','pneumonia')
  if_outcome_exists=match(outcome,outcome_vector)

  if (is.na(if_outcome_exists))
  {
    print("invalid outcome")
    break
  }
  else 
  {
      y = split(prime_dataset1, prime_dataset1$State)
      final_list = vector("list", length = length(y))
      sort_final_list = vector("list", length = length(y))
      state_wise_ranked_hospital=vector(mode="character", length = length(y))
      state_wise_mapped_name=vector(mode="character",length = length(y))
      state_wise_ranked_score=vector(mode="numeric",length = length(y))
      if (num == "best") { final_num=1}
      else if (num =="worst") {final_num=1}
      else {final_num = num}
      
      if (!is.numeric(final_num))
      {print("Invalid Input argument")
      }  
      
      
      stopifnot(is.numeric(final_num)) 
      
      
      if(outcome=="heart attack") 
      { 
         for (i in 1: length(y))
             {
             final_list[[i]]=subset(y[[i]],!is.na(y[[i]][,11]))
             sort_final_list[[i]]= final_list[[i]][order(final_list[[i]][,11],final_list[[i]][,2]),]
             if (num == "worst") {final_num = nrow(sort_final_list[[i]])}
             
             if (final_num >nrow(sort_final_list[[i]])){state_wise_ranked_hospital[i]=NA}
             else {state_wise_ranked_hospital[i]=sort_final_list[[i]][final_num,2]
             state_wise_ranked_score[i]=sort_final_list[[i]][final_num,11]}
             
             state_wise_mapped_name[i]=sort_final_list[[i]][final_num,7]
             
           
             }
    
     final_output_matrix=rbind(state_wise_ranked_hospital,state_wise_mapped_name, state_wise_ranked_score) 
      }
      
      else if(outcome=="heart failure") 
      { 
        for (i in 1: length(y))
        {
          final_list[[i]]=subset(y[[i]],!is.na(y[[i]][,17]))
          sort_final_list[[i]]= final_list[[i]][order(final_list[[i]][,17],final_list[[i]][,2]),]
          if (num == "worst") {final_num = nrow(sort_final_list[[i]])}
          
          if (final_num >nrow(sort_final_list[[i]])){state_wise_ranked_hospital[i]=NA}
          else {state_wise_ranked_hospital[i]=sort_final_list[[i]][final_num,2]
          state_wise_ranked_score[i]=sort_final_list[[i]][final_num,17]}
          
          state_wise_mapped_name[i]=sort_final_list[[i]][final_num,7]
        }
        
        final_output_matrix=rbind(state_wise_ranked_hospital,state_wise_mapped_name, state_wise_ranked_score) 
      }

      else if (outcome=="penumonia") 
      { 
        for (i in 1: length(y))
        {
          final_list[[i]]=subset(y[[i]],!is.na(y[[i]][,23]))
          sort_final_list[[i]]= final_list[[i]][order(final_list[[i]][,23],final_list[[i]][,2]),]
          if (num == "worst") {final_num = nrow(sort_final_list[[i]])}
          
          if (final_num >nrow(sort_final_list[[i]])){state_wise_ranked_hospital[i]=NA}
          else {state_wise_ranked_hospital[i]=sort_final_list[[i]][final_num,2]}
          
          state_wise_mapped_name[i]=sort_final_list[[i]][final_num,7]
        }
        
        final_output_matrix=rbind(state_wise_ranked_hospital,state_wise_mapped_name) 
      }
      
      
final_output_matrix
  
  }

}