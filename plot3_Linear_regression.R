library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI.mrg <- merge(NEI,SCC)
NEI.req <- NEI.mrg[NEI.mrg$fips==24510,]
year <- NEI.req[,"year"]
Emissions <- NEI.req[,"Emissions"]
png("plot3.png")
q <- qplot(year,Emissions,data=NEI.req)
q + facet_grid(.~type)+geom_smooth(method = "lm")+ylim(0,800)
#ggsave("plot3.png", width=10, height=10)
dev.off()
