#Summary Table

library(dplyr)

summary_table <- function(df)
  df %>%
  filter(Segment.Type == "Gender") %>%
  group_by(Segment.Description) %>%
  summarize(total = sum(Count)) %>%
  arrange(-total)
