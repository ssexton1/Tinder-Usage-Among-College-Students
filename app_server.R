# Load in script files
source("./scripts/scatter_plot.R")
source("./scripts/school_bar_chart.R")
source("./scripts/bar_chart.R")
source("./scripts/piechart.R")

# Load in data
df <- read.csv("data/Tinder Millennial Match Rate Dataset.csv",
                        stringsAsFactors = FALSE)

server <- function(input, output) {
  # Render school Tinder usage (scatter if all schools, bar if school selected)
  output$tinder_school <- renderPlotly({
    if (input$school_type == "all") {
      return(plot_q2(df, input$school_color))
    } else {
      return(plot_q2_bar(df, input$school, input$school_color))
    }
  })

  # Present error message if school is entered incorrectly
  output$tinder_school_error <- renderText({
    if (input$school_type != "all" &
       nrow(filter(df, Segment.Description == input$school)) == 0) {
      return("No data was found for this school.")
    }
  })

  # Render a bar chart for likelyhood of finding a date on tinder
  output$date_percentage_bar <- renderPlotly({
    return(bar_chart(df, input$bar_color))
  })

  # Render a pie chart for percentage of people meeting up through tinder
  output$meeting_piechart <- renderPlotly({
    return(piechart_function(df, input$pie_color1, input$pie_color2))
  })
}
