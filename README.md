# demeter_proxy
Allows the user full internet connectivity in R e.g. the ability to connect to any API, whilst on Demeter.

# Installation

Run this code in r:


```r
install.packages("devtools")

username<-"your demeter username"

password<-"your demeter password"

proxy_address<-paste0("http://",username,":",password,"@148.253.235.216:80")
  Sys.setenv(http_proxy=proxy_address, https_proxy=proxy_address)
  
devtools::install_github("lina2497/demeter_proxy")
```
