corr <- function(directory, threshold = 0){
        
        old <- getwd()
        setwd(directory)
        
        corr_vector <- vector()
        file_list <- 1:332
        for( i in file_list){
                
                j <- sprintf("%03d", i)
                infile <- paste(j, ".csv", sep="")
                
                read_file <- read.csv(infile)
                #read_file <- na.omit(read_file)
                read_file <- read_file[complete.cases(read_file),]
                nobs <- nrow(read_file)
                
                if(nobs > threshold){
                        corr_value <- cor(read_file[c("sulfate")], read_file["nitrate"])
                        corr_vector <- c(corr_vector, corr_value)
                }
        }
        
        setwd(old)
        corr_vector
}