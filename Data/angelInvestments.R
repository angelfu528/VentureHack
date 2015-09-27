library(ggplot2)
library(knitr)
library(xts)
library(RCurl)
library(ggmap)
library(maps)
library(reshape)
library(forecast)

#Angel Investments (3 sections)
#Investments_Overview
angelInv <- Quandl("CVR/ANGEL_TOTALS" , authcode="XzSzyqueociir6AfP9uT")
is.na(angelInv)
angel_New <- as.data.frame(angelInv)
angelInv
angel_New[is.na(angel_New)] <- 0
summary(angel_New) #check if there's still any NAs
head(angel_New)
names(angel_New)[2] <- "TotalInvestments"
names(angel_New)[3] <- "ActiveInvestors"
a <- ggplot(angel_New, aes(x = Date, y = TotalInvestments, colour = TotalInvestments)) + geom_line(stat="identity")
a1 <- a + ylab("Total Investments ($B)") + scale_y_continuous(limits=c(0,30), breaks=seq(0,30, by=5)) + labs(title="Angel Investments")
a1 
a2 <- ggplot(angel_New, aes(x = Date, y = ActiveInvestors, colour = ActiveInvestors)) + geom_line(stat="identity")
a2
a3 <- a2 + ylab("Active Investors") + scale_y_continuous(limits=c(0,70000), breaks=seq(0,70000, by=10000)) + labs(title="Active Angel Investors")
a3

#by Stage
angel_Stage <- Quandl("CVR/ANGEL_STAGES", authcode="XzSzyqueociir6AfP9uT")
head(angel_Stage)
summary(angel_Stage) #check if there's any NAs
angelStage <- melt(angel_Stage, id.vars = "Year")
ggplot(angelStage, aes(x = Year, y = value, colour = variable)) + geom_line() + ylab("Percentage (%)") + scale_y_continuous(limits=c(0,100), breaks=seq(0,100, by=20)) +labs(title="Angel Investments by Stage")

#by Sector 
angel_Industry <- Quandl("CVR/ANGEL_SECTORS", authcode="XzSzyqueociir6AfP9uT")
is.na(angel_Industry)
angel_Ind_New <- as.data.frame(angel_Industry)
angel_Ind_New[is.na(angel_Ind_New)] <- 0
summary(angel_Ind_New) #check if there's still any NAs
head(angel_Ind_New)
angelInd <- melt(angel_Ind_New, id.vars = "Year")
ggplot(angelInd, aes(x = Year, y = value, colour = variable)) + geom_line() + ylab("Number of Investments") + scale_y_continuous(limits=c(0,25), breaks=seq(0,25, by=5)) +labs(title="Angel Investments by Sector")
