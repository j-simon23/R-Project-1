library(readr)
library(StepReg)
AuctionData= read.csv("auction11.csv")


plot(AuctionData$Sold.Amount~AuctionData$Basement.sqft)
plot(AuctionData$Sold.Amount~AuctionData$Year.built)
plot(AuctionData$Sold.Amount~AuctionData$Finished_basement.numeric) 
plot(AuctionData$Sold.Amount~AuctionData$Quality.numeric)
plot(AuctionData$Sold.Amount~AuctionData$Full.Baths)
plot(AuctionData$Sold.Amount~AuctionData$Bedrooms)
plot(AuctionData$Sold.Amount~AuctionData$Lot.size)
plot(AuctionData$Sold.Amount~AuctionData$Story.height)
plot(AuctionData$Sold.Amount~AuctionData$Half.Baths)
plot(AuctionData$Sold.Amount~AuctionData$Garage.capacity)
plot(AuctionData$Sold.Amount~AuctionData$Living.area.total)
plot(AuctionData$Sold.Amount~AuctionData$Half.Year.net.Taxes)
plot(AuctionData$Sold.Amount~AuctionData$Neighborhood)

supervisor_backward=stepwise(AuctionData,y="Sold.Amount",selection="backward", select ="adjRsq")
supervisor_backward

## regression model
model1 <- lm(Sold.Amount ~ Lot.size + Half.Baths + Garage.capacity + Living.area.total + Half.Year.net.Taxes + Garage_type.numeric + Condition.numeric , data=AuctionData)
summary(model1)
plot(model1)

