# Read into R the data in the files "cheese1.csv" and "cheese2.csv".  These
# datasets contain the per capita consumption of different cheeses from 1995 to
# 2014. The two data sets cover the same years, although the names for the
# variable holding the year differ.  Merge the data together into a single
# data.frame in which all the consumption data for a given year is one
# observation.  Name your merged data.frame "cheese".  The dimension of this
# data.frame should be 20 rows and 7 columns.

cheese1 <- read.table(file="~/Desktop/STAT223/hw1-starter/files/cheese1.csv", header = TRUE, sep = ",")
cheese2 <- read.table(file="~/Desktop/STAT223/hw1-starter/files/cheese2.csv", header=TRUE, sep=",")
cheese <- merge(x = cheese1,y = cheese2, by.x = "Year", by.y = "Time")

dim(cheese)


# Which kind of cheese has the highest average consumption per capita over all
# years?
avgs <- apply(cheese[,names(cheese) != "Year"], 2, mean)
names(which.max(avgs))



# Which year saw the largest total consumption per capita of all cheeses?
totals <- apply(cheese[,names(cheese) != "Year"], 1, sum)
cheese$Year[which.max(totals)]
