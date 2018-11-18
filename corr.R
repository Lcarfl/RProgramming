corr <- function(directory, threshold = 0){
        ## 'directory' is a character vector of length 1 indicating the
        ## location of the CSV files
        
        ##'threshold is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all variables
        ## ) required to comute the correlation between nitrate and 
        ## sulfate; the default is 0
        
        ## Return a numeric vector of correlations
        ## Note: Do not round the result!
        
        ## Go to the directory containing the CSV files
        if(grepl(directory,getwd()) == F){
                setwd(directory)
        }
        MyFiles <- list.files()
        
        MyFrame <- complete(directory, id = 1:332)
        setwd(directory)
        corr <-numeric(0)
        
        for (i in 1:332) {
                if (MyFrame$nobs[i] > threshold){
                        MyData <- read.csv(MyFiles[i])
                        MyData <- MyData[complete.cases(MyData),]
                        
                        corr<- c(corr,cor(MyData$nitrate, MyData$sulfate))
                }
        }
        setwd("..")
        print(corr)
        
        ## Return to the directory containing the folder containing the
        ## CSV files
        
}