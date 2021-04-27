library(tidyverse)
glimpse(train)
dim(train)

train ->traintitanic
glimpse(traintitanic)

sum(is.na(traintitanic$Survived))
sum(is.na(traintitanic$Fare))
sum(is.na(traintitanic$Age))

traintitanic= na.omit(traintitanic)  "deletes rows if they have NA"

glimpse(traintitanic)

train <- mutate(train, Title = str_sub(Name, str_locate(Name, ",")[ , 1] + 2, 
                                         str_locate(Name, "\\.")[ , 1] - 1))  
"searching for title MR or MRS, in the Name variable between comma(,) and point(.)"

glimpse(train)

train %>% group_by(Title) %>%
  summarise(count = n()) %>%
  arrange(desc(count))


summary(train)
summarise(train, survival=sum(Survived)/nrow(train)*100) "average of survived"

ggplot(train, aes(x = Survived)) +
  geom_bar(width = 0.5, fill = "blue") +
  geom_text(stat = 'count', aes(label=stat(count)), vjust=-0.5) +
  theme_classic()

ggplot(train, aes(x = Survived, fill=Sex)) +
  geom_bar(position = position_dodge()) +
  geom_text(stat = 'count', aes(label=stat(count)), position = position_dodge(width = 0.5), vjust=-0.5) +
  theme_classic()

glimpse(test)
glimpse(train)

titanicfull=full_join(train,test)
glimpse(titanicfull)