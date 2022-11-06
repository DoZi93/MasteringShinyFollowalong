library(shiny)

ui <- fluidPage(
  # A task 1: textinput placeholder using "Your name"
  textInput("name", " ", value = "Your name"),
  # slider using dates as input
  sliderInput("date", "When should we deliver?", 
              min = as.Date("2020-09-16"), 
              max = as.Date("2020-09-23"),
              value = as.Date("2020-09-17"),
              step = 1),
  # slider input with an animation that scrolls through the slider
  sliderInput("percent", "How urgent is the delivery [%]. 100 -> very urgent, 0 -> not urgent?",
              min = 0, max = 100, step = 5, value = 0, 
              animate = animationOptions(interval = 200, loop = TRUE)), # interval is time in ms for each animation step
  # create sub headings for selectInput using html widgets
  selectInput("state", "Choose a german state",
              choices = list('Northern Germany' = list("Schleswig-Holstein", "Berlin", "Niedersachsen"),
                              'Southern Germany'= list("Bayern", "Baden-Wuerttemberg"))) # default Shiny can't use ü,ä etc. Error: does not seem to be encoded in UTF8
  )
  
server <- function(input, output, session){
  
}
shinyApp(ui, server)