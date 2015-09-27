#League Tables
ActiveInvestors <- read.table ("ActiveInvestors.csv", header=T, sep=",")
head(ActiveInvestors)
activeInvestors <- data.frame (ActiveInvestors)
activeInv <- activeInvestors[3:12,]
activeInv
names(activeInv)[c(1,2,3)] <- c("Name", "Inv", "FundsRaised")
arrange(activeInv, desc(Inv))
SuccessfulInvestors <- read.table("SuccessfulInvestors.csv", header=T, sep=",")
head(SuccessfulInvestors)
arrange (SuccessfulInvestors, desc(Exits))
investors <- merge (activeInv, SuccessfulInvestors, all=F)
investors
Top50Inv2013 <- read.table("Top50Investors.csv", header=T, sep=",")
head(Top50Inv2013)
merge(investors,Top50Inv2013, all=F)
