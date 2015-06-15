complete <- function(directory, id = 1:332){
        
        old <- getwd()
        
        setwd(directory)

        result <- data.frame()
        
        result_len = nrow(result)
        for( i in id){

                j <- sprintf("%03d", i)
                infile <- paste(j, ".csv", sep="")
                
                read_file <- read.csv(infile)
                read_file <- na.omit(read_file)
                nobs <- nrow(read_file)
                
                result <- rbind(result, data.frame(i, nobs))
        }
        
        setwd(old)
        
        result
}