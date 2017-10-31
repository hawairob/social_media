# Facebook

install.packages("Rfacebook")
library(Rfacebook)

# a traves de token temporal (dar de alta a cuales servicios puede acceder)
token <- "EAACEdEose0cBAB5NouC14dtF13Dv93oWG3RX3eEyZCHslrPGnB5Ly9ZA6LzZB07req3gaU0nZCnsqNIR2xKrA14NpfOaZBUz6kdcbTlcy0byyseMZCR1BiDMFuZCvKMMjnXM4wXZC417tYki8Xl8JroPVQvv1qgljFo1KZBJmtLZCrLV8VlrjxP8tVGLHVSIL91HUiPJltlFueZCwZDZD"

me <- getUsers("me", token, private_info=TRUE)
me

getUsers("barackobama", token, private_info=TRUE)

getUsers(c("barackobama", "donaldtrump"), token)

myfriends <- getFriends(token, simplify = TRUE)
myfriends

my_friends <- getFriends(token, simplify = FALSE)
my_friends


my_friends_info <- getUsers(my_friends$id, token, private_info = TRUE)
my_friends_info


mat <- getNetwork(token, format = "adj.matrix")
mat
