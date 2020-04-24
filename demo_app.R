library(shiny)

animals <- c("dog", "cat", "horse")

ui <- (fluidPage(
  
  titlePanel("Demo App"),
  
  sidebarLayout(
    sidebarPanel("User Input Area",
                 selectInput("animal_dropdown", "Choose an Animal below", animals)
                 ),
    mainPanel("Output Area",
              textOutput("selection_text"),
              plotOutput("mainplot")
              )
  )
)
       )

server <- function(input, output){
  output$selection_text <- renderText(paste("You selected: ", input$animal_dropdown))
  
  output$mainplot <- renderPlot({
    if (input$animal_dropdown == "dog"){
      plot(rnorm(100), rnorm(100))
    }
    if (input$animal_dropdown == "cat"){
      plot(rnorm(1000), rnorm(1000))
    }
    if (input$animal_dropdown == "horse"){
      plot(rnorm(10), rnorm(10))
    }
  })
  
}

shinyApp(ui, server)