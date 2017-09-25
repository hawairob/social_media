# Uso de twitteR
# Lo primero es registrar una app en twitter
# https://www.r-bloggers.com/getting-started-with-twitter-in-r/

# Otros tutoriales
# https://www.r-bloggers.com/a-glance-at-r-bloggers-twitter-feed/

# Paquetes
library(tidyverse)
library(twitteR)
library(RSQLite)

# Mi app me arroja los siguientes accesos necesarios.
consumer_key <- "ocda8P25UXb2FEFThhENBxvg8"
consumer_secret <- "zbNKcPw3fobb9KF5Luk2gnW4KGMOoqM6kUc8JibrVtMsXLFCTx"

access_token <- "2183602022-Dtg2qYFYaDre1bncuc5m64O1u3H99bT5aP0gKJM"
access_secret <- "tJ0XY9miiSMfnm7pQylyZShWI6DdXKghKBZpTDSjD7aNb"

setup_twitter_oauth(consumer_key, 
                    consumer_secret,
                    access_token,
                    access_secret)

## Explorar por hashtags o frases
tw <- searchTwitter('#kfc', n = 100, since = '2017-01-01')

# Pasarlos a un dataframe para facilitar el manejo
d <- twListToDF(tw)
d[2,] %>% glimpse

d %>%
  filter(isRetweet == TRUE) %>%
  .$text

# Get most favorite tweets from a user
fav <- favorites("BarackObama", n = 100)
fav
fav %>% twListToDF()

# Get users
getUser("BarackObama")
lookupUsers("Obama")
lookupUsers(c('geoffjentry','whitehouse'))

# Explorar quienes retweetean determinado tweet
a <- retweets("912366164868784130")
a %>% twListToDF()

# Funcion para ir guardando los tweets en "automatico", si se vuelve
# a correr solamente se guardan los nuevos.
register_sqlite_backend("pfm_tweets")
search_twitter_and_store("#prayformexico", table_name = "pfm_tweets")

tweets_guardados <- load_tweets_db(as.data.frame = TRUE, table_name = "pfm_tweets")
tweets_guardados %>% head

tweets_guardados %>%
  tail %>%
  .$created

# Timelines
userTimeline("barackobama", n = 20)

homeTimeline(n = 25)
mentions(n = 25)
retweetsOfMe(n = 25)

# Trends
lugares <- availableTrendLocations()
lugares %>%
  filter(country == "Mexico", name == "Monterrey")

# woed de mty: 134047
getTrends(134047) %>% glimpse
df <- getTrends(134047)
df$name

# friendships - relacion con mi cuenta
friendships("BarackObama") # no lo sigo
friendships("TheEllenShow") # si lo sigo


