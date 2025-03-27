rm(list = ls())
graphics.off()

library(tidyverse)
library(psych)

describe(men_data)
summary(men_data)
str(men_data)
men_data <- read_csv("./men_results.csv")
men_data <- men_data %>% 
  filter(tournament == "FIFA World Cup", date > "2002-01-01") %>% 
  mutate(total_goals = home_score + away_score)
women_data <-  read_csv("./women_results.csv")
women_data <- women_data %>% 
  filter(tournament == "FIFA World Cup", date > "2002-01-01") %>% 
  mutate(total_goals = home_score + away_score)

