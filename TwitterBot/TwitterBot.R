library(twitteR)
library(httr)
library(plyr)
api_key <- "mgMTWhIQPmBEjEkimhBL688I8"
api_secret <- "EQ8W7dODnVIgZpBEYR2AqH4a7iqNNg5Dr2dNCXYrCreUAioK0V"
access_Token <- "804714185200467968-MIBkse8ZUveBKrwV3HtwgSeQ4H4JrUH"
access_Secret <- "XPg34HJIJJ6sS1CJrn4XLQ2dG5p8yL72wFAWBzfQPDKOa"
setup_twitter_oauth( api_key, api_secret, access_token = access_Token, access_secret = access_Secret)

tweets_sanders <- searchTwitter('@BernieSanders', n = 15, resultType = 'popular')
feed <- laply(tweets_sanders, function(t)t$getText())


