#VC Investments 
#VC Overview 
vc <- Quandl("NVCA/VENTURE_1_04", authcode="XzSzyqueociir6AfP9uT")
is.na(vc)
vc_New <- as.data.frame(vc)
vc_New[is.na(vc_New)] <- 0
summary(vc_New) #check if there's still any NAs
head(vc_New)
names(vc_New)[c(5,8,9,10)] <- c("existFunds","avgFundSize", "avgFirmSize","actInv")
existFunds <- ggplot(vc_New) + geom_bar(aes(x = Year, y= existFunds), stat="identity") + ylab(" ") + labs(title="VC by Existing Funds")
existFunds
vc_Size <- vc_New[,c(1,8,9)]
vc_Size
vc_size <- melt(vc_Size, id.vars = "Year")
vcSize <- ggplot(vc_size, aes(x = Year, y = value, colour = variable)) + geom_line() + ylab("Amount ($M)") + scale_y_continuous(limits=c(0,300), breaks=seq(0,300, by=50)) +labs(title="VC by Size")
vcSize
vc_Inv <- ggplot(vc_New) + geom_bar(aes(x = Year, y= actInv), stat="identity") + ylab(" ") + labs(title="VC by Number of Actively Investing Firms")
vc_Inv

#by Sector
vc_Industry <- Quandl("NVCA/VENTURE_3_10", authcode="XzSzyqueociir6AfP9uT")
head(vc_Industry)
is.na(vc_Industry)
vc_ind_new <- as.data.frame(vc_Industry)
vc_ind_new[is.na(vc_ind_new)] <- 0
summary(vc_ind_new) #check if there's still any NAs
head(vc_ind_new)
vc_ind <- vc_ind_new[1:12,]
vc_ind <- melt(vc_ind, id.vars = "Year")
vc_Ind <- ggplot(vc_ind) + geom_bar(aes(x = Year, y= value, fill=variable), stat="identity") + ylab("Number of Investments") +labs(title="VC Investments by Sector")
vc_Ind

#by Stage
vc_Stage <- Quandl("NVCA/VENTURE_3_09", authcode="XzSzyqueociir6AfP9uT")
is.na(vc_Stage)
vc_stage <- vc_Stage[1:12,]
vc_stage
vc_stage <- melt(vc_stage, id.vars = "Year")
vcStage <- ggplot(vc_stage) + geom_bar(aes(x = Year, y= value, fill=variable), stat="identity") + ylab("Number of Investments") +labs(title="VC Investments by Stage")
vcStage

#by Region 
vc_Region <- Quandl("NVCA/VENTURE_3_08", authcode="XzSzyqueociir6AfP9uT")
is.na(vc_Region)
vc_region_new <- as.data.frame(vc_Region)
vc_region_new[is.na(vc_region_new)] <- 0
summary(vc_region_new) #check if there's still any NAs
vc_region <- vc_region_new[1:12,]
vc_region
vc_Region <- melt(vc_region, id.vars = "Year")
vcRegion <- ggplot(vc_Region) + geom_bar(aes(x = Year, y= value, fill=variable), stat="identity") + ylab("Number of Investments") +labs(title="VC Investments by Region")
vcRegion