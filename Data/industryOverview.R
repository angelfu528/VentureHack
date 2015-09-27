#Industry Overview
#Total Deal Volume (# of deals, Amount Raised)
dealVolume <- Quandl("COOLEY/VC_TOTAL_DEAL_VOLUME")
is.na(dealVolume)
dealVol <- as.data.frame(dealVolume)
dealVol[is.na(dealVol)] <- 0
summary(dealVol) #check if there's still any NAs
head(dealVol)
names(dealVol)[c(2,3)] <- c("NumOfDeals","amtRaised")
dealVol
numDeals <- ggplot(dealVol) + geom_bar(aes(x = Date, y= NumOfDeals), stat="identity") + ylab(" ") + labs(title="Total Deal Volume by Number of Deals")
numDeals
dealVol
amtRaised <- ggplot(dealVol, aes(x = Date, y = amtRaised, colour = amtRaised)) + geom_line() + ylab("Total Amount ($M)") + scale_y_continuous(limits=c(0,2000), breaks=seq(0,2000, by=400)) + labs(title="Total Deal Volume by Amount Raised")
amtRaised


#Simple exponential smoothing
plot(ses(dealVol$amtRaised, h=2, alpha=0.5))

#Valuations 
Valuations <- Quandl("COOLEY/VC_VALUE_BY_SERIES", authcode="XzSzyqueociir6AfP9uT")
summary(Valuations) #check if there's any NAs
head(Valuations)
valuations <- melt(Valuations, id.vars = "Date")
ggplot(valuations, aes(x = Date, y = value, colour = variable)) + geom_line() + ylab("$ millions") + scale_y_continuous(limits=c(0,220), breaks=seq(0,220, by=20)) +labs(title="Median Pre-Money Valuations by Stage")

#M&A exits
exitMA <- Quandl("NVCA/VENTURE_10_0", authcode="XzSzyqueociir6AfP9uT")
summary(exitMA) #check if there's any NAs
head(exitMA)
exitMA_new <- exitMA[1:13,]
names(exitMA_new)[2] <- "NumberTotal"
exitMA_new
numMA <- ggplot(exitMA_new) + geom_bar(aes(x = Year, y= NumberTotal), stat="identity") + ylab("Number of M&As") + labs(title="Number of M&A Exits")
numMA
ma <- exitMA_new [,1:2]

#auto.arima
ma <- xts(order.by=as.Date(ma$Year),ma$NumberTotal) 
plot.xts(ma) 
forecast(auto.arima(ma),5)
plot(forecast(ma),5)
amtMA <- ggplot(exitMA_new, aes(x = Year, y = Price, colour = Price)) + geom_line() + ylab("Total Amount ($M)") + scale_y_continuous(limits=c(0,32000), breaks=seq(0,32000, by=4000)) + labs(title="M&A Exits by Price")
amtMA
avgAmtMA <- ggplot(exitMA_new, aes(x = Year, y = Average, colour = Price)) + geom_line() + ylab("Average Amount ($M)") + scale_y_continuous(limits=c(0,180), breaks=seq(0,180, by=20)) + labs(title="M&A Exits by Average Price")
avgAmtMA

#IPO exits 
exitIPO <- Quandl("NVCA/VENTURE_4_03", authcode="XzSzyqueociir6AfP9uT")
is.na(exitIPO)
names(exitIPO)[c(2,6,8,10)] <- c("NumberofIPOs", "PostIPO","meanVal","meanTime")
head(exitIPO)
IPO <- exitIPO[1:12,]
numIPO <- ggplot(IPO) + geom_bar(aes(x = Year, y= NumberofIPOs), stat="identity") + ylab(" ") + labs(title="Number of IPOs")
numIPO
valIPO <- ggplot(IPO, aes(x = Year, y = PostIPO, colour = PostIPO)) + geom_line() + ylab("Total Amount ($M)") + scale_y_continuous(limits=c(0,180000), breaks=seq(0,180000, by=10000)) + labs(title="IPO Exits by Post Value")
valIPO
meanValIPO <- ggplot(IPO, aes(x = Year, y = meanVal, colour = meanVal)) + geom_line() + ylab("Average Amount ($M)") + scale_y_continuous(limits=c(0,2500), breaks=seq(0,180000, by=500)) + labs(title="IPO Exits by Average Post Value")
meanValIPO
meanAgeIPO <- ggplot(IPO, aes(x = Year, y = meanTime, colour = meanTime)) + geom_line() + ylab("Years") + scale_y_continuous(limits=c(0,10), breaks=seq(0,10, by=1)) + labs(title="IPO Exits by Mean Age")
meanAgeIPO

#IPO exits by Country - Chrolopeth 
exitByCountry <- Quandl("NVCA/VENTURE_4_17B", authcode="XzSzyqueociir6AfP9uT")
summary(exitByCountry) 
exitByCo <- as.data.frame(exitByCountry)
exitByCo[is.na(exitByCo)] <- 0
summary(exitByCo) #check if there's still any NAs
exitByCo
#Create the world map first 
names(exitByCo)[c(8,14)] <- c("HongKong","SouthKorea")
worldmap <- borders("world", colour="gray50", fill="gray50")
locations <- c("Argentina", "Bermuda", "Bahamas", "Canada","China","France","HK","India","Israel","Netherlands","Norway","Russia","SouthKorea","TW","UK","US")
coord <- geocode(locations)
locations_df <- data.frame(locations,coord)
mp <- ggplot(locations_df, aes(x=lon,y=lat)) + worldmap
mp <- mp + geom_point (color="blue",size=5)
mp
#Sum up to the total number of IPOs in all listed countries 
Argentina <- sum(exitByCo$Argentina)
Bermuda <- sum(exitByCo$Bermuda)
Bahamas <- sum(exitByCo$Bahamas)
Canada <- sum(exitByCo$Canada)
China <- sum(exitByCo$China)
France <- sum(exitByCo$France)
HK <- sum(exitByCo$HongKong)
India <- sum(exitByCo$India)
Israel <- sum(exitByCo$Israel)
Netherlands <- sum(exitByCo$Netherlands)
Norway <- sum(exitByCo$Norway)
Russia <- sum(exitByCo$Russia)
SouthKorea <- sum(exitByCo$SouthKorea)
TW <- sum(exitByCo$Taiwan)
UK <- sum(exitByCo$UK)
US <- sum(exitByCo$US)
Name <- c("Argentina","Bermuda","Bahamas","Canada","China","France","HongKong","India","Israel","Netherlands","Norway","SouthKorea","Taiwan","UK","US")
Number <- c(1,1,1,3,58,2,1,16,2,1,2,3,1,1,404)
IPOs <- data.frame(Name,Number)
IPOs