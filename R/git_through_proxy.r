#' Connect git to github.com through proxy
#'
#'
#' @return Allows git bash to talk to github.com. Only needs to be run once.
#' @examples
#' git_through_proxy()
#' 
#' @export
#' @import getPass
#' @importFrom stringr str_split
#' @importFrom curl ie_get_proxy_for_url


git_through_proxy<-function(){
proxy_ip <-
  stringr::str_split(curl::ie_get_proxy_for_url("https://github.com/"), ";")[[1]][1]


system(paste0("git config --global http.proxy ",proxy_ip))


}


