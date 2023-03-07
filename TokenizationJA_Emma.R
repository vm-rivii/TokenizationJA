library(tidyverse)
library(tidytext)
library(janeaustenr)

## create tibble for "Emma"
text <- tibble(emma)
text

## (df, output, input)
unnest_tokens(text, word, emma)
text_words <- text %>% unnest_tokens(word, emma)

## counts how many times a word appears in the novel
text_words %>% count(word, sort = T)

## shows how many times bigrams appear
text %>% unnest_ngrams(bigram, emma, n = 2) %>% 
  drop_na() %>% count(bigram, sort = T)

## initialize variable
## function unnests trigrams
text_tri <- text %>% unnest_ngrams(trigram, emma, n = 3) %>% 
  drop_na()
## shows how many times trigrams appear
text_tri %>% count(trigram, sort = T)

## unnests full sentences in Emma
text %>% unnest_sentences(s, emma)

## removes duplicate values in lexicon column
## output: "SMART"  "snowball"  "onyx"
unique(stop_words$lexicon)

## outputs word or bigram and modifier type
nma_words
print(nma_words, n = Inf)

## outputs modals from the modifier column
nma_words[nma_words$modifier == "modal", ]

## outputs values in word column
nma_words$word[nma_words$modifier == "modal"]

## using textdata package version 0.4.4 Emil Hvitfeldt 2018
## https://cran.r-project.org/package=textdata

## shows word and its sentiment value
get_sentiments("nrc")

## initialize sentiment variables
## filter by sentiments
nrc_joy <- get_sentiments("nrc") %>%
  filter(sentiment == "joy")
nrc_joy

nrc_fear <- get_sentiments("nrc") %>%
  filter(sentiment == "fear")
nrc_fear

nrc_trust <- get_sentiments("nrc") %>%
  filter(sentiment == "trust")
nrc_trust


