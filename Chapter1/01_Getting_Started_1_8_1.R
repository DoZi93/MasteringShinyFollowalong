library(shiny)

ui <- fluidPage(
  textInput("name", "what's your name?"), # get the name of the user
  textInput("age", "what's your age?"),
  textOutput("greeting")
)

server <- function(input, output, session) {
  output$greeting <- renderText({
    paste0("Hello ", input$name, " (", input$age, ")")
  })
}

shinyApp(ui, server)