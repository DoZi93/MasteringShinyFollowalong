library(shiny)

ui <- fluidPage(
  sliderInput("x", label = "If x is", min = 1, max = 50, value = 30),
  sliderInput("y", label = "If y is", min = 1, max = 50, value = 30),
  "then x times y is",
  textOutput("product")
)

server <- function(input, output, session) {
  output$product <- renderText({ 
    #x * 5 # exercise 1_8_2 was finding the error
    #input$x * 5 # in the output, it was referred to x instead of input$x
    input$x * input$y # exercise 1_8_3 the app should be customized to allow an input for the multiplier instead of only using "5"
  })
}

shinyApp(ui, server)