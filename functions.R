airtemps <- c(212, 30.3, 78, 32)

celsius1 <- (airtemps[1] - 32) * 5/9
celsius2 <- (airtemps[2] - 32)* 5/9
celsius3 <- (airtemps[3] - 32)* 5/9


#' Convert temperatures in fahrenheit to celsius
#'
#' @param fahr Temperature in fahrenheit
#' @keywords temperature conversion
#'
#' @return The temperature in celsius
#' @export 
#'
#' @examples 
#' fahr_to_celsius(32)
#' fahr_to_celsius(c(32, 212, 72))
fahr_to_celsius <- function(fahr) {
  (fahr - 32)*5/9
}
# function can take a vector of numbers

celsius4<-fahr_to_celsius(airtemps[1])
celsius1 == celsius4

fahr_to_celsius(airtemps)

celsius <- fahr_to_celsius(airtemps)

## write a function to convert from celsius to fahrenheit
celsius_to_fahr <- function(celsius) {
  (celsius *9/5) + 32
}

temps <- celsius_to_fahr(celsius)
airtemps == temps

airtemps