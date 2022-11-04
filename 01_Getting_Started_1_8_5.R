library(shiny)
library(ggplot2)

datasets <- c("economics", "faithfuld", "seals")
ui <- fluidPage(
  selectInput("dataset", "Dataset", choices = datasets),
  verbatimTextOutput("summary"),
  #tableOutput("plot") # original app uses a tableoutput but calls it plot (not necessarily an error since the name doesnt matter)
  tableOutput("table")
)

server <- function(input, output, session) {
  dataset <- reactive({
    get(input$dataset, "package:ggplot2")
  })
  output$summmry <- renderPrint({
    summary(dataset())
  })
  #output$plot <- renderPlot({ # the original app renders a plot whereas the output should be a table
  #  plot(dataset) # then uses a plot command # and also calls the reactive expression *not* as function!
  #}, res = 96)
  output$table <- renderTable({dataset()})
}

shinyApp(ui, server)