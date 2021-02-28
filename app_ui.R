library(ggplot2)
library(plotly)

# Setup school scatter plot/bar plot UI elements.
school_sidebar_panel <- sidebarPanel(
  radioButtons(
    inputId = "school_type",
    label = "Select What to Display",
    choices = list("All" = "all", "Enter Specific School" = "select")
  ),
  conditionalPanel(
    condition = "input.school_type == 'select'",
    textInput(
      inputId = "school",
      label = "Enter School Name",
      placeholder = "School name..."
    )
  ),
  selectInput(
    inputId = "school_color",
    label = "Select Color",
    choices = list(
      "Blue" = "darkblue",
      "Red" = "darkred",
      "Green" = "darkgreen",
      "Black" = "black"
    )
  )
)

school_main_panel <- mainPanel(
  textOutput("tinder_school_error"),
  plotlyOutput("tinder_school")
)

school_tab_panel <- tabPanel(
  "School Tinder Usage",
  titlePanel("Tinder Usage By School"),
  sidebarLayout(
    school_sidebar_panel,
    school_main_panel
  )
)


# barchart UI
bar_sidebar_panel <- sidebarPanel(
  selectInput(
    inputId = "bar_color",
    label = "Bar Color",
    choices = list(
      "Blue" = "blue",
      "Pink" = "pink",
      "Red" = "red",
      "Green" = "darkgreen"
    )
  )
)

bar_main_panel <- mainPanel(
  plotlyOutput("date_percentage_bar")
)

bar_tab_panel <- tabPanel(
  "Dating Gender Statistics",
  titlePanel("Date chance by Gender"),
  sidebarLayout(
    bar_sidebar_panel,
    bar_main_panel
  )
)

# Pie Chart UI
pie_sidebar_panel <- sidebarPanel(
  selectInput(
    inputId = "pie_color1",
    label = "Pie Color",
    choices = list(
      "Blue" = "blue",
      "Pink" = "pink",
      "Red" = "red",
      "Green" = "darkgreen"
    )
  ),
  selectInput(
    inputId = "pie_color2",
    label = "Pie Color",
    choices = list(
      "Pink" = "pink",
      "Red" = "red",
      "Green" = "darkgreen",
      "Blue" = "blue"
    )
  )
)

pie_main_panel <- mainPanel(
  plotlyOutput("meeting_piechart")
)

pie_tab_panel <- tabPanel(
  "Meeting Up through Tinder",
  titlePanel("Percentage of People Meeting Up Through Tinder"),
  sidebarLayout(
    pie_sidebar_panel,
    pie_main_panel
  )
)

intro_tab_panel <- tabPanel(
  "Overview",
    tags$h1("Tinder Usage Among College Students"),
    tags$p("Manya Jain, Zane Priebe, Sean Sexton, Kangjian Gao"),
    tags$p("6/4/2020"),
    tags$img(src = "dating.png"),
    tags$p("Our domain of interest is relationships and dating. We are
     specifically interested in how the increase in popularity of dating
     apps and online social networking has impacted how people meet and form
     relationships. This is extremely relevant now because of COVID-19 and
     the resulting overwhelming shift to online. We hope to answer questions
     related to how the move to online and app-based dating is changing how
     people form and maintain relationships."),
    tags$img(src = "tinder.png"),
    tags$p(
      "To find answers, we chose analyze the ",
      a(" Tinder Millennial Match Rate Dataset,",
        href =
        "https://data.world/ahalps/how-many-millennials-find-someone-on-tinder"
      ),
      "which is a survey of college students to determine how many respondents
      have ever met up someone that they found on Tinder."
    ),
    tags$p("The data is seperated by university, gender, and whether they are
     a web or mobile respondent. We downloaded the data from data.world.
     The data was collected by the millennial survey company and surveyed
     by Adam Halper, the company's CEO. There are 453 rows and 6 columns
     in this dataset."),
    tags$h3("Three Questions We Hope to Answer:"),
    tags$ul(
      tags$li("Are males more likely to find a date on Tinder than females?"),
      tags$li("Which university uses Tinder the most?"),
      tags$li("What percentage of people actually meet up with someone
              offline?")
    )
)

summary_tab_panel <- tabPanel(
  "Conclusion",
    tags$h1("Takeaways from project"),
    tags$h3("Tinder Success Breakdown"),
    p(
      "This table shows the number respondents to the survey, divided by
      gender. We decided to group by gender as it allowed us to see if there
      was a major discrepancy between the number of males who answered the
      survey compared to the number of females who answered it. From the table,
      we see that the number of female respondents was 1638, while the number
      of male respondents was 2218. From this, we see that quite a few more
      males answered the survey than females, which could lead to somewhat
      skewed results."
    ),
    tags$img(src = "success.png"),
    p("This chart was intended to show the relationship between gender and the
      likelihood that a Tinder user would find a date. We decided that a bar
      chart would be the most effective type of plot to answer this question.
      Bar charts are one of the most effective ways to visualize differences
      between different groups such as with gender in this case. The chart
      shows that females have a slightly higher likelihood of finding a date
      on Tinder with a 28.97% chance to get a date compared to 28.71% for the
      women. Based on how close the numbers are, it's safe to say that men and
      women have an equal chance of finding dates on Tinder with no gender
      having a distinct advantage."),

    h3("Differences in Tinder Usage between Schools"),
    p("We used a scatter plot to show how many Tinder users there are at each
      college surveyed. We chose a scatter plot because, while a bar chart
      would show which college had the highest number of Tinder users fairly
      well, it doesn't take into account the fact that not all colleges were
      surveyed evenly. Some schools had as little as one student who responded
      to the survey, while others had many times more. Using a scatterplot
      allows us to also include the percentage of college students who report
      using Tinder, so we get a more detailed picture of each college."),
    tags$img(src = "differences.png"),
    p("We can ignore unrealistic data like that of the University of Oregon and
      Yale University, where the data says that 100% of students use Tinder,
      but only because just one or two people actually responded to the survey.
      Several schools such as Vanderbilt University, the University of
      Wisconsin-Madison, and Northwestern University all had a high number of
      survey respondents (over 75) and results that show a very high proportion
      of Tinder users (exceeding 75%). While we still can't be entirely sure,
      it's safe to assume that these schools have some of the highest Tinder
      usage of those surveyed."),
    h3("Analysis of Tinder Success"),
    p(
      "With this plot, we aimed to answer the question \"How successful is
      Tinder?\" We answered this question based on how many people met up on
      Tinder compared with the number that did not. We excluded the people who
      answered \"I don't use Tinder\", as this data was not relevant to
      answering a question about Tinder success. A pie chart was used to
      present this information. A bar chart could have also been used."
    ),
    tags$img(src = "tindersuccess.png"),
    p("We concluded 71.2% of people said \"No\" to having met up with someone
      through Tinder. 28.8% of people said \"Yes\" to having met up with
      someone off Tinder. A pie chart was the most effective chart to depict
      our findings as only two variables were being considered (those who said
      \"Yes\" and those who said \"No\"), and a pie chart shows the difference
      between these categories very clearly.")
)

# setup UI
ui <- navbarPage(
  theme = "style.css",
  "College Student Tinder Dataset Analysis",
  intro_tab_panel,
  school_tab_panel,
  bar_tab_panel,
  pie_tab_panel,
  summary_tab_panel
)
