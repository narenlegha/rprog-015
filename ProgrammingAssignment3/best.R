best <- function(state, outcome){
        
        data <- read.csv("rprog_data_ProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character")
        
        if(! state %in% data$State){
                print("invalid state")
        }else if(outcome == "heart attack"){
                
                data_heartattatck <- data[, c("Hospital.Name", "State", "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack")]
                
                data_heartattatck_state <- subset(data_heartattatck, data_heartattatck$State == state)
                
                data_heartattatck_state_order <- data_heartattatck_state[order(data_heartattatck_state$Hospital.Name),]
                
                ## data_heartattatck_state_order[, data_heartattatck_state_order$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack] = as.numeric(data_heartattatck_state_order[, data_heartattatck_state_order$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack])
                
                data_heartattatck_state_order[, 3] = as.numeric(data_heartattatck_state_order[, 3])
                
                data_heartattatck_state_order <- data_heartattatck_state_order[complete.cases(data_heartattatck_state_order),]
                
                data_heartattatck_state_order$Hospital.Name[data_heartattatck_state_order$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack == min(data_heartattatck_state_order$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)]
                
        }else if(outcome == "heart failure"){
                data_heartfailure <- data[, c("Hospital.Name", "State", "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure")]
                
                data_heartfailure_state = subset(data_heartfailure, data_heartfailure$State == state)
                
                data_heartfailure_state_order = data_heartfailure_state[order(data_heartfailure_state$Hospital.Name), ]
                
                data_heartfailure_state_order[, 3] = as.numeric(data_heartfailure_state_order[, 3])
                
                data_heartfailure_state_order <- data_heartfailure_state_order[complete.cases(data_heartfailure_state_order),]
                
                data_heartfailure_state_order$Hospital.Name[data_heartfailure_state_order$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure == min(data_heartfailure_state_order$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)]
                
        }else if(outcome == "pneumonia"){
                data_pneumonia <- data[, c("Hospital.Name", "State", "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")]
                
                data_pneumonia_state = subset(data_pneumonia, data_pneumonia$State == state)
                
                data_pneumonia_state_order = data_pneumonia_state[order(data_pneumonia_state$Hospital.Name), ]
                
                data_pneumonia_state_order[, 3] = as.numeric(data_pneumonia_state_order[, 3])
                
                data_pneumonia_state_order <- data_pneumonia_state_order[complete.cases(data_pneumonia_state_order),]
                
                data_pneumonia_state_order$Hospital.Name[data_pneumonia_state_order$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia == min(data_pneumonia_state_order$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)]
                
        }else{
                print("invalid outcome")
        }
}