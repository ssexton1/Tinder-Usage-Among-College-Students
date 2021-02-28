# Scatter plot to answer question 2:
# Which college has the highest number of tinder users?

library(dplyr)
library(ggplot2)
library(plotly)

plot_q2 <- function(df, in_color="darkblue") {
  college_df <- df %>%
    filter(Segment.Type == "University") %>%
    filter(Answer == "Yes" | Answer == "No") %>%
    group_by(Segment.Description) %>%
    summarize(total_num = sum(Count), total_prop = sum(Percentage))
  plot <- ggplot(data = college_df,
                 aes(x = total_prop * 100, y = total_num,
                     text = Segment.Description)) +
    geom_point(color = in_color) +
    labs(
      title = "Tinder Usage by School",
      x = "Percentage Surveyed that Used Tinder (%)",
      y = "Number of Tinder Users Surveyed"
    )
  ggplotly(plot, tooltip = "text")
}
