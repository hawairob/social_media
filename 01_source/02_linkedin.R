# linkedIn

# Paquetes
require(devtools)
install_github("mpiccirilli/Rlinkedin")
require(Rlinkedin)
library(Rlinkedin)
library(httr)

app_name <- "none"
consumer_key <- "78oiecvm8trqc1"
consumer_secret <- "nxuYK6fnu3Hr35in"

in.auth <- inOAuth(app_name, consumer_key, consumer_secret)

my.connections <- getMyConnections(in.auth, partner = 1)

# YA MAMÓ, ES NECESARIO PERTENECER AL PARTNERSHIP DE LINKEDIN