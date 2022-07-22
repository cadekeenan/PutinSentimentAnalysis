### Pieced together with code from https://github.com/ChinmayaGarg/Sentiment-Analysis/blob/main/sentiment.R


rm(list=ls())
install.packages("dplyr")
library(tidyverse)
library(tidytext)
library(glue)
library(data.table) 

#ReadinDataHere
PutinApr <- as.data.frame(read.csv('Apr20a.csv')) ###or any transcript, text, tweet, ect

# stick together the path to the file & 1st file name
PutinApr <- glue("Users/Cade/CadeProj/Putin/Apr20a", PutinFeb[1], sep = "")


# get rid of any sneaky trailing spaces
PutinApr <- trimws(PutinFeb)

# read in the new file
PutinAprText <- glue(read_file(PutinFeb))

# remove any dollar signs (they're special characters in R)
fileText <- gsub("\\$", "", fileText) 

# tokeniz
tokens <- data_frame(text = PutinApr) %>% unnest_tokens(word, text)

tokens %>%
  inner_join(get_sentiments("bing")) %>% # pull out only sentiment words
  count(sentiment) %>% # count the # of positive & negative words
  spread(sentiment, n, fill = 0) %>% # made data wide rather than narrow
  mutate(sentiment = positive - negative) # # of positive words - # of negative words

