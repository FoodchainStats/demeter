# demeter_proxy
Allows the user full internet connectivity in R e.g. the ability to connect to any API, whilst on Demeter.

# Installation

Run this code in r, replacing the username and password with your credentials.


```r
#Install the package "devtools" if you don't already have it
if (!require("devtools")) install.packages("devtools")

#Enter your username
username<-"your demeter username"

#Enter your password
password<-"your demeter password"

#Generate proxy address
proxy_address<-paste0("http://",username,":",password,"@148.253.235.216:80")

#Create environment variable
Sys.setenv(http_proxy=proxy_address, https_proxy=proxy_address)
  
#Install package
devtools::install_github("FoodchainStats/demeter")
```

# Usage

The functions in this package essentially replace the code you entered to install the package.
If you need to connect to an API or install any other package from github you need only enter the following code:

```r
demeter::proxy_connect()

```

You will be prompted for your username and password. If successful you will be able to connect to any APIs you want.


This function:
```r
curl::has_internet()
```
May return FALSE despite your machine having full internet access. Some packages on CRAN designed for connecting to APIs use has_internet() as a test which might prevent you from using them to connect to an API. There are ways around this, such as connecting to the API directly using other packages such as jsonlite. 


Here's one example of connecting to the internet via the open street map API:

```r
devtools::install_github("lina2497/demeter_osmdata")

#Connect to the OSM API and retrieve coordinates for a bounding box around London:
osmdata::getbb("London")
```
