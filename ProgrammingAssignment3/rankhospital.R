rankhospital <- function(state, outcome, num = "best"){
        
        ## read the csv; colClasses will make reading faster
        data <- read.csv("rprog_data_ProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character")
        ## check validity of state variable
        if(!state %in% data$State){
        	stop("invalid state")
        }else if(outcome == "heart attack"){
                ## separate the relevant columns
                data_outcome <- data[, c("Hospital.Name", "State", "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack")]
                
                data_outcome_state <- subset(data_outcome, data_outcome$State == state)
                ## remove rows with NAs
                data_outcome_state <- data_outcome_state[complete.cases(data_outcome_state),]
                ## order/sort as per Hospital.Name 
                data_outcome_state_order <- data_outcome_state[order(data_outcome_state$Hospital.Name),]
                ## this conversion will introduce NAs
                data_outcome_state_order[, 3] = as.numeric(data_outcome_state_order[, 3])
                ## order/sort as per Heart.Attack column values in increasing order; decreasing = FALSE is default option
                data_outcome_state_order <- data_outcome_state_order[order(data_outcome_state_order$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack),]
                ## remove NAs inroduced by conversion
                data_outcome_state_order <- data_outcome_state_order[complete.cases(data_outcome_state_order),]
                
                hospital_list <- data_outcome_state_order[ , 1]
                
                if(num == "best"){
                       hospital_list[1]
                }else if(num == "worst"){
                        hospital_list[length(hospital_list)]
                }else if( num > length(hospital_list)){
                        NA
                }else{
                      hospital_list[num]
                }
        }else if(outcome == "heart failure"){
                data_outcome <- data[, c("Hospital.Name", "State", "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure")]
                
                data_outcome_state <- subset(data_outcome, data_outcome$State == state)
                data_outcome_state <- data_outcome_state[complete.cases(data_outcome_state),]
                
                data_outcome_state_order <- data_outcome_state[order(data_outcome_state$Hospital.Name),]
                
                data_outcome_state_order[, 3] = as.numeric(data_outcome_state_order[, 3])
                
                data_outcome_state_order <- data_outcome_state_order[order(data_outcome_state_order$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure),]
                
                data_outcome_state_order <- data_outcome_state_order[complete.cases(data_outcome_state_order),]
                
                hospital_list <- data_outcome_state_order[ , 1]
                
                if(num == "best"){
                        hospital_list[1]
                }else if(num == "worst"){
                        hospital_list[length(hospital_list)]
                }else if( num > length(hospital_list)){
                        NA
                }else{
                        hospital_list[num]
                }
        }else if(outcome == "pneumonia"){
                data_outcome <- data[, c("Hospital.Name", "State", "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")]
                
                data_outcome_state <- subset(data_outcome, data_outcome$State == state)
                data_outcome_state <- data_outcome_state[complete.cases(data_outcome_state),]
                
                data_outcome_state_order <- data_outcome_state[order(data_outcome_state$Hospital.Name),]
                
                data_outcome_state_order[, 3] = as.numeric(data_outcome_state_order[, 3])
                
                data_outcome_state_order <- data_outcome_state_order[order(data_outcome_state_order$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia),]
                
                data_outcome_state_order <- data_outcome_state_order[complete.cases(data_outcome_state_order),]
                
                hospital_list <- data_outcome_state_order[ , 1]
                
                if(num == "best"){
                        hospital_list[1]
                }else if(num == "worst"){
                        hospital_list[length(hospital_list)]
                }else if( num > length(hospital_list)){
                        NA
                }else{
                        hospital_list[num]
                }
        }else{
        	## If state is valid and outcome is none of the above
        	stop("invalid outcome")
        }
}