best <- function(state, outcome) {
        data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        ## Read outcome data
        
        ## Check that state and outcome are valid
        if (state %in% data$State & outcome %in% c("heart failure","heart attack","pneumonia")){
                if(outcome=="heart attack"){
                        a<-data[,c(2,7,11)] ## specifying columns for "heart attack"
                }
                
                if(outcome=="heart failure"){
                        a<-data[,c(2,7,17)]
                }
                
                if(outcome=="pneumonia"){
                        a<-data[,c(2,7,23)]
                }
                ## Return hospital name in that state with lowest 30-day death
                b<-split(a,a$State)
                c<-b[[state]]
                c<-c[,c(1,3)]
                colnames(c)<-cbind('Hospital.Name',outcome)
                c[,2]<-as.numeric(c[,2])
                
                d<- c[which(c[,2]==min(c[,2],na.rm=TRUE)),]
                
                best_hospitals<-d$Hospital.Name
                best_hospital<-sort(best_hospitals)[1]
                
        }
        ## rate
        else if (state %in% data$State ==FALSE) { stop("invalid state")}
        
        else if (outcome %in% c("heart failure","heart attack","pneumonia")==FALSE){
                stop("invalid outcome")
        }
        
        best_hospital   
        
}
best("SC", "heart attack")
best("NY", "pneumonia")
best("AK", "pneumonia")


rankhospital <- function(state, outcome, num = "best") {
        
        ## Read the outcome data
        dat <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        ## Check that state and outcome are valid
        if (!state %in% unique(dat[, 7])) {
                stop("invalid state")
        }
        switch(outcome, `heart attack` = {
                col = 11
        }, `heart failure` = {
                col = 17
        }, pneumonia = {
                col = 23
        }, stop("invalid outcome"))
        dat[, col] = as.numeric(dat[, col])
        df = dat[dat[, 7] == state, c(2, col)]
        df = na.omit(df)
        nhospital = nrow(df)
        switch(num, best = {
                num = 1
        }, worst = {
                num = nhospital
        })
        if (num > nhospital) {
                return(NA)
        }
        ## Return hospital name in that state with the given rank 30-day death rate
        
        o = order(df[, 2], df[, 1])
        df[o, ][num, 1]
}
rankhospital("NC", "heart attack", "worst")
rankhospital("WA", "heart attack", 7)
rankhospital("TX", "pneumonia", 10)
rankhospital("NY", "heart attack", 7)


rankall <- function(outcome,num='best') {
        
        if(is.character(num)){
                if (num %in% c('best','worst')==FALSE){
                        stop('Invalid Rank')
                } }
        
        data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        
        if (outcome %in% c("heart failure","heart attack","pneumonia")==FALSE){
                stop("invalid outcome")}
        
        
        
        
        if (outcome %in% c("heart failure","heart attack","pneumonia")){
                if(outcome=="heart attack"){
                        a<-data[,c(2,7,11)]
                }
                
                if(outcome=="heart failure"){
                        a<-data[,c(2,7,17)]
                }
                
                if(outcome=="pneumonia"){
                        a<-data[,c(2,7,23)]
                }}
        
        
        a[,3]<-as.numeric(a[,3])
        
        
        colnames(a)<-cbind('hospital','state','value')
        
        states<-sort(unique(a$state))
        
        b<-split(a,a$state)
        
        ans_state<-c()
        ans_hospital<-c()
        
        
        
        
        for (letter in states){
                
                
                g<-b[[letter]]
                
                g<-g[,c(1,3)]
                
                if (num=='best'){
                        
                        d<- c[which(g[,2]==min(g[,2],na.rm=TRUE)),]
                        
                        hospitals<-d$hospital
                        hospital<-sort(hospitals)[1]
                        
                }
                
                if (num=='worst'){
                        
                        d<- g[which(g[,2]==max(g[,2],na.rm=TRUE)),]
                        
                        hospitals<-d$hospital
                        hospital<-sort(hospitals)[1]
                        
                }
                
                if(is.numeric(num) & num < length(g$hospital)){
                        
                        
                        l<-g[!is.na(g[,2]),]
                        ll<-unique(sort(l[,2]))
                        
                        m<-c()
                        
                        for ( i in 1:length(ll)){
                                temp<-which(l[,2]==ll[i])
                                m<-rbind(m,l[temp,])
                        }
                        
                        k<-m[num,2]
                        p1<-which(m[,2]<k)
                        p<-which(m[,2]==k)
                        
                        num2<-num-length(p1)
                        
                        hospitals<-sort(m[p,1])
                        
                        hospital<-hospitals[num2]
                }
                
                if (is.numeric(num)){
                        if (num > length(g$hospital)){ 
                                hospital<-NA}}
                
                ans_state<-c(ans_state,letter)
                ans_hospital<-c(ans_hospital,hospital)
                
        }
        
        df = data.frame(ans_hospital, ans_state)       # df is a data frame 
        colnames(df)<-c('hospital','state')
        
        df
}

r <- rankall("heart attack", 4)
as.character(subset(r, state == "HI")$hospital)

r <- rankall("pneumonia", "worst")
as.character(subset(r, state == "NJ")$hospital)

r <- rankall("heart failure", 10)
as.character(subset(r, state == "NV")$hospital)