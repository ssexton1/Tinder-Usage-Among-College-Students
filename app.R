library(shiny)

# Source app files
source("app_server.R")
source("app_ui.R")

# Create Shiny application
shinyApp(ui = ui, server = server)
