#This Script will allow you to connect to API's and webscrape on demeter.

#Your username as a character string
username<-"m999999"

#Your password as a chacter string
password<-"password"

#This combines your username and password with the IP address of the proxy
proxy_address<-paste0("http://",username,":",password,"@148.253.235.216:80")

#This creates envirnmnet variables with the proxy details allowing R to connect.
Sys.setenv(http_proxy=proxy_address,
           https_proxy=proxy_address)
