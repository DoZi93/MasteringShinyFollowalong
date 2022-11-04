library(shiny)

ui <- fluidPage(
  selectInput("dataset", label = "Dataset", choices = ls("package:datasets")), # Inputwindow that allows us to chose from the choices
  verbatimTextOutput("summary"), # outputs text
  tableOutput("table") # outputs a table
  )

server <- function(input, output, session) {
  
  dataset <- reactive({ # reactive expressions run only once and changes only once it's updated (Different input selected by user)
    get(input$dataset, "package:datasets") # input$dataset refers to the name we gave the selectInput in fluidpage
  }) # if a reactive expression is used. It needs to be called as a function. Instead of dataset we need to call dataset()
  
  output$summary <- renderPrint({ # render function. Each render type function procudes a particular type of output. Here, it renders text
    summary(dataset()) # print the summary of the variable dataset. In this case, just one dataset thats selected via input
  })
  
  output$table <- renderTable({ # renders/outputs a table.
    dataset() # show the selected dataset as a table
  })
  }
  shinyApp(ui, server)