# Bar Chart showing Tinder meetups by school (complements scatter plot)

library(dplyr)
library(ggplot2)
library(plotly)

plot_q2_bar <- function(df, school, in_color) {
  # Doesn't graph if school selection is incorrect
  if (nrow(filter(df, Segment.Description == school)) == 0) {
    return(NULL)
  }

  college_df <- df %>%
    filter(Segment.Description == school) %>%
    select(Answer, Count)
  plot <- ggplot(data = college_df,
                 mapping = aes(x = Answer, y = Count,
                               text = paste("Count:", Count))) +
    geom_col(fill = in_color) +
    labs(
      title = paste("Tinder Meetups at", school),
      x = "Met Up in Person?",
      y = paste("Number of Students")
    )
  return(ggplotly(plot, tooltip = "text"))
}
