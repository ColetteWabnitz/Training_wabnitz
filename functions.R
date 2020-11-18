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


convert_temps <- function(fahr) {
  celsius <- (fahr - 32) * 5/9
  kelvin <- celsius + 273.15
  
  list("fahr" = fahr, "celsius" = celsius, "kelvin" = kelvin)
}

temp_series <- convert_temps(seq(-100, 100, 10))
temps_df <- data.frame(temp_series)
# can also write it out like this
# temps_df <- data.frame(convert_temps(seq(-100, 100, 10))

library(magrittr)
seq(-100, 100, 10) %>% convert_temps() %>% data.frame()

library(ggplot2)

custom_theme <- function(base_size = 9) {
  ggplot2::theme(
    axis.ticks       = ggplot2::element_blank(),
    text             = ggplot2::element_text(family = 'Helvetica', color = 'gray30', size = base_size),
    plot.title       = ggplot2::element_text(size = ggplot2::rel(1.25), hjust = 0.5, face = 'bold'),
    panel.background = ggplot2::element_blank(),
    legend.position  = 'right',
    panel.border     = ggplot2::element_blank(),
    panel.grid.minor = ggplot2::element_blank(),
    panel.grid.major = ggplot2::element_line(colour = 'grey90', size = .25),
    legend.key       = ggplot2::element_rect(colour = NA, fill = NA),
    axis.line        = ggplot2::element_blank()
  )
}

ggplot(temps_df, mapping=aes(x=fahr, y=celsius, color=kelvin)) +
  geom_point() +
  custom_theme(15)

# function takes data and has custom tweaks for point and font size
scatterplot <- function(df, point_size = 2, font_size= 9) {
  ggplot(df, mapping=aes(x=fahr, y=celsius, color=kelvin)) +
    geom_point(size=point_size) +
    custom_theme(font_size)
}

scatterplot(temps_df)
scatterplot(temps_df, 8, 15)
