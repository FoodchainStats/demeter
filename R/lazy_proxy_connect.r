

#' Connect through proxy with Demeter credentials in environment
#'
#' @param username Your demeter username.
#' @param password Your demeter password.
#'
#' @return Allows internet connectivity, e.g. APIs, webscraping, installing packages from github.
#' @examples
#' lazy_proxy_connect(username="m123456", password="password")
#'
#' @export




lazy_proxy_connect <- function(username = "m123456",
                               password = "password",
                               url = "http://google.com") {
  #I've called this function lazy because it will allow the user
  #to save their username and password in an r script
  #and not have to type it in each time.
  #Writing your password down is generally a bad idea but this function
  #may be useful for automation. I reccomend saving your credentials in
  #an .rdata or .rds of a list(username = x, password = x) then reading it in.
  #This way your password won't be visible on your screen whilst you work.
  
  
  #If a URL is supplied, the proxy address is retrieved for it, otherwise it defaults to an external IP
  proxy_ip <-
    stringr::str_split(curl::ie_get_proxy_for_url(url), ";")[[1]][1]
  
  #This combines your username and password with the IP address of the proxy
  proxy_address <-
    paste0("http://", username, ":", password, "@", proxy_ip)
  
  #This creates envirnmnet variables with the proxy details allowing R to connect.
  Sys.setenv(http_proxy = proxy_address,
             https_proxy = proxy_address)
}
