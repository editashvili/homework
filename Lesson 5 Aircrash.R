library(tidyverse)
library(lubridate)
library(tibble)
aircrash = aircrash %>% rename(planeType = Type, Date1 = Date)
glimpse(aircrash)
newdateformat = aircrash %>% mutate(Date1 = mdy(Date1))

glimpse(aircrash)
head(aircrash)
head(newdateformat)
newdateformat = newdateformat %>% mutate(day = wday(Date1, label = TRUE),
                                         weekend = day == "Sat"| day == "Sun")
as_tibble(select(newdateformat, Date1, Location, day, weekend))
as_tibble(aircrash)
