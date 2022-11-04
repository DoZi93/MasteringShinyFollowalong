library(shiny)

ui <- fluidPage(
  textInput("name", " ", value = "Your name") # A task 1: textinput placeholder using "Your name"
  sliderInput("date", "When should we deliver?", min = , max = , value = )
  
)
server <- function(input, output, session){
  
}
shinyApp(ui, server)