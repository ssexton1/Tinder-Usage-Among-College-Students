library(dplyr)

# summarize all the necessary information
get_summary_info <- function(dat) {
  # summarize the number of people answering the survey grouped by
  # segment description.
  dat_answer <- dat %>%
    filter(Segment.Type == "Mobile") %>%
    summarise(count = sum(Count)) %>%
    pull(count)

  # Total number of people using Tinder.
  dat_total <- dat %>%
    slice(1:2) %>%
    summarise(count = sum(Count)) %>%
    pull(count)

  # Total number of people not using Tinder
  dat_total_not <- dat %>%
    slice(3) %>%
    summarise(count = sum(Count))

  # Max users in each school
  dat_school <- dat %>%
    filter(Answer == "Yes" | Answer == "No") %>%
    filter(Segment.Type == "University") %>%
    group_by(Segment.Description) %>%
    mutate(sum_count = sum(Count)) %>%
    ungroup(Segment.Description) %>%
    filter(sum_count == max(sum_count)) %>%
    distinct(Segment.Description) %>%
    pull(Segment.Description)

  # success rate
  dat_rate <- dat %>%
    slice(1:2) %>%
    mutate(sum = sum(Count)) %>%
    filter(Answer == "Yes") %>%
    summarize(success_rate = Count / sum) %>%
    pull(success_rate)

  list(people_answered = dat_answer,
       people_use_tinder = dat_total,
       people_not_use = dat_total_not,
       max_users = dat_school,
       success_rate = dat_rate)
}
