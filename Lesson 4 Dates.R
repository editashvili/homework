Sys.Date()
Sys.time()

strDates = c("01/01/2020", "01/02/2020")
datesAsObjects = as.Date(strDates, "%m/%d/%Y")

library(lubridate)
strDates1 = c("01/01/2020", "01/02/2020")
mdy(strDates1)