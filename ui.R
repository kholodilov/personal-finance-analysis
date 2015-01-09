library(shiny)

# Define the overall UI
shinyUI(
  
  # Use a fluid Bootstrap layout
  fluidPage(    
    
    # Give the page a title
    titlePanel("Personal finance analysis"),
    
    # Generate a row with a sidebar
    sidebarLayout(      
      
      # Define the sidebar with one input
      sidebarPanel(
        selectInput("category", "Category:", 
                    choices=c("test1", "test2"))
      ),
      
      # Create a spot for the barplot
      mainPanel(
        plotOutput("expensesPlot")  
      )
      
    )
  )
)