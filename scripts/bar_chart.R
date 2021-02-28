# Bar chart to answer question 1:
# Are males more likely to find a date on Tinder than females?

library(dplyr)
library(plotly)

bar_chart <- function(df, color) {
  color <- as.character(color)

  gender_df <- df %>%
    filter(Segment.Type == "Gender") %>%
    filter(Answer == "Yes" | Answer == "No") %>%
    group_by(Segment.Description) %>%
    mutate(total = sum(Count)) %>%
    filter(Answer == "Yes") %>%
    summarize(prob_yes = (Count / total) * 100) %>%
    plot_ly(
      type = "bar",
      x = ~Segment.Description,
      y = ~prob_yes,
      color = I(color)
    ) %>%
    layout(
      title = "Percentage of Users Who Have
    Gotten a Date Through Tinder by Gender",
      xaxis = list(
        title = "Gender"
      ),
      yaxis = list(
        title = "Percentage of Users Who Have Gotten Date Through Tinder (%)"
      )
    )
  return(gender_df)
}
