install.packages("rtweet")
install.packages("twitteR")
install.packages("tidytext")
install.packages("tidyverse")
install.packages("readr")
library("readr")
library(tidyverse)
library(rtweet)
library(twitteR)
library(tidytext)



if (!requireNamespace("remotes", quietly = TRUE)) {
  install.packages("remotes")
}

remotes::install_github("ropensci/rtweet")


rtweet_app()

api_key <- "RkkLAB74mVI7mW3PDzUXe2JXw"
api_secret_key <- "7sDJEsGRNtWMm1LZMmbg4ZhOWzpQIj0LGfNR9O9UQvBHWQTyHV"

# tarayiciyla web dogrulamasi yapiyoruz.
token <- create_token(
  app = "emotionalchangofmds",
  consumer_key = api_key,
  consumer_secret = api_secret_key)
auth_get()

# new moon in leo cumlesini iceren, retweetlerin dahil olmadigi son 1000 adet tweeti cagiriyoruz.
leo <- search_tweets("new moon in leo", n = 1000, include_rts = FALSE)
View(leo)

# verilerden sectigimiz sutunlari dataframe haline getiriyoruz
df <- data.frame(leo$text)
View(df)

# dataframemizi disari istedigimiz formda aktariyoruz.
write.csv(df, "leotweet.csv")


# burada filtreleme mekanizmasina retweet, quote ve replyleri istemedigimizi soyledik.
ukraine <- search_tweets("StandWithUkraine-filter:retweets -filter:quote -filter:replies", n = 100)
View(ukraine)

tail(ukraine)
head(ukraine)

# bu fonksiyonla bolgesel olarak trendlerin dokumunu alabiliyoruz. ulke seklinde kullanılıyor. farklı kullanımlar icin lutfen linki verilen dosyayi check ediniz.
get_trends("Turkey")
get_trends("USA")


