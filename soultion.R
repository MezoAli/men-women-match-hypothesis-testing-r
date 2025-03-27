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


hist(men_data$total_goals)
hist(women_data$total_goals)

shapiro.test(men_data$total_goals)
shapiro.test(women_data$total_goals)

# data is not normally distributed so we use wilcoxon test to run the hypothesis

test_results <- wilcox.test(x = women_data$total_goals,
                            y = men_data$total_goals,
                            alternative = "greater")

test_results$p.value

p_val <- round(test_results$p.value, 4)
result <- ifelse(p_val <= 0.10, "reject", "fail to reject")

result_df <- data.frame(p_val,result)
