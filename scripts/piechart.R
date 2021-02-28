#How successful is tinder?
#(percentage of people who said YES to meeting up) pie chart
library("dplyr")
library(plotly)


piechart_function <- function(df, color1, color2) {
  tinder_summary_df <- df[-c(3:453), ]
  color1 <- as.character(color1)
  color2 <- as.character(color2)

  plot <- plot_ly(
    tinder_summary_df,
    labels = ~Answer,
    values = ~Count,
    type = "pie",
    marker = list(colors = c(color1, color2))
  )

  return(plot)
}
