library(shiny)

ui <- fluidPage(
  verbatimTextOutput("mtcars_summary"), # Number 1 
  textOutput("greeting"), # Number 2 
  verbatimTextOutput("ttest"), # Number 3 
  verbatimTextOutput("linmodel1") # Number 4 
  
  )
  
server <- function(input, output, session){
  # Should these renders be paired with textOutput or verbatimTextOutput?
  output$mtcars_summary <- renderPrint(summary(mtcars)) # Number 1 
  output$greeting <- renderText("Good morning!") # Number 2 
  output$ttest <- renderPrint(t.test(1:5, 2:6)) # Number 3 
  output$linmodel1 <- renderText(str(lm(mpg ~ wt, data = mtcars))) # Number 4 
}

shinyApp(ui, server)