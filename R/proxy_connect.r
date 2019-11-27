
#' Connect through proxy with Demeter credentials hidden
#'
#' @param show_characters logical indicating whether the characters of the password whould be visible.
#'
#' @return Allows internet connectivity, e.g. APIs, webscraping, installing packages from github.
#' @examples
#' proxy_connect()
#' 
#' @export
#' @import getPass







#This Script will allow you to connect to API's and webscrape on demeter.


proxy_connect<-function(show_characters=FALSE){
  
  #Asks for username
  ifelse(
    show_characters,
    username <-
      readline(prompt = "Enter Username:"),
    username <- getPass::getPass(msg = "Username", noblank = T)
  )
  
  #Asks for password
  ifelse(
    show_characters,
    password <-
      readline(prompt = "Enter Password:"),
    password <- getPass::getPass(msg = "Password", noblank = T)
  )
  
  
  #This combines your username and password with the IP address of the proxy
  proxy_address<-paste0("http://",username,":",password,"@148.253.235.216:80")
  
  #This creates envirnmnet variables with the proxy details allowing R to connect.
  Sys.setenv(http_proxy=proxy_address,
             https_proxy=proxy_address)
}


